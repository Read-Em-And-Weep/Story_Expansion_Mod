import 'Keepsakes/KeepsakeData_Thanatos.lua'
import 'Keepsakes/KeepsakeData_Megaera.lua'
import 'Keepsakes/KeepsakeData_Achilles.lua'
import 'Keepsakes/KeepsakeData_Orpheus.lua'
import 'Keepsakes/KeepsakeData_Dusa.lua'
import 'Keepsakes/KeepsakeData_Nyx.lua'
import 'Keepsakes/KeepsakeData_Patroclus.lua'
import 'Keepsakes/KeepsakeData_Theseus.lua'
import 'Keepsakes/KeepsakeData_Minotaur.lua'
import 'Keepsakes/KeepsakeData_Eurydice.lua'
import 'Keepsakes/KeepsakeData_Hypnos.lua'
import 'Keepsakes/KeepsakeData_Hades.lua'

modutil.mod.Path.Wrap("HandleUpgradeChoiceSelection", function(base, screen, button, args)
    if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionBoonRarityBoostKeepsake")) and (button.LootData.GodLoot or button.LootData.TreatAsGodLootByShops) then
        local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionBoonRarityBoostKeepsake"))
        if (trait.RarityBonus.Epic - trait.Decay) > 0 then
            trait.RarityBonus.Epic = trait.RarityBonus.Epic - trait.Decay
        else
            trait.RarityBonus.Epic = 0
			trait.CustomTrayText = trait.ZeroBonusTrayText
        end
    end
    return base(screen, button, args)
end)


function mod.KeepsakeAddMaxHealth(args)
	if CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.BiomeStartRoom then
		args.PreDelay = CurrentRun.CurrentRoom.IntroSequenceDuration
	end
	thread( AddMaxHealth, args.Amount, {}, args)
end

