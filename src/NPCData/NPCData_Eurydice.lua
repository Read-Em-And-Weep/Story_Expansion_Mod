mod.EurydiceNPCData = {
    NPC_Eurydice_Hub_Traits_StoryExpansion = {
		Name = "NPC_Eurydice_Hub_Traits_StoryExpansion",
		InheritFrom = { "NPC_Neutral","NPC_Giftable"},

		SpawnMap = "Hub_PreRun",
        SpawnId = "780532",
		Offset = {X = -200, Y = 200},
		GazeTarget = {X = -150, Y = 300},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        UseTextSpecial = "StoryExpansionEurydiceUseTextSpecial",
		UseTextTalkGiftAndSpecial = "StoryExpansionEurydiceUseTextTalkGiftAndSpecial",
		UseTextTalkAndSpecial = "StoryExpansionEurydiceUseTextTalkAndSpecial",
		UseTextGiftAndSpecial = "StoryExpansionEurydiceUseTextGiftAndSpecial",
        SpecialInteractFunctionName = _PLUGIN.guid..".OpenEurydiceFoodScreen",
        SpecialInteractGameStateRequirements =
		{
			{
				PathFalse = { "CurrentRun", "StoryExpansionFoodSelected" },
			},
		},
		SpecialInteractCooldown = 0,

        CanReceiveGift = true,
  
		    ActivateRequirements =
		{
			{
				Path = { "GameState", "TextLinesRecord"},
				HasAny = {"StoryExpansion_EurydiceInteractWithOrpheus01", "StoryExpansion_EurydiceInteractWithOrpheus01_B" },
			}
		},


		Portrait = "StoryExpansion_Eurydice_Default",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		GiftTextLineSets = {
			--StoryExpansion_EurydiceGift04 needs to be added, currently a prerequisite for the quality food upgrade incantation
			--[[StoryExpansion_EurydiceTestTaverna01 =
			{
				-- To work properly, the conversation needs to be split into three parts (before transition, in Hub_Main and in Hub_PreRun). Done with postline functions
				Name = "StoryExpansion_EurydiceTestTaverna01",
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
						PathFalse = { "CurrentRun", "TimePassageOccurred" },
						HintId = "Codex_TimePassesGiftUsed",
					},
				},
				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Would you accompany me to the Taverna, Musician Orpheus, so that we can share this bottle of Ambrosia properly?" },

				{ 
					PostLineRemoveContextArt = true,
					Portrait = "StoryExpansion_Eurydice_Default",
					PortraitExitAnimation = "StoryExpansion_Eurydice_Default_Exit",
					PostLineFunctionName = _PLUGIN.guid..".EurydiceTavernaStartPresentation",
					Text = "{#Emph}Oh{#Prev}, I, certainly, why, I don't see why not. I mean, it's not as though I've got something to do that isn't that." },

				{
					SkipContextArt = true,
					PreLineFunctionName = _PLUGIN.guid..".LoadEurydiceandHeroPackages",
					PreLineWait = 0.35,
					Text = "That Music Maker you summoned is excellent. The technique and ability to transition between styles so seamlessly… it is beautiful." },

				{  UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Do you feel inspired by them? I could always approach them and ask whether they would be willing to perform a duet with you. I’m sure the Crossroads would love to hear a piece performed by both of you." },

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
					Text = "Of course not, my friend. The struggle to improve is what makes someone a true artist. It is what drives us to perform. What drives you, Melinoe?" },
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
					PreLineFunctionName = _PLUGIN.guid.. ".EurydiceTavernaEndPresentation",
					PreLineWait = 0.35,

					PostLineThreadedFunctionName = "InCombatTextEvent",
					PostLineThreadedFunctionArgs = GameData.PostTavernaArgs,

					Text = "Thank you, Melinoe. I very much enjoyed your company, and the drink. Shall we do this again at some opportunity?" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.36,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_0769", Text = "Of course." },
					},
				},

			},]]
		},

		InteractTextLineSets = {
			StoryExpansion_EurydiceUnlocksEurydiceImprove =
			{
				Name = "StoryExpansion_EurydiceUnlocksEurydiceImprove",
				PlayOnce = true,
				UseableOffSource = true,

				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_EurydiceGift04" },
					},
					{
						PathFalse = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUpgradeEurydice", }
					},
				},
				{
					"You know, it's a shame you didn't get to taste my food back when I lived in Asphodel. Those feasts were a work of art."
				},
				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I've always thought the meals you've been making me are very tasty! I can't imagine them being any better." },
				{ 
					Text = "Oh you have as silver a tongue as your brother, Melinoë. But in Asphodel, I had access to fresh and premium ingredients I grew myself, and unfortunately the quality of them here is just not the same." },
									{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
																												PostLineThreadedFunctionName = "DisplayInfoToast",
					PostLineFunctionArgs = { Duration = 2, Title = "WorldUpgradeAdded", Text = "StoryExpansionWorldUpgradeUpgradeEurydice" },

					Text = "Premium ingredients... now that may be something I can fix..." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_0153", Text = "Let's try it." },
					},
				},
			},
        StoryExpansion_EurydiceChat01 = {
				Name = "StoryExpansion_EurydiceChat01",
				UseableOffSource = true,
				{
					Text = "The Music Maker you summoned is great, Your Royal Majesty. Do you think that shade would be willing to do a duet?"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeMusicPlayer" },
					}
				},
			},
			StoryExpansion_EurydiceChat02 = {
				Name = "StoryExpansion_EurydiceChat02",
				UseableOffSource = true,
				{
					Text = "I hope you're hungry, hon. I've got a bunch of delicious meals for you to choose from."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_EurydiceChat03 = {
				Name = "StoryExpansion_EurydiceChat03",
				UseableOffSource = true,
				{
					Text = "You've come at just the perfect time, hon. Just pulled my latest specials out of the kitchen."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_EurydiceChat04 = {
				Name = "StoryExpansion_EurydiceChat04",
				UseableOffSource = true,
				{
					Text = "What's it going to be this time, Your Royal Majesty?"
				},
			},
			StoryExpansion_EurydiceChat05 = {
				Name = "StoryExpansion_EurydiceChat05",
				UseableOffSource = true,
				{
					Text = "You want my advice, hon? Sing when you're happy, and sing even when you're not."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_EurydiceChat06 = {
				Name = "StoryExpansion_EurydiceChat06",
				UseableOffSource = true,
				{
					Text = "Only the finest meals for the Heroine of the Underworld."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_EurydiceChat07 = {
				Name = "StoryExpansion_EurydiceChat07",
				UseableOffSource = true,
				{
					Text = "You look positively famished, hon! Have I not been feeding you enough?"
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_EurydiceChat08 = {
				Name = "StoryExpansion_EurydiceChat08",
				UseableOffSource = true,
				{
					Text = "Have you heard my Orphy singing yet, hon?"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusTaverna02" },
					}
				},
			},
			StoryExpansion_EurydiceChat09 = {
				Name = "StoryExpansion_EurydiceChat09",
				UseableOffSource = true,
				{
					Text = "Eat up, hon! I made these meals for you and the rest of the Crossroads, of course."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_EurydiceChat10= {
				Name = "StoryExpansion_EurydiceChat10",
				UseableOffSource = true,
				{
					Text = "Just singing to myself and cooking up a storm. You know me, hon."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat11= {
				Name = "StoryExpansion_EurydiceChat11",
				UseableOffSource = true,
				{
					Text = "Eat up, hon! I got other mouths to feed!"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat12= {
				Name = "StoryExpansion_EurydiceChat11",
				UseableOffSource = true,
				{
					Text = "You want the best cooking in all of the Underworld, you know where to go!"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat13= {
				Name = "StoryExpansion_EurydiceChat13",
				UseableOffSource = true,
				{
					Text = "Take care of yourself out there, all right, Your Royal Majesty?"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat14= {
				Name = "StoryExpansion_EurydiceChat14",
				UseableOffSource = true,
				{
					Text = "Don't let anyone get you down, hon. Here."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat15= {
				Name = "StoryExpansion_EurydiceChat15",
				UseableOffSource = true,
				{
					Text = "You look like you're in a rush, though there's always time for a quick snack, right?"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat16= {
				Name = "StoryExpansion_EurydiceChat16",
				UseableOffSource = true,
				{
					Text = "Hey, welcome back, Your Royal Majesty, you're just in time!"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat17 = {
				Name = "StoryExpansion_EurydiceChat17",
				UseableOffSource = true,
				{
					Text = "You look like you haven't eaten since you were here last! We'd better fix that now, right hon?"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat18 = {
				Name = "StoryExpansion_EurydiceChat18",
				UseableOffSource = true,
				{
					Text = "Been trying to perfect these recipes forever! Maybe this will be the time, right hon?"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat19 = {
				Name = "StoryExpansion_EurydiceChat19",
				UseableOffSource = true,
				{
					Text = "I've got you something for the road! Enjoy my latest specials, hon."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_EurydiceChat20 = {
				Name = "StoryExpansion_EurydiceChat20",
				UseableOffSource = true,
				{
					Text = "Now Orphy is feeling better, I have a bunch of new songs I want his opinion on. Do you think he'll like 'em'?"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_EurydiceChat21 = {
				Name = "StoryExpansion_EurydiceChat21",
				UseableOffSource = true,
				{
					Text = "Here, have a snack, hon, and tell Orpheus it was delicious."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingOrpheusDialogue" },
					},
				},
			},
			StoryExpansion_EurydiceChat22 = {
				Name = "StoryExpansion_EurydiceChat22",
				UseableOffSource = true,
				{
					Text = "I'd ask you to bring one of my meals to Orphy, but I think he'll appreciate it if I personally give it."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingOrpheusDialogue" },
					},
				},
			},
			StoryExpansion_EurydiceChat23 = {
				Name = "StoryExpansion_EurydiceChat23",
				UseableOffSource = true,
				{
					Text = "I love Orpheus and all, hon, but it's nice having a little time for just us gals! And Schelemeus of course."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuest01"}
					}
				},
			},
			StoryExpansion_EurydiceChat24 = {
				Name = "StoryExpansion_EurydiceChat24",
				UseableOffSource = true,
				{
					Text = "I know you can't stay long, hon, so eat up and stay safe out there, all right?"
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_EurydiceChat25 = {
				Name = "StoryExpansion_EurydiceChat25",
				UseableOffSource = true,
				{
					Text = "Orphy and me, we're like your typical old married couple, hon. I hope you find a relationship as fulfilling someday."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_EurydiceChat26 = {
				Name = "StoryExpansion_EurydiceChat26",
				UseableOffSource = true,
				{
					Text = "It's nice hearing Orphy's song again! We can finally sing duets together again."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_EurydiceChat27 = {
				Name = "StoryExpansion_EurydiceChat27",
				UseableOffSource = true,
				{
					Text = "If you find happiness out there, hon, don't look back."
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_EurydiceChat28 = {
				Name = "StoryExpansion_EurydiceChat28",
				UseableOffSource = true,
				{
					Text = "I've whipped up something delicious this time, Your Majesty. I want your opinion on them once you get back, you hear?"
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusInspirationQuestEnd01" },
					}
				},
			},
			StoryExpansion_EurydiceChat29 = {
				Name = "StoryExpansion_EurydiceChat29",
				UseableOffSource = true,
				{
					Text = "Erebus is so different than Asphodel. I have to say I like the Crossroads much better. The company certainly helps, hon!"
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_EurydiceChat30 = {
				Name = "StoryExpansion_EurydiceChat30",
				UseableOffSource = true,
				{
					Text = "Got a bunch of fresh high-quality ingredients. Enjoy my latest work."
				},
				GameStateRequirements = {
					{
					}
				},
			},
    },

	Binks = {
			--"DusaIdle_Bink",
			--"DusaIdleInhouse_Bink",
			--"DusaIdleInhouseFidgetHairFlick__Bink",
		},
		
	},
	NPC_Eurydice_Hub_StoryExpansion = {
		Name = "NPC_Eurydice_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "558175",
		Offset = {X=10000, Y=1000},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        CanReceiveGift = false,
  
		    ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = {"StoryExpansionNeverPossible"}
			}
		},

		Portrait = "StoryExpansion_Eurydice_Default",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },
		InteractTextLineSets = {
        StoryExpansion_EurydiceInteractWithOrpheus01 = {
-- Unlocking Eurydice Pre True Ending
			Name = "StoryExpansion_EurydiceInteractWithOrpheus01",
                Partner = "NPC_Orpheus_Hub_StoryExpansion",
				PlayOnce = true,
				UseText = "UseListenNPC",
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				StatusAnimation = false,
				BlockDistanceTriggers = true,
				IgnoreSourceEndTextLinesThreadedFunctionName = true,
				UseableOffSource = true,
				TeleportToId = 591114,
				TeleportOffsetX = 600,
				TeleportOffsetY = 0,
				AngleTowardTargetId = 566831,
				InteractDistance = 450,
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
					{
						Path = { "GameState", "TextLinesRecord"},
						HasNone = {"StoryExpansion_EurydiceInteractWithOrpheus01_B", "StoryExpansion_EurydiceInteractWithOrpheus01_C" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice02"}
					},
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					}
				},

				{  Portrait = "StoryExpansion_Orpheus_Default", Speaker = "NPC_Orpheus_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "Eurydice... is it really you? Have you really returned to me?" },

				{ 
					PreLineWait = 0.35,
					Text = "Yes Orphy, it's really me. Is it really you? How did you manage to escape from Chronos?" },

				{ Portrait = "StoryExpansion_Orpheus_Default", Speaker = "NPC_Orpheus_Hub_StoryExpansion",
					Text = "It is all thanks to Princess Melinoë here. She rescued me and other members of the House." },
				{ 
					Text = "Thank you for saving him, Your Royal Majesty. Say, your energy is familiar; were you the one who sent that summons to me?" },
				{
					Portrait = "Portrait_Mel_Default_01", UsePlayerSource = true,
					Text = "It was my magick that welcomed you to the Crossroads. As for rescuing Orpheus, I need no thanks. It is simply part of my duty to the line of Hades, as is slaying Chronos."
				},
								{ 
					Text = "Now there's an aim I can get behind. In return for saving Orphy, let me repay you and make your fight easier. I've got plenty of recipes I'm willing to share that should strengthen you." },
									EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_1940", Text = "Thank you!" },
					},
				},
    },
	StoryExpansion_EurydiceInteractWithOrpheus01_B = {
		-- Unlocking Eurydice post true ending
			Name = "StoryExpansion_EurydiceInteractWithOrpheus01_B",
                Partner = "NPC_Orpheus_Hub_StoryExpansion",
				PlayOnce = true,
				UseText = "UseListenNPC",
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				StatusAnimation = false,
				BlockDistanceTriggers = true,
				IgnoreSourceEndTextLinesThreadedFunctionName = true,
				UseableOffSource = true,
				TeleportToId = 591114,
				TeleportOffsetX = 600,
				TeleportOffsetY = 0,
				AngleTowardTargetId = 566831,
				InteractDistance = 450,
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
					{
						Path = { "GameState", "TextLinesRecord"},
						HasNone = {"StoryExpansion_EurydiceInteractWithOrpheus01", "StoryExpansion_EurydiceInteractWithOrpheus01_C" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice02"}
					},
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					}
				},

				{  Portrait = "StoryExpansion_Orpheus_Default", Speaker = "NPC_Orpheus_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "Eurydice... is it really you? Have you really returned to me?" },

				{ 
					PreLineWait = 0.35,
					Text = "Yes Orphy, it's really me. Is it really you? How did you manage to escape from Chronos?" },

				{ Portrait = "StoryExpansion_Orpheus_Default", Speaker = "NPC_Orpheus_Hub_StoryExpansion",
					Text = "It is all thanks to Princess Melinoë here. She rescued me and other members of the House." },
				{ 
					Text = "Thank you for saving him, Your Royal Majesty. Say, your energy is familiar; were you the one who sent that summons to me?" },
				{
					Portrait = "Portrait_Mel_Default_01", UsePlayerSource = true,
					Text = "It was my magick that welcomed you to the Crossroads. As for rescuing Orpheus, I need no thanks. It is simply part of my duty to the line of Hades, as is diving into the rifts in Time each night."
				},
								{ 
					Text = "Now there's an aim I can get behind. In return for saving Orphy, let me repay you and make your fight easier. I've got plenty of recipes I'm willing to share that should strengthen you." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_1940", Text = "Thank you!" },
					},
				},
    },
	StoryExpansion_EurydiceInteractWithOrpheus01_C = {
		-- Eurydice already unlocked, due to story reset
			Name = "StoryExpansion_EurydiceInteractWithOrpheus01_C",
                Partner = "NPC_Orpheus_Hub_StoryExpansion",
				PlayOnce = true,
				UseText = "UseListenNPC",
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				StatusAnimation = false,
				BlockDistanceTriggers = true,
				IgnoreSourceEndTextLinesThreadedFunctionName = true,
				UseableOffSource = true,
				TeleportToId = 591114,
				TeleportOffsetX = 600,
				TeleportOffsetY = 0,
				AngleTowardTargetId = 566831,
				InteractDistance = 450,
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice02"}
					},
				},

				{  Portrait = "StoryExpansion_Orpheus_Default", Speaker = "NPC_Orpheus_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "Eurydice... is it really you? Are you really here?" },

				{ 
					PreLineWait = 0.35,
					Text = "Yes Orphy, it's really me. Is it really you? How did you manage to escape from Chronos?" },

				{ Portrait = "StoryExpansion_Orpheus_Default", Speaker = "NPC_Orpheus_Hub_StoryExpansion",
					Text = "It is all thanks to Princess Melinoë here. She rescued me and other members of the House." },
				{ 
					Text = "Thank you for saving him, Your Royal Majesty. I hope my meals made your job a little easier." },
				{
					Portrait = "Portrait_Mel_Default_01", UsePlayerSource = true,
					Text = "I need no thanks. It is simply part of my duty to the line of Hades, as is diving into the rifts in Time each night. Though your cooking certainly lightens the load."
				},
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_1940", Text = "Thank you!" },
					},
				},
    },
    },

	Binks = {
			--"DusaIdle_Bink",
			--"DusaIdleInhouse_Bink",
			--"DusaIdleInhouseFidgetHairFlick__Bink",
		},
		
	},
}

for newNPCName, newNPCData in pairs(mod.EurydiceNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end

import 'EurydiceScreenLogic.lua'

NarrativeData.NPC_Eurydice_Hub_Traits_StoryExpansion = {
	GiftTextLinePriorities = {
		"StoryExpansion_EurydiceTestTaverna01"
	}
}

NarrativeData.NPC_Eurydice_Hub_StoryExpansion = {
    InteractTextLinePriorities = {
		"StoryExpansion_EurydiceInteractWithOrpheus01",
		"StoryExpansion_EurydiceInteractWithOrpheus01_B",
		"StoryExpansion_EurydiceInteractWithOrpheus01_C",
    }
}