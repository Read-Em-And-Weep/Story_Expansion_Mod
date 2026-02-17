gods.CreateKeepsake({
    characterName = "Dusa",
    internalKeepsakeName = "StoryExpansionMaxHealthKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Heroic = 5,
    },

    Keepsake = {
        displayName = "Painted Heart",
        description = "Gain {#UpgradeFormat}+{$TooltipData.ExtractData.MaxHealthIncrease}{#Prev}{!Icons.HealthUp} this night.",
        signoffMax = "From {#AwardMaxFormat}Dusa{#Prev}{!Icons.ObjectiveSeparatorDark}Through duty, strength and perseverance, one can succeed.",
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
      AcquireFunctionName = _PLUGIN.guid..".KeepsakeAddMaxHealth",
		AcquireFunctionArgs = 
		{
			Amount = { BaseValue = 50 },
			Source = "StoryExpansionMaxHealthKeepsake",
			ReportValues = { ReportedCount = "Amount" }
		},
    },

    ExtractValues = {
        {
            Key = "ReportedCount",
            ExtractAs = "MaxHealthIncrease"
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})