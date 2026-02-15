import 'TraitData/TraitData_Patroclus.lua'
import 'TraitData/TraitData_Thanatos.lua'
import 'TraitData/TraitData_Megaera.lua'
import 'EurydiceTraitLogic.lua'

function mod.PatroclusRefillLastStands(args)
if not CurrentRun.Hero.MaxLastStands then
		return	
	end
	args = args or {}
	local numLastStands = CurrentRun.Hero.MaxLastStands - TableLength( CurrentRun.Hero.LastStands )
	local hadLastStands = HasLastStand( CurrentRun.Hero )
	if numLastStands > 0 then
		local currentFraction = 0.4 
		while numLastStands > 0 do
			AddLastStand({
				Name = "Echo",
				Icon = "ExtraLifeStyx",
				ManaFraction = currentFraction,
				HealFraction = currentFraction,
				Silent = true,
			})
			numLastStands = numLastStands - 1
		end
		
		if not hadLastStands then
			thread( LowHealthBonusBuffStatePresentation, 0.5 )
		end
		RecreateLifePips()
	end
end

modutil.mod.Path.Wrap("DoZeusSpawnDamage", function(base, enemy, traitArgs, damageAmount)
    if traitArgs.Vfx == "ThanatosCritFx" then
        	wait(0.1, RoomThreadName )
	CreateAnimation({ Name = traitArgs.Vfx, DestinationId = enemy.ObjectId, Group = "FX_Standing_Top" })
	thread( mod.ThanatosSpawnKillPresentation, enemy )
	thread( Damage, enemy, { AttackerId = CurrentRun.Hero.ObjectId, AttackerTable = CurrentRun.Hero, SourceProjectile = "ZeusOnSpawn", DamageAmount = damageAmount, Silent = false, PureDamage = true, IgnoreHealthBuffer = true } )

else
    return base(enemy, traitArgs, damageAmount)
end
end)

function mod.ThanatosSpawnKillPresentation(unit)
	PlaySound({ Name = "/Leftovers/SFX/PlayerKilledNEW", Id = unit.ObjectId })
	if CheckCooldown( "SpawnKillPresentationCooldown", 1.0 ) then
		thread( InCombatText, CurrentRun.Hero.ObjectId, "StoryExpansionHint_ThanatosSpawnKill", 0.75, { PreDelay = 0.25 } )
	end
end

function mod.LastStandHealthReserve(unit,args)
	if CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.BlockTraitSetup or not args then
		return
	end
    if not Contains(CurrentRun.BlockedKeepsakes, "LowHealthCritKeepsake") then
        table.insert(CurrentRun.BlockedKeepsakes, "LowHealthCritKeepsake")
    end
	local hasThanatosLastStand = false
	for i, lastStand in pairs( unit.LastStands ) do
		if lastStand.Name == "StoryExpansionThanatos"  then
			hasThanatosLastStand = true
			mod.UnreserveHealth( "StoryExpansionThanatosStandRefill")
			ReserveHealth( args.HealthReservationCost, "StoryExpansionThanatosStandRefill")
			return
		end
	end
	if not hasThanatosLastStand  then
		local numLastStands = CurrentRun.Hero.MaxLastStands - TableLength( CurrentRun.Hero.LastStands )
		local reservationCost = 0
		local startingLastStand = HasLastStand( CurrentRun.Hero )
		if numLastStands > 0 then
			-- only run once
			AddLastStand({
				Name = "StoryExpansionThanatos",
				Icon = "ExtraLifeSkelly",
				ManaFraction = 0.4,
				HealFraction = 0.4,
				Silent = true,
			})
			numLastStands = numLastStands - 1
			reservationCost = reservationCost + args.HealthReservationCost
			if startingLastStand ~= HasLastStand( CurrentRun.Hero ) then
				thread( RoomStartLowHealthBonusBuffStatePresentation  )
			end

		end
			mod.UnreserveHealth( "StoryExpansionThanatosStandRefill")
			ReserveHealth( args.HealthReservationCost, "StoryExpansionThanatosStandRefill")
	end
end

function mod.UnreserveHealth( source )
	CurrentRun.Hero.ReserveHealthSources[source] = nil
	FrameState.RequestUpdateHealthUI = true
end

function mod.IsLastStandHealthReserveEligible()
return not CurrentRun or not CurrentRun.Hero or IsEmpty(CurrentRun.Hero.ReserveHealthSources) or not CurrentRun.Hero.ReserveHealthSources.StoryExpansionThanatosStandRefill
end

