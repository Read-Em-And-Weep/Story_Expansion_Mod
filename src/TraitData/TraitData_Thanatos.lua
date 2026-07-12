gods.CreateBoon({
    internalBoonName = "ThanatosFocusDeathDefianceTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Second Chances",
    description =
    "Gain {#BoldFormatGraft}+1 {#Prev}{$Keywords.ExtraChanceAthena} that replenishes in each {$Keywords.RoomAlt}, but you {$Keywords.ReserveHealth} {!Icons.Health}.",
    RarityLevels = {
        Common = { Multiplier = 80.0 },
        Rare = { Multiplier = 70 },
        Epic = { Multiplier = 60 },
        Heroic = { Multiplier = 50 },

    },
    ExtraFields = {
        ExcludeTraitFromLastRunBoonPool = true,
        SetupFunction =
        {
            Name = _PLUGIN.guid .. ".LastStandHealthReserve",
            Args =
            {
                HealthReservationCost =
                {
                    BaseValue = 1,
                },
                ReportValues = { ReportedHealthReservationCost = "HealthReservationCost" }
            },
        },
        AcquireFunctionName = "AddLastStand",
        AcquireFunctionArgs = {
            Name = "StoryExpansionThanatos",
            Icon = "ExtraLifeSkelly",
            HealFraction = 0.4,
            ManaFraction = 0.4,
            ValidityFunctionName = _PLUGIN.guid .. ".IsLastStandHealthReserveEligible",
            IncreaseMax = true,
            Priority = true,
        },
        OnLevelOrRarityChangeFunctionName = _PLUGIN.guid .. ".RestoreLastStandHealthReserve",
        ShowInHUD = true,
        GameStateRequirements = {
            {
                Path = { "CurrentRun", "Hero", "MaxHealth", },
                Comparison = ">",
                Value = 80,
            },
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasNone = { "LowHealthCritKeepsake" },
			},

        }
    },
    StatLines = { "StoryExpansionThanatosFocusHealth" },
    customStatLine = {
        ID = "StoryExpansionThanatosFocusHealth",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Health Primed:",
        description = "{$TooltipData.StatDisplay1}",
    },
    ExtractValues =
    {
        {
            Key = "ReportedHealthReservationCost",
            ExtractAs = "TooltipManaReservation",
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
})

gods.CreateBoon({
    internalBoonName = "ThanatosDoubleDamageFinishTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Sudden Death",
    description = "Foes with less than {#BoldFormat}{$TooltipData.ExtractData.HealthThreshold}%{#Prev}{!Icons.EnemyHealth} may take {$TraitData.AresStatusDoubleDamageBoon.DamagePercent:F} damage.",
    RarityLevels = {
        Common = { Multiplier = 7 },
        Rare = { Multiplier = 12 },
        Epic = { Multiplier = 17 },
        Heroic = { Multiplier = 22 },

    },
    ExtraFields = {
        StoryExpansionTargetLowHealthThreshold = 0.2,
        StoryExpansionTargetLowHealthChance = {BaseValue = 0.01},
        ShowInHUD = true,

    },
    StatLines =
    {
        "DoubleDamageChanceStatDisplay1",
    },
    ExtractValues =
    {
        {
            Key = "StoryExpansionTargetLowHealthChance",
            ExtractAs = "Chance",
            Format = "LuckModifiedPercent",
            HideSigns = true,
        },
        {
				Key = "StoryExpansionTargetLowHealthThreshold",
				ExtractAs = "HealthThreshold",
				Format = "Percent",
				SkipAutoExtract = true
			},
    },
})

gods.CreateBoon({
    internalBoonName = "ThanatosFasterAttackTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Fragile Spirit",
    description =
    "Your {$Keywords.Attack}, {$Keywords.Special}, and {$Keywords.Cast} are faster, but you take {#AltPenaltyFormat}{$TooltipData.ExtractData.TooltipDamageCurse:P} {#Prev}damage.",
    RarityLevels = {
        Common = { Multiplier = 1 },
        Rare = { Multiplier = 1.5 },
        Epic = { Multiplier = 2 },
        Heroic = { Multiplier = 2.5 },

    },
    ExtraFields = {
        ApplyAfterHammerTraits = true,
        PropertyChanges = {
            {
                WeaponNames = WeaponSets.HeroNonExWeapons,
                WeaponProperty = "FireFx2",
                ChangeValue = "HermesSwipeLineC_Sword3",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroNonExWeapons,
                BaseValue = 0.9,
                SourceIsMultiplier = true,
                SpeedPropertyChanges = true,
                ExcludeLinked = true,
                ReportValues = { ReportedWeaponMultiplier = "ChangeValue" }
            },
        },
        AddIncomingDamageModifiers = {
            ValidWeaponMultiplier = 1.15,
            ReportValues =
            {
                ReportedMultiplier = "ValidWeaponMultiplier"
            },

        },
        ShowInHUD = true,

    },
    StatLines =
    {
        "NonOmegaSpeedStatDisplay1",
    },
    ExtractValues =
    {
        {
            Key = "ReportedWeaponMultiplier",
            ExtractAs = "TooltipDamageBonus",
            Format = "NegativePercentDelta",
        },
        {
            Key = "ReportedMultiplier",
            ExtractAs = "TooltipDamageCurse",
            Format = "PercentDelta",
        },
    }
})

gods.CreateBoon({
    internalBoonName = "ThanatosOldKeepsakeTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Familiar End",
    description = "Gain bonus damage each time you clear an {$Keywords.EncounterAlt} without taking damage.",
    RarityLevels = {
        Common = { Multiplier = 0.5 },
        Rare = { Multiplier = 1 },
        Epic = { Multiplier = 1.5 },
        Heroic = { Multiplier = 2 },

    },
    ExtraFields = {
        StoryExpansionPerfectClearDamageBonus =
        {
            BaseValue = 1.01,
            SourceIsMultiplier = true,
            DecimalPlaces = 3,
        },
        AddOutgoingDamageModifiers =
        {
            UseTraitValue = "AccumulatedDamageBonus",
        },
        AccumulatedDamageBonus = 1,
        OnEncounterStartFunction =
        {
            Name = "RecordDamageSnapshot",
        },
        EncounterEndFunctionName = _PLUGIN.guid .. ".CheckPerfectClear",
        EncounterEndFunctionArgs = {
            PerfectFunctionName = _PLUGIN.guid .. ".IncreaseAccumulatedDamageBonus"
        },
        ShowInHUD = true,
        TrayStatLines =
        {
            "StoryExpansionThanatosPerfectEscalating",
        },
    },
    customStatLine = {
        ID = "StoryExpansionThanatosPerfectEscalating",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Current Bonus Damage:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipAccumulatedBonus:P}",
    },
    StatLines =
    {
        "UnscathedDamageStatDisplay1",
    },
    ExtractValues =
    {
        {
            Key = "StoryExpansionPerfectClearDamageBonus",
            ExtractAs = "Multiplier",
            DecimalPlaces = 1,
            Format = "PercentDelta",
        },
        {
				Key = "AccumulatedDamageBonus",
				ExtractAs = "TooltipAccumulatedBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
    },
})

gods.CreateBoon({
    internalBoonName = "ThanatosPerfectClearBonusRewardTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Grave Robber",
    description =
    "Whenever you clear an {$Keywords.EncounterAlt} without taking damage, recieve an extra {$Keywords.RunReward}.",
    RarityLevels = {
        Common = { Multiplier = 1 },
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 3 },
        Heroic = { Multiplier = 4 },

    },
    ExtraFields = {
        OnEncounterStartFunction =
        {
            Name = "RecordDamageSnapshot",
        },
        EncounterEndFunctionName = _PLUGIN.guid .. ".CheckPerfectClear",
        EncounterEndFunctionArgs = {
            PerfectFunctionName = _PLUGIN.guid .. ".SummonExtraReward"
        },
        RemainingUses = { BaseValue = 1 },
        GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionThanatosGrantsReward01" },
			},
        }
    },
    customStatLine = {
        ID = "StoryExpansionThanatosPerfectRewardUses",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Remaining Rewards:",
        description = "{$TooltipData.RemainingUses}",
    },
    StatLines =
    {
        "StoryExpansionThanatosPerfectRewardUses",
    },
    ExtractValues =
    {},
})

