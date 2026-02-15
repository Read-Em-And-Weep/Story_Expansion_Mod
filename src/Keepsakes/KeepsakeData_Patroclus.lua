gods.CreateKeepsake({
    characterName = "Patroclus",
    internalKeepsakeName = "StoryExpansionCharonWellKeepsake",

    RarityLevels = {
        Common = 2,
        Rare = 3,
        Epic = 4,
        Heroic = 6,
    },

    Keepsake = {
        displayName = "Mystery Goodies",
        description = "At the start of every {$Keywords.EncounterAlt}, gain a random item offered from the {$Keywords.WellShop}, up to {#UpgradeFormat} {$TooltipData.ExtractData.Count} {#Prev} more time(s) this night.",
        signoffMax = "From {#AwardMaxFormat}Patroclus{#Prev}{!Icons.ObjectiveSeparatorDark}In the shadows of the greats, one must find their own fortitude.",
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
      OnEncounterStartFunction = { Name =_PLUGIN.guid..".KeepsakeRewardRandomConsumables",
		Args = 
		{
            NumberAwarded = {BaseValue = 1},
            ReportValues = {ReportedCount = "NumberAwarded"}
        		},        
            }
    },

    ExtractValues = {
        {
            Key = "ReportedCount",
            ExtractAs = "Count"
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})