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

EncounterSets.EncounterEventsStoryExpansionThanatosCombat = {
		{ FunctionName = _PLUGIN.guid .. ".BeginThanatosEncounter" },

		
        { FunctionName = "HandleEnemySpawns" },
		{ FunctionName = "CheckForAllEnemiesDead" },
		{ FunctionName = "PostCombatAudio" },
		{ FunctionName = "SpawnRoomReward" },
}


OverwriteTableKeys(EncounterData, 
{
    BaseThanatosStoryExpansionCombat = {
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
				PathFalse = { "CurrentRun", "UseRecord", "NPC_Thanatos_Field_StoryExpansion" },
			},
			--[[{
				Path = { "CurrentRun", "BiomeDepthCache" },
				Comparison = ">=",
				Value = 4,
			},]]
            {
				PathFalse = { "CurrentRun", "ExpiredKeepsakes", gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake") },
			},
			NamedRequirements = { "NoRecentFieldNPCEncounter" },
			NamedRequirementsFalse = { "StandardPackageBountyActive","HecateMissing" },
		},

		RequireNotRoomReward = { "Devotion" },

		BlockAthenaEncounterKeepsake = true,
		BlockDionysusEncounterKeepsake = true,
		ExpireTrait =  gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake"),

		BlockCodexBeforeStart = true,
		BlockLocationText = true,
		DelayedStart = true,
		-- SkipCombatBeginsVoiceLines = true,
		RequireCompletedIntro = true,
		PreSpawnEnemies = false,
		BlockHighlightEliteTypes = true,

		MuteSecretMusicDrumsOnCombatOver = true,
		NextRoomResumeMusic = true,

		UnthreadedEvents = EncounterSets.EncounterEventsStoryExpansionThanatosCombat,
		Using = { "NPC_Athena_01" },

		WaveStartUnthreadedEvents = {}, -- Excluding OlympusEagleSpawn from Athena encounters

		ThreadedEvents =
		{
			{
				FunctionName = _PLUGIN.guid..".HandleThanatosSpawn",
				Args = { Force = true },
			},
		},
    }
})

mod.ThanatosEncounters = {
    ThanatosStoryExpansionCombatN = {
        Name = "ThanatosStoryExpansionCombatN",
        		InheritFrom = { "BaseThanatosStoryExpansionCombat", "GeneratedN" },
		CanEncounterSkip = false,

		PauseDurationAfterPriorityGroup = 0.0, 
    },
    ThanatosStoryExpansionCombatO = {
                Name = "ThanatosStoryExpansionCombatO",

        		InheritFrom = { "BaseThanatosStoryExpansionCombat", "GeneratedO" },
		CanEncounterSkip = false,

		PauseDurationAfterPriorityGroup = 0.0, 
    },
    ThanatosStoryExpansionCombatP = {
                Name = "ThanatosStoryExpansionCombatP",
        		InheritFrom = { "BaseThanatosStoryExpansionCombat", "GeneratedP" },
		CanEncounterSkip = false,

		PauseDurationAfterPriorityGroup = 0.0, 
    },
    ThanatosStoryExpansionCombatQ = {
                Name = "ThanatosStoryExpansionCombatQ",
        		InheritFrom = { "BaseThanatosStoryExpansionCombat", "GeneratedQ" },
		CanEncounterSkip = false,

		PauseDurationAfterPriorityGroup = 0.0, 
    }
}

for encounterName, encounterData in pairs(mod.ThanatosEncounters) do
    game.ProcessDataInheritance(encounterData, game.EncounterData)
    game.EncounterData[encounterName] = encounterData
end

mod.AddEncounterToEncounterSet("ThanatosStoryExpansionCombatN", mod.NCombatRooms, 3)
mod.AddEncounterToEncounterSet("ThanatosStoryExpansionCombatO", mod.OCombatRooms, 3)
mod.AddEncounterToEncounterSet("ThanatosStoryExpansionCombatP", mod.PCombatRooms, 3)
mod.AddEncounterToEncounterSet("ThanatosStoryExpansionCombatQ", mod.QCombatRooms, 3)

table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "ThanatosStoryExpansionCombatN")
table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "ThanatosStoryExpansionCombatO")
table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "ThanatosStoryExpansionCombatP")
table.insert(NamedRequirementsData.NoRecentFieldNPCEncounter[1].TableValuesToCount, "ThanatosStoryExpansionCombatQ")