gods.CreateBoon({
    internalBoonName = "ThanatosPerfectCritTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Gossamer Blade",
    description =
    "In every {$Keywords.RoomAlt}, your {$Keywords.Omega} may deal {$Keywords.Crit} damage. Lose this whenever you are hit.",
    RarityLevels = {
        Common = { Multiplier = 0.7 },
        Rare = { Multiplier = 1.0 },
        Epic = { Multiplier = 1.3 },
        Heroic = { Multiplier = 1.6 },

    },
    ExtraFields = {
        AddOutgoingCritModifiers =
		{
            IsEx = true,
			UndamagedMultiplier =
			{
				BaseValue = 0.1,
			},
			ReportValues = { ReportedCritBonus= "UndamagedMultiplier"},
		},
		SetupFunction =
		{
			Name = _PLUGIN.guid .. ".RoomStartResetPerfectCritBonus",
		},
		OnSelfDamagedFunction = 
		{
			NotDamagingRetaliate = true,
			Name = _PLUGIN.guid .. ".ResetPerfectCritBonusBoon",
			FunctionArgs = 
			{
				Cooldown = 15,
				ReportValues  = { ReportedCooldown = "Cooldown" },
			}
		},
        ShowInHUD = true,
    },
    StatLines =
    {
        "CriticalChanceDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedCritBonus",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "ThanatosDodgeSpellTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Evasive Restraint",
    description =
    "While you {$Keywords.Spell} is not completely charged, you have a chance to {$Keywords.Dodge}.",
    RarityLevels = {
        Common = { Multiplier = 7 },
        Rare = { Multiplier = 9 },
        Epic = { Multiplier = 11 },
        Heroic = { Multiplier= 13 },

    },
    ExtraFields = {
        HexCooldownDodgeBuff = {BaseValue = 0.01},
        ShowInHUD = true,
        GameStateRequirements =
		{
						{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasAny = 
				{
					"SpellLaserTrait",
					"SpellLeapTrait",
					"SpellSummonTrait",
					"SpellMeteorTrait",
					"SpellTransformTrait",
					"SpellMoonBeamTrait",
					"SpellPolymorphTrait",
                    "SpellTimeSlowTrait",
                    "SpellPotionTrait",
				},
			},

        }
    },
    StatLines =
    {
        "BurnDodgeStatDisplay",
    },
    ExtractValues =
    {
        {
				Key = "HexCooldownDodgeBuff",
				ExtractAs = "DodgeChance",
				Format = "Percent",
			},
    }
})

--[[gods.CreateBoon({
    internalBoonName = "ThanatosPrimeDamageTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Ritual Slaughter",
    description =
    "{$Keywords.ReserveMana} {#BoldFormat} 40 {#Prev} {!Icons.Mana}. In exchange, your {$Keywords.Attack} and {$Keywords.Special} deal more damage for each primed {!Icons.Mana}.",
    RarityLevels = {
        Common = { Multiplier = 0.25 },
        Rare = { Multiplier = 0.5},
        Epic = { Multiplier = 0.75 },
        Heroic = { Multiplier= 1. },

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
				Name = "StoryExpansionThanatosPrimeDamageTrait",
				ManaReservationCost = 40,
			},
		},
        StoryExpansionMaxPrimedManaMultiplier = {BaseValue = 0.01, DecimalPlaces = 5,},
        CurrentBonusDamage = 1,
		OnExpire = 
		{
			FunctionName = "TraitUnreserveMana",
			FunctionArgs = { Name = "StoryExpansionThanatosPrimeDamageTrait" },
		},
    TrayStatLines = {
        "EscalatingCostumeStatDisplay1"
    },
    ShowInHUD = true,
	},
    customStatLine = {
        ID = "StoryExpansionThanatosDamagePerMagickPrimed",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Bonus Damage per Magick Primed:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipPercentIncrease:P}",
    },
    StatLines =
    {
        "StoryExpansionThanatosDamagePerMagickPrimed",
    },
    ExtractValues =
    {
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
    }
})]]

