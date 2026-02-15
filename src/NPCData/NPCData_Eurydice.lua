mod.EurydiceNPCData = {
    NPC_Eurydice_Hub_Traits_StoryExpansion = {
		Name = "NPC_Eurydice_Hub_Traits_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

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

        CanReceiveGift = false,
  
		    ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "ZeusFirstPickUp" },
			}
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
}

for newNPCName, newNPCData in pairs(mod.EurydiceNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end

import 'EurydiceScreenLogic.lua'