function mod.RestoreLastStandHealthReserve(traitData)
    	local args = traitData.SetupFunction.Args
	local reservationCost = args.HealthReservationCost
	
	local hasThanatosLastStand = false
	for i, lastStand in ipairs( CurrentRun.Hero.LastStands ) do
		if lastStand.Name == "StoryExpansionThanatos"  then
			hasThanatosLastStand = true
		end
	end
	if not hasThanatosLastStand and TableLength(CurrentRun.Hero.LastStands) == CurrentRun.Hero.MaxLastStands then
		return
	end
	mod.UnreserveHealth( "StoryExpansionThanatosStandRefill")
	ReserveHealth( args.HealthReservationCost, "StoryExpansionThanatosStandRefill")
end

function mod.IncreaseAccumulatedDamageBonus(traitData, args)
    traitData.AccumulatedDamageBonus = traitData.AccumulatedDamageBonus - (1-traitData.PerfectClearDamageBonus)
    if existingTraitData then
		Flash({ Id = existingTraitData.AnchorId, Speed = 2, MinFraction = 0, MaxFraction = 0.8, Color = Color.LimeGreen, ExpireAfterCycle = true })
		CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = existingTraitData.AnchorId, GroupName = "Overlay" })
		thread( InCombatText, existingTraitData.AnchorId, "StoryExpansionPerfectClearDamageBonus", 1.5 , { ScreenSpace = true, OffsetX = 170, OffsetY = 10, Angle = 0, LuaKey = "TempTextData", LuaValue = traitData })
	end
	wait( 0.45, RoomThreadName )

	local soundId = PlaySound({ Name = "/SFX/ThanatosAttackBell" })
	SetVolume({ Id = soundId, Value = 0.3 })
	CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Top" })
	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 1000, Duration = 0.3 })
    UpdateTraitNumber(traitData)
end

function mod.RoomStartResetPerfectCritBonus()
	SessionMapState.StoryExpansionDeactivatePerfectCritBonus = nil
    local traitData = GetHeroTrait(gods.GetInternalBoonName("ThanatosPerfectCritTrait"))
    TraitUIActivateTrait( traitData )
end

function mod.ResetPerfectCritBonusBoon(attacker, args, triggerArgs)
if triggerArgs.ManuallyTriggered or not triggerArgs.DamageAmount or triggerArgs.DamageAmount <= 0 then
		return
	end
	thread( mod.ThreadedPerfectCritReset, args.Cooldown )
end

function mod.ThreadedPerfectCritReset(delay)
	if not SessionMapState.StoryExpansionDeactivatePerfectCritBonus then
		mod.PerfectCritBoonExpire()
	end
	SessionMapState.StoryExpansionDeactivatePerfectCritBonus = true
end

function mod.PerfectCritBoonExpire()
	if CurrentRun.CurrentRoom.Encounter and CurrentRun.CurrentRoom.Encounter.BossKillPresentation then
		return
	end
    local traitData = GetHeroTrait(gods.GetInternalBoonName("ThanatosPerfectCritTrait"))
    TraitUIDeactivateTrait(traitData)
	PlaySound({ Name = "/SFX/WrathOver", Id = CurrentRun.Hero.ObjectId })
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "StoryExpansionPerfectCritBonusBoon_Expired", Duration = 1.45, PreDelay = 0.1, LuaKey = "TempTextData", LuaValue = { TimeLeft = threshold } } )
end

modutil.mod.Path.Wrap("CalculateCritChance", function(base, attacker, victim, weaponData, triggerArgs)
    local chance = base(attacker, victim, weaponData, triggerArgs)
    if HeroHasTrait(gods.GetInternalBoonName("ThanatosPerfectCritTrait")) and attacker == CurrentRun.Hero and weaponData and IsExWeapon(weaponData.Name, { Combat = true }, triggerArgs) then
        local trait = GetHeroTrait(gods.GetInternalBoonName("ThanatosPerfectCritTrait"))
        if not SessionMapState.StoryExpansionDeactivatePerfectCritBonus then
            chance = chance + trait.AddOutgoingCritModifiers.UndamagedMultiplier
        end
    end
    if HeroHasTrait(gods.GetInternalBoonName("ThanatosIncomingOutcomingCritTrait")) and victim == CurrentRun.Hero then
        local trait = GetHeroTrait(gods.GetInternalBoonName("ThanatosIncomingOutcomingCritTrait"))
        chance = chance + trait.StoryExpansionAddIncomingCritModifiers.Chance
    end
	if HeroHasTrait(gods.GetInternalBoonName("MegaeraOathTakeCriticalDamage")) and victim == CurrentRun.Hero then
		local trait = GetHeroTrait(gods.GetInternalBoonName("MegaeraOathTakeCriticalDamage"))
        chance = chance + trait.StoryExpansionAddIncomingCritModifiers.Chance
    end
    return chance
end)


