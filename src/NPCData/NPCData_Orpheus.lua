mod.OrpheusNPCData = {
    NPC_Orpheus_Hub_StoryExpansion = {
		Name = "NPC_Orpheus_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral", "NPC_Giftable"},

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
        CanReceiveGift = true,
		
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


		Portrait = "StoryExpansion_Orpheus_Default",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },
		GiftTextLineSets = {
			StoryExpansion_OrpheusGift01 = {
				Name = "StoryExpansion_OrpheusGift01",
				PlayOnce = true,
				OnGiftTrack = true,
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "UseRecord", "NPC_Orpheus_Hub_StoryExpansion" },
					},
				},
				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Musician Orpheus! Here, take this Nectar as a token of my deep appreciation for your service to the House of Hades." },
				{ 
					Text = "It is you who should be thanked for saving us from the Titan. Such kindness cannot go unanswered. May this gift serve you well." },
			},
			StoryExpansion_OrpheusGift02 = {
				Name = "StoryExpansion_OrpheusGift02",
				PlayOnce = true,
				OnGiftTrack = true,
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusGift01" },
					},
				},
								{ 
					Text = "This is amazing, my friend. Is this truly meant for me? You are ever so kind, Melinoe." },

				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Of course it’s for you, Orpheus! For all the warmth and joy you bring the shades of the Crossroads." },
			},
			StoryExpansion_OrpheusGift03 = {
				Name = "StoryExpansion_OrpheusGift03",
				PlayOnce = true,
				OnGiftTrack = true,
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusGift02" },
					},
				},
				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Here's another Nectar, Orpheus. I wanted to thank you for all of your encouragement." },
				{ 
					Text = "My gratitude is yours for thinking of me once again, Melinoë. I’m very obliged for such a genuine and thankful gesture." },
			},
			StoryExpansion_OrpheusGift04 = {
				Name = "StoryExpansion_OrpheusGift04",
				PlayOnce = true,
				OnGiftTrack = true,
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusGift03" },
					},
				},
								{ 
					Text = "You’re very much like your brother, you know. He too often offered gifts of Nectar purely out of the kindness of his heart." },

				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "It’s a way for me to show my appreciation. I’m sure he thought you deserved it as much as I do." },
			},
			StoryExpansion_OrpheusTaverna01 =
			{
				Name = "StoryExpansion_OrpheusTaverna01",
				PlayOnce = true,
				OnGiftTrack = true,
				UseableOffSource = true,
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				HintId = "Codex_TavernaGiftHint",
				LockedHintId = "Codex_LockedActivityHint",
				Cost =
				{
					SuperGiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusGift04" },
					},
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" },
					},
					{
						PathFalse = { "CurrentRun", "TimePassageOccurred" },
						HintId = "Codex_TimePassesGiftUsed",
					},
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeMusicPlayer" },
					}
				},
				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Would you accompany me to the Taverna, Musician Orpheus, so that we can share this bottle of Ambrosia properly?" },

				{ 
					PostLineRemoveContextArt = true,
					Portrait = "StoryExpansion_Orpheus_Default",
					PortraitExitAnimation = "StoryExpansion_Orpheus_Default_Exit",
					Text = "{#Emph}Oh{#Prev}, I, certainly, ...why, I don't see why not. I mean, it's not as though I've got something to do other than that." },

				{
					SkipContextArt = true,
					PreLineFunctionName = "TavernaStartPresentation",
					PreLineWait = 0.35,
					Text = "That Music Maker you summoned is excellent. The technique and ability to transition between styles so seamlessly… it is beautiful." },

				{  UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Do you feel inspired by them? I could always approach them and ask whether they would be willing to perform a duet with you. I’m sure the Crossroads would love to hear a piece by both of you." },

				{ 
					SkipContextArt = true,
					PreLineWait = 0.35,
					Text = "...Would that I felt up to it, my friend. Maybe another day… but perhaps we could talk about something else in the meantime." },

				{ UsePlayerSource = true,
					SkipContextArt = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					PreLineWait = 0.35,
					Text = "I must ask, where does your talent in music come from? I’ll admit that I can sing, but my skills with the lyre leave much to be desired." },

				{ 
					SkipContextArt = true,
					Text = "It was all happenstance, believe it or not. I met Lord Apollo in my youth, when he gave me my lyre and took me under his wing. From there, I earned my talent with hard work and continuous effort." },

				{ UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "That’s incredible, Orpheus! I never knew you had such a rich history with your music. I just assumed that you were born with your skill." },

				{ 
					SkipContextArt = true,
					Text = "Of course not, my friend. The struggle to improve is what makes someone a true artist. It is what drives us to perform. What drives you, Melinoë?" },
								{ UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					PreLineWait = 0.35,
					Text = "…I used to think it was to restore my family’s throne and return with them to live in the Underworld afterwards, but it’s not working out how I planned. I feel a bit lost, to be honest." },
									{ 
					SkipContextArt = true,
					Text = "I would not have gone far without the aid of my muse. Even the songs she had no hand in, I wrote from my feelings for her. She gave me a sense of purpose and belonging. Perhaps you need to find a similar home to anchor you." },
								{ UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Default_01",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
										PostLineThreadedFunctionName = "LoungeRevelryPresentation",
					PostLineFunctionArgs = { Sound2 = "/EmptyCue", Sound3 = "/EmptyCue", TimeTicks = 20 },
					PreLineWait = 0.35,
					Text = " …I shall think on it. Though Orpheus, let us not brood on these depressing matters, and instead celebrate this night and atmosphere. Here’s to us!" },

				{
					PreLineFunctionName = "TavernaEndPresentation",
					PreLineWait = 0.35,

					PostLineThreadedFunctionName = "InCombatTextEvent",
					PostLineThreadedFunctionArgs = GameData.PostTavernaArgs,

					Text = "Thank you, Melinoë. I very much enjoyed your company, and the drink. Shall we do this again at some opportunity?" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.36,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_0769", Text = "Of course." },
					},
				},

			},
		},
		InteractTextLineSets = {
        StoryExpansion_OrpheusUnlocksEurydice01 =
			{
				Name = "StoryExpansion_OrpheusUnlocksEurydice01",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
				},
				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Musician Orpheus... I can't help but notice that you haven't been playing much music lately. Is there something bothering you?" },
				{ 
					Text = "...Observant as always, my friend. Everytime I go to play something, I can't help but worry about my muse." },
									{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I'm afraid I haven't met this muse of yours. Why do you worry about them so?" },
								{ 
					Text = "My love, Eurydice, was at her home when the Titan struck. I've asked around, but no-one has heard anything about her or any other shade from Asphodel." },
									{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I've not run into her during my explorations of the Underworld either. I wonder if there is a way for us to find her." },
													{ 
					Text = "If you work one out, please let me know. It would set my mind at ease, and perhaps I could focus on my music once more." },
			},
			StoryExpansion_OrpheusUnlocksEurydice02 =
			{
				Name = "StoryExpansion_OrpheusUnlocksEurydice02",
				PlayOnce = true,
				UseableOffSource = true,

				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice01" },
					},
					{
						PathFalse = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice", }
					},
				},
				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Orpheus, I've been thinking about how we could find you muse. I know of an incantation that would send out a beacon of sorts to Eurydice, telling her she's welcome in the Crossroads." },
				{ 
					Text = "Truly? That sounds wonderful, Melinoë. You would have my eternal thanks for reuniting us." },
									{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I must warn you though, Orpheus, that I cannot guarantee she will take up the invitation. If she was captured, or otherwise incapacitated... are you sure you still want me to try this?" },
								{ 
																							PostLineThreadedFunctionName = "DisplayInfoToast",
					PostLineFunctionArgs = { Duration = 2, Title = "WorldUpgradeAdded", Text = "StoryExpansionWorldUpgradeUnlockEurydice" },

					Text = "I once left Eurydice behind by looking back. I cannot help constantly looking for her; it is in my very nature. When we reunited, I promised to always put my faith in her. Let me make good on that promise Melinoë, and trust she will find her way back to me." },
			EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_0153", Text = "Let's try it." },
					},
				},
			},
			StoryExpansion_EurydiceInteractWithOrpheus01 = {
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
					{
						Path = { "GameState", "TextLinesRecord"},
						HasNone = {"StoryExpansion_EurydiceInteractWithOrpheus01_B", "StoryExpansion_EurydiceInteractWithOrpheus01_C" },
					},
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice02"}
					},
				},
				Name = "StoryExpansion_EurydiceInteractWithOrpheus01",
				Partner = "NPC_Eurydice_Hub_StoryExpansion",
				PlayOnce = true,
				UseableOffSource = true,
				UseText = "UseListenNPC",
				BlockDistanceTriggers = true,
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
			},
			StoryExpansion_EurydiceInteractWithOrpheus01_B = {
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
					{
						Path = { "GameState", "TextLinesRecord"},
						HasNone = {"StoryExpansion_EurydiceInteractWithOrpheus01", "StoryExpansion_EurydiceInteractWithOrpheus01_C" },
					},
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice02"}
					},
				},
				Name = "StoryExpansion_EurydiceInteractWithOrpheus01_B",
				Partner = "NPC_Eurydice_Hub_StoryExpansion",
				PlayOnce = true,
				UseableOffSource = true,
				UseText = "UseListenNPC",
				BlockDistanceTriggers = true,
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
			},
			StoryExpansion_EurydiceInteractWithOrpheus01_C = {
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
					{
						Path = { "GameState", "TextLinesRecord"},
						HasNone = {"StoryExpansion_EurydiceInteractWithOrpheus01", "StoryExpansion_EurydiceInteractWithOrpheus01_B" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice02"}
					},
				},
				Name = "StoryExpansion_EurydiceInteractWithOrpheus01_C",
				Partner = "NPC_Eurydice_Hub_StoryExpansion",
				PlayOnce = true,
				UseableOffSource = true,
				UseText = "UseListenNPC",
				BlockDistanceTriggers = true,
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
			},
			StoryExpansion_OrpheusChat01 = {
				Name = "StoryExpansion_OrpheusChat01",
				UseableOffSource = true,
				{
					Text = "The music is lovely tonight, don't you think?"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeMusicPlayer" },
					}
				},
			},
			StoryExpansion_OrpheusChat02 = {
				Name = "StoryExpansion_OrpheusChat02",
				UseableOffSource = true,
				{
					Text = "My muse tells me you have quite an appetite, Melinoë. Though knowing the quality of her cooking, who could blame you?"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					}
				},
			},
			StoryExpansion_OrpheusChat03 = {
				Name = "StoryExpansion_OrpheusChat03",
				UseableOffSource = true,
				{
					Text = "The music of the night really makes you stop and think, does it not, my friend."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeMusicPlayer" },
					}
				},
			},
			StoryExpansion_OrpheusChat04 = {
				Name = "StoryExpansion_OrpheusChat04",
				UseableOffSource = true,
				{
					Text = "I was just thinking of you, Melinoë."
				},
			},
			StoryExpansion_OrpheusChat05 = {
				Name = "StoryExpansion_OrpheusChat05",
				UseableOffSource = true,
				{
					Text = "My greetings to my very dearest friend."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusTaverna02" },
					}
				},
			},
			StoryExpansion_OrpheusChat06 = {
				Name = "StoryExpansion_OrpheusChat06",
				UseableOffSource = true,
				{
					Text = "I do not have the time to talk now, my friend, for I have just come into a splash of inspiration and must create before the urge leaves me."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat07 = {
				Name = "StoryExpansion_OrpheusChat07",
				UseableOffSource = true,
				{
					Text = "I hope your day or night is just as splendid as my own, my friend."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusTaverna02" },
					}
				},
			},
			StoryExpansion_OrpheusChat08 = {
				Name = "StoryExpansion_OrpheusChat08",
				UseableOffSource = true,
				{
					Text = "I'm sorry I have no will for singing this night, Melinoë."
				},
				GameStateRequirements = {
					{
						PathFalse = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat09 = {
				Name = "StoryExpansion_OrpheusChat09",
				UseableOffSource = true,
				{
					Text = "I'll confess I feel a bit self-conscious about being a musician unable to sing and play. I hope you never feel the same, my friend."
				},
				GameStateRequirements = {
					{
						PathFalse = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat10= {
				Name = "StoryExpansion_OrpheusChat10",
				UseableOffSource = true,
				{
					Text = "I'm truly pleased to see you unharmed this night, Melinoë."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat11= {
				Name = "StoryExpansion_OrpheusChat11",
				UseableOffSource = true,
				{
					Text = "Would that I could aid you in some way, my friend."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat12= {
				Name = "StoryExpansion_OrpheusChat12",
				UseableOffSource = true,
				{
					Text = "Nice speaking with you, Melinoë."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat13= {
				Name = "StoryExpansion_OrpheusChat13",
				UseableOffSource = true,
				{
					Text = "I'm afraid I haven't much to say on this occasion, Melinoë."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat14= {
				Name = "StoryExpansion_OrpheusChat14",
				UseableOffSource = true,
				{
					Text = "I hope your day or night, I guess, is going nicely, my friend."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat15= {
				Name = "StoryExpansion_OrpheusChat15",
				UseableOffSource = true,
				{
					Text = "Please do be careful out there, Melinoë."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat16= {
				Name = "StoryExpansion_OrpheusChat16",
				UseableOffSource = true,
				{
					Text = "Be strong out there, my friend."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat17 = {
				Name = "StoryExpansion_OrpheusChat17",
				UseableOffSource = true,
				{
					Text = "I'm cheering for you all the way, my friend."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_OrpheusChat18 = {
				Name = "StoryExpansion_OrpheusChat18",
				UseableOffSource = true,
				{
					Text = "I'd ask if you remember what it's like to feel inspired, my friend, but I don't want to know."
				},
				GameStateRequirements = {
					{
						PathFalse = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat19 = {
				Name = "StoryExpansion_OrpheusChat19",
				UseableOffSource = true,
				{
					Text = "Oh, hello, Melinoë...."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_OrpheusChat20 = {
				Name = "StoryExpansion_OrpheusChat20",
				UseableOffSource = true,
				{
					Text = "I have an optimistic feeling about your next attempt, my friend!"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat21 = {
				Name = "StoryExpansion_OrpheusChat21",
				UseableOffSource = true,
				{
					Text = "May you yet find your muse somewhere out there, my friend."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
				},
			},
			StoryExpansion_OrpheusChat22 = {
				Name = "StoryExpansion_OrpheusChat22",
				UseableOffSource = true,
				{
					Text = "Each failure brings new opportunities for self-reflection, right, my friend?"
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_OrpheusChat23 = {
				Name = "StoryExpansion_OrpheusChat23",
				UseableOffSource = true,
				{
					Text = "Please keep me well apprised of all of your incredible achievements, Melinoë."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuest01"}
					}
				},
			},
			StoryExpansion_OrpheusChat24 = {
				Name = "StoryExpansion_OrpheusChat24",
				UseableOffSource = true,
				{
					Text = "It lifts my spirits when we briefly interact, my friend."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_OrpheusChat25 = {
				Name = "StoryExpansion_OrpheusChat25",
				UseableOffSource = true,
				{
					Text = "I thought I'd lost even the gift of music, Melinoë. So, thanks again for helping find that one for me!"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat26 = {
				Name = "StoryExpansion_OrpheusChat26",
				UseableOffSource = true,
				{
					Text = "I must say, it's nice having some music in my life again, and hopefully in yours!"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat27 = {
				Name = "StoryExpansion_OrpheusChat27",
				UseableOffSource = true,
				{
					Text = "It's nice that I no longer have to live and breathe, and can be focused purely on my song...!"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat28 = {
				Name = "StoryExpansion_OrpheusChat28",
				UseableOffSource = true,
				{
					Text = "You rescued me from an eternity of not getting to sing, my friend. Thank you, truly."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_OrpheusChat29 = {
				Name = "StoryExpansion_OrpheusChat29",
				UseableOffSource = true,
				{
					Text = "Eurydice speaks so highly of you, Melinoë. You should be very proud."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					}
				},
			},
			StoryExpansion_OrpheusChat30 = {
				Name = "StoryExpansion_OrpheusChat30",
				UseableOffSource = true,
				{
					Text = "You've given Eurydice such life with providing food for you and the rest of the Crossroads. I haven't seen her this happy in a long time."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					}
				},
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
					Text = "{#Emph} Ah...! {#Prev} What is going on? What is this place? And {#Emph} who {#Prev} are you?" },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Court Musician Orpheus! I am Melinoë, daughter of Lord Hades and rightful princess of the Underworld. I am here to free you from the grasp of Chronos after he captured all the members of the House." },
				{
					Portrait = "StoryExpansion_Orpheus_Default",
					Text = "I... I remember the attack. The horror of watching everyone freeze and knowing I was next. Has it really been so long that you were able to grow up?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Default_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I'm sorry you had to see that, Orpheus. I have been fighting to free the members of the House for my whole life and I apologise for not being able to rescue you sooner." },
{ 
					Portrait = "StoryExpansion_Orpheus_Default",
					Text = "...Has anyone ever told you that you have your mother's chin, as well as the same fire in your eyes?" },

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
					Text = "Take me away, goddess, to a place where we may be safe from the terrible Titan who assaulted our home. Whatever is next, I shall follow your lead.",
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

NarrativeData.NPC_Orpheus_Hub_StoryExpansion = {
    InteractTextLinePriorities = {
        "StoryExpansion_OrpheusUnlocksEurydice01",
		"StoryExpansion_OrpheusUnlocksEurydice02",
		"StoryExpansion_EurydiceInteractWithOrpheus01",
		"StoryExpansion_EurydiceInteractWithOrpheus01_B",
		"StoryExpansion_EurydiceInteractWithOrpheus01_C",
    },
	GiftTextLinePriorities = {
		"StoryExpansion_OrpheusGift01",
		"StoryExpansion_OrpheusGift02",
		"StoryExpansion_OrpheusGift03",
		"StoryExpansion_OrpheusGift04",
		"StoryExpansion_OrpheusTaverna01",
	},
}