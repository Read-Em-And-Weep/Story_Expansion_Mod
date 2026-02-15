import 'TraitData/TraitData_Eurydice.lua'

modutil.mod.Path.Wrap("ChooseLoot", function(base, excludeLootNames, forceLootName)
    local output = base(excludeLootNames, forceLootName)
    if forceLootName == nil then
    for k, trait in pairs( CurrentRun.Hero.Traits ) do
        if trait.StoryExpansionEurydiceForceGod and RandomChance(0.3) and not Contains(excludeLootNames, trait.StoryExpansionEurydiceForceGod) then
            output = LootData[trait.StoryExpansionEurydiceForceGod]
            thread( InCombatText, CurrentRun.Hero.ObjectId, "ForceBoonKeepsakeActivated", 2.0, { PreDelay = 1.0, LuaKey = "TempTextData", LuaValue = trait } )
        end
    end
    end
    return output
end)

modutil.mod.Path.Wrap("GetTraitFrame", function(base, trait)
    if trait.StoryExpansionEurydiceFoodTrait then
        local frameRarities =
		{
			Common = "Frame_Keepsake_Rank1",
			Rare = "Frame_Keepsake_Rank2",
			Epic = "Frame_Keepsake_Rank3",
			Heroic = "Frame_Keepsake_Rank4",
		}
        trait.Rarity = trait.Rarity or "Common"
        return frameRarities[trait.Rarity]
    end
    return base(trait)
end)

modutil.mod.Path.Wrap("CreateStackLoot", function(base, args)
	args = args or {}
	if args.StackNum == nil then
		args.StackNum = 1
	end
	if HeroHasTrait(gods.GetInternalBoonName("EurydiceFoodMorePotentPomsTrait")) then
		local trait = GetHeroTrait(gods.GetInternalBoonName("EurydiceFoodMorePotentPomsTrait"))
        if trait.RemainingUses > 0 then
		args.StackNum = args.StackNum + trait.StoryExpansionTemporaryPomLevelBonus
        trait.RemainingUses = trait.RemainingUses - 1
        UpdateTraitNumber(trait)
        thread( InCombatText, CurrentRun.Hero.ObjectId, "ForceBoonKeepsakeActivated", 2.0, { PreDelay = 1.0, LuaKey = "TempTextData", LuaValue = trait } )
        end
        if trait.RemainingUses <= 0 then
            RemoveTraitData( CurrentRun.Hero, trait, { SkipActivatedTraitUpdate = IsEmpty( trait.Elements ) } )
        end
	end
	return base(args)
end)

function mod.FoodBuffAcquireRandomBoonOfGod(args, traitData)
    args = args or {}
    local eligibleTraits = {}
    if args.God and not CanFreeSwapKeepsakes() then
        local rarityTable = {"Common", "Rare", "Epic", "Heroic"}
        args.Rarity = args.Rarity or 1
        local rarity = rarityTable[args.Rarity]
        for key, traitName in ipairs(EnemyData[args.God].Traits) do
            local traitData = TraitData[traitName]
            if traitData.GameStateRequirements == nil or IsGameStateEligible( traitData, traitData.GameStateRequirements ) then
                table.insert(eligibleTraits, traitName)
            end
        end
        if #eligibleTraits > 0 then
            local chosenTrait = RemoveRandomValue(eligibleTraits)
            local chosenTraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = chosenTrait, Rarity = rarity })
            local trait = AddTraitToHero({ TraitData = chosenTraitData, SkipQuestStatusCheck = true, SkipAddToHUD = true})
            trait.StoryExpansionIsGrantedByEurydiceFood = true
            UpdateHeroTraitDictionary()
            thread(HadesKeepsakeAcquiredPresentation, chosenTrait)
        end
    end
end

function mod.RunStartEurydiceFoodBoonAcquiredPresentation()
    local traitData = nil
	for i, trait in ipairs( CurrentRun.Hero.Traits ) do
		if trait.StoryExpansionIsGrantedByEurydiceFood then
			traitData = trait
			break
		end
	end
	if traitData then
	thread( InCombatTextArgs, { TargetId= CurrentRun.Hero.ObjectId, Text = "HadesKeepsake_Acquire", SkipRise = false, SkipFlash = false, Duration = 1.5, ShadowScaleX = 1.2, LuaKey = "TempTextData", 
		LuaValue = { NewName = traitData.Name }})
	end
end

