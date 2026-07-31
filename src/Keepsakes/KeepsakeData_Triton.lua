--Banish oaths either permanently (maybe guarantee one plus one extra X% of the time)

gods.CreateKeepsake({
    characterName = "Triton",
    internalKeepsakeName = "StoryExpansionRemoveShrineKeepsake",

    RarityLevels = {
        Common = 2.5,
        Rare = 5,
        Epic = 7.5,
        Heroic = 10,
    },

    Keepsake = {
        displayName = "Calming Horn",
        description = "Randomly draw one of your active {$Keywords.ShrineUpgradePlural}, and {#UpgradeFormat} {$TooltipData.ExtractData.Chance:P} {#Prev} of the time an additional one, and remove their effects this night.",
        signoffMax = "From {#AwardMaxFormat}Triton{#Prev}{!Icons.ObjectiveSeparatorDark}Bravery is fighting despite of fear and despair, not the absence of them.",
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
      AcquireFunctionName = _PLUGIN.guid..".TritonRemoveShrine",
		AcquireFunctionArgs = 
		{
			AdditionalShrineBanishChance = {BaseValue = 0.1},
			ReportValues = { ReportedChance = "AdditionalShrineBanishChance" }
		},
    },

    ExtractValues = {
        {
        Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})