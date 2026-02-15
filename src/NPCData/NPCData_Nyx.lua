mod.NyxNPCData = {
    NPC_Nyx_Hub_StoryExpansion = {
		Name = "NPC_Nyx_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "558175",
		Offset = {X = -250, Y = -230},
		GazeTarget = {X = -230, Y = -150},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
  
		    ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingNyxDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},

		Portrait = "Portrait_Nyx_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        LoadPackages = { "Nyx", },

		InteractTextLineSets = {
        ModdedThanChat01Placeholder =
			{
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
    },	
	},
	NPC_Nyx_Frozen_StoryExpansion = {
		Name = "NPC_Nyx_Frozen_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
  
        ActivateRequirements =
		{

		},



		Portrait = "Portrait_Nyx_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },
		        LoadPackages = { "Nyx", },


		InteractTextLineSets = {
        StoryExpansionFreeingNyxDialogue =
			{
				Name = "StoryExpansionFreeingNyxDialogue",
				PlayOnce = true,
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,
				PreEventFunctionName = _PLUGIN.guid .. ".FreeNPCFromChronos",

				{ 
					PreLineWait = 2.8,
					SecretMusicMutedStems = { "Drums" },
					Portrait = "Portrait_Nyx_Default_01",
					PreLineAnim = "Nyx_Greeting",
																	PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.15, UseChronosSound = false },
					Text = "Melinoë, it is excellent to finally meet you. You should be proud of all that you have accomplished." },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "You know who I am, O Night? And of what I have struggled against and done?" },
				{
					Portrait = "Portrait_Nyx_Default_01",
					Text = "Though I have been trapped in Time by the Titan, much of my power has remained with the Unseen, aiding you. You have carried my strength through your incantations, the Nocturnal Arms, and the Oath of the Unseen." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkTalking01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Then you deserve a much greater thanks than I am currently able to give. I would have accomplished nothing without your aid." },
{ 
					Portrait = "Portrait_Nyx_Default_01",
					Text = "My aid would be for naught without your talent, training and determination. Now, however, I suggest we return to the Crossroads. I have many ideas for incantations to solve our problems I wish to discuss with Hecate." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Thank you for lending me you power. I know Hecate is eager to reunite with you once more, and it will be one step closer to dealing with Chronos for good.",
				PostLineThreadedFunctionName = "KillHero",
					PostLineFunctionArgs = { WaitTime = 5, MusicEndTime = 60 },},
EndVoiceLines = {
	{
						PreLineWait = 0.35,
						UsePlayerSource = true,
{ Cue = "/VO/Melinoe_1629", Text = "See you in the Crossroads." },
					},
				
}


				}
	}
},
}

for newNPCName, newNPCData in pairs(mod.NyxNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end