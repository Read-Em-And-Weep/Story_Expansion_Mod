mod.ThanatosNPCData = {
    NPC_Thanatos_Hub_StoryExpansion = {
		Name = "NPC_Thanatos_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},
		SpawnMap = "Hub_Main",
        SpawnId = "591248",
		Offset = {X = -450, Y = 550},
		GazeTarget = {X = -455, Y = 555},
		Scale = 1,

		    ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingThanatosDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
			--TODO: set actual requirements
		},

	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
  


		Portrait = "Portrait_Thanatos_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		InteractTextLineSets = {
			RepeatableChat01 = {
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
			PlaceholderInteractWithZag = {
        Partner = "NPC_Zagreus_Hub_StoryExpansion",
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
				TeleportToId = 558175,
				TeleportOffsetX = 350,
				TeleportOffsetY = 550,
				AngleTowardTargetId = 738451,
				InteractDistance = 450,

				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Zagreus_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Zagreus_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },
	PlaceholderInteractWithMeg = {
                Partner = "NPC_Megaera_Hub_StoryExpansion",
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
				TeleportToId = 590206,
				TeleportOffsetX = 150,
				TeleportOffsetY = 250,
				AngleTowardTargetId = 566716,
				InteractDistance = 450,

				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Megaera_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Megaera_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },
	PlaceholderInteractWithAchilles = {
                Partner = "NPC_Achilles_Hub_StoryExpansion",
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
				TeleportToId = 586054,
				TeleportOffsetX = -300,
				TeleportOffsetY = 350,
				AngleTowardTargetId = 738451,
				InteractDistance = 450,

				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Achilles_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Achilles_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },
	PlaceholderInteractWithDusa = {
                Partner = "NPC_Dusa_Hub_StoryExpansion",
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
				TeleportToId = 566716,
				TeleportOffsetX = -250,
				TeleportOffsetY = 150,
				AngleTowardTargetId = 738440,
				InteractDistance = 450,


				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Dusa_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Dusa_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },
	PlaceholderInteractWithNyx = {
                Partner = "NPC_Nyx_Hub_StoryExpansion",
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
				TeleportToId = 558175,
				TeleportOffsetX = -240,
				TeleportOffsetY = -130,
				AngleTowardTargetId = 738376,
				InteractDistance = 450,


				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Nyx_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Nyx_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },
	PlaceholderInteractWithOrpheus = {
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


				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Orpheus_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Orpheus_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },
	PlaceholderInteractWithPersephone = {
                Partner = "NPC_Persephone_Hub_StoryExpansion",
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
				TeleportToId = 561464,
				TeleportOffsetX = -200,
				TeleportOffsetY = 100,
				AngleTowardTargetId = 575874,
				InteractDistance = 450,


				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Persephone_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Persephone_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },
	ModdedThanChat01Placeholder =
			{
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
		},
	Binks = {
			"ThanatosIdle_Bink",
			"ThanatosIdleInhouse_Bink",
			"ThanatosIdleInhouseFidgetHairFlick__Bink",
		},
		
	
},

NPC_Thanatos_Field_StoryExpansion = {
		Name = "NPC_Thanatos_Field_StoryExpansion",
		GenusName = "NPC_Thanatos_Hub_StoryExpansion",
		InheritFrom = {"NPC_Thanatos_Hub_StoryExpansion"},
		PreEventFunctionName = "AngleNPCToHero",

		Portrait = "StoryExpansion_Thanatos_Default",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		InvincibubbleScale = 1.33,
				HitInvulnerableExpireProjectiles = true,

		OnUsedFunctionName = _PLUGIN.guid..".UseThanatos",
		OnUsedFunctionArgs =
		{
			SkipInteractAnim = true,
			SkipSound = true,
			PackageName = "NPC_Athena_01",
			PreserveContextArt = true,
		},

		RarityRollOrder = {"Common", "Rare", "Epic", "Heroic" },
				TreatAsGodLootByShops = true,
		RequiredRoomInteraction = true,
		SkipAISetupOnActivate = true,
		ExcludeFromDamageDealtRecord = true,
		IgnoreForFieldsRewardClaimedVO = true,

		RecheckConversationOnLootPickup = true,

		BlockFieldsEncounterStart = true,

		PreferredSpawnPoint = "EnemyPoint",
		LootColor = {48, 25, 52, 255},
		LightingColor = {48, 25, 52, 255},

		
		MenuTitle = "StoryExpansionUpgradeChoiceMenu_Thanatos",
		SpawnSound = "/SFX/AthenaWrathHolyShield",
		UpgradeScreenOpenSound = "/SFX/AthenaWrathHolyShield",
		UpgradeSelectedSound = "/SFX/AthenaBoonChoice",
		Icon = "StoryExpansionBoonSymbolThanatos",

		SetupEvents =
		{
				FunctionName = "SilenceForDreamRun",
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
				},
			},

		Traits =
		{ 
			gods.GetInternalBoonName("ThanatosFocusDeathDefianceTrait"),
			gods.GetInternalBoonName("ThanatosDoubleDamageFinishTrait"),
			gods.GetInternalBoonName("ThanatosFasterAttackTrait"),
			gods.GetInternalBoonName("ThanatosOldKeepsakeTrait"),
			gods.GetInternalBoonName("ThanatosPerfectClearBonusRewardTrait"),
			gods.GetInternalBoonName("ThanatosPerfectCritTrait"),
			gods.GetInternalBoonName("ThanatosDodgeSpellTrait"),
			gods.GetInternalBoonName("ThanatosDamageOnKillTrait"),
			gods.GetInternalBoonName("ThanatosSummonShadeMercTrait"),
			gods.GetInternalBoonName("ThanatosIncomingOutcomingCritTrait"),
		},
		FlavorTextIds =
		{
			"StoryExpansionThanatosUpgrade_FlavorText01",
			"StoryExpansionThanatosUpgrade_FlavorText02",
			"StoryExpansionThanatosUpgrade_FlavorText03",
		},
		InteractTextLineSets = {
			StoryExpansion_ThanatosFieldChat01 = {
				Name = "StoryExpansion_ThanatosFieldChat01",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "No use in making idle chat, right, Melinoë? Take my blessing and go." },
			},
			StoryExpansion_ThanatosFieldChat02 = {
				Name = "StoryExpansion_ThanatosFieldChat02",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Sorry, Melinoë, but I have no time to linger. Lots of souls to collect. Too bad I can't be everywhere at once." },
			},
			StoryExpansion_ThanatosFieldChat03 = {
				Name = "StoryExpansion_ThanatosFieldChat03",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "I have a job to do, and so do you. We've no interest in remaining here, so go forth and slay our enemies." },
			},
			StoryExpansion_ThanatosFieldChat04 = {
				Name = "StoryExpansion_ThanatosFieldChat04",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "I can't keep bailing you out when you get in over your head, princess. Take a boon of mine to prevent it happening again." },
			},
			StoryExpansion_ThanatosFieldChat05 = {
				Name = "StoryExpansion_ThanatosFieldChat05",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Quite a mess you made here, Melinoë. You better know what you're doing." },
			},
			StoryExpansion_ThanatosFieldChat06 = {
				Name = "StoryExpansion_ThanatosFieldChat06",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "We're wasting time just standing here. Go, and continue fighting this night." },
			},
			StoryExpansion_ThanatosFieldChat07 = {
				Name = "StoryExpansion_ThanatosFieldChat07",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Nice to see you again, Melinoë. Perhaps another night we can fight our foes together." },
			},
			StoryExpansion_ThanatosFieldChat08 = {
				Name = "StoryExpansion_ThanatosFieldChat08",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "If I leave my duty now, your father will have my hide. Let's not linger now." },
			},
			StoryExpansion_ThanatosFieldChat09 = {
				Name = "StoryExpansion_ThanatosFieldChat09",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "As much as I'd like to stay and chat, I'd better go..." },
			},
			StoryExpansion_ThanatosFieldChat10 = {
				Name = "StoryExpansion_ThanatosFieldChat10",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "We sure showed those wretches, didn't we?" },
			},
			StoryExpansion_ThanatosFieldChat11 = {
				Name = "StoryExpansion_ThanatosFieldChat11",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "It was good to have this opportunity to back you up out here, Melinoë." },
			},
			StoryExpansion_ThanatosFieldChat12 = {
				Name = "StoryExpansion_ThanatosFieldChat12",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Still at it, I see. You're stubborn. And you are going to get me in a heap of trouble before all is said and done." },
			},
			StoryExpansion_ThanatosFieldChat13 = {
				Name = "StoryExpansion_ThanatosFieldChat13",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "We'll have to catch up at some other time. Though good to see you anyway." },
			},
			StoryExpansion_ThanatosFieldChat14 = {
				Name = "StoryExpansion_ThanatosFieldChat14",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "I only have a little time until my next assignment, but this shouldn't take too long." },
			},
			StoryExpansion_ThanatosFieldChat15 = {
				Name = "StoryExpansion_ThanatosFieldChat15",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
						IsAny = { "F", "G", "H", "I" },
					},
				},
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Thought I might stop by and check up on this corner of the Underworld, Melinoë." },
			},
			StoryExpansion_ThanatosFieldChat16 = {
				Name = "StoryExpansion_ThanatosFieldChat16",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "You've come this far, now let's make sure you go the distance, Princess." },
			},
			StoryExpansion_ThanatosFieldChat17 = {
				Name = "StoryExpansion_ThanatosFieldChat17",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Hope you didn't mind me cutting in here, Melinoë. Though perhaps this might sweeten the deal." },
			},
			StoryExpansion_ThanatosFieldChat18 = {
				Name = "StoryExpansion_ThanatosFieldChat18",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "What do you say I gift you something to help you take care of business. princess?" },
			},
			StoryExpansion_ThanatosFieldChat19 = {
				Name = "StoryExpansion_ThanatosFieldChat19",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "What do you say we deal some death together, Melinoë?" },
			},
			StoryExpansion_ThanatosFieldChat20 = {
				Name = "StoryExpansion_ThanatosFieldChat20",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake") },
					},
				},
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Good, I'm not too late. Got here as quickly as I could." },
			},
			StoryExpansion_ThanatosFieldChat21 = {
				Name = "StoryExpansion_ThanatosFieldChat21",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake") },
					},
				},
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "I got the message that you need assistance, Melinoë?" },
			},
			StoryExpansion_ThanatosFieldChat22 = {
				Name = "StoryExpansion_ThanatosFieldChat22",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake") },
					},
				},
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "I got the feeling you could use some backup here." },
			},
			StoryExpansion_ThanatosFieldChat23 = {
				Name = "StoryExpansion_ThanatosFieldChat23",
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Text = "Death approaches, whether you desire it or not." },
			},
		}
	},
	NPC_Thanatos_Frozen_StoryExpansion = {
		Name = "NPC_Thanatos_Frozen_StoryExpansion",
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



		Portrait = "Portrait_Thanatos_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },


		InteractTextLineSets = {
        StoryExpansionFreeingThanatosDialogue =
			{
				Name = "StoryExpansionFreeingThanatosDialogue",
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
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lord Thanatos, this may be difficult to believe, but I am Melinoë, Princess of the Underworld, and I am here to rescue you after the Titan Chronos led an assault against the House." },
				{ 
					Portrait = "StoryExpansion_Thanatos_Default",

					Text = "I can sense the vestiges of Mother Nyx's power on you and the Nocturnal Arms. Your magick must be refined to resonate with her, even while we were captured. Tell me, what is Mother Nyx's plan?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "You give me too much credit, O Death. What I have accomplished can be attributed to Headmistress Hecate's teachings. As is her plan to free all the members of the House before launching our final assault." },
{ 
					PreLineWait = 0.85,
					Portrait = "StoryExpansion_Thanatos_Pleased",

					Text = "Princess Melinoë, whether through your Headmistress's mentorship or Mother Nyx's guidance, it is still you who achieved your goals. To not place my trust in the will of Night would be foolish." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Well then, I require that trust from you now. I have rescued Prince Zagreus and Queen Persephone but we now must depart back to the Crossroads, where we may safely recover."},
					{ 
					
					Portrait = "StoryExpansion_Thanatos_Default",
												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.2, UseChronosSound = true },

					Text = "We have all been separated for too long. Escape sounds prudent, since I can already sense Chronos stirring. To the Crossroads then, where we may prepare to face Chronos for a final time.",
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

if elementalinfusion then
	table.insert(mod.ThanatosNPCData.NPC_Thanatos_Field_StoryExpansion.Traits, gods.GetInternalBoonName("ThanatosElementalTrait"))
end
if ZagreusJourney then
	table.insert(mod.ThanatosNPCData.NPC_Thanatos_Field_StoryExpansion.Traits, gods.GetInternalBoonName("ThanatosButterflyOnKillTrait"))
end


for newNPCName, newNPCData in pairs(mod.ThanatosNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end
