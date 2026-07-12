function mod.TryMegaeraSpawn()
	if CurrentRun.UseRecord.NPC_Megaera_Field_StoryExpansion then
		return
	end
	if CurrentRun.CurrentRoom.Name == "G_Intro" then
		if RandomChance(11/50) then --11/50
			return mod.SpawnMegaera()
		end
	end
	if CurrentRun.CurrentRoom.Name == "H_Intro" then
		if RandomChance(11/39) then --11/39
			return mod.SpawnMegaera()
		end
	end
	if CurrentRun.CurrentRoom.Name == "I_Intro" then
		if RandomChance(11/28) then --11/28
			return mod.SpawnMegaera()
		end
	end
	--therefore an overall 66% chance to encounter on an Underworld run
end

--TODO: insert the Incantation to allow you to do this
--"StoryExpansionWorldUpgradeMegInbetweenRegions"
--table.insert(RoomData.G_Intro.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid..".TryMegaeraSpawn", GameStateRequirements ={NamedRequirementsFalse = { "StandardPackageBountyActive", },}})
--table.insert(RoomData.H_Intro.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid..".TryMegaeraSpawn",GameStateRequirements ={NamedRequirementsFalse = { "StandardPackageBountyActive", },}})
--table.insert(RoomData.I_Intro.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid..".TryMegaeraSpawn",GameStateRequirements ={NamedRequirementsFalse = { "StandardPackageBountyActive", },}})


table.insert(RoomData.G_Intro.StartUnthreadedEvents,
{
    FunctionName = _PLUGIN.guid..".BiomeStartFriendlyEncounter", 
    Args = {
        RandomSuccessChance = 11/50,
        SpawnPointId = 410264,
        CharacterOptions = {
            {
                CharacterName = "NPC_Megaera_Field_StoryExpansion",
                Offset = {X=0,Y=0,Z=0},
                GameStateRequirements = {
                    {
                    PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeMegInbetweenRegions" },
                    },
                    {
                        PathFalse = {"CurrentRun", "UseRecord", "NPC_Megaera_Field_StoryExpansion"}
                    },
                }
                Weight = 1
                --TrackHero = false,
                --GazeTarget = {X = 0, Y = 0},
            }
        }
    }
     GameStateRequirements ={
        NamedRequirementsFalse = { "StandardPackageBountyActive", },
        {
			Path = { "CurrentRun", "RunDepthCache" },
			Comparison = ">=",
			Value = 3,
		},
    }
}
)

table.insert(RoomData.H_Intro.StartUnthreadedEvents,
{
    FunctionName = _PLUGIN.guid..".BiomeStartFriendlyEncounter", 
    Args = {
        RandomSuccessChance = 11/39,
        SpawnPointId = 621444,
        CharacterOptions = {
            {
                CharacterName = "NPC_Megaera_Field_StoryExpansion",
                Offset = {X=0,Y=0,Z=0},
                GameStateRequirements = {
                    {
                    PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeMegInbetweenRegions" },
                    },
                    {
                        PathFalse = {"CurrentRun", "UseRecord", "NPC_Megaera_Field_StoryExpansion"}
                    },
                }
                Weight = 1
                --TrackHero = false,
                --GazeTarget = {X = 0, Y = 0},
            }
        }
    }
     GameStateRequirements ={
        NamedRequirementsFalse = { "StandardPackageBountyActive", },
        {
			Path = { "CurrentRun", "RunDepthCache" },
			Comparison = ">=",
			Value = 3,
		},
    }
}
)

table.insert(RoomData.I_Intro.StartUnthreadedEvents,
{
    FunctionName = _PLUGIN.guid..".BiomeStartFriendlyEncounter", 
    Args = {
        RandomSuccessChance = 11/28,
        SpawnPointId = 699326,
        CharacterOptions = {
            {
                CharacterName = "NPC_Megaera_Field_StoryExpansion",
                Offset = {X=0,Y=0,Z=0},
                GameStateRequirements = {
                    {
                    PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeMegInbetweenRegions" },
                    },
                    {
                        PathFalse = {"CurrentRun", "UseRecord", "NPC_Megaera_Field_StoryExpansion"}
                    },
                }
                Weight = 1
                --TrackHero = false,
                --GazeTarget = {X = 0, Y = 0},
            }
        }
    }
    GameStateRequirements ={
        NamedRequirementsFalse = { "StandardPackageBountyActive", },
        {
			Path = { "CurrentRun", "RunDepthCache" },
			Comparison = ">=",
			Value = 3,
		},
    }
}
)