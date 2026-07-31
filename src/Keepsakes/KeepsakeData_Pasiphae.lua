if not gods.IsKeepsakeRegistered("StoryExpansionPrimeDamageKeepsake") then
gods.CreateKeepsake({
    characterName = "Pasiphaë",
    internalKeepsakeName = "StoryExpansionPrimeDamageKeepsake",

    RarityLevels = {
        Common = 0.25,
        Rare = 0.5,
        Epic = 0.75,
        Heroic = 1,
    },

    Keepsake = {
        displayName = "Untested Grimoire",
        description = "{$Keywords.ReserveMana} {#BoldFormat} all {#Prev} {!Icons.Mana}. In exchange, your {$Keywords.Attack} and {$Keywords.Special} deal {#UpgradeFormat} {$TooltipData.ExtractData.TooltipPercentIncrease:P} {#Prev} more damage for each primed {!Icons.Mana}. {#ItalicFormat}Currently: {#Prev}{#BoldFormatGraft}{$TooltipData.ExtractData.TooltipCurrentBonus:P}",
        signoffMax = "From {#AwardMaxFormat}Pasiphaë{#Prev}{!Icons.ObjectiveSeparatorDark}You cannot move forward in relationships without accepting looking back.",
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
		AddOutgoingDamageModifiers = {
			ValidWeapons = WeaponSets.HeroNonExWeapons,
            UseTraitValue = "CurrentBonusDamage",
        },
        		SetupFunction =
		{
			Name = "TraitReserveMana",
			Args =
			{
				Name = "StoryExpansionPrimeDamageKeepsake",
				ManaReservationCost = 99999,
			},
		},
        StoryExpansionMaxPrimedManaMultiplier = {BaseValue = 0.01, DecimalPlaces = 5,},
        CurrentBonusDamage = 1,
		OnExpire = 
		{
			FunctionName = "TraitUnreserveMana",
			FunctionArgs = { Name = "StoryExpansionPrimeDamageKeepsake" },
		},
    },

    ExtractValues = {
        {
				Key = "CurrentBonusDamage",
				ExtractAs = "TooltipCurrentBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
            {
				Key = "StoryExpansionMaxPrimedManaMultiplier",
				ExtractAs = "TooltipPercentIncrease",
				Format = "Percent",
                DecimalPlaces = 5,
			}
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end