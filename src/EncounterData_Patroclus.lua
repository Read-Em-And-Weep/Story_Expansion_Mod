OverwriteTableKeys( EncounterData,
{
	PatroclusStoryExpansionRandomEvent =
	{
        Name = "PatroclusStoryExpansionRandomEvent",
        InheritFrom = { "NonCombat" },

		DisableTraps = true,
		NextRoomResumeMusic = true,
		BlockMaxBonusRewards = true,


		GameStateRequirements =
		{
			{
			Path = { "GameState", "RoomsEntered", "I_Boss01" },
			Comparison = ">=",
			Value = 1,
			},
			{
				PathFalse = {"CurrentRun", "RoomsEntered", "I_Boss01"},
			},
			NamedRequirementsFalse = { "StandardPackageBountyActive", "HecateMissing",  },
		},

		RequireNotRoomReward = { "Boon", "SpellDrop", "Devotion", "HermesUpgrade", "WeaponUpgrade", "StackUpgrade", "TalentDrop", "Story" },

		MaxAppearancesThisBiome = 1,
		UnthreadedEvents = {},
		StartRoomUnthreadedEvents =
		{
			{
				FunctionName = "SimulateCombatDestruction",
				Args =
				{
					DecalNames = { "BloodSplatGroundRandom", },
					DecalsMin = 50,
					DecalsMax = 100,
					DecalRadius = 30,
					DestroyBreakablesMin = 5,
					DestroyBreakablesMax = 10,
				},
			},
			{
				FunctionName = _PLUGIN.guid ..".SpawnPatroclusForRandomEvents",
				Args =
				{
					PreferredSpawnPointGroup = "BonusRewardSpawnPoints",
					PreferredSpawnPoint = "LootPoint",
					CheckRewardPointsUsed = true,
				}
			},
					{ FunctionName = "SpawnRoomReward" },
		},
		RequireMinPlayerDistance = 300,

		SetupEvents =
		{
			{
				FunctionName = "EraseRoomKeys",
				Args =
				{
					EraseKeys =
					{
						"FishingPointSuccess",
						"ExorcismPointSuccess",
					},
				},
			},
		},
	},
})

mod.AddEncounterToEncounterSet("PatroclusStoryExpansionRandomEvent", mod.ICombatRooms, 4)





table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "PatroclusStoryExpansionRandomEvent")