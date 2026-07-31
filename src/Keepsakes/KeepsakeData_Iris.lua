-- After gaining x amount of money, rarify a boon?

if not gods.IsKeepsakeRegistered("StoryExpansionGoldRarifyKeepsake") then
gods.CreateKeepsake({
    characterName = "Iris",
    internalKeepsakeName = "StoryExpansionGoldRarifyKeepsake",

    RarityLevels = {
        Common = 200,
        Rare = 150,
        Epic = 100,
        Heroic = 50,
    },

    Keepsake = {
        displayName = "Prismatic Pouch",
        description = "For every {#UpgradeFormat} {$TooltipData.ExtractData.Count}{#Prev}{!Icons.Currency} you gain, {$Keywords.RarityUpgrade} a {#BoldFormat} random {$Keywords.GodBoon}{#Prev}.",
        signoffMax = "From {#AwardMaxFormat}Iris{#Prev}{!Icons.ObjectiveSeparatorDark}There is beauty in almost everything, if only you cherish it.",
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
        GoldForRarify = {BaseValue = 1},
        CurrentGoldCount = 0,
        CustomTrayText = "StoryExpansionGoldRarifyKeepsake_Tray",    
    },

    ExtractValues = {
        {
            Key = "GoldForRarify",
            ExtractAs = "Count",
        },
        {
            Key = "CurrentGoldCount",
            ExtractAs = "CurrentGoldCount"
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end