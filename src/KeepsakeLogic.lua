import 'Keepsakes/KeepsakeData_Thanatos.lua'
import 'Keepsakes/KeepsakeData_Megaera.lua'
import 'Keepsakes/KeepsakeData_Achilles.lua'
import 'Keepsakes/KeepsakeData_Orpheus.lua'
import 'Keepsakes/KeepsakeData_Dusa.lua'
import 'Keepsakes/KeepsakeData_Nyx.lua'
import 'Keepsakes/KeepsakeData_Eurydice.lua'
import 'Keepsakes/KeepsakeData_Penelope.lua'
import 'Keepsakes/KeepsakeData_Andromache.lua'
import 'Keepsakes/KeepsakeData_Iris.lua'
import 'Keepsakes/KeepsakeData_Hypnos.lua'

import 'Keepsakes/KeepsakeData_Hector.lua'
import 'Keepsakes/KeepsakeData_Ariadne.lua'
import 'Keepsakes/KeepsakeData_Pasiphae.lua'
import 'Keepsakes/KeepsakeData_Arke.lua'
import 'Keepsakes/KeepsakeData_Cassandra.lua'
import 'Keepsakes/KeepsakeData_Calypso.lua'
--import 'Keepsakes/KeepsakeData_Ganymede.lua'
import 'Keepsakes/KeepsakeData_Sisyphus.lua'
import 'Keepsakes/KeepsakeData_Theseus.lua'
import 'Keepsakes/KeepsakeData_Minotaur.lua'
import 'Keepsakes/KeepsakeData_Patroclus.lua'

import 'Keepsakes/KeepsakeData_Telemachus.lua'
import 'Keepsakes/KeepsakeData_Triton.lua'
import 'Keepsakes/KeepsakeData_Iphigenia.lua'
--import 'Keepsakes/KeepsakeData_Jetty.lua'
--import 'Keepsakes/KeepsakeData_Prometheus.lua'
--import 'Keepsakes/KeepsakeData_Epimetheus.lua'
import 'Keepsakes/KeepsakeData_Hades.lua'
import 'Keepsakes/KeepsakeData_Cerberus.lua'
import 'Keepsakes/KeepsakeData_Alecto.lua'
import 'Keepsakes/KeepsakeData_Tisiphone.lua'
--import 'Keepsakes/KeepsakeData_Rhea.lua'


function mod.ResetKeepsakeOrder()
	local addedKeepsakes = {
		gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionExtraCastMegKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionDodgeShieldKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionBossShieldsKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionMaxHealthKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionBackstabKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionFreeMealKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionBossPreDamageKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionExtraRerollKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionGoldRarifyKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionFreeTemporaryDuosKeepsake"),

		gods.GetInternalKeepsakeName("StoryExpansionDDHealthKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionBoonRarityBoostKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionPrimeDamageKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionBonusPowerKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionFearForDamageKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionRandomElementsKeepsake"),
		--Ganymede
		gods.GetInternalKeepsakeName("StoryExpansionDecayingDamageProtectionKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionGodsentHexKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionAllySummonKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionCharonWellKeepsake"),

		gods.GetInternalKeepsakeName("StoryExpansionExtraWellPurchaseKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionRemoveShrineKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake"),
		--Jetty
		--Prometheus
		--Epimetheus
		gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionPerfectMaxHealthKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionExtraCastAlectoKeepsake"),
		gods.GetInternalKeepsakeName("StoryExpansionExtraCastTisiphoneKeepsake"),
		--Rhea
	}
	for _, name in ipairs(addedKeepsakes) do
		RemoveValue(ScreenData.KeepsakeRack.ItemOrder, name)
	end
	local count = 0
	for _, name in ipairs(addedKeepsakes) do
		table.insert(ScreenData.KeepsakeRack.ItemOrder, 34 + count, name)
		count = count + 1
	end
end