function mod.SetUpDodgeShieldKeepsake(unit, traitArgs)
    SetLifeProperty({ Property = "DodgeChance", Value = 1, ValueChangeType = "Add", DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
    SessionState.GlobalCooldowns["PauseDodgeShieldKeepsake"] = nil
end

function mod.PauseDodgeShieldKeepsake(unit, traitArgs)
    if CheckCooldown("PauseDodgeShieldKeepsake", traitArgs.Cooldown) then
        local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionDodgeShieldKeepsake"))
        TraitUIActivateTrait(trait, {Duration = traitArgs.Cooldown})
        SetLifeProperty({ Property = "DodgeChance", Value = -1, ValueChangeType = "Add", DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
        thread(mod.DodgeKeepsakeCooldown, unit, traitArgs)
    end
end

function mod.DodgeKeepsakeCooldown(unit, traitArgs)
    wait(traitArgs.Cooldown, RoomThreadName)
    	PlaySound({ Name = "/SFX/WrathOver", Id = CurrentRun.Hero.ObjectId })
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "StoryExpansionRechargedShieldKeepsake", Duration = 1, PreDelay = 0 } )
    mod.SetUpDodgeShieldKeepsake(unit, traitArgs)
end

function mod.KeepsakeRewardRandomConsumables(unit, args)
    if args.NumberAwarded > 0 then
    AwardRandomStoreItem({Traits = 
			{
				"TemporaryImprovedSecondaryTrait",
				"TemporaryImprovedCastTrait",
				"TemporaryMoveSpeedTrait",
                "TemporaryForcedSecretDoorTrait",
				"TemporaryBoonRarityTrait",
				"TemporaryImprovedExTrait",
				"TemporaryImprovedDefenseTrait",
				"TemporaryHealExpirationTrait",
				"TemporaryDoorHealTrait",
                "TemporaryEmptySlotDamageTrait",
			},
			Consumables = 
			{
				"LastStandShopItem",
				"EmptyMaxHealthShopItem",
				"HealDropRange",
                "MetaCurrencyRange",
				"MetaCardPointsCommonRange",
				"MemPointsCommonRange",
				"SeedMysteryRange",
			},})
           local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionCharonWellKeepsake"))
           trait.OnEncounterStartFunction.Args.NumberAwarded = trait.OnEncounterStartFunction.Args.NumberAwarded - 1
		   UpdateTraitNumber(trait)
           if trait.OnEncounterStartFunction.Args.NumberAwarded == 0 then
                trait.CustomTrayText = trait.ZeroBonusTrayText
           end
        end
end

modutil.mod.Path.Wrap("GetShopCostMultiplier", function(base)
    if not CurrentRun or (CurrentRun and not CurrentRun.CurrentRoom) then
        return 1
    else
        return base()
    end
end)

function mod.GainRandomFear(args)
    if game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun" then
        return
    end
local reservedShrineUpgrades = {}
		local totalReservedPoints = 0
		for i, name in ipairs( ShrineUpgradeOrder ) do
			local shrineUpgradeData = MetaUpgradeData[name]
			if not shrineUpgradeData.IgnoredByRandomBounties and not shrineUpgradeData.IneligibleForCirceRemoval then
				local pointSum = 0
				for j, rank in ipairs( shrineUpgradeData.Ranks ) do
					if rank.Points == 1 then
						pointSum = pointSum + 1
					end
				end
				if pointSum == #shrineUpgradeData.Ranks then
					reservedShrineUpgrades[name] = pointSum
					totalReservedPoints = totalReservedPoints + pointSum
				end
			end
		end

		-- We only need to reserve 3 shrine points, so let's whittle down the list.
		local maxPointsPerRank = 3
		DebugAssert({ Condition = totalReservedPoints >= maxPointsPerRank, Text = "Not enough potential reserves!", Owner = "Caleb" })
		while totalReservedPoints > maxPointsPerRank do
			local shrineUpgrade = GetRandomKey( reservedShrineUpgrades )
			reservedShrineUpgrades[shrineUpgrade] = reservedShrineUpgrades[shrineUpgrade] - 1
			totalReservedPoints = totalReservedPoints - 1
			if reservedShrineUpgrades[shrineUpgrade] <= 0 then
				reservedShrineUpgrades[shrineUpgrade] = nil
			end
		end

		-- Determine the available list of shrine upgrades (excluding reserved ranks)
		local availableShrineUpgradeRanks = {}
		for i, name in ipairs( ShrineUpgradeOrder ) do
			local shrineUpgradeData = MetaUpgradeData[name]
			if not shrineUpgradeData.IgnoredByRandomBounties and not shrineUpgradeData.IneligibleForCirceRemoval then
				local maxRank = GetShrineUpgradeMaxRank( shrineUpgradeData ) - (reservedShrineUpgrades[name] or 0)
				if maxRank > 0 then
					availableShrineUpgradeRanks[name] = maxRank
				end
			end
		end

		local budget = args.FearAmount
		local currentCostTotal = 0
		while currentCostTotal < budget do
			local outOfOptions = IsEmpty( availableShrineUpgradeRanks )
			if outOfOptions and reservedShrineUpgrades == nil then
				-- This should never happen, but just in case, prevent an infinite loop...
				DebugAssert({ Condition = false, Text = "Ran completely out of shrine point options!", Owner = "Caleb" })
				break
			end

			-- If we're out of affordable options, or if we're close to the budget, add the reserves to the pool.
			if reservedShrineUpgrades ~= nil and ( outOfOptions or (budget - currentCostTotal) <= maxPointsPerRank ) then
				for name, ranks in pairs( reservedShrineUpgrades ) do
					availableShrineUpgradeRanks[name] = (availableShrineUpgradeRanks[name] or 0) + ranks
				end
				reservedShrineUpgrades = nil
			end

			-- Pick a random upgrade to level up.
			-- If we can't afford it, we'll remove it from the pool and pick something else.
            if IsEmpty(availableShrineUpgradeRanks) then
                return
            end
			local randomUpgradeName = GetRandomKey( availableShrineUpgradeRanks )
			local currentLevel = GameState.ShrineUpgrades[randomUpgradeName] or 0
            if MetaUpgradeData[randomUpgradeName].Ranks[currentLevel + 1] then
			local nextCost = MetaUpgradeData[randomUpgradeName].Ranks[currentLevel + 1].Points
			if currentCostTotal + nextCost > budget then
				-- priced out, remove the upgrade from the pool!
				availableShrineUpgradeRanks[randomUpgradeName] = nil
			else
				-- purchased!
				availableShrineUpgradeRanks[randomUpgradeName] = availableShrineUpgradeRanks[randomUpgradeName] - 1
				if availableShrineUpgradeRanks[randomUpgradeName] <= 0 then
					-- maxed out, remove the upgrade from the pool!
					availableShrineUpgradeRanks[randomUpgradeName] = nil
				end
				GameState.ShrineUpgrades[randomUpgradeName] = (GameState.ShrineUpgrades[randomUpgradeName] or 0) + 1
				currentCostTotal = currentCostTotal + nextCost
			end
        else
            availableShrineUpgradeRanks[randomUpgradeName] = nil
        end
		end
end

function mod.GrantRandomFoodOfRarity(args)
	if game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun" then
        return
    end

	args = args or {}
	args.Rarity = args.Rarity or 1
	local rarityTable = {"Common", "Rare", "Epic", "Heroic"}
	local rarityToAdd = rarityTable[args.Rarity]
	local eligibleFoods = {}
	for i, option in ipairs(PresetEventArgs["StoryExpansionEurydiceFoodChoices"]) do
		if option.GameStateRequirements == nil or IsGameStateEligible(option, option.GameStateRequirements) then
            table.insert(eligibleFoods, option)
		end
	end
    if #eligibleFoods < 1 then
		return
	end
	local traitToAdd = RemoveRandomValue(eligibleFoods)
	local traitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitToAdd.Name, Rarity = rarityToAdd })
		AddTraitToHero({ TraitData = traitData, SkipQuestStatusCheck = true, SkipAddToHUD = true})
		if traitData.AcquireFunctionName then
		thread(CallFunctionName, traitData.AcquireFunctionName, traitData.AcquireFunctionArgs, traitData)
		end
