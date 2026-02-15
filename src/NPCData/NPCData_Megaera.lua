PresetEventArgs["StoryExpansionMegaeraOathChoices"] = {
			GetItemForce = 200,
		GetItemUpwardForce = 700,
		GiveOptions =
		{
			{
				Name = gods.GetInternalBoonName("MegaeraOathIncreasedManaCost")
			},
			{
				Name = gods.GetInternalBoonName("MegaeraOathIncreasedSpellCost"),
				GameStateRequirements = 
				{
					{
						PathTrue = { "CurrentRun", "UseRecord", "SpellDrop" },
					},
				}
			}, 
			{
				Name = gods.GetInternalBoonName("MegaeraOathNoManaBoon"),
				GameStateRequirements = 
				{
					{
						PathFalse = { "CurrentRun", "Hero", "SlottedTraits", "Mana" },
					},
				}
			},
			{
				Name = gods.GetInternalBoonName("MegaeraOathDecreasedMaxGods"),
				GameStateRequirements = 
				{
					{
						FunctionName = _PLUGIN.guid .. ".NotReachedMaxGods",
						FunctionArgs = {}
					},
				}
			},
			{
				Name = gods.GetInternalBoonName("MegaeraOathDecreasedWeaponRank"),
				GameStateRequirements = 
				{
					{
						FunctionName = _PLUGIN.guid .. ".IsWeaponAtNotMinRank",
						FunctionArgs = {}
					},
				}
			},
			{
				Name = gods.GetInternalBoonName("MegaeraOathInCastDamage"),
				GameStateRequirements = 
				{
				}
			},
		{
			Name = gods.GetInternalBoonName("MegaeraOathRivals2"),
			GameStateRequirements =
			{
				{
					FunctionName = "RequiredShrineLevel",
					FunctionArgs =
					{
						ShrineUpgradeName = "BossDifficultyShrineUpgrade",
						Comparison = "<",
						Value = 2,
					},
				},
				{
					PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBossDifficultyT2" },
				},
				{
					Path = { "CurrentRun", "RoomsEntered" },
					HasAny = { "F_Boss01", "F_Boss02", "N_Boss01", "N_Boss02", "A_Boss01", "A_Boss02", "A_Boss03" }
				},
				{
					Path = { "CurrentRun", "RoomsEntered" },
					HasNone = { "G_Boss01", "G_Boss02", "O_Boss01", "O_Boss02", "X_Boss01", "X_Boss02" }
				}
			}
		},
		{
			Name = gods.GetInternalBoonName("MegaeraOathRivals3"),
			GameStateRequirements =
			{
				{
					FunctionName = "RequiredShrineLevel",
					FunctionArgs =
					{
						ShrineUpgradeName = "BossDifficultyShrineUpgrade",
						Comparison = "<",
						Value = 3,
					},
				},
				{
					PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBossDifficultyT3" },
				},
				{
					Path = { "CurrentRun", "RoomsEntered" },
					HasAny = { "G_Boss01", "G_Boss02", "O_Boss01", "O_Boss02", "X_Boss01", "X_Boss02" }
				},
				{
					Path = { "CurrentRun", "RoomsEntered" },
					HasNone = { "H_Boss01", "H_Boss02", "P_Boss01", "Y_Boss01"}
				}
			}
		},
		{
			Name = gods.GetInternalBoonName("MegaeraOathRivals4"),
			GameStateRequirements =
			{
				{
					FunctionName = "RequiredShrineLevel",
					FunctionArgs =
					{
						ShrineUpgradeName = "BossDifficultyShrineUpgrade",
						Comparison = "<",
						Value = 4,
					},
				},
				{
					PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBossDifficultyT4" },
				},
				{
					Path = { "CurrentRun", "RoomsEntered" },
					HasAny = { "H_Boss01", "H_Boss02", "P_Boss01", "Y_Boss01" }
				},
				{
					Path = { "CurrentRun", "RoomsEntered" },
					HasNone = { "I_Boss01", "Q_Boss01", "Q_Boss02", "D_Boss01"}
				}
			}
		},
		{
				Name = gods.GetInternalBoonName("MegaeraOathAntiHeal"),
				GameStateRequirements = 
				{
					{
					FunctionName = "RequiredShrineLevel",
					FunctionArgs =
					{
						ShrineUpgradeName = "HealingReductionShrineUpgrade",
						Comparison = "<",
						Value = 3,
					},
				},
				}
			},
			{
				Name = gods.GetInternalBoonName("MegaeraOathLargePrime"),
				GameStateRequirements = 
				{
				}
			},
			{
				Name = gods.GetInternalBoonName("MegaeraOathTakeCriticalDamage"),
				GameStateRequirements = 
				{
				}
			},
			{
				Name = gods.GetInternalBoonName("MegaeraOathNoRushBoon"),
				GameStateRequirements = 
				{
					{
						PathFalse = { "CurrentRun", "Hero", "SlottedTraits", "Rush" },
					},
				}
			},
		},
		GetOptions =
		{

			{ Name = gods.GetInternalBoonName("MegaeraBlessingArcanaDraw"),
				GameStateRequirements =
				{
					
				},
			},
			{ Name = gods.GetInternalBoonName("MegaeraBlessingArcanaUpgrade"),
				GameStateRequirements =
				{
					{
						Path = { "GameState", "MetaUpgradeCostCache" },
						Comparison = ">",
						Value = 0,
					},	
				},
			},
			{Name = gods.GetInternalBoonName("MegaeraBlessingTalentDrop"),
			GameStateRequirements = {
				{
					NamedRequirements = { "TalentLegal", },
				}
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingGoldChambers"),
			GameStateRequirements = {
				
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingCastCount"),
			GameStateRequirements = {
				
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingElementalBoost"),
			GameStateRequirements = {
				{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeElementalBoons", },
				}
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingStackUpgradeBoost"),
			GameStateRequirements = {
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingDuoLegendaryBoost"),
			GameStateRequirements = {
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingDefianceRefill"),
			GameStateRequirements = {
				NamedRequirements = { "MissingLastStand", },
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingRandomHeroicChance"),
			GameStateRequirements = {
			}
		},
		{Name = gods.GetInternalBoonName("MegaeraBlessingRegainRerolls"),
			GameStateRequirements = {
				NamedRequirements = { "RerollAvailable", }
			}
		},	
		},
}

mod.MegaeraNPCData = {
    NPC_Megaera_Hub_StoryExpansion = {
		Name = "NPC_Megaera_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "590206",
		Offset = {X = 125, Y = 100},
		GazeTarget = {X = 150, Y = 125},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
  


		Portrait = "StoryExpansion_Megaera_Standoffish",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		    ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingMegaeraDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},

		InteractTextLineSets = {
        ModdedThanChat01Placeholder =
			{
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
    },

	Binks = {
			--"MegaeraIdle_Bink",
			--"MegaeraIdleInhouse_Bink",
			--"MegaeraIdleInhouseFidgetHairFlick__Bink",
		},
		
	},
	    NPC_Megaera_Field_StoryExpansion = {
        InheritFrom = {"NPC_Neutral"},
        Name = "NPC_Megaera_Field_StoryExpansion",
        
		AnimOffsetZ = 0,
		ExcludeFromDamageDealtRecord = true,
		PreEventFunctionName = "AngleNPCToHero",

        UpgradeScreenOpenSound = "/SFX/WeaponUpgradeHammerDrop2",
		UpgradeSelectedSound = "/SFX/HammerBoonChoice",
		UpgradeAcquiredAnimation = "MelinoeEquip",
		UpgradeAcquiredAnimationDelay = 1.2,

		Portrait = "StoryExpansion_Megaera_Standoffish",
		MenuTitle = "StoryExpansionPatroclusChoiceMenu_Title",
		BoonInfoTitleText = "Codex_BoonInfo_Icarus",
		FlavorTextIds =
		{
			"StoryExpansionPatroclusChoiceMenu_FlavorText01",
		},

        Traits =
		{

		},
        InteractTextLineSets =
		{
			MegaeraFirstMeeting =
			{
				Name = "MegaeraFirstMeeting",
				PlayOnce = false,
				StatusAnimation = "StatusIconWantsToTalkImportant",
				UseableOffSource = true,
				PreEventFunctionName = _PLUGIN.guid .. ".AngleStoryExpansionNPCToHero",
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				{ Cue = "/VO/Icarus_0062",
					Portrait = "Portrait_Icarus_Pleased_01",

					PreLineAnim = "Icarus_Pensive_Start",
					PostLineAnim = "Icarus_Pensive_End",
					Text = "It's really you. Before you say anything, I know I'm not supposed to be here, but I spotted this ship and had to drop in for a closer look. And now I'm going to take off! So let's pretend this never happened, hey?" },
				{ Cue = "/VO/MelinoeField_1930", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Hold it right there, Icarus! I'm not about to let you just fly out on me again without a chat at least. To start with, what are you doing in the middle of this blasted war?" },
				{ Cue = "/VO/Icarus_0003",
					PreLineAnim = "Icarus_Explaining_Start",
					PostLineAnim = "Icarus_Explaining_End",
					Portrait = "Portrait_Icarus_Unsure_01",
					Text = "The same thing I've {#Emph}been {#Prev}doing: slowing these bastards down. If everyone like me pitched in a little bit, this war would have been well over by now." },
				{ Cue = "/VO/MelinoeField_1931", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That may be so. But this is a matter between gods and Titans. I wouldn't want you to get hurt." },
				{ Cue = "/VO/Icarus_0004",
					Portrait = "Portrait_Icarus_Pleased_01",
					Text = "Bit late for that, Meli! Anyway, I've kept you for too long, but let me give you something I've been working on before I go — and these all work. I swear!" },
				PrePortraitExitFunctionName = _PLUGIN.guid .. ".MegaeraOathChoice",
				PrePortraitExitFunctionArgs = PresetEventArgs.StoryExpansionMegaeraOathChoices,
			},
			MegaeraTestMeeting01 =
			{
				Name = "MegaeraTestMeeting01",
				PlayOnce = false,
				UseableOffSource = true,
				PreEventFunctionName = _PLUGIN.guid .. ".AngleStoryExpansionNPCToHero",
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				{ Cue = "/VO/Icarus_0062",
					Portrait = "Portrait_Icarus_Pleased_01",

					PreLineAnim = "Icarus_Pensive_Start",
					PostLineAnim = "Icarus_Pensive_End",
					Text = "It's really you. Before you say anything, I know I'm not supposed to be here, but I spotted this ship and had to drop in for a closer look. And now I'm going to take off! So let's pretend this never happened, hey?" },
				{ Cue = "/VO/MelinoeField_1930", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Hold it right there, Icarus! I'm not about to let you just fly out on me again without a chat at least. To start with, what are you doing in the middle of this blasted war?" },
				{ Cue = "/VO/Icarus_0003",
					PreLineAnim = "Icarus_Explaining_Start",
					PostLineAnim = "Icarus_Explaining_End",
					Portrait = "Portrait_Icarus_Unsure_01",
					Text = "The same thing I've {#Emph}been {#Prev}doing: slowing these bastards down. If everyone like me pitched in a little bit, this war would have been well over by now." },
				{ Cue = "/VO/MelinoeField_1931", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That may be so. But this is a matter between gods and Titans. I wouldn't want you to get hurt." },
				{ Cue = "/VO/Icarus_0004",
					Portrait = "Portrait_Icarus_Pleased_01",
					Text = "Bit late for that, Meli! Anyway, I've kept you for too long, but let me give you something I've been working on before I go — and these all work. I swear!" },
				PrePortraitExitFunctionName = _PLUGIN.guid .. ".MegaeraOathChoice",
				PrePortraitExitFunctionArgs = PresetEventArgs.StoryExpansionMegaeraOathChoices,
			},
			MegaeraTestMeeting02 =
			{
				Name = "MegaeraTestMeeting02",
				PlayOnce = false,
				UseableOffSource = true,
				PreEventFunctionName = _PLUGIN.guid .. ".AngleStoryExpansionNPCToHero",
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				{ Cue = "/VO/Icarus_0062",
					Portrait = "Portrait_Icarus_Pleased_01",

					PreLineAnim = "Icarus_Pensive_Start",
					PostLineAnim = "Icarus_Pensive_End",
					Text = "It's really you. Before you say anything, I know I'm not supposed to be here, but I spotted this ship and had to drop in for a closer look. And now I'm going to take off! So let's pretend this never happened, hey?" },
				{ Cue = "/VO/MelinoeField_1930", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Hold it right there, Icarus! I'm not about to let you just fly out on me again without a chat at least. To start with, what are you doing in the middle of this blasted war?" },
				{ Cue = "/VO/Icarus_0003",
					PreLineAnim = "Icarus_Explaining_Start",
					PostLineAnim = "Icarus_Explaining_End",
					Portrait = "Portrait_Icarus_Unsure_01",
					Text = "The same thing I've {#Emph}been {#Prev}doing: slowing these bastards down. If everyone like me pitched in a little bit, this war would have been well over by now." },
				{ Cue = "/VO/MelinoeField_1931", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That may be so. But this is a matter between gods and Titans. I wouldn't want you to get hurt." },
				{ Cue = "/VO/Icarus_0004",
					Portrait = "Portrait_Icarus_Pleased_01",
					Text = "Bit late for that, Meli! Anyway, I've kept you for too long, but let me give you something I've been working on before I go — and these all work. I swear!" },
				PrePortraitExitFunctionName = _PLUGIN.guid .. ".MegaeraOathChoice",
				PrePortraitExitFunctionArgs = PresetEventArgs.StoryExpansionMegaeraOathChoices,
			},
			MegaeraTestMeeting03 =
			{
				Name = "MegaeraTestMeeting03",
				PlayOnce = false,
				UseableOffSource = true,
				PreEventFunctionName = _PLUGIN.guid .. ".AngleStoryExpansionNPCToHero",
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				{ Cue = "/VO/Icarus_0062",
					Portrait = "Portrait_Icarus_Pleased_01",

					PreLineAnim = "Icarus_Pensive_Start",
					PostLineAnim = "Icarus_Pensive_End",
					Text = "It's really you. Before you say anything, I know I'm not supposed to be here, but I spotted this ship and had to drop in for a closer look. And now I'm going to take off! So let's pretend this never happened, hey?" },
				{ Cue = "/VO/MelinoeField_1930", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Hold it right there, Icarus! I'm not about to let you just fly out on me again without a chat at least. To start with, what are you doing in the middle of this blasted war?" },
				{ Cue = "/VO/Icarus_0003",
					PreLineAnim = "Icarus_Explaining_Start",
					PostLineAnim = "Icarus_Explaining_End",
					Portrait = "Portrait_Icarus_Unsure_01",
					Text = "The same thing I've {#Emph}been {#Prev}doing: slowing these bastards down. If everyone like me pitched in a little bit, this war would have been well over by now." },
				{ Cue = "/VO/MelinoeField_1931", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That may be so. But this is a matter between gods and Titans. I wouldn't want you to get hurt." },
				{ Cue = "/VO/Icarus_0004",
					Portrait = "Portrait_Icarus_Pleased_01",
					Text = "Bit late for that, Meli! Anyway, I've kept you for too long, but let me give you something I've been working on before I go — and these all work. I swear!" },
				PrePortraitExitFunctionName = _PLUGIN.guid .. ".MegaeraOathChoice",
				PrePortraitExitFunctionArgs = PresetEventArgs.StoryExpansionMegaeraOathChoices,
			},
        }
    },
	NPC_Megaera_Frozen_StoryExpansion = {
		Name = "NPC_Megaera_Frozen_StoryExpansion",
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



		Portrait = "Portrait_Persephone_Queen_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		InteractTextLineSets = {
        StoryExpansionFreeingMegaeraDialogue =
			{
				Name = "StoryExpansionFreeingMegaeraDialogue",
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
					Portrait = "StoryExpansion_Megaera_Default",
					Text = "{#Emp} Ugh... {#Prev} What happened? Who are you? Stand back. I am armed and ready to attack. You will answer my questions or face my whip." },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lady Megaera, it is truly an honour to meet you. I am Melinoë, daughter of Hades, and I am here to free you and destroy the Titan Chronos." },
				{ 
					Portrait = "StoryExpansion_Megaera_Standoffish",

					Text = "You do have the flaming feet of the Hades line. But with much greater bloodlust than your brother. I can certainly get behind that. Now, let us slay the Usurper for the glory of the House." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "{#Emph}<Sigh> {#Prev}Would that we could, O Fury, but I do not yet have a weapon powerful enough to strike down the Titan permanently. It is Headmistress Hecate's belief that rescuing the members of the House and learning more about our enemy is essential to our victory." },
{ 
					Portrait = "StoryExpansion_Megaera_Pleased",
					Text = "There is no-one I know more skilled in witchcraft than Hecate. I will place my trust in her plan, as your mother and Nyx often did. Does she have need for my wrath?" },
							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.8, UseChronosSound = true },
					Text = "I am certain that the Headmistress has a role for you battlefield skill already planned. But for now, we must escape back to the Crossroads before Chronos wakes."},
					{ 
					Portrait = "StoryExpansion_Megaera_Pleased",
					Text = "Chronos should be glad that we are retreating and that he is not tasting my whip. The next time we meet, I shall not be as merciful.",
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

for newNPCName, newNPCData in pairs(mod.MegaeraNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end