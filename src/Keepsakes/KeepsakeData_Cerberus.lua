--Perfect clear bonus health?

gods.CreateKeepsake({
    characterName = "Cerberus",
    internalKeepsakeName = "StoryExpansionPerfectMaxHealthKeepsake",

    RarityLevels = {
        Common = 5,
        Rare = 10,
        Epic = 15,
        Heroic = 20,
    },

    Keepsake = {
        displayName = "Beloved Plush",
        description = "Gain {#UpgradeFormat}+{$TooltipData.ExtractData.MaxHealthIncrease}{#Prev}{!Icons.HealthUp} whenever you clear an {$Keywords.EncounterAlt} without taking damage.",
        signoffMax = "From {#AwardMaxFormat}Cerberus{#Prev}{!Icons.ObjectiveSeparatorDark}The two of you share a ferocious bond, and will forevermore.",
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
      OnEncounterStartFunction =
        {
            Name = "RecordDamageSnapshot",
        },
        EncounterEndFunctionName = _PLUGIN.guid .. ".CheckPerfectClear",
        EncounterEndFunctionArgs = {
            PerfectFunctionName = _PLUGIN.guid .. ".AwardPerfectBonusHealth",
            PerfectFunctionArgs = {
                HealthPerClear = {BaseValue = 1},
                ReportValues = {ReportedCount = "HealthPerClear"}
            }
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