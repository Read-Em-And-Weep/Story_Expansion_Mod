mod.DusaNPCData = {
    NPC_Dusa_Hub_StoryExpansion = {
		Name = "NPC_Dusa_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "566716",
		Offset = {X = -200, Y = 0},
		GazeTarget = {X = -150, Y = 125},
	
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
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingDusaDialogue" },
			}
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
	NPC_Dusa_Frozen_StoryExpansion = {
		Name = "NPC_Dusa_Frozen_StoryExpansion",
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



		Portrait = "StoryExpansion_Dusa_Default",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		InteractTextLineSets = {
        StoryExpansionFreeingDusaDialogue =
			{
				Name = "StoryExpansionFreeingDusaDialogue",
				PlayOnce = true,
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,
				PreEventFunctionName = _PLUGIN.guid .. ".FreeNPCFromChronos",

				{UsePlayerSource = true,
									PreLineWait = 2.8,
					SecretMusicMutedStems = { "Drums" },
																	PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.15, UseChronosSound = false },

					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Head Custodian Dusa, I am Princess Melinoë, but I probably look much older than you remember." },
				{
					Portrait = "StoryExpansion_Dusa_Default",
					Text = "Oh, {#Emph} Ah{#Prev}, Princess Melinoë? You do look much older than I last remember you, and in such a strange place too. Is this a dream or something?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Well it is a dream of a sort. It's a magick dream that I've created to free you after Chronos invaded the House and captured its members." },
{ 
					Portrait = "StoryExpansion_Dusa_Empathetic",
					Text = "Chr-Chronos? In the House of Hades? But the Olympians slew him eons ago! How is it possible that he's risen again? And what has happened to the other members of the House?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I believe it was my brother's sacrificing of Titan's Blood that enabled Chronos to regain his strength. As for the other members of the House, I have rescued all but Nyx and yourself."},
					{ 
					Portrait = "StoryExpansion_Dusa_Empathetic",
																											PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.1, UseChronosSound = false },
					Text = "What is that noise? Is it Chronos? Has he come to capture us again?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Yes, it seems that already Chronos is waking. Come Head Custodian Dusa, let us escape to safety.",
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

for newNPCName, newNPCData in pairs(mod.DusaNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end