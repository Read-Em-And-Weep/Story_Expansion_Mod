gods.CreateBoon({
    internalBoonName = "ImprovedTemporaryEmptySlotDamageTrait",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_50",
    displayName = "Danaid Dagger Deluxe",
    description = "Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipBonus:P} {#Prev}damage while not empowered by {$Keywords.GodBoonPlural}.",
ExtraFields = {
    		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			EmptySlotMultiplier = 4,
			EmptySlotValidData =
			{
				Melee = WeaponSets.HeroPrimaryWeapons,
				Secondary = WeaponSets.HeroSecondaryWeapons,
			},
			ReportValues = { ReportedWeaponMultiplier = "EmptySlotMultiplier"},
		},
},
StatLines = 
		{
			"StoreUsesRemainingDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "TooltipBonus",
				Format = "PercentDelta",
				SkipAutoExtract = true
			},
		},
})

gods.CreateBoon({
    internalBoonName = "ImprovedTemporaryImprovedExTrait",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_46",
    displayName = "Witch's Mark Max",
    description = "Your {$Keywords.Omega} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipBonus:P} {#Prev}damage.",
ExtraFields = {
    		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ExMultiplier = 1.75,
			ReportValues = { ReportedWeaponMultiplier = "ExMultiplier"}
		},
},
StatLines = 
		{
			"StoreUsesRemainingDisplay1",
		},
		ExtractValues =
		{
			{
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "TooltipBonus",
				Format = "PercentDelta",
			},
		},
})

gods.CreateBoon({
    internalBoonName = "ImprovedLimitedSwapTraitDrop",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_49",
    displayName = "Superior Sacrificial Hymn",
    description = "{$Keywords.TraitExchangeAlt} will be offered as soon as possible, and your next gains {#AltUpgradeFormat}+4{#Prev} {$Keywords.PomLevel}",
ExtraFields = {
        ShowInHUD = true,
        Uses = 1,
		ForceSwaps = true,		
		BlockStacking = true,
		ExchangeLevelBonus = 4,
		
},
		ExtractValues = 
		{
			{
				Key = "ExchangeLevelBonus",
				ExtractAs = "Levels",
			},
		}
})

gods.CreateBoon({
    internalBoonName = "ImprovedTemporaryImprovedDefenseTrait",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_45",
    displayName = "Elder Python Scales",
    description = "You take {#UpgradeFormat}-{$TooltipData.ExtractData.TooltipDamageReduction}% {#Prev}damage.",
ExtraFields = {
        RemainingUses = 5,
		UsesAsEncounters = true,
		AddIncomingDamageModifiers =
		{
			HealthOnly = true,
			ValidWeaponMultiplier = 0.85,
			ReportValues = 
			{
				ReportedMultiplier = "ValidWeaponMultiplier"
			},
		},
},
StatLines = 
		{
			"StoreUsesRemainingDisplay1",
		},
		ExtractValues = 
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "TooltipDamageReduction",
				Format = "NegativePercentDelta",
			},
		}
})

gods.CreateBoon({
    internalBoonName = "ImprovedTemporaryMoveSpeedTrait",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_36",
    displayName = "Improved Ignited Ichor",
    description = "You move {#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed}% {#Prev}faster.",
ExtraFields = {
        RemainingUses = 8,
		UsesAsEncounters = true,
				PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
				ReportValues = { ReportedSpeed = "ChangeValue"}
			},
		},

},
StatLines = 
		{
			"StoreUsesRemainingDisplay1",
		},
		ExtractValues = 
		{
			{
				Key = "ReportedSpeed",
				ExtractAs = "TooltipSpeed",
				Format = "PercentDelta",
			}
		}
})

gods.CreateBoon({
    internalBoonName = "ImprovedTemporaryDoorHealTrait",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_33",
    displayName = "HydraLite Gold",
    description = "Restore {#UpgradeFormat}{$TooltipData.ExtractData.TooltipHeal}%{!Icons.Health} {#Prev}whenever you enter a {$Keywords.RoomAlt}.",
ExtraFields = {
		RemainingUses = 3,
		UsesAsRooms = true,
		DoorHeal = 0.20,
		CustomStatLinesWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			StatLines = 
			{
				"StoreUsesRemainingDisplay1",
				"HealingReductionNotice",
			}
		},

},
StatLines = 
		{
			"StoreUsesRemainingDisplay2",
		},
		ExtractValues = 
		{
			{
				Key = "DoorHeal",
				ExtractAs = "TooltipHeal",
				Format = "PercentHeal",
			},
		}
})

gods.CreateBoon({
    internalBoonName = "ImprovedLastStandDrop",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_30",
    displayName = "Kiss of Styx Premium",
    description = "Replenish {#UpgradeFormat}all {#Prev}uses of {#BoldFormatGraft}{$Keywords.ExtraChanceMisc} {#Prev}now.",
ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid..".PatroclusRefillLastStands",
},
})


gods.CreateBoon({
    internalBoonName = "ImprovedResourcesDrops",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_31",
    displayName = "Luxury Parcel",
    description = "Gain +{#UpgradeFormat}50{#Prev}{!Icons.MetaCardPointsCommonIcon}, +{#UpgradeFormat}50{#Prev}{!Icons.MemPointsCommonIcon} and +{#UpgradeFormat}50{#Prev}{!Icons.MetaCurrencyIcon} now.",
ExtraFields = {
AcquireFunctionName = "AddTraitResources",
		AcquireFunctionArgs = 
		{
			Delay = 0.5,
			GiftResources = 
			{
				MetaCardPointsCommon = 50,
                MemPointsCommon = 50,
                MetaCurrencyIcon = 50,
			},
		},},
})

gods.CreateBoon({
    internalBoonName = "ImprovedTemporaryBoonRarityTrait",
    InheritFrom = {"ShopTrait"},
    characterName = "StoryExpansionPatroclus",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\ShopIcons\\Shop_32",
    displayName = "Quality Yarn of Ariadne",
    description = "Ensure the next {$Keywords.GodBoon} you find includes blessings with {#BoldFormat} significantly {#Prev} greater {$Keywords.Rarity}.",
ExtraFields = {
        RarityBonus =
		{
			GodLootOnly = true,
			Epic = 1,
			Duo = 0.5,
			Legendary = 0.5,
		},
		RemainingUses = 1,
},
})