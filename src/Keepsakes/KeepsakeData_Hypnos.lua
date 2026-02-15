gods.CreateKeepsake({
    characterName = "Hypnos",
    internalKeepsakeName = "StoryExpansionCritOmegaKeepsake",

    RarityLevels = {
        Common = 1.5,
        Rare = 2,
        Epic = 2.5,
        Heroic = 4.5,
    },

    Keepsake = {
        displayName = "Beloved Plush",
        description = "For the next {$Keywords.Biome}, your {$Keywords.Omega} have a {#UpgradeFormat} {$TooltipData.ExtractData.CritBonus:P} {#Prev} chance to deal {$Keywords.Crit} damage, but you are limited to {#PenaltyFormat} 50{#Prev}{!Icons.ManaUp}.",
        signoffMax = "From {#AwardMaxFormat}Hypnos{#Prev}{!Icons.ObjectiveSeparatorDark}Though you were never able to interact with him in your youth, you never the less feel a close bond with him.",
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
        AcquireFunctionName = "ValidateMaxMana",
    AddOutgoingCritModifiers =
		{
			TraitName = _PLUGIN.guid.."-StoryExpansionCritOmegaKeepsake",
            IsEx = true,
			ActiveTraitChance = { BaseValue = 0.10 },
			ReportValues = { ReportedCritBonus = "ActiveTraitChance"}
		},
		Uses = 1,
        OnExpire = {
            FunctionName = "ValidateMaxMana"
        }
    },

    ExtractValues = {
        {
				Key = "ReportedCritBonus",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent",
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})

