mod.AchillesNPCData = {
    NPC_Achilles_Hub_StoryExpansion = {
		Name = "NPC_Achilles_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "586054",
		Offset = {X = -200, Y = 150},
		GazeTarget = {X = -455, Y = 555},
	
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
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingAchillesDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},

		Portrait = "Portrait_Achilles_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        LoadPackages = { "Achilles", "BiomeIHouse"},

		InteractTextLineSets = {
        ModdedThanChat01Placeholder =
			{
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
    },	
	},
	NPC_Achilles_Frozen_StoryExpansion = {
		Name = "NPC_Achilles_Frozen_StoryExpansion",
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



		Portrait = "Portrait_Achilles_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        LoadPackages = { "Achilles", "BiomeIHouse"},

		InteractTextLineSets = {
        StoryExpansionFreeingAchillesDialogue =
			{
				Name = "StoryExpansionFreeingAchillesDialogue",
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
					Portrait = "Portrait_Achilles_Default_01",
																	PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.15, UseChronosSound = false },
					Text = "{#Emph} Ugh... I... {#Prev} What happened...?" },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Sir Achilles, I am Melinoë, daughter of Hades. I have come to rescue you, as I already have for other members of the House, from the grasp of Chronos." },
				{ 
					Portrait = "Portrait_Achilles_Default_01",
					Text = "Melinoë? You were just a babe the last time I saw you! How long has it been? What happened?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "It's been a long time, longer than I'd like to admit to be honest. Even with the forces of Olympus behind us, what remains of the Chthonic gods have been unable to truly lead an assault on the House until I came of age." },
{ 
					Portrait = "Portrait_Achilles_Default_01",
					Text = "Lass, I'm sure you did the best you could, as everyone else did. When gods go to war, very little remains in your control. To be able to free me already shows your incredible talent." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
																						PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 1.5, UseChronosSound = false },
					Text = "You flatter me, Sir Achilles. But for now, I have reached the extent of my talent. We should escape before Chronos reawakens and captures you once more."},
					{ 
					Portrait = "Portrait_Achilles_Default_01",
					Text = "If we have exhausted your strength, then there is no way we can make a stand now. Let us abscond to retreat and recuperate. At your leave, Princess.",
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
}
}

for newNPCName, newNPCData in pairs(mod.AchillesNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end