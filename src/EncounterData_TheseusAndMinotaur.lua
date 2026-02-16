--ObjectiveData.StoryExpansionThanatosKills = {Description = "Objective_StoryExpansionThanatosKills", LuaKey = "StoryExpansionThanatosKills", StartingLuaValue = "0"}
--ObjectiveData.StoryExpansionPlayerKills = {Description = "Objective_StoryExpansionPlayerKills", LuaKey = "StoryExpansionPlayerKills", StartingLuaValue = "0"}


--[[ObjectiveSetData["StoryExpansionThanatosChallenge"] = {
    AllowRepeat = true,
		ManualActivationOnly = true,
		OverrideExistingObjective = true,
		Objectives =
		{
			{ "StoryExpansionThanatosKills", "StoryExpansionPlayerKills" },
		},
}]]

EncounterSets.EncounterEventsStoryExpansionTheseusMinotaurCombat = {
		{ FunctionName = _PLUGIN.guid .. ".HandleNaturalTheseusMinotaurSpawn" },
        {FunctionName = _PLUGIN.guid.. "TheseusMinotaurAngleToHero"},
		{ FunctionName = "EncounterAudio" },
		{ FunctionName = "BeginHeraclesEncounter" },
		{ FunctionName = "HandleEnemySpawns" },
		{ FunctionName = "CheckForAllEnemiesDead" },
		{ FunctionName = "PostCombatAudio" },
		{ FunctionName = "SpawnRoomReward" },
}


OverwriteTableKeys(EncounterData, 
{
    BaseTheseusMinotaurStoryExpansionCombat = {
        		--RequiredKillFunctionName = _PLUGIN.guid .. ".TrackThanatosChallengeProgress",
		--ObjectiveSets = "StoryExpansionThanatosChallenge",

		GameStateRequirements =
		{
			-- rule 1: have x or fewer of these encounters
			--[[{
				Path = { "CurrentRun", "EncountersCompletedCache" },
				SumOf = { "HeraclesCombatIntro", "HeraclesCombatN", "HeraclesCombatN2", "HeraclesCombatO", "HeraclesCombatO2", "HeraclesCombatP", "HeraclesCombatP2" },
				Comparison = "<=",
				Value = 0,
			},
			{
				PathTrue = { "GameState", "EncountersCompletedCache", "HeraclesCombatIntro" },
			},]]
            {
				PathFalse = { "CurrentRun", "UseRecord", "NPC_Theseus_Field_01_StoryExpansion" },
			},
            {
				PathFalse = { "CurrentRun", "UseRecord", "NPC_Minotaur_Field_01_StoryExpansion" },
			},
		    {
				Path = { "CurrentRun", "BiomeDepthCache" },
				Comparison = ">=",
				Value = 2,
			},
			--NamedRequirements = { "NoRecentFieldNPCEncounter" },
			NamedRequirementsFalse = { "StandardPackageBountyActive","HecateMissing" },
		},

		RequireNotRoomReward = { "Devotion" },

		BlockAthenaEncounterKeepsake = true,
		BlockDionysusEncounterKeepsake = true,
        StoryExpansionBlockAllySummonKeepsake = true,

		BlockCodexBeforeStart = true,
		BlockLocationText = true,
		DelayedStart = true,
		-- SkipCombatBeginsVoiceLines = true,
		RequireCompletedIntro = true,
		PreSpawnEnemies = false,
		BlockHighlightEliteTypes = true,

		MuteSecretMusicDrumsOnCombatOver = true,
		NextRoomResumeMusic = true,

		UnthreadedEvents = EncounterSets.EncounterEventsStoryExpansionTheseusMinotaurCombat,
		Using = { "NPC_Athena_01" },

		WaveStartUnthreadedEvents = {}, -- Excluding OlympusEagleSpawn from Athena encounters
    }
})

mod.TheseusMinotaurEncounters = {
    TheseusMinotaurStoryExpansionCombatF = {
        Name = "TheseusMinotaurStoryExpansionCombatF",
        		InheritFrom = { "BaseTheseusMinotaurStoryExpansionCombat", "GeneratedF" },
		CanEncounterSkip = false,

		PauseDurationAfterPriorityGroup = 0.0, 
    },
    TheseusMinotaurStoryExpansionCombatF2 = {
        Name = "TheseusMinotaurStoryExpansionCombatF2",
        		InheritFrom = { "BaseTheseusMinotaurStoryExpansionCombat", "GeneratedF" },
		CanEncounterSkip = false,
        		GameStateRequirements =
		{
			Append = true,
			{
				SumPrevRuns = 4,
				Path = { "SpawnRecord", "NPC_Theseus_Field_01_StoryExpansion" },
				Comparison = "<=",
				Value = 0,
			},
			{
				PathFalse = { "PrevRun", "SpecialInteractRecord", "Shrine" },
			}
		},

		PauseDurationAfterPriorityGroup = 0.0, 
    },
    TheseusMinotaurStoryExpansionCombatG = {
                Name = "TheseusMinotaurStoryExpansionCombatG",

        		InheritFrom = { "BaseTheseusMinotaurStoryExpansionCombat", "GeneratedG" },
		CanEncounterSkip = false,

		PauseDurationAfterPriorityGroup = 0.0, 
    },
    TheseusMinotaurStoryExpansionCombatG2 = {
                Name = "TheseusMinotaurStoryExpansionCombatG2",

        		InheritFrom = { "BaseTheseusMinotaurStoryExpansionCombat", "GeneratedG" },
		CanEncounterSkip = false,
        GameStateRequirements =
		{
			Append = true,
			{
				SumPrevRuns = 4,
				Path = { "SpawnRecord", "NPC_Theseus_Field_01_StoryExpansion" },
				Comparison = "<=",
				Value = 0,
			},
			{
				PathFalse = { "PrevRun", "SpecialInteractRecord", "Shrine" },
			}
		},

		PauseDurationAfterPriorityGroup = 0.0, 
    },
}

for encounterName, encounterData in pairs(mod.TheseusMinotaurEncounters) do
    game.ProcessDataInheritance(encounterData, game.EncounterData)
    game.EncounterData[encounterName] = encounterData
end




--[[table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF")
table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF")
table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF2")
table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF2")
table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF2")
table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF2")
table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF2")
table.insert(EncounterSets.FEncountersDefault, "TheseusMinotaurStoryExpansionCombatF2")

table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG")
table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG")
table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG2")
table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG2")
table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG2")
table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG2")
table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG2")
table.insert(EncounterSets.GEncountersDefault, "TheseusMinotaurStoryExpansionCombatG2")]]


mod.AddEncounterToEncounterSet("TheseusMinotaurStoryExpansionCombatF", mod.FCombatRooms, 2)
mod.AddEncounterToEncounterSet("TheseusMinotaurStoryExpansionCombatF2", mod.FCombatRooms, 4)
mod.AddEncounterToEncounterSet("TheseusMinotaurStoryExpansionCombatG", mod.GCombatRooms, 2)
mod.AddEncounterToEncounterSet("TheseusMinotaurStoryExpansionCombatG2", mod.GCombatRooms, 4)


table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "TheseusMinotaurStoryExpansionCombatF")
table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "TheseusMinotaurStoryExpansionCombatF2")
table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "TheseusMinotaurStoryExpansionCombatG")
table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "TheseusMinotaurStoryExpansionCombatG2")