mod.ResetKeepsakeOrder()

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
	local currentRun = CurrentRun or {}
	local currentRoom = currentRun.CurrentRoom or {}
	currentRoom.RoomCreations = currentRoom.RoomCreations or {}
	currentRun.RoomCreations = currentRun.RoomCreations or {}
	args = args or {}
	args.Rarity = args.Rarity or 1
	local rarityTable = {"Common", "Rare", "Epic", "Heroic"}
	local rarityToAdd = rarityTable[args.Rarity]
	local eligibleFoods = {}
	for i, option in ipairs(PresetEventArgs["StoryExpansionEurydiceFoodChoices"]) do
		if option.GameStateRequirements == nil or IsGameStateEligible(option, option.GameStateRequirements) and not Contains(args.BannedTraits, option.Name) then
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
		if trait and trait.AcquireFunctionName == _PLUGIN.guid..".KeepsakeAddMaxHealth" and CurrentRun.Hero.IsDead then
			AddMaxHealth( -trait.AcquireFunctionArgs.Amount, {}, {Silent = true})
		end
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionExtraCastMegKeepsake") and not CurrentHubRoom and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraCastMegKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionExtraCastMegKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionExtraCastAlectoKeepsake") and not CurrentHubRoom and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraCastAlectoKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionExtraCastAlectoKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionExtraCastTisiphoneKeepsake") and not CurrentHubRoom and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraCastTisiphoneKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionExtraCastTisiphoneKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionFearForDamageKeepsake") and not CurrentHubRoom and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionFearForDamageKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionFearForDamageKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake") and not CurrentHubRoom and not args.AdvanceKeepsakeMoment then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"))
		local processedData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent"), Rarity =trait.Rarity }) 
		AddTraitToHero({ TraitData = processedData })
	end
    local valueToReturn = base(heroUnit,traitName,args)
	ValidateMaxHealth()
	ValidateMaxMana()

    --[[if TraitData[traitName].Permanent and not CanFreeSwapKeepsakes() and not args.AdvanceKeepsakeMoment and Contains({gods.GetInternalKeepsakeName("StoryExpansionPerfectClearKeepsake"), gods.GetInternalKeepsakeName("StoryExpansionExtraCastMegKeepsake"), gods.GetInternalKeepsakeName("StoryExpansionFearForDamageKeepsake")}, traitName) then
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

function mod.AwardPerfectBonusHealth(trait, args)
	AddMaxHealth(args.HealthPerClear, trait, {})
	PlaySound({ Name =  "/Leftovers/Menu Sounds/TalismanPowderUpLEGENDARY", DestinationId = CurrentRun.Hero.ObjectId })
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
if trait.Slot and Contains(CurrentRun.StoryExpansionPermanentKeepsakesUsed, trait.Name) and not CurrentHubRoom then
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
	if currentTraits == nil then return base(args) end 
	for i, trait in ipairs( currentTraits ) do
		if trait.Slot and Contains(CurrentRun.StoryExpansionPermanentKeepsakesUsed, trait.Name) and not CurrentHubRoom then
			TraitUIRemove(trait)
		local reAddTraitToUI = UnequipKeepsake( CurrentRun.Hero, trait.Name )
		            reAddTraitToUI.ShowInHUD = false
		if reAddTraitToUI.Slot and Contains(CurrentRun.StoryExpansionPermanentKeepsakesUsed, reAddTraitToUI.Name) and not CurrentHubRoom then
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


modutil.mod.Path.Wrap("TriggerPostBossEvents", function(base, eventSource,args)
	if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) and IsTraitActive( gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake"))
		ReduceTraitUses(trait,{ Force = true })
		trait.CustomName = trait.ZeroBonusTrayText
		ValidateMaxMana()
	end
	return base(eventSource, args)
end)

modutil.mod.Path.Wrap("PostCombatAudio", function(base,eventSource)
	local currentRun = CurrentRun or {}
	local currentRoom = currentRun.CurrentRoom
	local currentEncounter = eventSource or currentRoom.Encounter

	if currentEncounter and currentEncounter.EncounterType == "Boss" and not currentEncounter.SkipBossTraits then
		if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) and IsTraitActive( gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake"))
		ReduceTraitUses(trait,{ Force = true })
		trait.CustomName = trait.ZeroBonusTrayText
		ValidateMaxMana()
	end
	end
	return base(eventSource)
end)

modutil.mod.Path.Wrap("GetExpectedMaxMana", function(base)
	local expectedMaxMana = base()
	if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionCritOmegaKeepsake")) then
		return math.min(50, expectedMaxMana)
	end
	return expectedMaxMana
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

modutil.mod.Path.Wrap("EquipKeepsake", function(base, heroUnit, traitName, args)
	if traitName == gods.GetInternalKeepsakeName("StoryExpansionDecayingDamageProtectionKeepsake") then
		args = args or {}
		local unit = heroUnit or CurrentRun.Hero
		traitName = traitName or GameState.LastAwardTrait
		local rarity = args.ForceRarity or GetRarityKey(GetKeepsakeLevel(traitName))
		local traitData = AddTrait(unit, traitName, rarity, args)
		if traitData == nil then
			return
		end
		if not CurrentRun.Hero.IsDead then
			CurrentRun.TraitCache[traitName] = CurrentRun.TraitCache[traitName] or 1
		end

		if args.AddToCache then
			table.insert(CurrentRun.KeepsakeCache, traitName)
		end
		traitData.CurrentStoryExpansionProtection = traitData.InitialStoryExpansionProtection
		UpdateTraitNumber(traitData)
	end
	if Contains({gods.GetInternalKeepsakeName("StoryExpansionExtraCastMegKeepsake"), gods.GetInternalKeepsakeName("StoryExpansionExtraCastAlectoKeepsake"), gods.GetInternalKeepsakeName("StoryExpansionExtraCastTisiphoneKeepsake")}, traitName) and not CurrentHubRoom then
		table.insert(CurrentRun.BlockedKeepsakes, gods.GetInternalKeepsakeName("StoryExpansionExtraCastMegKeepsake"))
		table.insert(CurrentRun.BlockedKeepsakes, gods.GetInternalKeepsakeName("StoryExpansionExtraCastAlectoKeepsake"))
		table.insert(CurrentRun.BlockedKeepsakes, gods.GetInternalKeepsakeName("StoryExpansionExtraCastTisiphoneKeepsake"))
	end
	return base(heroUnit, traitName,args)
end)

modutil.mod.Path.Wrap("EndEncounterEffects", function(base, currentRun, currentRoom, currentEncounter)
	if not currentRoom.SkipRoomsPerUpgrade then
		for k, traitData in ipairs( CurrentRun.Hero.Traits ) do
				if traitData.CurrentStoryExpansionProtection and traitData.CurrentStoryExpansionProtection < 1 then
					traitData.CurrentStoryExpansionProtection = traitData.CurrentStoryExpansionProtection + traitData.DecayRate
					if traitData.CurrentStoryExpansionProtection >= 1 then
						traitData.CustomTrayText = traitData.ZeroBonusTrayText
						traitData.CurrentStoryExpansionProtection = 1
						ReduceTraitUses( traitData, { Force = true })
						thread( mod.DecayingDamageKeepsakeExpiredPresentation )
					end
					UpdateTraitNumber(traitData)
				end
			end
	end
	return base(currentRun, currentRoom, currentEncounter)
end)

function mod.DecayingDamageKeepsakeExpiredPresentation()
	PlaySound({ Name = "/SFX/WrathOver", Id = CurrentRun.Hero.ObjectId })
	thread( PlayVoiceLines, HeroVoiceLines.KeepsakeExpiredVoiceLines, true )
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "StoryExpansionDecayingDamageProtectionKeepsakeExpired", Duration = 1.3, PreDelay = 0.2 } )
end

modutil.mod.Path.Wrap("ReserveMana", function(base,amount, source)
    base(amount, source)
    if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionPrimeDamageKeepsake")) then
        local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionPrimeDamageKeepsake"))
        trait.CurrentBonusDamage = 1 + trait.StoryExpansionMaxPrimedManaMultiplier*(CurrentRun.Hero.MaxMana - GetHeroMaxAvailableMana())
        UpdateTraitNumber(trait)
    end
end)


modutil.mod.Path.Wrap("CalculateBaseDamageAdditions", function(base, attacker, victim, triggerArgs)
    local damageAddition = base(attacker, victim, triggerArgs)
	if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionBonusPowerKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionBonusPowerKeepsake"))
		if CheckCooldown("StoryExpansionBonusPowerKeepsake", trait.Cooldown) then
			TraitUIActivateTrait(trait, {Duration = trait.Cooldown})
			damageAddition = damageAddition + trait.StoryExpansionKeepsakeBonusPower
			thread(mod.BonusPowerKeepsakeCooldown, {Cooldown = trait.Cooldown})
		end
	end
    return damageAddition
end)


function mod.BonusPowerKeepsakeCooldown(traitArgs)
    wait(traitArgs.Cooldown, RoomThreadName)
    	PlaySound({ Name = "/SFX/WrathOver", Id = CurrentRun.Hero.ObjectId })
			thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "StoryExpansionRechargedBonusPowerKeepsake", Duration = 1, PreDelay = 0 } )
