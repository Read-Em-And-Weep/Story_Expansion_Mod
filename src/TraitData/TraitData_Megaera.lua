-- Oaths
gods.CreateBoon({
    internalBoonName = "MegaeraOathIncreasedManaCost",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Fated_Persuasion",
    displayName = "Oath of Effort",
    description = "Your {$Keywords.Omega} cost {#PenaltyFormat} +15% {#Prev} more this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    ManaCostModifiers = 
		{
			ManaCostMultiplier = 1.15,
			ReportValues = { ReportedManaCost = "ManaCostMultiplier" }
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

gods.CreateBoon({
    internalBoonName = "MegaeraOathNoManaBoon",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\budget_cuts",
    displayName = "Oath of Independence",
    description = "You will no longer be offered {#BoldFormat} Gain {#Prev} {$Keywords.GodBoonPlural} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = _PLUGIN.guid .. ".BanAllManaBoons",
    AcquireFunctionArgs = {},
    },
    ExtractValues =
		{
		}
})


gods.CreateBoon({
    internalBoonName = "MegaeraOathIncreasedSpellCost",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\forced_overtime",
    displayName = "Oath of Obscurity",
    description = "You use {#PenaltyFormat} +15{#Prev}{!Icons.Mana} more than before to recharge your {$Keywords.Spell} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    ManaSpendCostModifiers =
		{
			Add = 15,
		},
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathDecreasedMaxGods",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Family_Favorite",
    displayName = "Oath of Emancipation",
    description = "You will naturally encounter {#PenaltyFormat} one {#Prev} less {#BoldFormat} God {#Prev} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = _PLUGIN.guid.. ".DecreaseMaxGods",
    AcquireFunctionArgs = {},
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathDecreasedWeaponRank",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\shadow_presence",
    displayName = "Oath of Weakness",
    description = "Your {$Keywords.Aspect} of the {#BoldFormatGraft}Nocturnal Arms {#Prev} will lose {#PenaltyFormat} 1 {#Prev} rank this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = "UpgradeAspect",
		AcquireFunctionArgs = 
		{
			UpgradeLevels = -1,
			ReportValues = { ReportedUpgrade = "UpgradeLevels" }
		},
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathInCastDamage",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\boiling_blood",
    displayName = "Oath of Exposure",
    description = "Foes in your {$Keywords.CastSet} deal {#PenaltyFormat} +30% {#Prev} damage this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    StoryExpansionInCastDamage = 0.3
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathRivals2",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\middle_management",
    displayName = "Oath of Rivalry",
    description = "The next {$Keywords.Boss} you face will be affected by the {#PenaltyFormat} Vow of Rivals{#Prev}.",
ExtraFields = {
    AcquireFunctionName = _PLUGIN.guid .. ".EquipRivals",
    AcquireFunctionArgs = {
        RivalsLevel = 2
    },
        ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathRivals3",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\middle_management",
    displayName = "Oath of Rivalry",
    description = "The next {$Keywords.Boss} you face will be affected by the {#PenaltyFormat} Vow of Rivals{#Prev}.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = _PLUGIN.guid .. ".EquipRivals",
    AcquireFunctionArgs = {
        RivalsLevel = 3
    }
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathRivals4",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\middle_management",
    displayName = "Oath of Rivalry",
    description = "The next {$Keywords.Boss} you face will be affected by the {#PenaltyFormat} Vow of Rivals{#Prev}.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = _PLUGIN.guid .. ".EquipRivals",
    AcquireFunctionArgs = {
        RivalsLevel = 4
    }
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathAntiHeal",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\lasting_consequences",
    displayName = "Oath of Regret",
    description = "Any {!Icons.HealthRestoreAlt} effects are {#PenaltyFormat} -25% {#Prev} weaker this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    TraitHealingBonus = 0.75,
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathLargePrime",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\First_Blood",
    displayName = "Oath of Reservation",
    description = "{$Keywords.ReserveMana} {#PenaltyFormat} 80{#Prev}{!Icons.Mana} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    SetupFunction =
		{
			Name = "TraitReserveMana",
			Args =
			{
				Name = "StoryExpansionMegaeraOathLargePrime",
				ManaReservationCost = 80,
			},
		},

},
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathTakeCriticalDamage",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\personal_liability",
    displayName = "Oath of Vulnerability",
    description = "You have a {#PenaltyFormat} +8% {#Prev} chance to take {$Keywords.Crit} damage this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    StoryExpansionAddIncomingCritModifiers = {
            Chance = 0.08,
        },
},
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraOathNoRushBoon",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Greater_Celerity",
    displayName = "Oath of Sloth",
    description = "You will no longer be offered {#BoldFormat} Rush {#Prev} {$Keywords.GodBoonPlural} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = _PLUGIN.guid .. ".BanAllRushBoons",
    AcquireFunctionArgs = {},
    },
    ExtractValues =
		{
		}
})

