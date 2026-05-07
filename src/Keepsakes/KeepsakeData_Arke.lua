if not gods.IsKeepsakeRegistered("StoryExpansionBonusPowerKeepsake") then
gods.CreateKeepsake({
    characterName = "Arke",
    internalKeepsakeName = "StoryExpansionBonusPowerKeepsake",

    RarityLevels = {
        Common = 3,
        Rare = 5,
        Epic = 7,
        Heroic = 10,
    },

    Keepsake = {
        displayName = "Shattered Feather",
        description = "Gives your very next move {#UpgradeFormat}+{$TooltipData.ExtractData.Damage} {#Prev}{$Keywords.BaseDamage}, every {#BoldFormatGraft} {$TooltipData.ExtractData.Cooldown} Sec(s).{#Prev}",
        signoffMax = "From {#AwardMaxFormat}Arke{#Prev}{!Icons.ObjectiveSeparatorDark}Maybe mercy is power in of itself.",
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
	Cooldown = 10,
    StoryExpansionKeepsakeBonusPower = {BaseValue = 10}
    },

    ExtractValues = {
        {
				Key = "Cooldown",
				ExtractAs = "Cooldown",
				DecimalPlaces = 1,
				Format = "SpeedModifiedDuration",
			},
			{
				Key = "StoryExpansionKeepsakeBonusPower",
				ExtractAs = "Damage",
				SkipAutoExtract = true,
			}
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end