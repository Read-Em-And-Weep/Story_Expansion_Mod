if not gods.IsKeepsakeRegistered("StoryExpansionExtraCastTisiphoneKeepsake") then
gods.CreateKeepsake({
    characterName = "Tisiphone",
    internalKeepsakeName = "StoryExpansionExtraCastTisiphoneKeepsake",

    RarityLevels = {
        Common = 3,
        Rare = 3.5,
        Epic = 4,
        Heroic = 4.5,
    },

    Keepsake = {
        displayName = "Haunting Bead",
        description = "Your {$Keywords.Attack} and {$Keywords.Special} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev} damage while standing in your {$Keywords.CastSet}, and you gain an {#BoldFormat}additional {#Prev} use of your {$Keywords.CastSet} for the rest of this night.",
        signoffMax = "From {#AwardMaxFormat}Tisiphone{#Prev}{!Icons.ObjectiveSeparatorDark}Meeerrr..ir..noooee....Meelll..in..oeeee.",
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
            ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			RequiredEffects = { "InsideCastBuff" },
			RequiredSelfEffectsMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			
			ReportValues = 
			{ 
				ReportedModifier = "RequiredSelfEffectsMultiplier" 
			},		
        },
    },

    ExtractValues = {
        {
            Key = "ReportedModifier",
            ExtractAs = "TooltipDamageBonus",
            Format = "PercentDelta",
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})

gods.CreateBoon({
    internalBoonName = "StoryExpansionExtraCastTisiphoneKeepsakePermanent",
    InheritFrom = {},
    characterName = "StoryExpansionTisiphone",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
    displayName = "Haunting Bead",
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

