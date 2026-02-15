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
			InteractWithZag = {
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
	InteractWithMeg = {
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
	InteractWithAchilles = {
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
	InteractWithDusa = {
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
	InteractWithNyx = {
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
	InteractWithOrpheus = {
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
	InteractWithPersephone = {
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

		Traits =
		{ 
			gods.GetInternalBoonName("ThanatosFocusDeathDefianceTrait"),
			gods.GetInternalBoonName("ThanatosInstantKillTrait"),
			gods.GetInternalBoonName("ThanatosFasterAttackTrait"),
			gods.GetInternalBoonName("ThanatosOldKeepsakeTrait"),
			gods.GetInternalBoonName("ThanatosPerfectClearBonusRewardTrait"),
			gods.GetInternalBoonName("ThanatosPerfectCritTrait"),
			gods.GetInternalBoonName("ThanatosDodgeSpellTrait"),
			gods.GetInternalBoonName("ThanatosPrimeDamageTrait"),
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
			RepeatableChat01 = {
				UseableOffSource = true,
				{ Portrait = "StoryExpansion_Thanatos_Default",
					Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
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
					Text = "Lord Thanatos, this may be difficult to believe, but I am Melinoë, Princess of the Underworld, and I am here to rescue after the Titan Chronos lead an assault against the House." },
				{ 
					Portrait = "StoryExpansion_Thanatos_Default",

					Text = "I can sense the vestiges of Mother Nyx's power on you and the Nocturnal Arms you wield. Your magick must truly be strong to have such a powerful resonance with her, even while we were captured. Tell me, what is Mother Nyx's plan?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "There's no need for such flattery, O Death. What I have accomplished can be solely attributed to Headmistress Hecate teachings. As to is her plan to free all the members of the House before launching our final assault." },
{ 
					PreLineWait = 0.85,
					Portrait = "StoryExpansion_Thanatos_Pleased",

					Text = "Princess Melinoë, whether it is through you Headmistress's teachings or Mother Nyx's will that have achieved you goals, it is still you who achieved them. I would gladly place my trust in someone so humble and favoured by my Mother." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Well then, I require that trust from you now. I have rescued Prince Zagreus and Queen Persephone but we now must depart back to the Crossroads, where we may safely recover."},
					{ 
					
					Portrait = "StoryExpansion_Thanatos_Default",
												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.2, UseChronosSound = true },

					Text = "Then my trust you shall have. Escape sounds like an excellent idea, since I can already sense Chronos awakening. To the Crossroads then, where we may prepare to strike back with greater force.",
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


for newNPCName, newNPCData in pairs(mod.ThanatosNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end