gods.CreateBoon({
    internalBoonName = "ThanatosDamageOnKillTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Death Pact",
    description =
    "Whenever you slay a foe, damage all other foes attacking you.",
    RarityLevels = {
        Common = { Multiplier = .30},
        Rare = { Multiplier = 0.40 },
        Epic = { Multiplier = 0.50},
        Heroic = { Multiplier= 0.60},

    },
    ExtraFields = {
        OnEnemyDeathFunction = 
		{
			Name = _PLUGIN.guid..".DoDamageAllEnemies",
			FunctionArgs = 
			{
				DamageAmount = 
				{
					BaseValue = 100,
					MinMultiplier = 0.1,
					IdenticalMultiplier =
					{
						Value = -0.5,
						DiminishingReturnsMultiplier = 0.8,
					},
				},
				Vfx = "ThanatosCritFx",
				Delay = 0.2,
				ReportValues = {
					ReportedDamage = "DamageAmount",
				}
			}
		},
    ShowInHUD = true,
	},
    StatLines =
    {
        "LinkedDeathDamageStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedDamage",
				ExtractAs = "Damage",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "ThanatosSummonShadeMercTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Posthumous Aid",
    description =
    "Whenever you slay foes, you raise {$Keywords.ShadeMerc} {#UpgradeFormat} {$TooltipData.ExtractData.Chance:P} {#Prev} of the time. {$Keywords.ShadeMerc} deal more damage.",
    RarityLevels = {
        Common = { Multiplier = .5},
        Rare = { Multiplier = 0.75 },
        Epic = { Multiplier = 1.},
        Heroic = { Multiplier= 1.5},

    },
    ExtraFields = {
        EncounterEndFunctionName = "EndEncounterShadeDissipate",
		EncounterEndFunctionArgs =
		{
			Name = "ShadeMerc",
			SmileChance = 0.05,
		},
		OnEnemyDeathFunction = 
		{
			Name = "CreateShadeMerc",
			FunctionArgs = 
			{
				MaxCount = 8,
				Chance = 0.75,
				Name = "ShadeMerc",
				AngleMin = 190,
				AngleMax = 350,
                ReportValues = {ReportedChance = "Chance"}}
			},
        SetupFunction = 
		{
			Name = "SetupMercDamageBonus",
			Args = 
			{
				DamageMultiplier = { BaseValue = 0.5 },
				ReportValues = { DamageIncrease = "DamageMultiplier" },
			}
		},
    ShowInHUD = true,
    GameStateRequirements =
		{
			{
				Path = { "GameState", "LastWeaponUpgradeName", "WeaponStaffSwing", },
				IsNone = {"StaffRaiseDeadAspect", }
			},
            {
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeShadeMercs" },
			},
        }
	},
    StatLines =
    {
        "EscalatingCostumeStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "DamageIncrease",
				ExtractAs = "TooltipDamageBonus",
				Format = "Percent",
                IncludeSigns = false,
			},
            {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "ThanatosIncomingOutcomingCritTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Risky Behavior",
    description =
    "You have a chance to both deal and take {$Keywords.Crit} damage.",
    RarityLevels = {
        Common = { Multiplier = 5},
        Rare = { Multiplier = 6 },
        Epic = { Multiplier = 7},
        Heroic = { Multiplier= 8},

    },
    ExtraFields = {
        AddOutgoingCritModifiers =
		{
			Chance = { BaseValue = 0.01 },
			ReportValues = { ReportedCritBonus = "Chance"}
		},
        StoryExpansionAddIncomingCritModifiers = {
            Chance = {BaseValue = 0.01},
        },
    ShowInHUD = true,
	},
    StatLines =
    {
        "CriticalChanceDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedCritBonus",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent",
			},
    }
})

if ZagreusJourney then
gods.CreateBoon({
    internalBoonName = "ThanatosButterflyOnKillTrait",
    InheritFrom = { "InPersonOlympianTrait", "AetherBoon" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Kaleidoscopic Curse",
    description =
    "Whenever you slay a foe, summon a horde of {$TooltipData.ExtractData.Butterflies} {$Keywords.StoryExpansionButterfly}.",
    RarityLevels = {
        Common = { Multiplier = 8},
        Rare = { Multiplier = 12},
        Epic = { Multiplier = 16},
        Heroic = { Multiplier= 20},

    },
    ExtraFields = {
        OnEnemyDeathFunction = 
		{
			Name = _PLUGIN.guid..".SummonButterflies",
			FunctionArgs = 
			{
				NumButterflies = 5,
                ProjectileDamageMultiplier = {BaseValue = 1},
                ProjectileCap = 25,
				ReportValues = {
					ReportedButterflies = "NumButterflies",
                    ReportedMultiplier = "ProjectileDamageMultiplier",
				}
			}
		},
    ShowInHUD = true,
	},
    StatLines =
    {
        "StoryExpansionButterfliesSummonedStatLine",
    },
    customStatLine = {
        ID = "StoryExpansionButterfliesSummonedStatLine",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Butterfly Damage:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Damage}",
    },
    ExtractValues =
    {
        {
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "StoryExpansionButterflyWeapon",
				BaseProperty = "Damage",
			},
            {
                Key = "ReportedButterflies"
                ExtractAs = "Butterflies"
            }
    }
})

end

if elementalinfusion then
    gods.CreateBoon({
    internalBoonName = "ThanatosElementalTrait",
    InheritFrom = { "InPersonOlympianTrait" },
    characterName = "StoryExpansionThanatos",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Hades_03",
    displayName = "Philosopher's Stone",
    description =
    "Lose {#Emph}all {#Prev} of a random {$Keywords.AllElementsWithCountNoPlural}. In exchange, gain an equal number of whatever element you currently have the most of.", 
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = {Multiplier = 1},
        Epic = {Multiplier = 1},
        Heroic = {Multiplier = 1},
    },
    ExtraFields = {
        AcquireFunctionName = _PLUGIN.guid..".TransmuteRandomElement",
    ShowInHUD = true,
    GameStateRequirements =
		{
			{
				PathTrue = { "CurrentRun", "Hero", "ExtraElementalBoonsDominantElementByCount" },
			},
            {
                    Path = { "CurrentRun", "Hero", "Elements", "Fire" },
                    Comparison = ">=",
                    Value = 1,
                },
                {
                    Path = { "CurrentRun", "Hero", "Elements", "Earth" },
                    Comparison = ">=",
                    Value = 1,
                },
                {
                    Path = { "CurrentRun", "Hero", "Elements", "Air" },
                    Comparison = ">=",
                    Value = 1,
                },
                {
                    Path = { "CurrentRun", "Hero", "Elements", "Water" },
                    Comparison = ">=",
                    Value = 1,
                },
        },
        		IsElementalTrait = true,
		BlockStacking = true,
		BlockInRunRarify = true,
		BlockMenuRarify = true,
		ExcludeFromRarityCount = true,
		CustomRarityName = "Boon_Infusion",
		CustomRarityColor = Color.BoonPatchElemental,
		InfoBackingAnimation = "BoonSlotUnity",
		UpgradeChoiceBackingAnimation = "BoonSlotUnity",
		Frame = "Unity",
	},
    customStatLine = {
        ID = "StoryExpansionThanatosElementTransmuted",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Gain per Element Lost:",
        description = "{#UpgradeFormat}+1",
    },
    StatLines =
    {
        "StoryExpansionThanatosElementTransmuted",
    },
    ExtractValues =
    {
    }
})
end