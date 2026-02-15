gods.CreateKeepsake({
    characterName = "Hades",
    internalKeepsakeName = "StoryExpansionChthonicBoonKeepsake",

    RarityLevels = {
        Common =
			{
				Multiplier = 4
			},
			Rare =
			{
				Multiplier = 6
			},
			Epic =
			{
				Multiplier = 8
			},
			Heroic =
			{
				Multiplier = 12
			},
    },

    Keepsake = {
        displayName = "Infernal Mark",
        description = "You may encounter {$Keywords.Chthonic} blessings this night. While you hold this keepsake, you have a {#UpgradeFormat} {$TooltipData.ExtractData.RarityBonus:P} {#Prev} chance to encounter {$Keywords.Duo} and {$Keywords.Chthonic} blessings.",
        signoffMax = "From {#AwardMaxFormat}Hades{#Prev}{!Icons.ObjectiveSeparatorDark}The Underworld is the ending for all mortals, and it is the ending for you too.",
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
RarityBonus =
		{
			Duo = { BaseValue = 0.01 },
			ReportValues = { ReportedRarityBonus = "Duo"}			
		},
    },

    ExtractValues = {
        {
				Key = "ReportedRarityBonus",
				ExtractAs = "RarityBonus",
				Format = "Percent",
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})

gods.CreateBoon({
    internalBoonName = "StoryExpansionChthonicBoonKeepsakePermanent",
    InheritFrom = {},
    characterName = "NPC_Hades_01",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
    displayName = "Infernal Mark",
    description = "You may encounter {$Keywords.Chthonic} blessings this night.",
    RarityLevels = {
       Common =
			{
				Multiplier = 4
			},
			Rare =
			{
				Multiplier = 6
			},
			Epic =
			{
				Multiplier = 8
			},
			Heroic =
			{
				Multiplier = 12
			},
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

gods.CreateCustomRarity({
    Name = "Chthonic",
    BlockInRunStacking = true,
    BlockInRunRarify = true,
    BlockMenuRarify = true,
    RarityLevels = {
        Duo = {
            MinMultiplier = 1,
			MaxMultiplier = 1,
        }
    },
    Display = {
		CustomRarityColor = Color.BoonPatchHeroic,
        PathOverrides = {framePath = "GUI\\Screens\\BoonIconFrames\\heroic", backingPath = "GUI\\Screens\\BoonSelect\\BoonSlot_Heroic"},
        framePath = "GUI\\Screens\\BoonIconFrames\\heroic",
        backingPath = "GUI\\Screens\\BoonSelect\\BoonSlot_Heroic"
	},
})

local chthonicTrait = gods.GetInternalRarityName("Chthonic")



--Ares
gods.CreateBoon({
	internalBoonName = "CompoundingWoundsTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Ares",
	addToExistingGod = true,
	
	BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.AresRendTraits, {gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Chronic Dehiscence",
	description = "After you inflict {$Keywords.Rend}, {$Keywords.Rend} gains bonus power for the rest of the {$Keywords.EncounterAlt}.",
	StatLines = {"StoryExpansionCompoundingWoundsTraitStatLine"},
	ExtraFields = {
		OnEncounterStartFunction =
		{
			Name = _PLUGIN.guid .. ".ResetCompoundingWounds",
		},
        ExtraPowerPerWounds = 2,
        CurrentExtraWounds = 0,
	},
    customStatLine = {
        ID = "StoryExpansionCompoundingWoundsTraitStatLine",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Bonus Power per Application:",
        description = "{#UpgradeFormat}+{$TooltipData.ExtractData.DamagePerWounds}",
    },
	ExtractValues =
		{
            {
                Key = "CurrentExtraWounds",
                ExtractAs = "BonusDamage",
                IncludeSigns = true,
            },
            {
				Key = "ExtraPowerPerWounds",
				ExtractAs = "DamagePerWounds",
				IncludeSigns = true,
			},
            {
				ExtractAs = "AresCurseDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "AresStatus",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "AresCursePowerBonus",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectLuaData",
				BaseName = "AresStatus",
				BaseProperty = "BonusBaseDamageOnInflict",
			}
		},
})

function mod.ResetCompoundingWounds()
    if HeroHasTrait(gods.GetInternalBoonName("CompoundingWoundsTrait")) then
        local compoundingTrait = gods.GetBoonData("CompoundingWoundsTrait")
        compoundingTrait.CurrentExtraWounds = 0
    end
end

modutil.mod.Path.Wrap("CalculateBaseDamageAdditions", function(base, attacker, victim, triggerArgs)
    local damageAddition = base(attacker, victim, triggerArgs)

    if attacker ~= nil and attacker == CurrentRun.Hero and victim ~= nil and HeroHasTrait(gods.GetInternalBoonName("CompoundingWoundsTrait")) then
        for i, modifierData in ipairs(attacker.OutgoingDamageModifiers) do
            local validWeapon = modifierData.ValidWeaponsLookup == nil or
            (modifierData.ValidWeaponsLookup[triggerArgs.SourceWeapon] ~= nil and triggerArgs.EffectName == nil)
            local validProjectile = modifierData.ValidProjectilesLookup == nil or
            (triggerArgs.SourceProjectile and modifierData.ValidProjectilesLookup[triggerArgs.SourceProjectile] ~= nil and triggerArgs.EffectName == nil)
            local validActiveEffect = modifierData.ValidActiveEffects == nil or
            (victim.ActiveEffects and ContainsAnyKey(victim.ActiveEffects, modifierData.ValidActiveEffects))
            local validEffect = modifierData.ValidSelfEffect == nil or
            (attacker.ActiveEffects and attacker.ActiveEffects[modifierData.ValidSelfEffect])
            if validWeapon and validProjectile and validActiveEffect and validEffect then
                if modifierData.MissingEffectDamage then
                    if victim.TriggersOnHitEffects and victim.ActiveEffects and not victim.ActiveEffects[modifierData.MissingEffectName] and modifierData.MissingEffectName == "AresStatus" then
                        local compoundingTrait = gods.GetBoonData("CompoundingWoundsTrait")
                        local missingEffectDamageAddition = compoundingTrait.CurrentExtraWounds
                        local missingEffectDamageMultiplier = 1 +
                            GetTotalHeroTraitValue("MissingEffectDamageIncreasePerUniqueGod") * attacker.UniqueGodCount
                        for i, data in ipairs(GetHeroTraitValues("ActivatedMissingEffectDamageIncrease")) do
                            if HeroHasTrait(data.TraitName) and GetHeroTrait(data.TraitName).Activated then
                                missingEffectDamageMultiplier = missingEffectDamageMultiplier + data.Amount
                            end
                        end
                        local newDamageAddition = missingEffectDamageAddition * missingEffectDamageMultiplier
                        if triggerArgs.SourceWeapon and WeaponData[triggerArgs.SourceWeapon] and WeaponData[triggerArgs.SourceWeapon].BaseDamageBonusMultiplier then
                            newDamageAddition = round(newDamageAddition *
                                GetTotalHeroTraitValue(WeaponData[triggerArgs.SourceWeapon].BaseDamageBonusMultiplier))
                        end
                        compoundingTrait.CurrentExtraWounds = compoundingTrait.CurrentExtraWounds +
                        compoundingTrait.ExtraPowerPerWounds
                        damageAddition = damageAddition + newDamageAddition
                    end
                end
            end
        end
    end
    return damageAddition
end)

-- Hestia
gods.CreateBoon({
	internalBoonName = "KillShareBurnTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Hestia",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.HestiaBurnTraits, {gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Shared Immolation",
	description = "When you slay a foe, any remaining {$Keywords.Burn} they have is split between other foes.",
	StatLines = {"StoryExpansionKillShareBurnTraitStatLine"},
	ExtraFields = {
        GameStateRequirements = {
            OrRequirements =
			{
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake") },
					},
				},
                {
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent") },
					},
				},
			},
        },
		OnEnemyDeathFunction = 
		{
			Name = _PLUGIN.guid .. ".TransferBurn",
			FunctionArgs = 
			{
				EffectName = "BurnEffect",
                FractionTransferred = 0.60,
                ReportValues = {ReportedFraction = "FractionTransferred"}
			},
		},
	},
    customStatLine = {
        ID = "StoryExpansionKillShareBurnTraitStatLine",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{!Keywords.Burn} Transferred{#Prev}:",
        description = "{#UpgradeFormat}{$TooltipData.ExtractData.Chance:P}",
    },
	ExtractValues =
		{
			{
				Key = "ReportedFraction",
				ExtractAs = "Chance",
				Format = "Percent",
                SkipAutoExtract = true,
			},
            {
				ExtractAs = "BurnRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectLuaData",
				BaseName = "BurnEffect",
				BaseProperty = "DamagePerSecond",
				DecimalPlaces = 1,
			},
		},
})

function mod.TransferBurn(victim, args)
    if victim.ActiveEffectsAtDamageStart and victim.ActiveEffectsAtDamageStart[args.EffectName] then
        local eligibleTargets = {}
        local targetCount = 0
			for id, enemy in pairs( ShallowCopyTable( ActiveEnemies ) ) do
				if not enemy.IsDead and not enemy.SkipModifiers and not enemy.AlwaysTraitor and not IsUntargetable({ Id = id }) then
					table.insert(eligibleTargets, enemy )
                    targetCount = targetCount + 1
				end
			end
            if targetCount == 0 then
                return
            end
            local burnToApply = round(victim.ActiveEffectsAtDamageStart[args.EffectName]/targetCount * args.FractionTransferred)
            for key, enemy in pairs(eligibleTargets) do
                thread(ApplyBurn, enemy, {EffectName = "BurnEffect", NumStacks = burnToApply,})
            end
    end
end

-- Demeter
gods.CreateBoon({
	internalBoonName = "FrozenMarkTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Demeter",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.DemeterRootTraits,{gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Easy Target",
	description = "After inflicting a foe with {$Keywords.Root}, they are also inflicted with {$Keywords.Mark}.",
	StatLines = {"StoryExpansionFrozenMarkTraitStatLine"},
	ExtraFields = {
		OnEnemyCrittedFunction =
		{
			Name = _PLUGIN.guid .. ".RemoveDemeterArtemisMark",
		},
		OnEffectApplyFunction = 
		{
			FunctionName = _PLUGIN.guid .. ".CheckRootStrike",
			FunctionArgs = 
			{
				ApplyEffect = "ReadEmAndWeepMoreDuosDemeterArtemisDuoHuntersMark" 
			}
		},
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				HasNone = { "TimedCritVulnerabilityBoon"},
			},
		},
	},
    customStatLine = {
        ID = "StoryExpansionFrozenMarkTraitStatLine",
        displayName = "{!Icons.Bullet}{#PropertyFormat}{$Keywords.Mark} {$Keywords.Crit} Chance{#Prev}:",
        description = "{#UpgradeFormat}15%",
    },
	ExtractValues = {
		{
				ExtractAs = "ChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "ChillEffect",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "ChillActiveDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "ChillEffect",
				BaseProperty = "ActiveDuration",
			},
			{
				External = true,
				BaseType = "EffectData",
				BaseName = "ReadEmAndWeepMoreDuosDemeterArtemisDuoHuntersMark",
				BaseProperty = "Duration",
				ExtractAs = "TooltipMarkDuration",
				SkipAutoExtract = true,
			},
			{
				External = true,
				BaseType = "EffectLuaData",
				BaseName = "ReadEmAndWeepMoreDuosDemeterArtemisDuoHuntersMark",
				BaseProperty = "CritVulnerability",
				ExtractAs = "CritRate",
				Format = "Percent",
				SkipAutoExtract = true,
			}
	}
})


function mod.RemoveDemeterArtemisMark(victim)
	ClearEffect({ Id = victim.ObjectId, Name = "ReadEmAndWeepMoreDuosDemeterArtemisDuoHuntersMark" })
end

function mod.CheckRootStrike(victim, functionArgs, triggerArgs)
	if triggerArgs.EffectName == "ChillEffect" and victim.RootActive and not triggerArgs.Reapplied then
		local effectName = functionArgs.ApplyEffect
		ApplyEffect({ 
						DestinationId = victim.ObjectId, 
						Id = CurrentRun.Hero.ObjectId, 
						EffectName = effectName, 
						DataProperties = EffectData[effectName].EffectData
					})
	end
end

    game.EffectData.ReadEmAndWeepMoreDuosDemeterArtemisDuoHuntersMark =
	{
		EffectName = "ArtemisHunterMark",
		Vfx = "ArtemisCritVulnerabilityStatusIn",
		StopVfxesPreventChain = { "ArtemisCritVulnerabilityStatusIn" },
		-- CritVulnerability is not linked to the StatLine (done manually) so if this is changed, stat line needs to be changed manually
        CritVulnerability = 0.15,
		EffectData = 
		{
			Duration = 6,
			Modifier = 1,
			TimeModifierFraction = 0,
		}
	}

-- Poseidon
gods.CreateBoon({
	internalBoonName = "FrothCritTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Poseidon",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.PoseidonKnockbackAmplifyTraits,{gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Critical Burst",
	description = "{$Keywords.KnockbackAmplify} has a chance to deal {$Keywords.Crit} damage.",
	StatLines = {"CriticalChanceDisplay1"},
	ExtraFields = {
		AddOutgoingCritModifiers = {
            ValidProjectiles = {"PoseidonEffectFont"},
			Chance = 0.25,
			ReportValues = { ReportedChance = "Chance"},
        }
	},
    customStatLine = {
        ID = "StoryExpansionCompoundingWoundsTraitStatLine_Tray",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Current Bonus Power:",
        description = "{#UpgradeFormat}+{$TooltipData.CurrentExtraWounds}",
    },
	ExtractValues = {
        {
				Key = "ReportedChance",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent"
			},
					{
				ExtractAs = "KnockbackAmplifyDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "AmplifyKnockbackEffect",
				BaseProperty = "Duration",
				DecimalPlaces = 1,
			},
			{
				ExtractAs = "FontChance",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectLuaData",
				BaseName = "AmplifyKnockbackEffect",
				BaseProperty = "Chance",
				Format = "LuckModifiedPercent"
			},
			{
				External = true,
				ExtractAs = "FontDamage",
				BaseType = "ProjectileBase",
				BaseName = "PoseidonEffectFont",
				BaseProperty = "Damage",
			},
	}
})

-- Hera
gods.CreateBoon({
	internalBoonName = "HitchCritTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Hera",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.HeraLinkTraits,{gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Marital Split",
	description = "You have increased chance to deal {$Keywords.Crit} damage to {$Keywords.Link}-afflicted foes, but doing so removes {$Keywords.Link} from all other foes.",
	StatLines = {"CriticalChanceDisplay1"},
	ExtraFields = {
		AddOutgoingCritModifiers = {
            ValidActiveEffects = {"DamageShareEffect"},
			Chance = 0.1,
			ReportValues = { ReportedChance = "Chance"},
        },
        OnEnemyCrittedFunction =
		{
			Name = _PLUGIN.guid .. ".RemoveLinkEffect",
			Args = {  }
		},
	},
	ExtractValues = {
        {
				Key = "ReportedChance",
				ExtractAs = "CritBonus",
				Format = "LuckModifiedPercent"
			},
			{
				ExtractAs = "DamageShareDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "DamageShareEffect",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "DamageShareAmount",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "DamageShareEffect",
				BaseProperty = "Amount",
				Format = "Percent",
				HideSigns = true,
			},
	}
})

function mod.RemoveLinkEffect(victim, args)
    if not victim.ActiveEffectsAtDamageStart and not victim.ActiveEffectsAtDamageStart["DamageShareEffect"] then
        return
    end
    for id, enemy in pairs( ShallowCopyTable( ActiveEnemies ) ) do
			if enemy.ActiveEffects and enemy.ActiveEffects["DamageShareEffect"] then
				ClearEffect({ Id = enemy.ObjectId, Name = "DamageShareEffect" })
                CreateAnimation({ Name = "HeraProjectileExplosion", GroupName = "FX_Standing_Top", DestinationId = enemy.ObjectId })
                CreateAnimationsBetween({ 
					Animation = "HeraRope", DestinationId = enemy.ObjectId, Id = victim.ObjectId, 
					Stretch = true, UseZLocation = false})
			end
		end
end

-- Aphrodite
gods.CreateBoon({
	internalBoonName = "HeartthrobUrnTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Aphrodite",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {{"ManaBurstBoon"},{gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Aching Breakup",
	description = "Whenever a {$Keywords.HeartBurst} expires or deals damage, summon ghostly hands to damage foes.",
	StatLines = {"BonusDamageStatDisplay1"},
	ExtraFields = {
		OnProjectileDeathFunction = 
		{
			ValidProjectiles = { "AphroditeBurst" },
			Name = _PLUGIN.guid..".CreateUrnDamage",
            Args = 
			{
				Multiplier = 80/200,
                ReportValues = {ReportedMultiplier = "Multiplier"}
			}
		},
	},
	ExtractValues = {
        {
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "HadesUrnDeath",
				BaseProperty = "Damage",
			},
			{
				ExtractAs = "Duration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "AphroditeBurst",
				BaseProperty = "Fuse",
			},
	}
})

function mod.CreateUrnDamage(triggerArgs, functionArgs)
    if not triggerArgs or not functionArgs then
        return
    end
    if triggerArgs.LocationX and triggerArgs.LocationY then
        local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY  })
        	CreateProjectileFromUnit({ Name = "HadesUrnDeath", Id = CurrentRun.Hero.ObjectId, DestinationId = dropLocation, FireFromTarget = true, DamageMultiplier = functionArgs.Multiplier })	
            	Destroy({Id = dropLocation})
    end

end

-- Zeus
gods.CreateBoon({
	internalBoonName = "ZeusBonusLevelTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Zeus",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.ZeusCoreTraits,{gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Godly Authority",
	description = "Raise {$Keywords.PomLevel} for {#ItalicFormat}all {#Prev}your {$Keywords.GodBoonPlural} of {#BoldFormatGraft}Zeus {#Prev} for each {$Keywords.GodBoon}-giver you have.",
	StatLines = {"StoryExpansionZeusBonusLevelTraitStatLine"},
	ExtraFields = {
		AcquireFunctionName = _PLUGIN.guid..".BoostZeusLevelsForUniqueGodCount",
	},
    customStatLine = {
        ID = "StoryExpansionZeusBonusLevelTraitStatLine",
        displayName = "{!Icons.Bullet}{#PropertyFormat}Bonus Lv. per God(dess){#Prev}:",
        description = "{#UpgradeFormat}+3",
    },
	ExtractValues = {
        {},
	},
})

function mod.BoostZeusLevelsForUniqueGodCount()
local traitDictionary = {}
	local validTraits = {}
	local buffTraits = {}
	local totalLevels = 3*CurrentRun.Hero.UniqueGodCount
    local origTraitData = GetHeroTrait(gods.GetInternalBoonName("ZeusBonusLevelTrait"))
	local sourceTraitData = nil
		for i, traitData in ipairs( CurrentRun.Hero.Traits ) do
			if AreTraitsIdentical( traitData, origTraitData) then
				sourceTraitData = CurrentRun.Hero.Traits[i]
			end
			if not traitDictionary[traitData.Name] 
				and IsGodTrait(traitData.Name, { ForShop = true }) 
				and TraitData[traitData.Name] 
				and traitData.Rarity ~= nil then
				if GetLootSourceName(traitData.Name) == "ZeusUpgrade" and not traitData.BlockStacking then
					table.insert(buffTraits, traitData )
				end
		end
	end
    for _, traitData in pairs( buffTraits ) do
		IncreaseTraitLevel( traitData, totalLevels )
	end
    thread( SuperSacrificePresentation, "ZeusUpgrade", "ZeusUpgrade", totalLevels)
end

-- Hephaestus
gods.CreateBoon({
	internalBoonName = "HephaestusBossArmourTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Hephaestus",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.HephaestusCoreTraits,{gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Contingency Plan",
	description = "Whenever a foe makes you use {$Keywords.ExtraChanceMisc}, gain {$Keywords.Armor} for the remainder of the {$Keywords.RoomAlt}.",
	StatLines = {"ArmorStatDisplay2"},
	ExtraFields = {
		OnLastStandFunction = 
		{
			Name = _PLUGIN.guid..".AwardArmorOnLastStandUse",
			FunctionArgs = 
			{
                Source = "StoryExpansionHephaestusBossArmourTrait",
					Delay = 0.75,
					BaseAmount = 50,
					ReportValues = 
					{ 
						ReportedArmor = "BaseAmount",
					}			}
		},
	},
	ExtractValues = {
        {
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
	}
})

function mod.AwardArmorOnLastStandUse(functionArgs, triggerArgs)
    if CurrentRun.Hero.IsDead then return end
    AddHealthBuffer(functionArgs.BaseAmount, functionArgs.Source)
    FrameState.RequestUpdateHealthUI = true
end

-- Hephaestus
gods.CreateBoon({
	internalBoonName = "ApolloKillHealTrait",
	InheritFrom = {chthonicTrait, "AetherTrait"},
	characterName = "Apollo",
	addToExistingGod = true,
	
	BlockStacking = true,

	reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\BoonIcons\\Zeus_41",

	requirements = {OneFromEachSet = {LinkedTraitData.ApolloCoreTraits,{gods.GetInternalKeepsakeName("StoryExpansionChthonicBoonKeepsake"),gods.GetInternalBoonName("StoryExpansionChthonicBoonKeepsakePermanent")}}},
	displayName = "Healing Dissection",
	description = "Whenever you kill a foe, restore some {!Icons.Health}, {#UpgradeFormat} 20% {#Prev} of the time.",
	StatLines = {"EncounterHealStatDisplay1"},
	ExtraFields = {
		OnEnemyDeathFunction = 
		{
			Name = _PLUGIN.guid .. ".HealOnKill",
			FunctionArgs = 
			{
				HealAmount = 2,
                Chance = 0.2,
                ReportValues = { ReportedHeal = "HealAmount" }
			},
		},
	},
	ExtractValues = {
        {
				Key = "ReportedHeal",
				ExtractAs = "Heal",
				Format = "FlatHeal"
			},
	}
})

function mod.HealOnKill(victim, args)
    if not RandomChance(args.Chance) then
        return
    end
    local healingMultiplier = CalculateHealingMultiplier()
	local expectedHeal = round(args.HealAmount * healingMultiplier)
    Heal(CurrentRun.Hero, {HealAmount = expectedHeal,SourceName = "ApolloKillHealTrait", Silent = false })
end