-- Blessings
gods.CreateBoon({
    internalBoonName = "MegaeraBlessingArcanaDraw",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\infernal_soul",
    displayName = "Blessing of Wisdom",
    description = "Randomly draw {#UpgradeFormat} 2 {#Prev} of your inactive {$Keywords.CardPlural}, and activate them this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = "CirceRandomMetaUpgrade",
		AcquireFunctionArgs = 
		{
			Count = 2,
			ReportValues = { ReportedCount = "Count" }
		},
    },
    ExtractValues =
		{
			{
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingArcanaUpgrade",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Unifying_Bond",
    displayName = "Blessing of Insight",
    description = "Randomly draw {#UpgradeFormat} 2 {#Prev} of your active {$Keywords.CardPlural} and upgrade them this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = "CirceMetaUpgradeRarity",
		AcquireFunctionArgs = 
		{
			Count = 2, 
			ReportValues = { ReportedCount = "Count" }
		},
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingTalentDrop",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Dark_Regeneration",
    displayName = "Blessing of Clarity",
    description = "Your next {$Keywords.TalentPoint} will grant you {#UpgradeFormat} +3 {#Prev} upgrades.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    AcquireFunctionName = "AddTalentPoints",
    AcquireFunctionArgs = {Count = 3},
    },
    ExtractValues =
		{
		}
})


gods.CreateBoon({
    internalBoonName = "MegaeraBlessingGoldChambers",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Golden_Touch",
    displayName = "Blessing of Riches",
    description = "All {!Icons.Currency} you gain are worth {#UpgradeFormat} +50%. {#Prev} more this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
	MoneyMultiplier = { BaseValue = 1.5, 
				SourceIsMultiplier = true},
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingCastCount",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Stygian_Soul",
    displayName = "Blessing of Capture",
    description = "Gain {#UpgradeFormat} +1 {#Prev} use of your {$Keywords.CastSet} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
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
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingElementalBoost",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\priveleged_status",
    displayName = "Blessing of Essence",
    description = "Gain {#UpgradeFormat} +2{#Prev}{!Icons.CurseEarth}{!Icons.CurseWater}{!Icons.CurseAir}{!Icons.CurseFire}{!Icons.CurseAether} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
	AddAllElements = 2,
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingStackUpgradeBoost",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\jury_duty",
    displayName = "Blessing of Power",
    description = "{$Keywords.PomPlural} will award {#UpgradeFormat} +2 {#Prev} {$Keywords.PomLevel} this night.",
ExtraFields = {
    StackUpgradeAdditionalLevels = 2,
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingDuoLegendaryBoost",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\Gods_Envy",
    displayName = "Blessing of Cooperation",
    description = "{$Keywords.GodBoonPlural} have a {#UpgradeFormat} +8% {#Prev} chance to be {$Keywords.Duo} and {$Keywords.Legendary} blessings this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    		RarityBonus =
		{
            GodLootOnly = true,
			Duo = 0.08,
            Legendary = 0.08
        },
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingDefianceRefill",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\death_defiance",
    displayName = "Blessing of Defiance",
    description = "Replenish all spent {$Keywords.ExtraChanceMisc}.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    		AcquireFunctionName = _PLUGIN.guid..".PatroclusRefillLastStands",
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingRandomHeroicChance",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\gods_pride",
    displayName = "Blessing of Heroism",
    description = "You may be offered {$Keywords.Heroic} {$Keywords.GodBoonPlural} {#UpgradeFormat} 10% {#Prev} of the time this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    		StoryExpansionCommonToHeroicChance = 0.15,
    },
    ExtractValues =
		{
		}
})

gods.CreateBoon({
    internalBoonName = "MegaeraBlessingRegainRerolls",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionMegaera",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconScale = 0.8,
    boonIconPath = "ReadEmAndWeep-Story_ExpansionGUI\\fated_authority",
    displayName = "Blessing of Control",
    description = "Gain  {#UpgradeFormat} +3 {#Prev} {!Icons.ReRollAlt} this night.",
ExtraFields = {
    ExcludeTraitFromLastRunBoonPool = true,
    ShowInHUD = false,
    		AcquireFunctionName = _PLUGIN.guid .. ".AddRerolls",
            AcquireFunctionArgs = {
                Amount = 3
            }
    },
    ExtractValues =
		{
		}
})
