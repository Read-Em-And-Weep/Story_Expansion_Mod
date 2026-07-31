-- Increased sprint speed and rush boon damage for rest of night? Upgrade Arcana? Refill DDs?
-- Your dd effects heal more health
-- Splintered Shield

if not gods.IsKeepsakeRegistered("StoryExpansionDDHealthKeepsake") then
gods.CreateKeepsake({
    characterName = "Hector",
    internalKeepsakeName = "StoryExpansionDDHealthKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 1.5,
        Epic = 2,
        Heroic = 2.5,
    },

    Keepsake = {
        displayName = "Worn Brassard",
        description = "Your {$Keywords.ExtraChance} effects heal {#UpgradeFormat}{$TooltipData.StatDisplay1}{#Prev}{!Icons.Health} when used.",
        signoffMax = "From {#AwardMaxFormat}Hector{#Prev}{!Icons.ObjectiveSeparatorDark}If there is honour even in falling, it is only found when we do it together.",
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
        LastStandHealFraction = {BaseValue = 0.1 },    
    },

    ExtractValues = {
        {
				Key = "LastStandHealFraction",
				ExtractAs = "BonusHeal",
				Format = "Percent",
			},
			{
				Key = "LastStandHealFraction",
				ExtractAs = "LastStandHeal",
				Format = "Percent",
				SkipAutoExtract = true,
			},
			{
				External = true,
				BaseType = "HeroData",
				BaseName = "LastStandData",
				BaseProperty = "Heal",
				Format = "Percent",
				ExtractAs = "LastStandHeal",
				SkipAutoExtract = true,
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end