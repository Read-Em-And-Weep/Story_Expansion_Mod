ScreenData.StoryExpansionFateManipulationScreen =
{
    Name = "StoryExpansionFateManipulationScreen",
    Components = {},
	BlockPause = true,
	AllowAdvancedTooltip = false,
	UpgradesOrder = {
		"FateManipulationLessLikely",
		"FateManipulationMoreLikely",
		"FateManipulationMoreRare",
		"FateManipulationMoreDuo",
		"FateManipulationMoreLegendary",
		"FateManipulationHealOnPickup",
		"FateManipulationArmorOnPickup",
		"FateManipulationManaOnPickup",
		"FateManipulationGoldOnPickup",
		"FateManipulationSecondaryOnly",
	},
	ColorMap = {
		FateManipulationLessLikely=Color.PenaltyRed,
		FateManipulationMoreLikely=Color.Violet,
		FateManipulationMoreRare= Color.BoonPatchRare,
		FateManipulationMoreDuo= Color.BoonPatchDuo,
		FateManipulationMoreLegendary= Color.BoonPatchLegendary,
		FateManipulationHealOnPickup= Color.HotPink,
		FateManipulationArmorOnPickup= Color.SaddleBrown,
		FateManipulationManaOnPickup= Color.BoonPatchEpic,
		FateManipulationGoldOnPickup= Color.LightGold,
		FateManipulationSecondaryOnly= Color.BoonPatchPerfect,
	},
	TitleTextOrder = {

	},


    ComponentData =
	{
		DefaultGroup = "Combat_Menu_Overlay",
		UseNativeScreenCenter = true,

		Order =
		{
			"BackgroundTint",
			--"Background",
			"DialogueBoxGlow",
			"FateManipulationSpool",
			"DialogueBox",
            "DialogueTitleText",
			"DialogueExplainText",
			
			"ActionBarBackground",
		},
		
		BackgroundTint = 
		{
			Graphic = "rectangle01",
			Scale = 10,
			X = ScreenCenterX,
			Y = ScreenCenterY,
			Color = Color.Black,
			Alpha = 0.0,
			AlphaTarget = 0.75,
			AlphaTargetDuration = 0.3,
		},

		--[[Background = 
		{
			Animation = "WeaponShopIn",
			X = ScreenCenterX,
			Y = ScreenCenterY,
        },]]

		TitleText = 
		{
			Text = "StoryExpansionFateScreen_Title",
			X = ScreenCenterX,
			Y = 100,
			TextArgs =
			{
				FontSize = 32,
				OffsetX = 0, OffsetY = 0,
				Color = Color.White,
				Font = "P22UndergroundSCLightTitling",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 3},
				OutlineThickness = 3,
				Justification = "Center",
			}
		},

		SubtitleText = 
		{
			Text = "StoryExpansionFateScreen_Subtitle",
			X = ScreenCenterX,
			Y = 150,
			TextArgs =
			{
				FontSize = 19,
				OffsetX = 0, OffsetY = 0,
				Color = { 0.8, 0.8, 0.8, 1.0 },
				Font = "LatoItalic",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "Center",
			},
		},
		DialogueBoxGlow = {
			AnimationName = "NarrationBackgroundGlow",
			Scale = 1,
			X = ScreenCenterX + 200 - 198*2.5 - 100,
			Y = ScreenCenterY + 300 + 20
		},

		DialogueBox = {
			AnimationName = "DialogueSpeechBubble",
			Scale = 1,
			X = ScreenCenterX - 198*1.5 - 100,
			Y = ScreenCenterY + 264 + 20,
		},

		DialogueTitleText = {
			Text = "StoryExpansionFateScreen_DialogueTitle",
			X = ScreenCenterX - 198*1.5-200 - 100,
			Y = ScreenCenterY + 264-135,
			Alpha = 0,
			TextArgs =
			{
				FontSize = 32,
				OffsetX = 0, OffsetY = 18,
				Color = Color.DialogueSpeakerName,
				Font = "CaesarDressing",
				ShadowBlur = 1, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "CENTER",
			},
		},

		DialogueExplainText = {
			Text = "StoryExpansionFateScreen_Explain",
			X = ScreenCenterX - 198*1.5-200+180 - 100,
			Y = ScreenCenterY + 264-135+60,
			Alpha = 0,
			TextArgs =
			{
				Font = "LatoSemibold",
				VerticalJustification = "TOP",
				Justification = "LEFT",
				LineSpacingBottom = 4,
				OffsetX = -397,
				OffsetY = 45,
				Width = 833,
				FontSize = 24,
				Color = Color.DialogueText,
			},
		},

        FateManipulationSpool = {
            Animation = "StoryExpansionFateManipulationSpool",
			Alpha = 0,
			Scale = 0.8,
			X = ScreenCenterX + 150+400,
			Y = ScreenCenterY + 264 + 70,
        },

        ActionBarBackground =
		{
			AnimationName = "GUI\\ActionBar",
			X = ScreenCenterX,
			Y = UIData.ActionBarY,
			UseScreenScaleX = true,
		},
        ActionBarLeft =
		{
			X = UIData.ContextualButtonXLeft,
			Y = UIData.ContextualButtonY,
			AutoAlignContextualButtons = true,
			AutoAlignJustification = "Left",

			ChildrenOrder =
			{
			},

			Children =
			{
			},
		},

		ActionBarRight =
		{
			X = UIData.ContextualButtonXRight,
			Y = UIData.ContextualButtonY,
			AutoAlignContextualButtons = true,
			AutoAlignJustification = "Right",

			ChildrenOrder =
			{
				"CloseButton",
				"PrevUpgradeButton",
				"NextUpgradeButton",
			},

			Children =
			{
				--[[ResetAllButton = 
				{
					Graphic = "ContextualActionButton",
					GroupName = "Combat_Menu_Overlay",
					Alpha = 0.0,
					Data =
					{
						OnMouseOverFunctionName = "MouseOverContextualAction",
						OnMouseOffFunctionName = "MouseOffContextualAction",
						OnPressedFunctionName = "ShrineLogicResetAll",
						ControlHotkeys = { "MenuLeft", },
					},
					Text = "ShrineScreen_ResetAll",
					TextArgs = UIData.ContextualButtonFormatRight,
				},]]

				CloseButton = 
				{
					Graphic = "ContextualActionButton",
					GroupName = "Combat_Menu_Overlay",
					Data =
					{
						OnMouseOverFunctionName = "MouseOverContextualAction",
						OnMouseOffFunctionName = "MouseOffContextualAction",
						OnPressedFunctionName = _PLUGIN.guid..".CloseFateManipulationScreen",
						ControlHotkeys = { "Cancel", },
					},
					Text = "Menu_Exit",
					TextArgs = UIData.ContextualButtonFormatRight,
				},
				PrevUpgradeButton = 
				{
					Graphic = "ContextualActionButton",
					GroupName = "Combat_Menu_Overlay",
					Data =
					{
						OnMouseOverFunctionName = "MouseOverContextualAction",
						OnMouseOffFunctionName = "MouseOffContextualAction",
						OnPressedFunctionName = _PLUGIN.guid..".FateManipulationScreenPrevUpgrade",
						ControlHotkeys = { "PrevLayout", },
					},
					Text = "StoryExpansionPrevFateUpgrade",
					TextArgs = UIData.ContextualButtonFormatRight,
				},
				NextUpgradeButton = 
				{
					Graphic = "ContextualActionButton",
					GroupName = "Combat_Menu_Overlay",
					Data =
					{
						OnMouseOverFunctionName = "MouseOverContextualAction",
						OnMouseOffFunctionName = "MouseOffContextualAction",
						OnPressedFunctionName = _PLUGIN.guid..".FateManipulationScreenNextUpgrade",
						ControlHotkeys = { "NextLayout", },
					},
					Text = "StoryExpansionNextFateUpgrade",
					TextArgs = UIData.ContextualButtonFormatRight,
				},
			},
		},
    },
}