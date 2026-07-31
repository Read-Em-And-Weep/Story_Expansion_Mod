-- Random selection of elements

gods.CreateKeepsake({
    characterName = "Calypso",
    internalKeepsakeName = "StoryExpansionRandomElementsKeepsake",

    RarityLevels = {
        Common = 3,
        Rare = 5,
        Epic = 7,
        Heroic = 9,
    },

    Keepsake = {
        displayName = "Rustic Statuette",
        description = "Gain a {#BoldFormatGraft} random {#Prev} assortment of {#UpgradeFormat}+{$TooltipData.ExtractData.RandomElements}{#Prev}{$ConsumableData.ElementalBoost.UseFunctionArgs.[1].TraitName}.",
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
      AcquireFunctionName = _PLUGIN.guid..".AddRandomElements",
		AcquireFunctionArgs = 
		{
			ElementsToAdd = {BaseValue = 1},
			ReportValues = { ReportedCount = "ElementsToAdd" }
		},
    },

    ExtractValues = {
        {
            Key = "ReportedCount",
            ExtractAs = "RandomElements"
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})