gods.CreateKeepsake({
    characterName = "Sisyphus",
    internalKeepsakeName = "StoryExpansionDecayingDamageProtectionKeepsake",

    RarityLevels = {
        Common =
			{
				Multiplier = 3,
			},
			Rare =
			{
				Multiplier = 4,
			},
			Epic =
			{
				Multiplier = 5,
			},
			Heroic =
			{
				Multiplier = 7,
			}
    },

    Keepsake = {
        displayName = "Bouldy Jr.",
        description = "Take {#UpgradeFormat}-{$TooltipData.ExtractData.StartingBonus}% {#Prev} less damage, but lose {#BoldFormatGraft}{$TooltipData.ExtractData.DecayRate}% {#Prev}of this bonus after each {$Keywords.EncounterAlt}.",
        signoffMax = "From {#AwardMaxFormat}Sisyphus{#Prev}{!Icons.ObjectiveSeparatorDark}For mortals, self-growth is a necessity due to their limited time; perhaps immortals could learn from this.",
        trayExpired = "This {$Keywords.KeepsakeAlt}'s effect has expired for this night."
    },

    Icons = {
        iconPathOverrides = {
        iconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
		maxCornerIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_small\\Demeter",
		maxIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_big\\Demeter",
        },
    },

    ExtraFields = {
      AddIncomingDamageModifiers = {
        UseTraitValue = "CurrentStoryExpansionProtection",
      },
      	InitialStoryExpansionProtection = { BaseValue = 0.9, SourceIsMultiplier = true },
		CurrentStoryExpansionProtection = 1,
		DecayRate = 0.05,
        CustomTrayText = "StoryExpansionDecayingDamageProtectionKeepsake_Tray",
    },

    ExtractValues = {
        {
				Key = "InitialStoryExpansionProtection",
				ExtractAs = "StartingBonus",
				Format = "NegativePercentDelta",
                HideSigns = true,
			},
			{
				Key = "CurrentStoryExpansionProtection",
				ExtractAs = "CurrentBonus",
				Format = "NegativePercentDelta",
                HideSigns = true,
			},
			{
				Key = "DecayRate",
				ExtractAs = "DecayRate",
				Format = "Percent",
			}
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})