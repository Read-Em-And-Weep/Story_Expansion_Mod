local newQuestOrderData = {
    "StoryExpansionQuestThanatosUpgrades",
    "StoryExpansionQuestMegCurses",
    "StoryExpansionQuestMegBlessings",
    "StoryExpansionQuestPatroclusUpgrades",
    "StoryExpansionQuestEurydiceUpgrades",
}

local newQuestData = 
{
    StoryExpansionQuestThanatosUpgrades =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultOlympianQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 500,
		UnlockGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionThanatosGift02" },
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll =
				{
				gods.GetInternalBoonName("ThanatosFocusDeathDefianceTrait"),
			    gods.GetInternalBoonName("ThanatosDoubleDamageFinishTrait"),
			    gods.GetInternalBoonName("ThanatosFasterAttackTrait"),
			    --gods.GetInternalBoonName("ThanatosOldKeepsakeTrait"),
			    gods.GetInternalBoonName("ThanatosPerfectClearBonusRewardTrait"),
			    gods.GetInternalBoonName("ThanatosPerfectCritTrait"),
			    gods.GetInternalBoonName("ThanatosDodgeSpellTrait"),
			    gods.GetInternalBoonName("ThanatosDamageOnKillTrait"),
			    gods.GetInternalBoonName("ThanatosSummonShadeMercTrait"),
			    gods.GetInternalBoonName("ThanatosIncomingOutcomingCritTrait"),
				},
			},
		},

		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0243", Text = "I know my brother trusts you more than most." },
			},
		},
	},
    StoryExpansionQuestMegCurses =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultOlympianQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 500,
		UnlockGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "Placeholder" },
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll =
				{
				gods.GetInternalBoonName("MegaeraOathIncreasedManaCost"),
                gods.GetInternalBoonName("MegaeraOathIncreasedSpellCost"),
                gods.GetInternalBoonName("MegaeraOathNoManaBoon"),
                gods.GetInternalBoonName("MegaeraOathDecreasedMaxGods"),
                gods.GetInternalBoonName("MegaeraOathDecreasedWeaponRank"),
                gods.GetInternalBoonName("MegaeraOathInCastDamage"),
                gods.GetInternalBoonName("MegaeraOathAntiHeal"),
                gods.GetInternalBoonName("MegaeraOathLargePrime"),
                gods.GetInternalBoonName("MegaeraOathTakeCriticalDamage"),
                gods.GetInternalBoonName("MegaeraOathNoRushBoon"),
				},
			},
		},

		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0220", Text = "Your generosity shall not be forgotten." },
			},
		},
	},
    StoryExpansionQuestMegBlessings =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultOlympianQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 500,
		UnlockGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "MegaeraOathNoManaBoon" },
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll =
				{
				gods.GetInternalBoonName("MegaeraBlessingArcanaDraw"),
                gods.GetInternalBoonName("MegaeraBlessingArcanaUpgrade"),
                gods.GetInternalBoonName("MegaeraBlessingTalentDrop"),
                gods.GetInternalBoonName("MegaeraBlessingGoldChambers"),
                gods.GetInternalBoonName("MegaeraBlessingCastCount"),
                gods.GetInternalBoonName("MegaeraBlessingElementalBoost"),
                gods.GetInternalBoonName("MegaeraBlessingStackUpgradeBoost"),
                gods.GetInternalBoonName("MegaeraBlessingDuoLegendaryBoost"),
                gods.GetInternalBoonName("MegaeraBlessingDefianceRefill"),
                gods.GetInternalBoonName("MegaeraBlessingRandomHeroicChance"),
                gods.GetInternalBoonName("MegaeraBlessingRegainRerolls"),
				},
			},
		},

		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0216", Text = "A necessary step along your path." },
			},
		},
	},
    StoryExpansionQuestPatroclusUpgrades =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultOlympianQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 500,
		UnlockGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionPatroclusGift02" },
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll =
				{
				gods.GetInternalBoonName("ImprovedTemporaryEmptySlotDamageTrait"),
                gods.GetInternalBoonName("ImprovedTemporaryImprovedExTrait"),
                gods.GetInternalBoonName("ImprovedLimitedSwapTraitDrop"),
                gods.GetInternalBoonName("ImprovedTemporaryMoveSpeedTrait"),
                gods.GetInternalBoonName("ImprovedTemporaryImprovedDefenseTrait"),
                gods.GetInternalBoonName("ImprovedTemporaryDoorHealTrait"),
                gods.GetInternalBoonName("ImprovedLastStandDrop"),
                gods.GetInternalBoonName("ImprovedResourcesDrops"),
                --gods.GetInternalBoonName("ImprovedTemporaryBoonRarityTrait"),
				},
			},
		},

		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0216", Text = "A necessary step along your path." },
			},
		},
	},
    StoryExpansionQuestEurydiceUpgrades =
	{
		InheritFrom = { "DefaultQuestItem", "DefaultOlympianQuest" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 2,
		UnlockGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionEurydiceGift02" },
			},
		},
		CompleteGameStateRequirements =
		{
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll =
				{
                gods.GetInternalBoonName("EurydiceFoodForceZeusTrait"),
                gods.GetInternalBoonName("EurydiceFoodForceHeraTrait"),
                gods.GetInternalBoonName("EurydiceFoodForcePoseidonTrait"),
                gods.GetInternalBoonName("EurydiceFoodForceDemeterTrait"),
                gods.GetInternalBoonName("EurydiceFoodForceHestiaTrait"),
                gods.GetInternalBoonName("EurydiceFoodForceApolloTrait"),
				gods.GetInternalBoonName("EurydiceFoodForceAphroditeTrait"),
                gods.GetInternalBoonName("EurydiceFoodForceHephaestusTrait"),
                gods.GetInternalBoonName("EurydiceFoodForceAresTrait"),
                gods.GetInternalBoonName("EurydiceFoodArtemisBoonTrait"),
                gods.GetInternalBoonName("EurydiceFoodAthenaBoonTrait"),
                gods.GetInternalBoonName("EurydiceFoodDionysusBoonTrait"),
                gods.GetInternalBoonName("EurydiceFoodThanatosBoonTrait"),
                gods.GetInternalBoonName("EurydiceFoodMorePotentPomsTrait"),
                gods.GetInternalBoonName("EurydiceFoodBackstabTrait"),
                gods.GetInternalBoonName("EurydiceFoodDamageForVulnerabilityTrait"),
                gods.GetInternalBoonName("EurydiceFoodCritChanceTrait"),
                gods.GetInternalBoonName("EurydiceFoodChannelSpeedTrait"),
                gods.GetInternalBoonName("EurydiceFoodDamageCapTrait"),
                gods.GetInternalBoonName("EurydiceFoodDiminishingDodgeTrait"),
                gods.GetInternalBoonName("EurydiceFoodMaxHealthTrait"),
                gods.GetInternalBoonName("EurydiceFoodMaxManaTrait"),
                gods.GetInternalBoonName("EurydiceFoodRandomCardDrawTrait"),
                gods.GetInternalBoonName("EurydiceFoodTalentPointsTrait"),
                gods.GetInternalBoonName("EurydiceFoodSorceryChargeTrait"),
                gods.GetInternalBoonName("EurydiceFoodSecretDoorTrait"),
                gods.GetInternalBoonName("EurydiceFoodDuoChanceTrait"),
                gods.GetInternalBoonName("EurydiceFoodLegendaryChanceTrait"),
                gods.GetInternalBoonName("EurydiceFoodEpicChanceTrait"),
                gods.GetInternalBoonName("EurydiceFoodChamberStacksTrait"),
                gods.GetInternalBoonName("EurydiceFoodBonusGoldTrait"),
                gods.GetInternalBoonName("EurydiceFoodBossKudosTrait"),
                gods.GetInternalBoonName("EurydiceFoodRandomElementsTrait"),
				},
			},
		},

		CashedOutVoiceLines =
		{
			{
				PreLineWait = 0.4,
				GameStateRequirements =
				{
					{
					},
				},
				Cooldowns =
				{
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",

				{ Cue = "/VO/Moros_0216", Text = "A necessary step along your path." },
			},
		},
	},
}

if elementalinfusion then
	table.insert(newQuestData.StoryExpansionQuestThanatosUpgrades.CompleteGameStateRequirements[1].HasAll, gods.GetInternalBoonName("ThanatosElementalTrait"))
end
if ZagreusJourney then
	table.insert(newQuestData.StoryExpansionQuestThanatosUpgrades.CompleteGameStateRequirements[1].HasAll, gods.GetInternalBoonName("ThanatosButterflyOnKillTrait"))
end

mod.AddTableKeysSkipDupes(game.QuestData, newQuestData)

game.ConcatTableValuesIPairs(game.QuestOrderData, newQuestOrderData)
