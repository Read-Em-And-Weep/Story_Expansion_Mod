gods.CreateKeepsake({
    characterName = "Andromache",
    internalKeepsakeName = "StoryExpansionExtraRerollKeepsake",

    RarityLevels = {
        Common = 2,
        Rare = 4,
        Epic = 6,
        Heroic = 8,
    },

    Keepsake = {
        displayName = "Carved Dice",
        description = "Gain {#UpgradeFormat}+{$TooltipData.ExtractData.Count}{#Prev}{!Icons.ReRollAlt} for the rest of this night.",
        signoffMax = "From {#AwardMaxFormat}Andromache{#Prev}{!Icons.ObjectiveSeparatorDark}A disciplined mind is one prepared for anything.",
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
        RerollCount = {BaseValue = 1},
      AcquireFunctionName = _PLUGIN.guid..".AddExtraRerolls",
    },

    ExtractValues = {
        {
            Key = "RerollCount",
            ExtractAs = "Count"
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})

FatedDisableKeepsakes[gods.GetInternalKeepsakeName("StoryExpansionExtraRerollKeepsake")] = true