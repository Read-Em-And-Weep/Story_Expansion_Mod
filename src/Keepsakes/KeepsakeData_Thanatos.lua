gods.CreateKeepsake({
    characterName = "Thanatos",
    internalKeepsakeName = "StoryExpansionSummonThanatosKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Heroic = 4,
    },

    Keepsake = {
        displayName = "Scythe Pin",
        description = "While you have at least one {!Icons.ExtraChanceMisc}, {#BoldFormatGraft}Thanatos {#Prev}may appear once this night with at least {#AltUpgradeFormat}{$TooltipData.ExtractData.RarityValue} {#Prev}{$Keywords.GodBoonPluralNoTooltip}.",
        signoffMax = "From {#AwardMaxFormat}Thanatos{#Prev}{!Icons.ObjectiveSeparatorDark}Death comes for all mortals, yet only few immortals are capable of cultivating a close bond with him.",
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
		BlockedByEnding = true,
        UniqueEncounterArgs = 
		{
			GameStateRequirements = 
			{
				{
					Path = { "CurrentRun", "Hero", "LastStands" },
					UseLength = true,
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "CurrentRun", "BiomeDepthCache" },
					Comparison = ">=",
					Value = 2,
				},
				{
					PathFalse = { "CurrentRun", "CurrentRoom", "BlockAthenaEncounterKeepsake" }
				},
				NamedRequirementsFalse = { "HecateMissing" },
			},
			EncounterThreadedFunctions = 
			{
				FunctionName = _PLUGIN.guid..".HandleThanatosSpawn",
				Args = 
				{
					RarityLevelBonus = { BaseValue = 1 },
					FromTrait = gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake"),
					ReportValues = { BlessingRarityBonus = "RarityLevelBonus" },
				},
			},},
            RemainingUses = 1,
        },

    ExtractValues = {
        {
				Key = "BlessingRarityBonus",
				ExtractAs = "RarityValue",
				Format = "Rarity",
				SkipAutoExtract = true,
			},
			{
				External = true,
				BaseType = "HeroData",
				BaseName = "LastStandData",
				BaseProperty = "Heal",
				Format = "Percent",
				ExtractAs = "LastStandHeal",
				SkipAutoExtract = true,
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})

FatedDisableKeepsakes[gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake")] = true