import 'ScreenLogic_Fate.lua'

--       "FateManipulationLessLikely",
--		"FateManipulationMoreLikely",
--		"FateManipulationMoreRare",
--		"FateManipulationMoreDuo",
--		"FateManipulationMoreLegendary",
--		"FateManipulationHealOnPickup",
--		"FateManipulationArmorOnPickup",
--		"FateManipulationManaOnPickup",
--		"FateManipulationGoldOnPickup",
--		"FateManipulationSecondaryOnly",



mod.FateManipulationLessLikelySuccess = 0.4
mod.FateManipulationMoreLikelySuccess = 0.1
mod.FateManipulationMoreRareBoost = 0.2
mod.FateManipulationMoreDuoBoost = 0.1
mod.FateManipulationMoreLegendaryBoost = 0.05
mod.FateManipulationHeal = 10
mod.FateManipulationArmor = 8
mod.FateManipulationMana = 10
mod.FateManipulationMoney = 20

modutil.mod.Path.Wrap("RunStateInit", function(base)
    if CurrentRun == nil then
		return base()
	end
    if GameState.StoryExpansionFateManipulationsActive and not CurrentRun.StoryExpansionFateManipulationSetup then
        CurrentRun.StoryExpansionFateManipulationSetup = true
        CurrentRun.StoryExpansionFateManipulationBans = CurrentRun.StoryExpansionFateManipulationBans or {}
       for god, upgrade in pairs(GameState.StoryExpansionFateManipulationsActive) do
        if upgrade == "FateManipulationLessLikely" and RandomChance(mod.FateManipulationLessLikelySuccess) then
            CurrentRun.StoryExpansionFateManipulationBans[god] = true
            --TODO: IMPLEMENT THE ABOVE BY HOOKING INTO CHOOSE LOOT FUNCTION
        elseif upgrade == "FateManipulationMoreLikely" and RandomChance(mod.FateManipulationMoreLikelySuccess) then
            CurrentRun.LootTypeHistory = CurrentRun.LootTypeHistory or {}
            CurrentRun.LootTypeHistory[god] = 1
        elseif upgrade == "FateManipulationSecondaryOnly" then
            mod.BanAllPrimaryBoons(god)
        end
       end
    end
    return base()
end)

function mod.BanAllPrimaryBoons(god)
    CurrentRun.BannedTraits = CurrentRun.BannedTraits or {}
    for _, trait in ipairs(LootData[god].Traits) do
		local traitData = TraitData[trait]
        if traitData.Slot then
        CurrentRun.BannedTraits[trait] = true
        end
	end
end

modutil.mod.Path.Wrap("GetRarityChances", function(base, loot)
    local rarityChances = base(loot)
    local lootName = loot.Name
    if lootName and GameState.StoryExpansionFateManipulationsActive then
        if GameState.StoryExpansionFateManipulationsActive[lootName] then
           if GameState.StoryExpansionFateManipulationsActive[lootName] == "FateManipulationMoreRare" then
            rarityChances["Rare"] = rarityChances["Rare"] or 0
            rarityChances["Rare"] = rarityChances["Rare"] + mod.FateManipulationMoreRareBoost
           elseif GameState.StoryExpansionFateManipulationsActive[lootName] == "FateManipulationMoreDuo" then
            rarityChances["Duo"] = rarityChances["Duo"] or 0
            rarityChances["Duo"] = rarityChances["Duo"] + mod.FateManipulationMoreDuoBoost
            elseif GameState.StoryExpansionFateManipulationsActive[lootName] == "FateManipulationMoreLegendary" then
                rarityChances["Legendary"] = rarityChances["Legendary"] or 0
                rarityChances["Legendary"] = rarityChances["Legendary"] + mod.FateManipulationMoreLegendaryBoost
           end
        end
    end
    return rarityChances
end)

modutil.mod.Path.Wrap("HandleUpgradeChoiceSelection", function(base,screen,button,args)
	local source = screen.Source
	local spawnTarget = nil
	local duplicateOnClose = false
	local name = source.Name
	args = args or {}

	local upgradeData = button.Data
	if name and GameState.StoryExpansionFateManipulationsActive and GameState.StoryExpansionFateManipulationsActive[name] then
		if GameState.StoryExpansionFateManipulationsActive[name] == "FateManipulationHealOnPickup" then
            Heal(CurrentRun.Hero, {HealAmount = mod.FateManipulationHeal, Silent = true})
        elseif GameState.StoryExpansionFateManipulationsActive[name] == "FateManipulationArmorOnPickup" then
            AddArmor(mod.FateManipulationArmor, {Thread = true, Delay = 1})
		    FrameState.RequestUpdateHealthUI = true
        elseif GameState.StoryExpansionFateManipulationsActive[name] == "FateManipulationManaOnPickup" then
            AddMaxMana( mod.FateManipulationMana, "StoryExpansionFateManipulation", { Thread = true, Delay = 0.2, Silent = true})
        elseif GameState.StoryExpansionFateManipulationsActive[name] == "FateManipulationGoldOnPickup" then
            thread( GushMoney, { Amount = mod.FateManipulationMoney, LocationId = CurrentRun.Hero.ObjectId, Radius = 100, Source = "StoryExpansionFateManipulation", Delay = 1})
        end
	end
    return base(screen,button,args)
end)

modutil.mod.Path.Wrap("GetEligibleLootNames", function(base, excludeLootNames)
    local output = base(excludeLootNames)
    if CurrentRun.StoryExpansionFateManipulationBans then
        for _, god in ipairs(output) do
            if TableLength(output) <= 1 then
                break
            end
            if CurrentRun.StoryExpansionFateManipulationBans[god] then
                RemoveValue(output, god)
            end
        end
    end
    return output
end)