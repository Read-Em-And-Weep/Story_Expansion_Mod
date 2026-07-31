--Either:
--An offensive version of Odysseus's keepsake, deal more damage to guardians

if not gods.IsKeepsakeRegistered("StoryExpansionBossPreDamageKeepsake") then
gods.CreateKeepsake({
    characterName = "Penelope",
    internalKeepsakeName = "StoryExpansionBossPreDamageKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Heroic = 5,
    },

    Keepsake = {
        displayName = "Olive Spindle",
        description = "The next {$Keywords.Boss} loses {#UpgradeFormat}-{$TooltipData.ExtractData.Damage}%{#Prev}{!Icons.EnemyHealth}. You deal {#BoldFormat}+{$TooltipData.ExtractData.Strength}% {#Prev}damage to {$Keywords.BossPlural_NoTooltip}.",
        signoffMax = "From {#AwardMaxFormat}Penelope{#Prev}{!Icons.ObjectiveSeparatorDark}Sometimes, we have to weave our own fates with wounded hands.",
        trayExpired = "You deal {#BoldFormat}+{$TooltipData.ExtractData.Defense}% {#Prev}damage to {$Keywords.BossPlural}."
    },

    Icons = {
        iconPathOverrides = {
        iconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
		maxCornerIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_small\\Demeter",
		maxIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_big\\Demeter",
        }
    },

    ExtraFields = {
        EncounterPreDamage =
		{
			PreDamage = { BaseValue = 0.05 },
			EnemyType = "Boss",
			DamageSourceName = "StoryExpansionBossPreDamageKeepsake",
			ReportValues = { ReportedDamage = "PreDamage" }
		},
        AddOutgoingDamageModifiers = 
		{
			BossDamageMultiplier = 1.10,
			ReportValues = { ReportedWeaponMultiplier = "BossDamageMultiplier"},
		},
    },

    ExtractValues = {
        {
				Key = "ReportedDamage",
				ExtractAs = "Damage",
				Format = "FlatPercent",
			},
            {
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "Strength",
				Format = "FlatPercentDelta",
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end