end


modutil.mod.Path.Wrap("CreateKeepsakeIcon", function(base,screen, components, args)
	base(screen, components, args)
	args = args or {}
	local localx = args.X
	local localy = args.Y
	local itemIndex = args.Index
	local upgradeData = args.UpgradeData
	local keyAppend = args.KeyAppend or ""
	local scale = args.Scale or 0.75
		
	local locked = false
	local buttonKey = "UpgradeToggle"..itemIndex..keyAppend
	if upgradeData.Unlocked then
		if upgradeData.Gift == gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake") and not GameState.TextLinesRecord.StoryExpansionFreeingThanatosDialogue then
			CreateTextBox({ 
					Id = components[buttonKey].Id,
					Text = "BlockedByStoryExpansionThanatosCaptured_Tooltip",
					UseDescription = true,
					OffsetX = 0, OffsetY = 0,
					Color = Color.Transparent,
				})
			locked = true
		end
		local blocked = ( Contains(CurrentRun.BlockedKeepsakes, upgradeData.Gift) or ( CurrentRun.UseRecord.NPC_Athena_01 and not HeroHasTrait("AthenaEncounterKeepsake") and upgradeData.Gift == "AthenaEncounterKeepsake" ) ) 
		local blockedByEnding = false
		if not IsFateValid() and FatedEnableKeepsakes[upgradeData.Gift] then
			blocked = true
		end
		if TraitData[upgradeData.Gift].BlockedByEnding and not IsGameStateEligible( upgradeData, { NamedRequirementsFalse = {"SurfaceRouteLockedByTyphonKill"}} ) then
			blockedByEnding = true
		end
		if locked and not ((not CurrentHubRoom and blocked) or blockedByEnding) then 
		components[buttonKey.."Lock"] = CreateScreenComponent({ Name = "BlankObstacle", X = localx, Y = localy, Group = "Combat_Menu_Overlay", Animation = "LockedKeepsakeIcon" })
			SetColor({ Id = components[buttonKey].Id, Color = Color.DarkSlateGray })
			if components[buttonKey.."Sticker"] then
				SetColor({ Id = components[buttonKey.."Sticker"].Id, Color = Color.SlateGray })
			end
			components[buttonKey].OnPressedFunctionName = "BlockedKeepsakePresentation"
			components[buttonKey].Blocked = true
		end
	end
end)

