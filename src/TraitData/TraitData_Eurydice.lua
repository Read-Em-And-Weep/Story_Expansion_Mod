gods.CreateBoon({
    internalBoonName = "EurydiceFoodBaseTrait",
    InheritFrom = {  },
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Debug Food",
    description =
    "Debug",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 1 },
        Epic = { Multiplier = 1},
        Heroic = { Multiplier= 1},

    },
    ExtraFields = {
        StoryExpansionEurydiceFoodTrait = true,
        DebugOnly = true,
        FrameRarities =
		{
			Common = "Frame_Keepsake_Rank1",
			Rare = "Frame_Keepsake_Rank2",
			Epic = "Frame_Keepsake_Rank3",
			Heroic = "Frame_Keepsake_Rank4",
		},
        Slot = "Assist",
        ShowInHUD = true,
        HideInRunHistory = true,
            BlockInRunRarify = true,

        CustomRarityLevels =
		{
			"StoryExpansionTraitLevel_Food1",
			"StoryExpansionTraitLevel_Food2",
			"StoryExpansionTraitLevel_Food3",
			"StoryExpansionTraitLevel_Food4",
		},
        InfoBackingAnimation = "KeepsakeSlotBase",
        		PinAnimationIn = "TraitPinIn_Keepsake",
		PinAnimationOut = "TraitPinOut_Keepsake",
		TrayHighlightAnimScale = 1.2,
        		TrayTextBackingAnimation = "TraitTray_LevelBacking_Alt",
		TrayTextBackingOffsetY = 9,
		TrayTextOffsetY = -10,
		NewTraitHighlightAnimation = "NewTraitHighlightKeepsake",

	},
    StatLines =
    {
        "EscalatingCostumeStatDisplay1",
    },
    ExtractValues =
    {

    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceHephaestusTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Armored Bakclava",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Hephaestus {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Hephaestus {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        StoryExpansionEurydiceFoodTrait = true,
        RarityBonus = {
            RequiredGod = "HephaestusUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "HephaestusUpgrade",
    	},
    customStatLine = {
        ID = "StoryExpansionBonusRarityStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Bonus Chance for {$Keywords.Rare} Blessings{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Chance:P}",
    },
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})


gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceAresTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Black Soup",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Ares {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Ares {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "AresUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "AresUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceAphroditeTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Nectar-Candied Apples",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Aphrodite {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Aphrodite {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "AphroditeUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "AphroditeUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceZeusTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Lightning-Fried Souvlaki",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Zeus {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Zeus {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "ZeusUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "ZeusUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForcePoseidonTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Fisherman's Basket",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Poseidon {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Poseidon {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "PoseidonUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "PoseidonUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceHeraTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Ambrosia-Infused Spanakopita",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Hera {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Hera {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "HeraUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "HeraUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceDemeterTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Harvest Granita",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Demeter {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Demeter {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "DemeterUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "DemeterUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceHestiaTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Molten Lava Cake",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Hestia {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Hestia {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "HestiaUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "HestiaUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodForceApolloTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Brilliant-Beaming Bougatsa",
    description =
    "{$Keywords.GodBoonPlural} are {#UpgradeFormat}30% {#Prev}more likely to be from {#BoldFormat}Apollo {#Prev} tonight. {#BoldFormat}{$Keywords.GodBoonPlural} of Apollo {#Prev}are also more likely to include {$Keywords.Rare} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2.0 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        RarityBonus = {
            RequiredGod = "ApolloUpgrade",
            RareBonus = {BaseValue = 0.1},
            ReportValues = {ReportedChance = "RareBonus"}
        },
        StoryExpansionEurydiceForceGod = "ApolloUpgrade"
	},
    StatLines =
    {
        "StoryExpansionBonusRarityStatDisplay1",
    },
    ExtractValues =
    {

        {
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "LuckModifiedPercent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodMorePotentPomsTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Pom Porridge",
    description =
    "The first {$Keywords.PomNoPlural} you claim will offer more {$Keywords.PomLevel}",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 3},
        Heroic = { Multiplier= 4},
    },
    ExtraFields = {
        StoryExpansionTemporaryPomLevelBonus = {BaseValue = 1},
        RemainingUses = 1,
        CustomTrayText = "StoryExpansionEurydiceFoodMorePotentPomsTrait_Tray"
    },
    customStatLine = {
        ID = "StoryExpansionBonusPomLevelsStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Bonus {$Keywords.PomLevel}{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.StoryExpansionTemporaryPomLevelBonus}",
    },
    StatLines =
    {
        "StoryExpansionBonusPomLevelsStatDisplay1",
    },
    ExtractValues =
    {
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodBackstabTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Double-Crossed Skewers",
    description =
    "This night, you will deal more damage to foes when you strike from {#BoldFormat} behind{#Prev}.",
    RarityLevels = {
        Common = { Multiplier = 0.5},
        Rare = { Multiplier = 1 },
        Epic = { Multiplier = 1.5},
        Heroic = { Multiplier= 2},
    },
    ExtraFields = {
		AddOutgoingDamageModifiers =
		{
			HitVulnerabilityMultiplier =
			{
				BaseValue = 1.40,
				SourceIsMultiplier = true,
			},
			ReportValues = { ReportedMultiplier = "HitVulnerabilityMultiplier"},

		},

    },
    StatLines =
    {
        "BackstabStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "PercentDelta",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodAthenaBoonTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Olive-Brine Swordfish",
    description =
    "This night, you will gain a random {#BoldFormat} blessing of Athena {#Prev} that you are eligible for.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 3},
        Heroic = { Multiplier= 4},
    },
    ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid .. ".FoodBuffAcquireRandomBoonOfGod",
        AcquireFunctionArgs = {
            Rarity = {BaseValue = 1},
            God = "NPC_Athena_01",
            ReportValues = {BlessingRarityBonus = "Rarity"},
        },
        DelayedRunStartPresentation = 
		{
			FunctionName = _PLUGIN.guid .. ".RunStartEurydiceFoodBoonAcquiredPresentation",
		},
    },
    customStatLine = {
        ID = "StoryExpansionBonusBoonRarityStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Rarity of Bonus Blessings{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.RarityValue}",
    },
    StatLines =
    {
        "StoryExpansionBonusBoonRarityStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "BlessingRarityBonus",
				ExtractAs = "RarityValue",
				Format = "Rarity",
				SkipAutoExtract = true,
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodArtemisBoonTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Huntress's Delight",
    description =
    "This night, you will gain a random {#BoldFormat} blessing of Artemis {#Prev} that you are eligible for.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 3},
        Heroic = { Multiplier= 4},
    },
    ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid .. ".FoodBuffAcquireRandomBoonOfGod",
        AcquireFunctionArgs = {
            Rarity = {BaseValue = 1},
            God = "NPC_Artemis_Field_01",
            ReportValues = {BlessingRarityBonus = "Rarity"},
        },
        DelayedRunStartPresentation = 
		{
			FunctionName = _PLUGIN.guid .. ".RunStartEurydiceFoodBoonAcquiredPresentation",
		},
    },
    StatLines =
    {
        "StoryExpansionBonusBoonRarityStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "BlessingRarityBonus",
				ExtractAs = "RarityValue",
				Format = "Rarity",
				SkipAutoExtract = true,
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodDionysusBoonTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Dionysian Amphora, Olympiad II",
    description =
    "This night, you will gain a random {#BoldFormat} blessing of Dionysus {#Prev} that you are eligible for.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 3},
        Heroic = { Multiplier= 4},
    },
    ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid .. ".FoodBuffAcquireRandomBoonOfGod",
        AcquireFunctionArgs = {
            Rarity = {BaseValue = 1},
            God = "NPC_Dionysus_01",
            ReportValues = {BlessingRarityBonus = "Rarity"},
        },
        DelayedRunStartPresentation = 
		{
			FunctionName = _PLUGIN.guid .. ".RunStartEurydiceFoodBoonAcquiredPresentation",
		},
    },
    StatLines =
    {
        "StoryExpansionBonusBoonRarityStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "BlessingRarityBonus",
				ExtractAs = "RarityValue",
				Format = "Rarity",
				SkipAutoExtract = true,
			},
    }
})


