if not gods.IsKeepsakeRegistered("StoryExpansionBoonRarityBoostKeepsake") then
gods.CreateKeepsake({
    characterName = "Ariadne",
    internalKeepsakeName = "StoryExpansionBoonRarityBoostKeepsake",

    RarityLevels = {
        Common = 5,
        Rare = 7,
        Epic = 9,
        Heroic = 12,
    },

    Keepsake = {
        displayName = "Woven Pendant",
        description = "Every {$Keywords.GodBoon} you claim has a {#UpgradeFormat} {$TooltipData.ExtractData.EpicPercent:P} {#Prev} to be {$Keywords.Epic}, but you lose {#PenaltyFormat} -20% {#Prev} with each {$Keywords.GodBoonNoTooltip}.",
        signoffMax = "From {#AwardMaxFormat}Ariadne{#Prev}{!Icons.ObjectiveSeparatorDark}Hope for the best, but always plan for the worst.",
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
		RarityBonus =
		{
			GodLootOnly = true,
            Epic = {BaseValue = 0.1},
            ReportValues = {ReportedEpicBonus = "Epic"}
		},
        Decay = 0.2,
        --update Decay manually in description
    },

    ExtractValues = {
        {
				Key = "ReportedEpicBonus",
				ExtractAs = "EpicPercent",
                Format = "Percent"
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end