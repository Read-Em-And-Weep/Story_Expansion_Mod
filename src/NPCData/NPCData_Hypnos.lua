mod.HypnosNPCData = {
    NPC_Hypnos_Hub_StoryExpansion = {
		Name = "NPC_Hypnos_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "586054",
		Offset = {X =140 , Y = 0},
		GazeTarget = {X = 140, Y = 125},
	
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
				PathTrue = { "GameState", "TextLinesRecord", "HypnosFinalDreamMeeting01" },
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
    NPC_Hypnos_Field_StoryExpansion = {
        InheritFrom = {"NPC_Neutral"},
        Name = "NPC_Hypnos_Field_StoryExpansion",
        
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
		    ModdedThanChat01Placeholder =
			{
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
        }
    },
}

for newNPCName, newNPCData in pairs(mod.HypnosNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end