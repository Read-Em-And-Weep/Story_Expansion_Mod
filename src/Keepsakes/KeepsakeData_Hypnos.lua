-- Give this keepsake to someone else (Orion? Maybe Telemachus? Or Prometheus) In it's place, add in chance for boons to have a poppy on them
-- Poppies are invested in dreams (generated like Selene Hexes) which can provide small upgrades like instant money, rarity chance, etc.
-- Actually instead have common boons having enhancements/modifiers (like grant gold/armour every x encounters, self-rarifying etc.)

-- Lets rename it to a Poppy bouquet
gods.CreateKeepsake({
    characterName = "Hypnos",
    internalKeepsakeName = "StoryExpansionFreeTemporaryDuosKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Heroic = 4,
    },

    Keepsake = {
        displayName = "Poppy Bouquet",
        description = "Gain {#UpgradeFormat} {$TooltipData.ExtractData.Count} {#Prev} random {$Keywords.Duo} blessing(s) that last for {#BoldFormat}{$TooltipData.ExtractData.TooltipDuration} {#Prev}{$Keywords.EncounterPlural} from Olympians whose {$Keywords.GodBoonPlural} you've accepted.",
        signoffMax = "From {#AwardMaxFormat}Hypnos{#Prev}{!Icons.ObjectiveSeparatorDark}Though you were never able to interact with him in your youth, you never the less feel a close bond with him.",
        trayExpired = "This {$Keywords.KeepsakeAlt}'s effect has expired for this night."
    },

    Icons = {
        iconPathOverrides = {
        iconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
		maxCornerIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_small\\Demeter",
		maxIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_big\\Demeter",
        }
    },

    ExtraFields = {
        AcquireFunctionName = _PLUGIN.guid..".GiveDreamDuos",
		AcquireFunctionArgs = 
		{
			SkipRequirements = true,		-- Skip prereq traits
			Count = {BaseValue = 1},
            Duration = 10,
			BlockedTraits = 
			{
				SuperSacrificeBoonHera = true,
				SuperSacrificeBoonZeus = true,
			},
			ReportValues = { ReportedCount = "Count", ReportedDuration = "Duration",}
		},
    },

    ExtractValues = {
        {
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
            {
				Key = "ReportedDuration",
				ExtractAs = "TooltipDuration",
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})


function mod.GiveDreamDuos(args, origTraitData)
    if not CurrentRun.Hero.IsDead then
		mod.GrantEligibleDreamDuos( args, originalTraitData )
	end
end


function mod.GrantEligibleDreamDuos( args, originalTraitData )
	if game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun" then
        return
    end
    args = args or {}
	local interactedGods = GetInteractedGodsThisRun()
    if IsEmpty(interactedGods) then
        interactedGods = {"ZeusUpgrade", "PoseidonUpgrade", "HeraUpgrade", "HestiaUpgrade",
    "DemeterUpgrade", "AphroditeUpgrade", "HephaestusUpgrade", "AresUpgrade", "ApolloUpgrade"}
    end
	local eligibleTraits = {}
	local addedTraits = {}
	local blockedTraits = args.BlockedTraits or {}
	for _, lootName in pairs(interactedGods) do
		for s, traitName in pairs( LootData[lootName].Traits ) do
			if not blockedTraits[traitName] and TraitData[traitName].IsDuoBoon and IsTraitEligible(TraitData[traitName]) and (args.SkipRequirements or HasTraitRequirements( traitName )) and 
            (not TraitData[traitName].StoryExpansionIsChthonicBoon or 
            (TraitData[traitName].StoryExpansionIsChthonicBoon and (HeroHasTrait(gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake")) or HeroHasTrait(gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent"))))) then
				table.insert(eligibleTraits, traitName )
			end
		end
	end
	for i=1, args.Count do
		if not IsEmpty(eligibleTraits) then
			local traitName  = RemoveRandomValue( eligibleTraits )
			local lootSource = TraitData[traitName].PackageName or GetLootSourceName( traitName )
			LoadPackages({ Name = lootSource, IgnoreAssert = true })
            local traitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitName })
            traitData.RemainingUses = args.Duration
        	traitData.UsesAsEncounters = true
	        traitData.OnExpire = { FunctionName = _PLUGIN.guid..".DreamDuoLostPresentation", FunctionArgs = traitName }
			AddTraitToHero({ TraitData = traitData, SkipAddToHUD = true, SkipActivatedTraitUpdate = true })
			addedTraits[traitName] = true
		end
	end
	thread( BoonGrantedPresentation, addedTraits, 2.0 )
	UpdateHeroTraitDictionary()
end


function mod.DreamDuoLostPresentation( traitName )
	thread( InCombatTextArgs, { TargetId= CurrentRun.Hero.ObjectId, Text = "StoryExpansionDreamDuo_Lost", SkipRise = false, SkipFlash = false, Duration = 1.5, ShadowScaleX = 1.2, LuaKey = "TempTextData", UseProgressiveStack = true, 
	LuaValue = { Name = traitName }})
end
