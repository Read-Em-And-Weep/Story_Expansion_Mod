if not gods.IsKeepsakeRegistered("StoryExpansionExtraCastKeepsake") then
gods.CreateKeepsake({
    characterName = "Megaera",
    internalKeepsakeName = "StoryExpansionExtraCastKeepsake",

    RarityLevels = {
        Common = 1.5,
        Rare = 2.5,
        Epic = 3.5,
        Heroic = 5.5,
    },

    Keepsake = {
        displayName = "Torn Whip",
        description = "Your {$Keywords.CastSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev} damage, and you gain an {#BoldFormat}additional {#Prev} use of your {$Keywords.CastSet} for the rest of this night.",
        signoffMax = "From {#AwardMaxFormat}Megaera{#Prev}{!Icons.ObjectiveSeparatorDark}Your word should be a guarantee, lest the Furies come for you.",
    },

    Icons = {
        iconPathOverrides = {
        iconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
		maxCornerIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_small\\Demeter",
		maxIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_big\\Demeter",
        }
    },

    ExtraFields = {
PropertyChanges = {
                {
                    WeaponName = "WeaponCast",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponAnywhereCast",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastLob",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastProjectile",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastArm",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastProjectileHades",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                }
            },
        AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseValue = 1.1, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroRangedWeapons,
			ValidProjectiles = WeaponSets.CastProjectileNames,
			WeaponOrProjectileRequirement = true,
			ReportValues = { ReportedMultiplier = "ValidWeaponMultiplier"}
		},
    },

    ExtractValues = {
        {
            Key = "ReportedMultiplier",
            ExtractAs = "TooltipDamageBonus",
            Format = "PercentDelta",
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})


local hadesCastFixFile = rom.path.combine(rom.paths.Content(), 'Game/Weapons/PlayerWeapons.sjson')

local hadesCastFixOrder = {
  "Name",
  "InheritFrom",
  "Projectile",
  "ShowFreeAimLine",
  "AimLineAnimation",
  "AutoLock",
  "ManualAiming",
  "IgnoreUnitChargeMultiplier",
  "ActiveProjectileCap",
}

local hadesCastFix = {
		Name = "WeaponCastProjectileHades",
		InheritFrom = "WeaponCastProjectile",
		Projectile = "ProjectileCastHades",
		ShowFreeAimLine = true,
		AimLineAnimation = "AuraAimLine",
		AutoLock = true,
		ManualAiming = false,
		IgnoreUnitChargeMultiplier = true,
        ActiveProjectileCap = 1,
	}
sjson.hook(hadesCastFixFile, function(data)
  for _, newWeaponText in ipairs(hadesCastFix) do
    table.insert(data.Texts, sjson.to_object(newWeaponText, hadesCastFixOrder))
  end
end)
end

gods.CreateBoon({
    internalBoonName = "StoryExpansionExtraCastKeepsakePermanent",
    InheritFrom = {},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
    displayName = "Torn Whip",
    description = "Gain an {#BoldFormat}additional {#Prev} use of your {$Keywords.CastSet} for the rest of this night.",
    RarityLevels = {
        Common = { Multiplier = 1.0 },
        Rare = { Multiplier = 1.0 },
        Epic = { Multiplier = 1.0 },
        Heroic = { Multiplier = 1.0 },

    },
ExtraFields = {
    		FrameRarities =
		{
			Common = "Frame_Keepsake_Rank1",
			Rare = "Frame_Keepsake_Rank2",
			Epic = "Frame_Keepsake_Rank3",
			Heroic = "Frame_Keepsake_Rank4",
		},
		PreCreateActiveOverlay = true,

		HideInRunHistory = true,
		CustomRarityLevels =
		{
			"TraitLevel_Keepsake1",
			"TraitLevel_Keepsake2",
			"TraitLevel_Keepsake3",
			"TraitLevel_Keepsake4",
		},
		RecordCacheOnEquip = true,
		InfoBackingAnimation = "KeepsakeSlotBase",

		PinAnimationIn = "TraitPinIn_Keepsake",
		PinAnimationOut = "TraitPinOut_Keepsake",
		TrayHighlightAnimScale = 1.2,

		TrayTextBackingAnimation = "TraitTray_LevelBacking_Alt",
		TrayTextBackingOffsetY = 9,
		TrayTextOffsetY = -10,
		NewTraitHighlightAnimation = "NewTraitHighlightKeepsake",
PropertyChanges = {
                {
                    WeaponName = "WeaponCast",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponAnywhereCast",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastLob",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastProjectile",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastArm",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                },
                {
                    WeaponName = "WeaponCastProjectileHades",
                    WeaponProperty = "ActiveProjectileCap",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                }
            },
    },
    ExtractValues =
		{
			{
				Key = "ReportedManaCost",
				ExtractAs = "ManaCost",
				Format = "PercentDelta",
				HideSigns = true,
			},
		}
})