end

modutil.mod.Path.Wrap("UnequipKeepsake", function(base, heroUnit, traitName, args )
    if not traitName then
		return
	end
    args = args or {}
	local traitUsesRemaining = nil
    if traitName == gods.GetInternalKeepsakeName("StoryExpansionMaxHealthKeepsake") then
		local trait = GetHeroTrait(traitName)
		if trait.AcquireFunctionName == _PLUGIN.guid..".KeepsakeAddMaxHealth" and CurrentRun.Hero.IsDead then
			AddMaxHealth( -trait.AcquireFunctionArgs.Amount, {}, {Silent = true})
		end
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionExtraCastKeepsake") and not CanFreeSwapKeepsakes() and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraCastKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionExtraCastKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionFearForDamageKeepsake") and not CanFreeSwapKeepsakes() and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionFearForDamageKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionFearForDamageKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake") and not CanFreeSwapKeepsakes() and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
    local valueToReturn = base(heroUnit,traitName,args)
	ValidateMaxHealth()
	ValidateMaxMana()

    --[[if TraitData[traitName].Permanent and not CanFreeSwapKeepsakes() and not args.AdvanceKeepsakeMoment and Contains({gods.GetInternalKeepsakeName("StoryExpansionPerfectClearKeepsake"), gods.GetInternalKeepsakeName("StoryExpansionExtraCastKeepsake"), gods.GetInternalKeepsakeName("StoryExpansionFearForDamageKeepsake")}, traitName) then
        local trait = GetHeroTrait(traitName)
        TraitUIRemove( trait )
        CurrentRun.StoryExpansionPermanentKeepsakesUsed =CurrentRun.StoryExpansionPermanentKeepsakesUsed or {} 
        table.insert(CurrentRun.StoryExpansionPermanentKeepsakesUsed, traitName)
    end]]
	--[[if traitUsesRemaining then
		local trait = GetHeroTrait(traitName)
		trait.RemainingUses = traitUsesRemaining
		if traitUsesRemaining == 0 then
			valueToReturn = nil
		end
	end]]
    return valueToReturn
