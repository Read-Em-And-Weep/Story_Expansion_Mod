gods.CreateKeepsake({
    characterName = "Achilles",
    internalKeepsakeName = "StoryExpansionDodgeShieldKeepsake",

    RarityLevels = {
        Common = 35,
        Rare = 30,
        Epic = 25,
        Heroic = 20,
    },

    Keepsake = {
        displayName = "Repaired Spearpoint",
        description = "Every {$Keywords.EncounterAlt}, gain a guaranteed {$Keywords.Dodge} against the first damage you take. Regain this {$Keywords.Dodge} after {#UpgradeFormat} {$TooltipData.ExtractData.Cooldown} Sec.{#Prev}",
        signoffMax = "From {#AwardMaxFormat}Achilles{#Prev}{!Icons.ObjectiveSeparatorDark}The greatest of the Greeks derives his strength from his bonds, and now, so do you.",
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
		OnEncounterStartFunction ={
            Name = _PLUGIN.guid..".SetUpDodgeShieldKeepsake",
            Args = {},
        },
        OnDodgeFunction = 
		{
			FunctionName = _PLUGIN.guid .. ".PauseDodgeShieldKeepsake",
			RunOnce = true,
			FunctionArgs =
			{
                Cooldown = {BaseValue = 1},
                ReportValues = 
			{
				ReportedCooldown = "Cooldown",
			},
			},

		},
    },

    ExtractValues = {
        {
				Key = "ReportedCooldown",
				ExtractAs = "Cooldown",
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})

