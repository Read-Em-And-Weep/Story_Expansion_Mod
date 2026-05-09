mod.RheaNPCData = {
    NPC_Rhea_01_StoryExpansion = {
        Name = "NPC_Rhea_01_StoryExpansion",
		InheritFrom = {"NPC_Neutral"},
        TrackHero = true,
        SpawnMap = "Hub_Main",
        SpawnId = "558175",
		Offset = {X = 500, Y = 400},
		GazeTarget = {X = 450, Y = 450},
        
        RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,

        OnUsedFunctionName = "UseNPC",

		ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "Placeholder" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "Placeholder" },
			},
		},
		
        Portrait = "Portraits_Rhea_Hooded_01",
		AnimOffsetZ = 30,
		Groups = { "NPCs" },



		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,

InteractTextLineSets = {
    }
},
}

for newNPCName, newNPCData in pairs(mod.RheaNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end