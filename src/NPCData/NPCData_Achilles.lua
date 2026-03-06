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
        StoryExpansion_AchillesChat01 = {
				Name = "StoryExpansion_AchillesChat01",
				UseableOffSource = true,
				{
					Text = "I've not the faintest doubt you can do this."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat02 = {
				Name = "StoryExpansion_AchillesChat02",
				UseableOffSource = true,
				{
					Text = "When faced with danger, remember your training and stay calm. Losing yourself to anger does no good, lass."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat03 = {
				Name = "StoryExpansion_AchillesChat03",
				UseableOffSource = true,
				{
					Text = "Go forth, lass, and do what you must."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_AchillesChat04 = {
				Name = "StoryExpansion_AchillesChat04",
				UseableOffSource = true,
				{
					Text = "What's it going to be this time, Your Royal Majesty?"
				},
			},
			StoryExpansion_AchillesChat05 = {
				Name = "StoryExpansion_AchillesChat05",
				UseableOffSource = true,
				{
					Text = "I'll be keeping an eye on things here while you're gone. Should take some stress off your mind, eh lass?"
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat06 = {
				Name = "StoryExpansion_AchillesChat06",
				UseableOffSource = true,
				{
					Text = "Not much point tarrying on longer than you must, lass. I know you have places to be."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_AchillesChat07 = {
				Name = "StoryExpansion_AchillesChat07",
				UseableOffSource = true,
				{
					Text = "I'd teach you something if I could, lass, but I have little experience in using magick."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat08 = {
				Name = "StoryExpansion_AchillesChat08",
				UseableOffSource = true,
				{
					Text = "Fight as though you've but one life to live. Were you not a child of Hades, that might well be true."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat09 = {
				Name = "StoryExpansion_AchillesChat09",
				UseableOffSource = true,
				{
					Text = "Experience is the greatest teacher, lass."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_AchillesChat10= {
				Name = "StoryExpansion_AchillesChat10",
				UseableOffSource = true,
				{
					Text = "Get back out and finish what you started, lass."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat11= {
				Name = "StoryExpansion_AchillesChat11",
				UseableOffSource = true,
				{
					Text = "Mistakes are opportunities for learning, lass. Be glad you get the chance to grow from them."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat12= {
				Name = "StoryExpansion_AchillesChat11",
				UseableOffSource = true,
				{
					Text = "I have your back. No matter what."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat13= {
				Name = "StoryExpansion_AchillesChat13",
				UseableOffSource = true,
				{
					Text = "Ready yourself, lass, and give it another attempt."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat14= {
				Name = "StoryExpansion_AchillesChat14",
				UseableOffSource = true,
				{
					Text = "There's nothing you cannot achieve. I'm sure of it."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat15= {
				Name = "StoryExpansion_AchillesChat15",
				UseableOffSource = true,
				{
					Text = "Do not throw away your life as I did mine, lass. We rarely get a second chance."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat16= {
				Name = "StoryExpansion_AchillesChat16",
				UseableOffSource = true,
				{
					Text = "You have this, lass. The Fates be damned."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat17 = {
				Name = "StoryExpansion_AchillesChat17",
				UseableOffSource = true,
				{
					Text = "You have a good heart, lass. Keep listening to it."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_AchillesChat18 = {
				Name = "StoryExpansion_AchillesChat18",
				UseableOffSource = true,
				{
					Text = "I've decided not to join Patroclus this night, lass. He has his duty in clearing out Tartarus, while I have a duty here."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_AchillesChat19 = {
				Name = "StoryExpansion_AchillesChat19",
				UseableOffSource = true,
				{
					Text = "Patroclus tells me you've been enjoying his pilfered goods, lass. He's always been good at finding the little joys in tragedy."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_AchillesChat20 = {
				Name = "StoryExpansion_AchillesChat20",
				UseableOffSource = true,
				{
					Text = "I think I might sneak out from my post tonight to top up Patroclus's supplies. Though seeing him is my real goal, lass."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_AchillesChat21 = {
				Name = "StoryExpansion_AchillesChat21",
				UseableOffSource = true,
				{
					Text = "My oath binds me in defense to the House of Hades. Regardless of whether you make your home here or there, lass, I am here to guard you."
				},
				GameStateRequirements = {
					{
					},
				},
			},
			StoryExpansion_AchillesChat22 = {
				Name = "StoryExpansion_AchillesChat22",
				UseableOffSource = true,
				{
					Text = "I tended to use swords and spears while I was alive. Unfortunately, lass, I cannot provide advice for your arms."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat23 = {
				Name = "StoryExpansion_AchillesChat23",
				UseableOffSource = true,
				{
					Text = "Go forth, lass, and conquer. May the Muses sing of your fury."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat24 = {
				Name = "StoryExpansion_AchillesChat24",
				UseableOffSource = true,
				{
					Text = "Look out for Patroclus for me, would you lass? I can't handle losing him again."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_AchillesChat25 = {
				Name = "StoryExpansion_AchillesChat25",
				UseableOffSource = true,
				{
					Text = "If you can, lass, convince Patroclus to return to the Crossroads. We have no place in fighting wars meant for gods."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_AchillesChat26 = {
				Name = "StoryExpansion_AchillesChat26",
				UseableOffSource = true,
				{
					Text = "Hit hard and fast, lass."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat27 = {
				Name = "StoryExpansion_AchillesChat27",
				UseableOffSource = true,
				{
					Text = "May you have my swiftness to dodge your enemies."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_AchillesChat28 = {
				Name = "StoryExpansion_AchillesChat28",
				UseableOffSource = true,
				{
					Text = "May Nike grant you victory on your next pillaging, lass."
				},
				GameStateRequirements = {

				},
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