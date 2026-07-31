-- Increase the time that boons with time limits (e.g. Shop Traits) will have
-- The next x purchases from Wells/Shrines give double
if not gods.IsKeepsakeRegistered("StoryExpansionExtraWellPurchaseKeepsake") then
gods.CreateKeepsake({
    characterName = "Telemachus",
    internalKeepsakeName = "StoryExpansionExtraWellPurchaseKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Heroic = 4,
    },

    Keepsake = {
        displayName = "Hero's Sheath",
        description = "Your next {#UpgradeFormat} {$TooltipData.ExtractData.Count} {#Prev} purchase(s) from {$Keywords.WellShop} or {$Keywords.SurfaceShop} will award double.",
        signoffMax = "From {#AwardMaxFormat}Telemachus{#Prev}{!Icons.ObjectiveSeparatorDark}Being a hero is hard, but proving yourself is harder.",
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
        RemainingDuplications = {BaseValue = 1},
     },

    ExtractValues = {
        {
            Key = "RemainingDuplications",
            ExtractAs = "Count",
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end