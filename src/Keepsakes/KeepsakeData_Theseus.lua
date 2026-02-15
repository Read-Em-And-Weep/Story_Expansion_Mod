if not gods.IsKeepsakeRegistered("StoryExpansionBoonRarityBoostKeepsake") then
gods.CreateKeepsake({
    characterName = "Theseus",
    internalKeepsakeName = "StoryExpansionBoonRarityBoostKeepsake",

    RarityLevels = {
        Common = 3,
        Rare = 5,
        Epic = 7,
        Heroic = 9,
    },

    Keepsake = {
        displayName = "Rescued Merchandise",
        description = "Every {$Keywords.GodBoon} you claim has a {#UpgradeFormat} {$TooltipData.ExtractData.EpicPercent:P} {#Prev} to be {$Keywords.Epic}, but you lose {#PenaltyFormat} -20% {#Prev} with each {$Keywords.GodBoonNoTooltip}.",
        signoffMax = "From {#AwardMaxFormat}Theseus{#Prev}{!Icons.ObjectiveSeparatorDark}To do nothing while others suffer is tantamount to enabling the suffering itself.",
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