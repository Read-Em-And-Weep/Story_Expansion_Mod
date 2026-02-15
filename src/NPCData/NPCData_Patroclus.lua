PresetEventArgs["StoryExpansionPatroclusBenefitChoices"] = {
		SkipComponents =
		{
			"OlympusBackground",
			"ShopBackground",
			"ShopLighting",
		},

		DefaultGroup = "Combat_Menu_Overlay_Backing",
		ButtonGroupName = "Combat_Menu_Overlay_Backing",
		PurchaseAnimationGroupName = "Combat_Menu_Overlay_Additive",
		
		PortraitShift = { Distance = 150, Angle = 180, Duration = 0.3, EaseIn = 0.5, EaseOut = 1.0, },

		OverwriteTableKeys =
		{
			SkipUpgradePresentationAndExitUnlock = true,	
		},

		UpgradeOptions =
		{
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedTemporaryEmptySlotDamageTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
				Path = { "CurrentRun", "Hero", "SlottedTraits" },
				NotHasAll = {"Melee", "Secondary" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasNone = { "TemporaryEmptySlotDamageTrait" },
			},
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedTemporaryImprovedExTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasNone = { "TemporaryImprovedExTrait" },
			},
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedLimitedSwapTraitDrop"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasNone = { "LimitedSwapBonusTrait" },
			},
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedTemporaryMoveSpeedTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{

								},
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedTemporaryImprovedDefenseTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasNone = { "TemporaryImprovedDefenseTrait" },
			},
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedTemporaryDoorHealTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedLastStandDrop"),
				Rarity = "Common",
				GameStateRequirements =
				{
					NamedRequirements = { "MissingLastStand", },
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedResourcesDrops"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				ItemName = gods.GetInternalBoonName("ImprovedTemporaryBoonRarityTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionPatroclusGrantsReward01" },
					},
				},
				PrioritySlotEntranceAnimation = "BoonEntranceNew",
				PriorityRequirements =
				{
					{
						PathFalse = { "GameState", "TraitsSeen", gods.GetInternalBoonName("ImprovedTemporaryBoonRarityTrait") },
					},
				},
			},
		},
    }



mod.PatroclusNPCData = {
    NPC_Patroclus_Field_StoryExpansion = {
        InheritFrom = {"NPC_Neutral"},
        Name = "NPC_Patroclus_Field_StoryExpansion",
        
		AnimOffsetZ = 0,
		ExcludeFromDamageDealtRecord = true,
		PreEventFunctionName = "AngleNPCToHero",

        UpgradeScreenOpenSound = "/SFX/WeaponUpgradeHammerDrop2",
		UpgradeSelectedSound = "/SFX/HammerBoonChoice",
		UpgradeAcquiredAnimation = "MelinoeEquip",
		UpgradeAcquiredAnimationDelay = 1.2,

		Portrait = "Portrait_Thanatos_Default_01",
		MenuTitle = "StoryExpansionPatroclusChoiceMenu_Title",
		BoonInfoTitleText = "Codex_BoonInfo_Icarus",
		FlavorTextIds =
		{
			"StoryExpansionPatroclusChoiceMenu_FlavorText01",
		},

        Traits =
		{
			gods.GetInternalBoonName("ImprovedTemporaryEmptySlotDamageTrait"),
			gods.GetInternalBoonName("ImprovedTemporaryImprovedExTrait"),
			gods.GetInternalBoonName("ImprovedLimitedSwapTraitDrop"),
			gods.GetInternalBoonName("ImprovedTemporaryImprovedDefenseTrait"),
			gods.GetInternalBoonName("ImprovedTemporaryMoveSpeedTrait"),
			gods.GetInternalBoonName("ImprovedTemporaryDoorHealTrait"),
			gods.GetInternalBoonName("ImprovedLastStandDrop"),
			gods.GetInternalBoonName("ImprovedResourcesDrops"),
			gods.GetInternalBoonName("ImprovedTemporaryBoonRarityTrait"),

		},
        InteractTextLineSets =
		{
			PatroclusFirstMeeting =
			{
				Name = "PatroclusFirstMeeting",
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
					Portrait = "Portrait_Mel_Vulnerable_01",
					Text = "Bit late for that, Meli! Anyway, I've kept you for too long, but let me give you something I've been working on before I go — and these all work. I swear!" },
				PrePortraitExitFunctionName = _PLUGIN.guid .. ".PatroclusBenefitChoice",
				PrePortraitExitFunctionArgs = PresetEventArgs.StoryExpansionPatroclusBenefitChoices,
			},
        }
    }	
	}

for newNPCName, newNPCData in pairs(mod.PatroclusNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end
