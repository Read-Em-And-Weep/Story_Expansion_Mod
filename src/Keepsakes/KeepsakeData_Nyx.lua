if not gods.IsKeepsakeRegistered("StoryExpansionBackstabKeepsake") then
gods.CreateKeepsake({
    characterName = "Nyx",
    internalKeepsakeName = "StoryExpansionBackstabKeepsake",

    RarityLevels = {
        Common = 0.5,
        Rare = 1,
        Epic = 1.5,
        Heroic = 2,
    },

    Keepsake = {
        displayName = "Mirror Shard",
        description = "You will deal {#UpgradeFormat} {$TooltipData.ExtractData.Multiplier:P} {#Prev} when you strike foes from {#BoldFormat} behind{#Prev}.",
        signoffMax = "From {#AwardMaxFormat}Nyx{#Prev}{!Icons.ObjectiveSeparatorDark}Though you knew her not while growing up, you still felt her gentle embrace.",
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
        AddOutgoingDamageModifiers =
		{
			HitVulnerabilityMultiplier =
			{
				BaseValue = 1.40,
				SourceIsMultiplier = true,
			},
			ReportValues = { ReportedMultiplier = "HitVulnerabilityMultiplier"},

		},    },

    ExtractValues = {
        {
            Key = "ReportedMultiplier",
            ExtractAs = "Multiplier",
            Format = "PercentDelta",
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end