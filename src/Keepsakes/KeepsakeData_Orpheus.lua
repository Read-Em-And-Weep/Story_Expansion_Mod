gods.CreateKeepsake({
    characterName = "Orpheus",
    internalKeepsakeName = "StoryExpansionBossShieldsKeepsake",

    RarityLevels = {
        Common = 2,
        Rare = 3,
        Epic = 4,
        Heroic = 6,
    },

    Keepsake = {
        displayName = "Everlasting Sapling",
        description = "You take {#BoldFormatGraft}0 {#Prev}damage the first {#AltUpgradeFormat}{$TooltipData.ExtractData.ShieldNum} {#Prev}time(s) you are hit in {$Keywords.Boss} {$Keywords.EncounterPlural}.",
        signoffMax = "From {#AwardMaxFormat}Orpheus{#Prev}{!Icons.ObjectiveSeparatorDark}His art is inspired from his love for the world around him, and he shares his greatest love with us all.",
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
        BossEncounterShieldHits = { BaseValue = 1 },
        BossShieldFx = "MelShieldFront"
    },

    ExtractValues = {
        {
            Key = "BossEncounterShieldHits",
            ExtractAs = "ShieldNum"
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})