modutil.mod.Path.Wrap("ReserveMana", function(base,amount, source)
    base(amount, source)
    if HeroHasTrait(gods.GetInternalBoonName("ThanatosPrimeDamageTrait")) then
        local trait = GetHeroTrait(gods.GetInternalBoonName("ThanatosPrimeDamageTrait"))
        trait.CurrentBonusDamage = 1 + trait.StoryExpansionMaxPrimedManaMultiplier*(CurrentRun.Hero.MaxMana - GetHeroMaxAvailableMana())
        UpdateTraitNumber(trait)
    end
end)

function mod.DoDamageAllEnemies(unit, args)
for id, enemy in pairs( ShallowCopyTable( ActiveEnemies ) ) do
			if enemy then
				thread( mod.DoThanatosDamageEnemy, enemy, args )
			end
		end
end

function mod.DoThanatosDamageEnemy(enemy,args)
wait(args.Delay, RoomThreadName)
	if enemy and not enemy.IsDead and enemy.IsAggroed and IsEmpty( enemy.InvulnerableFlags ) then
		CreateAnimation({ Name = args.Vfx, DestinationId = enemy.ObjectId })
		Damage (enemy, {  DamageAmount = args.DamageAmount, Silent = false, } )
	end
end

function mod.TransmuteRandomElement()
	local elementalOptions = {}
	local allBaseElements = {"Fire", "Water", "Earth", "Air"}
	local dominantElement = CurrentRun.Hero.ExtraElementalBoonsDominantElementByCount
	if dominantElement == nil then
		return
	end
	for key, element in ipairs(allBaseElements) do
		if element ~= dominantElement and CurrentRun.Hero.Elements[element] > 0 then
			table.insert(elementalOptions, element)
		end
	end
	local elementToLose = RemoveRandomValue(elementalOptions)
	if elementToLose == dominantElement then
		elementToLose = RemoveRandomValue(elementalOptions)
	end
	local count = mod.RemoveAllOfElement(elementToLose)
	mod.AddElement(dominantElement, count)
	UpdateHeroTraitDictionary()
	mod.TransmuteElementPresentation(elementToLose, dominantElement, count)
end

function mod.RemoveAllOfElement(elementToLose)
	local count = 0
	for i, trait in ipairs( CurrentRun.Hero.Traits ) do
	if not IsEmpty(trait.Elements) then
		for i, elementName in pairs( trait.Elements ) do
			if elementName == elementToLose then
				trait.Elements[i] = nil
				count = count + 1
			end
		end
	end
	if trait.AddAllElements then
		local elements = {"Fire", "Water", "Earth", "Air", "Aether"}
		for key, element in ipairs(elements) do
			if element ~= elementToLose then
				for variable = 1, trait.AddAllElements, 1 do
				table.insert(trait.Elements,element)
				end
			end
		end
		count = count + trait.AddAllElements
		trait.AddAllElements = 0
	end
	end
	return count
end

function mod.AddElement(elementToAdd, count)
	if elementToAdd == nil or count <= 0 then 
		return
	end
	local elementalEssence = {Fire = "FireEssence", Water = "WaterEssence",Earth = "EarthEssence", Air = "AirEssence"}
	local essenceToAdd = elementalEssence[elementToAdd]
	if essenceToAdd == nil then return end
	for variable = 1, count, 1 do
		AddTraitToHero({TraitName = essenceToAdd, Silent = true})
	end
end

function mod.TransmuteElementPresentation(elementToLose, elementToGain, count)
	CreateAnimation({ Name = "ItemGet_PomUpgraded", DestinationId = CurrentRun.Hero.ObjectId, Scale = 2.0 })

	PlaySound({ Name =  "/Leftovers/Menu Sounds/TalismanPowderDownLEGENDARY", DestinationId = CurrentRun.Hero.ObjectId })

	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text =  "StoryExpansionElementalSacrificeLoss_CombatText"..elementToLose, SkipRise = false, SkipFlash = false, ShadowScaleX = 1.33, Duration = 1.5, 
	LuaKey = "TempTextData", 
	LuaValue = { 
		Name = elementToLose,
		Amount = count,
	}})
	wait(1)
	PlaySound({ Name =  "/Leftovers/Menu Sounds/TalismanPowderUpLEGENDARY", DestinationId = CurrentRun.Hero.ObjectId })
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text =  "StoryExpansionElementalSacrificeGain_CombatText"..elementToGain, SkipRise = false, SkipFlash = false, ShadowScaleX = 1.33, Duration = 1.5, 
	LuaKey = "TempTextData", 
	LuaValue = { 
		Name = elementToGain,
		Amount = count,
	}})
end