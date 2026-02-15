mod.OrpheusNPCData = {
    NPC_Orpheus_Hub_StoryExpansion = {
		Name = "NPC_Orpheus_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "591114",
		Offset = {X = 600, Y = -100},
		GazeTarget = {X = 620, Y = -75},
        
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
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingOrpheusDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},


		Portrait = "Portrait_Orpheus_Default_01",
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
			--"OrpheusIdle_Bink",
			--"OrpheusIdleInhouse_Bink",
			--"OrpheusIdleInhouseFidgetHairFlick__Bink",
		},
		
	},
	NPC_Orpheus_Frozen_StoryExpansion = {
		Name = "NPC_Orpheus_Frozen_StoryExpansion",
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



		Portrait = "StoryExpansion_Orpheus_Default",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		InteractTextLineSets = {
        StoryExpansionFreeingOrpheusDialogue =
			{
				Name = "StoryExpansionFreeingOrpheusDialogue",
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
					Portrait = "StoryExpansion_Orpheus_Default",
																	PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.15, UseChronosSound = false },
					Text = "{#Emph} Ah...! {#Prev} What is going on? What is this {#Emph} marvelous {#Prev} place? And {#Emph} who {#Prev} are you?" },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Court Musician Orpheus! I am Melinoë, daughter of Lord Hades and rightful princess of the Underworld. I am here to free you from the grasp of Chronos after he captured all the members of the House." },
				{
					Portrait = "StoryExpansion_Orpheus_Default",
					Text = "Melinoë? I wrote a ballad for your birth only a few months ago. There is no way that you've grown so much in so little time." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Default_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Unfortunately it is possible when you have been trapped in Time by the Titan for all these years. I have been fighting to free the members of the House for my whole life and I apologise for not being able to rescue you sooner." },
{ 
					Portrait = "StoryExpansion_Orpheus_Default",
					Text = "Has anyone ever told you that you have your mother's chin, as well as the same light in your eyes? You have your father's determination too." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "{#Emph} I... {#Prev} No-one has ever told me that. I never knew that. Thank you, Orpheus; I can't explain how much knowing that means to me."},
					{ 
					Portrait = "StoryExpansion_Orpheus_Default",
					Text = "And there's your brother's smile plain upon your face. Melinoë, thank you for saving me from Chronos. My fate is entirely in your hands." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Default_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
																						PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 1.5, UseChronosSound = false },
					Text = "Well in that case, it might be a good idea for us to escape. Already Chronos is waking. Come, return to the Crossroads with me to reunite with those who I have already rescued."},
					
					{ 
					Portrait = "StoryExpansion_Orpheus_Default",
					Text = "Take me away, goddess, to a place where we may be safe from the terrible Titan who assaulted our home.",
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

for newNPCName, newNPCData in pairs(mod.OrpheusNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end