end)

modutil.mod.Path.Wrap("KeepsakeScreenClose", function(base, screen, button )
	base(screen, button)
	ValidateMaxHealth()
	ValidateMaxMana()
end)

function mod.CheckPerfectClear(traitData, args)
    if not SessionMapState.EncounterStartDamage then
		return
	end
	args = args or {}
    	local damageTaken = CurrentRun.TotalDamageTaken - SessionMapState.EncounterStartDamage
    if damageTaken <= 0 then
		if args.PerfectFunctionName then
		thread(CallFunctionName, args.PerfectFunctionName, traitData, args.PerfectFunctionArgs)
		end
    end
end

function mod.SummonExtraReward(trait, args)
	if trait.RemainingUses <= 0 then
		return
	end
	local rewardList = {"BlindBoxLoot","WeaponUpgrade", "MaxHealthDrop", "MaxManaDrop","StackUpgrade","RoomMoneyDrop","BlindBoxLoot","MaxHealthDrop", "MaxManaDrop","StackUpgrade","RoomMoneyDrop"}
    if IsEmpty(rewardList) then
        return
    end
    local chosenReward = RemoveRandomValue(rewardList)
    while chosenReward == "StackUpgrade" and not IsGameStateEligible({},{NamedRequirements = { "StackUpgradeLegal" }}) do
        chosenReward = RemoveRandomValue(rewardList)
    end
    local spawnPoint = SelectSurfaceItemSpawnPoint()
		local consumableId = SpawnObstacle({ Name = chosenReward, DestinationId = spawnPoint, Group = "Standing", })
		local consumable = CreateConsumableItem( consumableId, chosenReward, 0, { RunProgressUpgradeEligible = true } )
		ApplyConsumableItemResourceMultiplier( CurrentRun.CurrentRoom, consumable )
		consumable.MetaConversionEligible = false
		MapState.RoomRequiredObjects[consumableId] = consumable
		SetObstacleProperty({ Property = "MagnetismWhileBlocked", Value = 0, DestinationId = consumableId })
		trait.RemainingUses = trait.RemainingUses - 1 
		UpdateTraitNumber(trait)
		if trait.RemainingUses <= 0 then
				RemoveTraitData( CurrentRun.Hero, trait, { SkipActivatedTraitUpdate = IsEmpty( trait.Elements ) } )
		end
end
modutil.mod.Path.Wrap("TraitUIAdd", function(base,trait, args)
if trait.Slot and Contains(CurrentRun.StoryExpansionPermanentKeepsakesUsed, trait.Name) and not CanFreeSwapKeepsakes() then
        TraitUIRemove(trait)
        trait.Slot = nil
        trait.AnchorId = nil
			trait.ActiveSlotOffsetIndex = nil
			trait.HideInRunHistory = nil
            trait.Ordered = nil
			SessionMapState.HUDTraitsShown[trait.Name] = nil    
            trait.ShowInHUD = false
            end
    return base(trait, args)
end)

--[[modutil.mod.Path.Wrap("ShowTraitUI", function(base,args)
    	local currentTraits = ShallowCopyTable( CurrentRun.Hero.Traits )
	currentTraits = CollapseTableOrdered( currentTraits )
	for i, trait in ipairs( currentTraits ) do
		if trait.Slot and Contains(CurrentRun.StoryExpansionPermanentKeepsakesUsed, trait.Name) and not CanFreeSwapKeepsakes() then
			trait.Slot = nil
        trait.AnchorId = nil
			trait.ActiveSlotOffsetIndex = nil
			trait.HideInRunHistory = nil
            trait.Ordered = nil
			SessionMapState.HUDTraitsShown[trait.Name] = nil
            trait.ShowInHUD = false
		end
	end


return base(args)
end)]]

