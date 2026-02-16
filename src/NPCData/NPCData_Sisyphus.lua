mod.SisyphusNPCData = {
    NPC_Sisyphus_Field_StoryExpansion = {
		Name = "NPC_Sisyphus_Field_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},


        StoryExpansionMapData = {
            F_Story01 = {
                SpawnId = 557839,
                Offset = {X= 400, Y = 400},
            },
            G_Story01 = {
                SpawnId = 563070,
                Offset = {X= 150, Y= -100}
            },
            H_Bridge01 = {
SpawnId = 617749,
Offset = {X = 980, Y = -450}
},
I_Story01 = {
SpawnId = 506340,
Offset = {X = 350, Y = 100}
},
N_Story01 = {
SpawnId = 560780,
Offset = {X = 150, Y = -20}
},
O_Story01 = {
SpawnId = 691402,
Offset = {X = -300, Y = 150}
},
P_Story01 = {
SpawnId = 744586,
Offset = {X = 175, Y = -85}
},
        },
		SpawnMap = "Hub_Main",
        SpawnId = "586054",
		Offset = {X =140 , Y = 0},
		GazeTarget = {X = 140, Y = 125},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=true,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
  
		    ActivateRequirements =
		{
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},


		Portrait = "Portrait_Dusa_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		InteractTextLineSets = {
        ModdedThanChat01Placeholder =
			{
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
    },

	Binks = {
			--"DusaIdle_Bink",
			--"DusaIdleInhouse_Bink",
			--"DusaIdleInhouseFidgetHairFlick__Bink",
		},
},
}

for newNPCName, newNPCData in pairs(mod.SisyphusNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end