gods.CreateBoon({
    internalBoonName = "EurydiceFoodDamageForVulnerabilityTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Primordial Soup",
    description =
    "Foes with at least {#BoldFormatGraft}{$TooltipData.ExtractData.MinRequiredVulnerabilityEffects} {#Prev}{$Keywords.StatusPluralAlt} from different Olympians will take more damage.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 1.5 },
        Epic = { Multiplier = 2},
        Heroic = { Multiplier= 2.5},
    },
    ExtraFields = {
		AddOutgoingDamageModifiers =
		{
			MinRequiredVulnerabilityEffects = 4,
			VulnerabilityMultiplier = 
			{
				BaseValue = 1.25,
				SourceIsMultiplier = true,
			},
			ReportValues = { ReportedDamageBoost = "VulnerabilityMultiplier", ReportedEffects = "MinRequiredVulnerabilityEffects"},
        },
    },
    StatLines =
    {
        "BonusDamageStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedDamageBoost",
				ExtractAs = "DamageBoost",
				Format = "PercentDelta",
			},
            {
				Key = "ReportedEffects",
				ExtractAs = "MinRequiredVulnerabilityEffects",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodCritChanceTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Arrow-Speared Squid",
    description =
    "Any damage you deal this night may be {$Keywords.Crit}.",
    RarityLevels = {
        Common =
			{
				Multiplier = 2.00,
			},
			Rare =
			{
				Multiplier = 3,
			},
			Epic =
			{
				Multiplier = 4,
			},
			Heroic =
			{
				Multiplier = 5.00,
			},
    },
    ExtraFields = {
		AddOutgoingCritModifiers =
		{
			Chance = { BaseValue = 0.01 },
			ReportValues = { ReportedCritBonus = "Chance"}
		},
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
    internalBoonName = "EurydiceFoodRandomCardDrawTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Enchanting Pudding",
    description =
    "This night, activate {#BoldFormatGraft}{$ConstantsData.Two} {#Prev}random inactive {#BoldFormatGraft}Arcana Cards{#Prev}.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 3},
        Heroic = { Multiplier= 4},
    },
    ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid .. ".FoodBuffAcquireRandomArcana",
        AcquireFunctionArgs = {
            CardRarity = {BaseValue = 1},
            Amount = 2,
            Delay = 2.5,
            ReportValues = {BlessingRarityBonus = "CardRarity"},
        },
    },
    customStatLine = {
        ID = "StoryExpansionDrawnArcanaRarityStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Rarity of Drawn Arcana{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.RarityValue}",
    },
    StatLines =
    {
        "StoryExpansionDrawnArcanaRarityStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "BlessingRarityBonus",
				ExtractAs = "RarityValue",
				Format = "CardRarity",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodTalentPointsTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Celestial Feta",
    description =
    "The first {$Keywords.TalentPoint} you use will grant you additional upgrades.",
    RarityLevels = {
        Common = { Multiplier = 2},
        Rare = { Multiplier = 3 },
        Epic = { Multiplier = 4},
        Heroic = { Multiplier= 5},
    },
    ExtraFields = {
		AcquireFunctionName = "AddTalentPoints",
        AcquireFunctionArgs = {
            Count = {BaseValue = 1},
            ReportValues = {ReportedCount = "Count"}
        },
    },
    customStatLine = {
        ID = "StoryExpansionExtraTalentPointsStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Additional Upgrades{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Count}",
    },
    StatLines =
    {
        "StoryExpansionExtraTalentPointsStatDisplay1",
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
    internalBoonName = "EurydiceFoodSorceryChargeTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Stellar Slice",
    description =
    "Your {$Keywords.Spell} will also charge up automatically, as though you used {!Icons.Mana}.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 2},
        Epic = { Multiplier = 3},
        Heroic = { Multiplier= 4},
    },
    ExtraFields = {
		SetupFunction =
		{
			Threaded = true,
			Name = "SorceryChargeSetup",
			Args =
			{
				Name = "MetaUpgrade",
				ChargePerSecond = { BaseValue = 1 },
				ReportValues = { ReportedCharge = "ChargePerSecond" }
			},
		},
    },
    customStatLine = {
        ID = "StoryExpansionSpellAutoChargeStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Automatic Charge{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.ChargePerSecond}{!Icons.Mana} {#Prev}{#ItalicFormat}(every 1 Sec.)",
    },
    StatLines =
    {
        "StoryExpansionSpellAutoChargeStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedCharge",
				ExtractAs = "ChargePerSecond"
			}
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodSecretDoorTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Deep-Fried Kraken",
    description =
    "You are more likely to run into {$Keywords.HealthGatePlural} this night.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 3},
        Epic = { Multiplier = 5},
        Heroic = { Multiplier= 7},
    },
    ExtraFields = {
		StoryExpansionSecretDoorChance = {BaseValue = 0.01}
    },
    customStatLine = {
        ID = "StoryExpansionSecretDoorChanceDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Additional {$Keywords.HealthGate} Chance {#Prev} per Room:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Chance:P}",
    },
    StatLines =
    {
        "StoryExpansionSecretDoorChanceDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "StoryExpansionSecretDoorChance",
				ExtractAs = "Chance",
                Format = "LuckModifiedPercent"
			}
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodMaxHealthTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Nourishing Caramels",
    description =
    "You will have more {!Icons.HealthUp} this night.",
    RarityLevels = {
        Common = { Multiplier = 3},
        Rare = { Multiplier = 5},
        Epic = { Multiplier = 7},
        Heroic = { Multiplier= 9},
    },
    ExtraFields = {
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 10,
				ChangeType = "Add",
				ReportValues = { ReportedHealthBonus = "ChangeValue"}
			},
        }
    },
    customStatLine = {
        ID = "StoryExpansionExtraMaxHealthDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{!Icons.HealthUp} Gained{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.HealthBonus}",
    },
    StatLines =
    {
        "StoryExpansionExtraMaxHealthDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedHealthBonus",
				ExtractAs = "HealthBonus",
                IncludeSigns = true,
			}
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodMaxManaTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Mystic Candies",
    description =
    "You will have more {!Icons.ManaUp} this night.",
    RarityLevels = {
        Common = { Multiplier = 3},
        Rare = { Multiplier = 5},
        Epic = { Multiplier = 7},
        Heroic = { Multiplier= 9},
    },
    ExtraFields = {
		PropertyChanges =
		{
			{
				LuaProperty = "MaxMana",
				BaseValue = 10,
				ChangeType = "Add",
				ReportValues = { ReportedManaBonus = "ChangeValue"}
			},
        }
    },
    customStatLine = {
        ID = "StoryExpansionExtraMaxManaDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{!Icons.ManaUp} Gained{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.ManaBonus}",
    },
    StatLines =
    {
        "StoryExpansionExtraMaxManaDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedManaBonus",
				ExtractAs = "ManaBonus",
                IncludeSigns = true,
			}
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodBonusGoldTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Gold-Leaf Tart",
    description =
    "Gain bonus {!Icons.Currency} this night.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 1.5 },
        Epic = { Multiplier = 2},
        Heroic = { Multiplier= 2.5},
    },
    ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid .. ".FoodGrantMoney",
        AcquireFunctionArgs = {
            Amount = {BaseValue = 100},
            ReportValues = {ReportedAmount = "Amount"},
        },
    },
    customStatLine = {
        ID = "StoryExpansionBonusMoneyStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{!Icons.Currency} Gained{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Money}",
    },
    StatLines =
    {
        "StoryExpansionBonusMoneyStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedAmount",
				ExtractAs = "Money",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodBossKudosTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Party Pizza",
    description =
    "Whenever you defeat a {$Keywords.Boss} this night, gain {!Icons.CosmeticsPoints}.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 3},
        Heroic = { Multiplier= 4},
    },
    ExtraFields = {
		OnRoomRewardSpawnedFunctionName = _PLUGIN.guid ..".AwardKudosForBoss",
        OnRoomRewardSpawnedFunctionArgs = {
            KudosAmount = {BaseValue = 100},
            ReportValues = {ReportedAmount = "KudosAmount"}
        }
    },
    customStatLine = {
        ID = "StoryExpansionKudosForBossStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{!Icons.CosmeticsPoints} Gained{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Kudos}",
    },
    StatLines =
    {
        "StoryExpansionKudosForBossStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedAmount",
				ExtractAs = "Kudos",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodDuoChanceTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Tea for Two",
    description =
    "Any {$Keywords.GodBoonPlural} you find have an increased chance to include {$Keywords.Duo} blessings.",
    RarityLevels = {
        Common = { Multiplier = 3},
        Rare = { Multiplier = 5 },
        Epic = { Multiplier = 7},
        Heroic = { Multiplier= 9},
    },
    ExtraFields = {
		RarityBonus =
		{
			Duo = { BaseValue = 0.01 },
			ReportValues = { ReportedRarityBonus = "Duo"}			
		},
    },
    customStatLine = {
        ID = "StoryExpansionDuoBoostStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{$Keywords.Duo} Blessing Chance{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.RarityBonus:P}",
    },
    StatLines =
    {
        "StoryExpansionDuoBoostStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedRarityBonus",
				ExtractAs = "RarityBonus",
				Format = "Percent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodLegendaryChanceTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Golden Silphium Extract",
    description =
    "Any {$Keywords.GodBoonPlural} you find have an increased chance to include {$Keywords.Legendary} blessings.",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 3 },
        Epic = { Multiplier = 5},
        Heroic = { Multiplier= 7},
    },
    ExtraFields = {
		RarityBonus =
		{
			Legendary = { BaseValue = 0.01 },
			ReportValues = { ReportedRarityBonus = "Legendary"}			
		},
    },
    customStatLine = {
        ID = "StoryExpansionLegendaryBoostStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{$Keywords.Legendary} Blessing Chance{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.RarityBonus:P}",
    },
    StatLines =
    {
        "StoryExpansionLegendaryBoostStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedRarityBonus",
				ExtractAs = "RarityBonus",
				Format = "Percent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodEpicChanceTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Salted Ambrosia",
    description =
    "Any {$Keywords.GodBoonPlural} you find have an increased chance to include {$Keywords.Epic} blessings.",
    RarityLevels = {
        Common = { Multiplier = 5},
        Rare = { Multiplier = 10},
        Epic = { Multiplier = 15},
        Heroic = { Multiplier= 20},
    },
    ExtraFields = {
		RarityBonus =
		{
			Epic = { BaseValue = 0.01 },
			ReportValues = { ReportedRarityBonus = "Epic"}			
		},
    },
    customStatLine = {
        ID = "StoryExpansionEpicBoostStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{$Keywords.Epic} Blessing Chance{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.RarityBonus:P}",
    },
    StatLines =
    {
        "StoryExpansionEpicBoostStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedRarityBonus",
				ExtractAs = "RarityBonus",
				Format = "Percent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodChamberStacksTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Pomegranate Seed Salad",
    description =
    "Whenever you pass through enough {$Keywords.RoomPlural}, a random {$Keywords.GodBoon} will gain a {$Keywords.PomLevel}",
    RarityLevels = {
        Common = { Multiplier = 1},
        Rare = { Multiplier = 7/8 },
        Epic = { Multiplier = 6/8},
        Heroic = { Multiplier= 5/8},
    },
    ExtraFields = {
		RoomsPerUpgrade = {
			Amount = {
				BaseValue = 8,
			},
			TraitStacks = 1,
			ReportValues = {
				ReportedRoomsPerTraitStacks = "Amount",
			},
		},
    },
    customStatLine = {
        ID = "StoryExpansionTravellingPomStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{$Keywords.RoomPlural} per {$Keywords.PomLevel}{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}",
    },
    StatLines =
    {
        "StoryExpansionTravellingPomStatDisplay1",
    },
    ExtractValues =
    {
                        {Key = "ReportedRoomsPerTraitStacks",
			    ExtractAs = "TooltipRoomInterval",}

    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodDamageCapTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Protective Pastry",
    description =
    "Whenever you take over {#BoldFormat} 20 {#Prev} damage this night, take less.",
    RarityLevels = {
        Common = { Multiplier = 2},
        Rare = { Multiplier = 3 },
        Epic = { Multiplier = 4},
        Heroic = { Multiplier= 5},
    },
    ExtraFields = {
		        ActivatedDamageReductionThreshold = 20,
		ActivatedDamageReduction = 
		{ 
			BaseValue = 1, 
			AsInt = true,
			MinValue = -1,
			MinMultiplier = -2,
			IdenticalMultiplier =
			{
				Value = -1,
			},
		},
		ReportedValue = {BaseValue = 1},

    },
    StatLines =
    {
        "DamageCapStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedValue",
				ExtractAs = "TooltipReduction",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodDiminishingDodgeTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Airy Religieuse",
    description =
    "Start the night with a high {$Keywords.Dodge} chance. Whenever you {$Keywords.Dodge}, lose {#PenaltyFormat} 5% {#Prev} of this.",
    RarityLevels = {
        Common = { Multiplier = 5},
        Rare = { Multiplier = 5.5 },
        Epic = { Multiplier = 6},
        Heroic = { Multiplier= 6.5},
    },
    ExtraFields = {
		        		SetupFunction = 
		{
			Name = _PLUGIN.guid..".DiminishingDodgeSetup",
		},
		OnDodgeFunction = 
		{
			FunctionName = _PLUGIN.guid..".DiminishingDodge",
			RunOnce = true,
			FunctionArgs =
			{
				Cooldown = 0.2,
			},
		},
		InitialDodgeChance = {BaseValue = 0.1},
		CurrentDodgeChance = {BaseValue = 0.1},
		Decay = 0.05,
    },
    StatLines =
    {
        "CurrentDecayingDodgeStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "CurrentDodgeChance",
				ExtractAs = "TooltipCurrentDodge",
				Format = "Percent",
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodChannelSpeedTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Star-Dried Styxeon",
    description =
    "You {$Keywords.HoldNoTooltip} your {$Keywords.Omega} faster this night.",
    RarityLevels = {
        Common = { Multiplier = 1.5},
        Rare = { Multiplier = 2 },
        Epic = { Multiplier = 2.5},
        Heroic = { Multiplier= 3},
    },
    ExtraFields = {
        PropertyChanges = 
		{
			{
				WeaponNames = { "WeaponLobSpecial", "WeaponCastArm", "WeaponStaffBall", "WeaponStaffSwing5", "WeaponDaggerThrow", "WeaponDagger5", "WeaponAxeSpecialSwing" },
				BaseMin = 0.85,
				BaseMax = 0.90,
				SourceIsMultiplier = true,
				SpeedPropertyChanges = true,
			}
		},
		WeaponSpeedMultiplier =
		{
			WeaponNames = WeaponSets.HeroAllWeaponsAndSprint,
			Value = 
			{
				BaseMin = 0.85,
				BaseMax = 0.90,
				SourceIsMultiplier = true,
			},
			ReportValues = { ReportedWeaponMultiplier = "Value" }
		},
    },
    customStatLine = {
        ID = "StoryExpansionChannelSpeedStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Increased {$Keywords.Omega} {$Keywords.HoldNoTooltip} Speed{#Prev}:",
        description = "{#UpgradeFormat}+{$TooltipData.ExtractData.TooltipWeaponSpeed}%",
    },
    StatLines =
    {
        "StoryExpansionChannelSpeedStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "TooltipWeaponSpeed",
				Format = "NegativePercentDelta"
			},
    }
})

gods.CreateBoon({
    internalBoonName = "EurydiceFoodRandomElementsTrait",
    InheritFrom = { gods.GetInternalBoonName("EurydiceFoodBaseTrait")},
    characterName = "StoryExpansionEurydice",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_35",
    displayName = "Cosmic Omelet",
    description =
    "Gain a random assortment of {$Keywords.AllElements} this night.",
    RarityLevels = {
        Common = { Multiplier = 5},
        Rare = { Multiplier = 7},
        Epic = { Multiplier = 9},
        Heroic = { Multiplier= 11},
    },
    ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid .. ".GrantRandomElementSelection",
        AcquireFunctionArgs = {
            Amount = {BaseValue = 1},
            ReportValues = {ReportedAmount = "Amount"},
        },
    },
    customStatLine = {
        ID = "StoryExpansionBonusElementsStatDisplay1",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Total {$Keywords.AllElements} Gained{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Elements}",
    },
    StatLines =
    {
        "StoryExpansionBonusElementsStatDisplay1",
    },
    ExtractValues =
    {
        {
				Key = "ReportedAmount",
				ExtractAs = "Elements",
			},
    }
})