modutil.mod.Path.Wrap("LoadMap",function(base,args)
local currentTraits = ShallowCopyTable( CurrentRun.Hero.Traits )
	currentTraits = CollapseTableOrdered( currentTraits )
	for i, trait in ipairs( currentTraits ) do
		if trait.Slot and Contains(CurrentRun.StoryExpansionPermanentKeepsakesUsed, trait.Name) and not CanFreeSwapKeepsakes() then
			TraitUIRemove(trait)
		local reAddTraitToUI = UnequipKeepsake( CurrentRun.Hero, trait.Name )
		            reAddTraitToUI.ShowInHUD = false
		if reAddTraitToUI.Slot and Contains(CurrentRun.StoryExpansionPermanentKeepsakesUsed, reAddTraitToUI.Name) and not CanFreeSwapKeepsakes() then
			trait.ShowInHUD = false
			reAddTraitToUI.Slot = nil
			        reAddTraitToUI.AnchorId = nil
			reAddTraitToUI.ActiveSlotOffsetIndex = nil
			reAddTraitToUI.HideInRunHistory = nil
            reAddTraitToUI.Ordered = nil
			SessionMapState.HUDTraitsShown[trait.Name] = nil   
		end
		if reAddTraitToUI ~= nil then
			TraitUIAdd( reAddTraitToUI )
		end
		end
	end
	UpdateHeroTraitDictionary()
return base(args)
end)

modutil.mod.Path.Wrap("GetExpectedMaxMana", function(base)
	local expectedMaxMana = base()
	if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) then
		return math.min(50, expectedMaxMana)
	end
	return expectedMaxMana
end)

modutil.mod.Path.Wrap("TriggerPostBossEvents", function(base, eventSource,args)
	if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) and IsTraitActive( gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake"))
		ReduceTraitUses(trait,{ Force = true })
		trait.CustomName = trait.ZeroBonusTrayText
		ValidateMaxMana()
	end
end)

function mod.TryKeepsakeTheseusAndAsteriusSpawn(functionArgs, triggerArgs)
	if not IsGameStateEligible( traitData, functionArgs.GameStateRequirements) then
		return
	end
	if functionArgs.Uses <= 0 then
		return
	end
	local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionAllySummonKeepsake"))
	trait.OnLastStandFunction.FunctionArgs.Uses = trait.OnLastStandFunction.FunctionArgs.Uses - 1
	trait.CustomTrayText = trait.ZeroBonusTrayText
	if CurrentRun.Hero.IsDead then
		return
	end
	SessionMapState.StoryExpansionKeepsakeSpawnedAllies = true
	CurrentRun.StoryExpansionSpawnAllyKeepsakeUsed = true
	thread(mod.TheseusAndMinotaurKeepsakeSpawn, {})
end

function mod.EndEncounterRemoveSpawnedTheseusAndAsterius(traitData, args)
	if SessionMapState.StoryExpansionKeepsakeSpawnedAllies then
		mod.TheseusAndMinotaurExit()
		if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionAllySummonKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionAllySummonKeepsake"))
		trait.RemainingUses = 0
		UpdateTraitNumber(trait)
	end
	end
end

modutil.mod.Path.Wrap("DamageEnemy", function(base, victim, triggerArgs)
	local attacker = triggerArgs.AttackerTable
	if attacker and attacker.SummonedByKeepsake then 
		if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionAllySummonKeepsake")) and triggerArgs.DamageAmount and triggerArgs.DamageAmount ~= 0 then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionAllySummonKeepsake"))
		trait.RemainingUses = trait.RemainingUses - triggerArgs.DamageAmount
		if trait.RemainingUses <= 0 then
			trait.RemainingUses = 0
			trait.CustomTrayText = trait.ZeroBonusTrayText
			mod.TheseusAndMinotaurExit()
			SessionMapState.StoryExpansionKeepsakeSpawnedAllies = nil
		end
		UpdateTraitNumber(trait)
		end
	end
	
	return base(victim, triggerArgs)
end)