function mod.FoodBuffAcquireRandomArcana(args, traitData)
    args = args or {}
    if CanFreeSwapKeepsakes() then
        return
    end
    AddRandomMetaUpgrades(args.Amount, { RarityLevel = args.CardRarity, Delay = args.Delay })
end

modutil.mod.Path.Wrap("IsSecretDoorEligible", function(base, currentRun, currentRoom)
    local output = base(currentRun, currentRoom)
    if not output and HeroHasTrait(gods.GetInternalBoonName("EurydiceFoodSecretDoorTrait")) then
        local trait = GetHeroTrait(gods.GetInternalBoonName("EurydiceFoodSecretDoorTrait"))
        if RandomChance(trait.StoryExpansionSecretDoorChance* GetTotalHeroTraitValue( "LuckMultiplier", { IsMultiplier = true } )) and IsGameStateEligible( currentRoom, NamedRequirementsData.ForceSecretDoorRequirements ) then
            thread( InCombatText, CurrentRun.Hero.ObjectId, "ForceBoonKeepsakeActivated", 2.0, { PreDelay = 1.0, LuaKey = "TempTextData", LuaValue = trait } )
            return true
        end
    end
    return output
end)

function mod.FoodGrantMoney(args, traitData)
    args = args or {}
    if args.Amount and not CanFreeSwapKeepsakes() then
        AddResource( "Money", args.Amount , "RunStart" )
    end
end

function mod.AwardKudosForBoss(trait, args)
	local encounter = CurrentRun.CurrentRoom.Encounter
	if encounter == nil or encounter.EncounterType ~= "Boss" or encounter.SkipBossTraits then
		return
	end

    args = args or {}
    if args.KudosAmount then
        AddResource("CosmeticsPoints", args.KudosAmount, trait.Name)
    end
    if HeroHasTrait(gods.GetInternalBoonName("EurydiceFoodBossKudosTrait")) then
        local newTrait = GetHeroTrait(gods.GetInternalBoonName("EurydiceFoodBossKudosTrait"))
        thread( InCombatText, CurrentRun.Hero.ObjectId, "ForceBoonKeepsakeActivated", 2.0, { PreDelay = 1.0, LuaKey = "TempTextData", LuaValue = newTrait } )
    end
end

function mod.DiminishingDodgeSetup( unit, traitArgs )
	local trait = GetHeroTrait(gods.GetInternalBoonName("EurydiceFoodDiminishingDodgeTrait"))
	SetLifeProperty({ Property = "DodgeChance", Value = trait.CurrentDodgeChance, ValueChangeType = "Add", DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
end

function mod.DiminishingDodge( unit, traitArgs )
	if CheckCooldown( "StoryExpansionDiminishingDodge", traitArgs.Cooldown ) then
		local trait = GetHeroTrait(gods.GetInternalBoonName("EurydiceFoodDiminishingDodgeTrait"))

		if trait.CurrentDodgeChance > trait.Decay then	
			trait.CurrentDodgeChance = trait.CurrentDodgeChance - trait.Decay
			SetLifeProperty({ Property = "DodgeChance", Value = -trait.Decay, ValueChangeType = "Add", DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
		else
			SetLifeProperty({ Property = "DodgeChance", Value = -trait.CurrentDodgeChance, ValueChangeType = "Add", DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
			thread( mod.DiminishingDodgeExpiredPresentation )
			RemoveTraitData( CurrentRun.Hero, trait )
		end
        if trait.CurrentDodgeChance <= 0 then
            thread( mod.DiminishingDodgeExpiredPresentation )
			RemoveTraitData( CurrentRun.Hero, trait )
        end
	end
end

function mod.DiminishingDodgeExpiredPresentation()
	PlaySound({ Name = "/SFX/WrathOver", Id = CurrentRun.Hero.ObjectId })
	thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "StoryExpansionDiminishingDodgeExpired", Duration = 1.3, PreDelay = 0.2 } )
end

function mod.GrantRandomElementSelection(args, traitData)
	local elementsAdded = 0 
	local eligibleEssence = {"FireEssence", "WaterEssence","EarthEssence", "AirEssence"}
	local essenceToAdd = GetRandomValue(eligibleEssence)
	while elementsAdded < args.Amount and not CanFreeSwapKeepsakes() do
		AddTraitToHero({TraitName = essenceToAdd})
		elementsAdded = elementsAdded + 1
		essenceToAdd = GetRandomValue(eligibleEssence)
	end
end