modutil.mod.Path.Wrap("AddResource", function(base, name, amount, source, args)
	if name == "Money" and HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionGoldRarifyKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionGoldRarifyKeepsake"))
		trait.CurrentGoldCount = trait.CurrentGoldCount + amount
		while trait.CurrentGoldCount >= trait.GoldForRarify do
			AddRarityToTraits(trait, { NumTraits = 1,})
			trait.CurrentGoldCount = trait.CurrentGoldCount - trait.GoldForRarify
		end
		UpdateTraitNumber(trait)
	end
	return base(name, amount, source, args)
end)

function mod.AddRandomElements(args, trait)
	if CurrentHubRoom then return end
	local elementsToAdd = args.ElementsToAdd
	local elementsAdded = 0 
	local eligibleEssence = {"FireEssence", "WaterEssence","EarthEssence", "AirEssence"}
	local essenceToAdd = GetRandomValue(eligibleEssence)
	while elementsAdded < elementsToAdd do
		AddTraitToHero({TraitName = essenceToAdd})
		elementsAdded = elementsAdded + 1
		essenceToAdd = GetRandomValue(eligibleEssence)
	end
end

modutil.mod.Path.Wrap("HandleStorePurchase", function(base, screen, button)
	if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraWellPurchaseKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraWellPurchaseKeepsake"))
		if trait.RemainingDuplications <= 0 then
			return base(screen, button)
		end
	local upgradeData = button.Data
	local canAfford = true
	if upgradeData.HealthCost and CurrentRun.Hero.Health <= upgradeData.HealthCost then
		canAfford = false
	end
	
	local costAmount = 0
	if upgradeData.ResourceCosts then
		for name, amount in pairs( upgradeData.ResourceCosts) do
			if name == "Money" then
				costAmount = amount 
			end
		end
	end

	if GetResourceAmount( "Money" ) < costAmount then
		canAfford = false
	end

	if costAmount ~= nil and costAmount > 0 and upgradeData.PurchaseRequirements ~= nil and not IsGameStateEligible( upgradeData, upgradeData.PurchaseRequirements ) then
		canAfford = false
	end

	if upgradeData.Type == "Trait" then
		if upgradeData.MakePermanent and HeroHasTrait("ExtendedShopTrait") then
			local trait = GetHeroTrait("ExtendedShopTrait")
			upgradeData.UsesAsEncounters = false
			upgradeData.UsesAsRooms = false
			upgradeData.UsesAsBosses = true
			upgradeData.RemainingUses = trait.BossExtension
			upgradeData.StatLines = {"ExtendedStoreUsesRemainingDisplay1"}
			if upgradeData.CustomStatLinesWithShrineUpgrade and GetNumShrineUpgrades( upgradeData.CustomStatLinesWithShrineUpgrade.ShrineUpgradeName ) > 0 then
				upgradeData.CustomStatLinesWithShrineUpgrade.StatLines[1] = "ExtendedStoreUsesRemainingDisplay1"
			end
			UseHeroTraitsWithValue( "BossExtension", true )
		end
		if upgradeData.IncreaseUsesOnStack and HeroHasTrait(upgradeData.Name) then
			local trait = GetHeroTrait( upgradeData.Name )
			trait.RemainingUses = trait.RemainingUses + upgradeData.RemainingUses
			UpdateTraitNumber( trait )
		else
			AddTraitToHero({ TraitData = upgradeData, SkipQuestStatusCheck = true, SkipAddToHUD = true})
		end
		IncrementTableValue( GameState.ItemInteractions, upgradeData.Name )
		CheckCodexUnlock( "Items", upgradeData.Name )
	elseif upgradeData.Type == "Consumable" then
		local consumableName = upgradeData.Name
		local consumableId = SpawnObstacle({ Name = consumableName, DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing" })
		local consumable = CreateConsumableItemFromData( consumableId, upgradeData, 0 )
		consumable.CanDuplicate = false
	end	
	trait.RemainingDuplications = trait.RemainingDuplications - 1
	end 
	return base(screen, button)
end)

modutil.mod.Path.Wrap("HandleSurfaceShopAction", function(base,screen, button)
	if HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraWellPurchaseKeepsake")) then
		local trait = GetHeroTrait(gods.GetInternalKeepsakeName("StoryExpansionExtraWellPurchaseKeepsake"))
		if trait.RemainingDuplications <= 0 then
			return base(screen, button)
		end
	local components = screen.Components
	local upgradeData = button.Data
	local costAmount = 0
	local speedUpDelivery = false
	local itemData = nil
	local itemIndex = nil
	local canAfford = true
	for i, value in pairs (CurrentRun.CurrentRoom.Store.StoreOptions) do
		if value.Name == upgradeData.Name then
			itemData = value	
			itemIndex = i
			if value.Purchased then
				speedUpDelivery = true
			end
		end
	end

	if speedUpDelivery then
		if not HasResources( upgradeData.SpeedUpResourceCosts ) then
			canAfford = false
		end
	else
		if not HasResources( upgradeData.ResourceCosts ) then
			canAfford= false
			return
		else
		end
	end

	if upgradeData.PurchaseRequirements ~= nil and not IsGameStateEligible( upgradeData, upgradeData.PurchaseRequirements ) then
		canAfford = false
	end



	if not speedUpDelivery and canAfford then
		local shopTrait = DeepCopyTable(TraitData.StorePendingDeliveryItem)
		shopTrait.RemainingUses = itemData.RoomDelay 
		shopTrait.OnExpire = { SpawnShopItem = DeepCopyTable( itemData  ) }
		if shopTrait.OnExpire.SpawnShopItem.Args then
			shopTrait.OnExpire.SpawnShopItem.Args.ResourceCosts = { Money = 0 }
		else
			shopTrait.OnExpire.SpawnShopItem.ResourceCosts = { Money = 0 }
			shopTrait.OnExpire.SpawnShopItem.CostOverride = 0
		end
		shopTrait.OnExpire.SpawnShopItem.PendingShopItem = true
		shopTrait.AcquiredDepth = CurrentRun.RunDepthCache
		shopTrait.ShopItemName = itemData.Name 
		shopTrait.ItemDisplayName = GetSurfaceShopText(itemData, {ForTraitTray = true })
		if itemData.Name == "SpellDrop" then
			CurrentRun.PendingSpellDrop = true
		end
		AddTraitToHero({ TraitData =  shopTrait, SkipUIUpdate = true })
		trait.RemainingDuplications = trait.RemainingDuplications - 1
		UpdateTraitNumber(trait)
	end
end
	return base(screen, button)
end)



function mod.TritonRemoveShrine(args, trait)
	if CurrentHubRoom then return end
	local additionalSuccessChance = args.AdditionalShrineBanishChance
	local count = 1
	if RandomChance(additionalSuccessChance * GetTotalHeroTraitValue( "LuckMultiplier", { IsMultiplier = true })) then
		count = count + 1
	end
	local shrineOptions = {}
	for name, rank in pairs( GameState.ShrineUpgrades ) do
		if rank > 0 and not MetaUpgradeData[name].IneligibleForCirceRemoval and not CurrentRun.ShrineUpgradesDisabled[name] then
			shrineOptions[name] = true
		end
	end
	local presentationIncrement = 0
	while count > 0 and not IsEmpty( shrineOptions ) do
		local shrineKey = GetRandomKey( shrineOptions )
		shrineOptions[shrineKey] = nil
		CurrentRun.ShrineUpgradesDisabled[shrineKey] = true
		if MetaUpgradeData[shrineKey].OnDisabledFunctionName ~= nil then
			CallFunctionName( MetaUpgradeData[shrineKey].OnDisabledFunctionName )
		end
		count = count - 1
		presentationIncrement = presentationIncrement + 1
		ShrineUpgradeExtractValues( shrineKey )
		thread( CirceRemoveShrinePresentation, shrineKey, 1 + presentationIncrement * 1.1  )
	end
end

function mod.AddExtraRerolls(args, trait)
	if not CurrentRun or not CurrentRun.NumRerolls then return end
	if CurrentHubRoom then return end
	local rerollsToAdd = trait.RerollCount
	AddRerolls(trait, {Amount = rerollsToAdd})
end