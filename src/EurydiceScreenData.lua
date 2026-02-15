ScreenData.StoryExpansionFoodScreen =
{
    Name = "StoryExpansionFoodScreen",
	Components = {},
	TraitTrayArgs =
	{
		IgnoreHideMoney = true,
	},
	FreezePlayerArgs =
	{
		DisableTray = false,
	},			
	BlockPause = true,
	AllowAdvancedTooltip = false, -- Block the normal hotkey, works through TraitTrayButton
	CloseAnimationName = "WellShopOut",

	TitleText =
	{
		FontSize = 27,
		OffsetX = -420, OffsetY = -60,
		Font = "P22UndergroundSCMedium",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
		Justification = "Left",
		LuaKey = "TooltipData",
		LuaValue = {},
		DataProperties =
		{
			OpacityWithOwner = true,
		},
	},
	FlavorText = 
		{
			TextArgs =
			{
				FontSize = 19,
				OffsetY = -415, Width = 1040,
				Color = { 0.8, 0.8, 0.8, 1.0 },
				Font = "LatoItalic",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "Center",
			},
		},

	GamepadNavigation =
	{
		FreeFormSelectWrapY = true,
		FreeFormSelecSearchFromId = 0,
		FreeFormSelectStepDistance = 10,
	},

	PurchaseSound = "/Leftovers/World Sounds/ClickSplash2",

	ShopItemStartX = ScreenCenterX+210,
	ShopItemSpacerX = 820,
	ShopItemStartY = 335,
	ShopItemSpacerY = 240,

	ComponentData =
	{
		DefaultGroup = "Combat_Menu_Overlay",
		UseNativeScreenCenter = true,
		
		Order =
		{
			"BackgroundTint",
			"ShopBackground",
			"ShopBackgroundEurydice",
			"ActionBarBackground",
			"TitleText",
			"FlavorText",
		},

		BackgroundTint = 
		{
			Graphic = "rectangle01",
			GroupName = "Combat_Menu_Backing",
			Scale = 4.0,
			UseScreenScaleX = true,
			UseScreenScaleY = true,
			X = ScreenCenterX,
			Y = ScreenCenterY,
			Color = {0.15, 0.15, 0.15, 0.85}
		},

		ShopBackground = 
		{
			AnimationName = "WellShopIn",
			GroupName = "Combat_Menu_Backing", 
			OffsetX = 0, 
			OffsetY = 190,

		},

		ShopBackgroundEurydice = 
		{
			Graphic = "StoryExpansionBoonSelectEurydice",
			X = ScreenCenterX,
			Y = ScreenCenterY+5,
		},

		ActionBarBackground =
		{
			AnimationName = "GUI\\ActionBar",
			X = ScreenCenterX,
			Y = UIData.ActionBarY,
			UseScreenScaleX = true,
		},

		ActionBar =
		{
			X = UIData.ContextualButtonXRight,
			Y = UIData.ContextualButtonY,
			AutoAlignContextualButtons = true,
			AutoAlignJustification = "Right",

			ChildrenOrder =
			{
				"CloseButton",
				"TraitTrayButton",
				"SelectButton",
				"RerollButton",
			},

			Children =
			{
				SelectButton =
				{
					Graphic = "ContextualActionButton",
					GroupName = "Combat_Menu_Overlay",
					Alpha = 0.0,
					Data =
					{
						-- Dummy button
					},
					Text = "Menu_Buy",
					TextArgs = UIData.ContextualButtonFormatRight,
				},
				
				RerollButton =
				{
					Graphic = "ContextualActionButton",
					Alpha = 0.0,
					Data =
					{
						OnMouseOverFunctionName = "MouseOverContextualAction",
						OnMouseOffFunctionName = "MouseOffContextualAction",
						OnPressedFunctionName = "AttemptPanelReroll",
						ControlHotkeys = { "Reroll", },
					},
					Text = " ",
					TextArgs = UIData.ContextualButtonFormatRight,
				},

				CloseButton =
				{
					Graphic = "ContextualActionButton",
					GroupName = "Combat_Menu_Overlay",
					Data =
					{
						OnMouseOverFunctionName = "MouseOverContextualAction",
						OnMouseOffFunctionName = "MouseOffContextualAction",
						OnPressedFunctionName = _PLUGIN.guid..".CloseFoodScreen",
						ControlHotkeys = { "Cancel", },
					},
					Text = "Menu_Exit",
					TextArgs = UIData.ContextualButtonFormatRight,
				},

				TraitTrayButton = 
				{
					Graphic = "ContextualActionButton",
					Data =
					{
						OnMouseOverFunctionName = "MouseOverContextualAction",
						OnMouseOffFunctionName = "MouseOffContextualAction",
						OnPressedFunctionName = "UpgradeChoiceScreenOpenTraitTray",
						ControlHotkeys = { "AdvancedTooltip", },
					},
					Text = "Menu_OpenTraitTray",
					TextArgs = UIData.ContextualButtonFormatRight,
				},
			},
		},
		TitleText = 
		{
			TextArgs =
			{
				FontSize = 32,
				OffsetX = 0, OffsetY = -455,
				Color = Color.White,
				Font = "P22UndergroundSCLightTitling",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 3},
				OutlineThickness = 3,
				Justification = "Center",
			},
		},
		FlavorText = 
		{
			TextArgs =
			{
				FontSize = 19,
				OffsetY = -415, Width = 1040,
				Color = { 0.8, 0.8, 0.8, 1.0 },
				Font = "LatoItalic",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "Center",
			},
		},
	}
}

PresetEventArgs["StoryExpansionEurydiceFoodChoices"] = {
   {
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceAphroditeTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "AphroditeFirstPickUp" },
			},
				}
			},
            {
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceHephaestusTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "HephaestusFirstPickUp" },
			},
				}
			},
            {
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceAresTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "AresFirstPickUp" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceZeusTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "ZeusFirstPickUp" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceHeraTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "HeraFirstPickUp", "HeraFirstPickUpAlt" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForcePoseidonTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "PoseidonFirstPickUp" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceDemeterTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "DemeterFirstPickUp" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceHestiaTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "HestiaFirstPickUp" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodForceApolloTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "ApolloFirstPickUp" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodMorePotentPomsTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodBackstabTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodAthenaBoonTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "AthenaFirstMeeting" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodArtemisBoonTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "ArtemisFirstMeeting" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodDionysusBoonTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "DionysusFirstMeeting", "DionysusFirstMeeting_B" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodDamageForVulnerabilityTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodCritChanceTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodRandomCardDrawTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {

			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodTalentPointsTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
						
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodSorceryChargeTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
						
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodSecretDoorTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "ChaosFirstPickUp" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodMaxHealthTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
						
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodMaxManaTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
						
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodBonusGoldTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
						
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodBossKudosTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
                    {
					Path = { "GameState", "WorldUpgrades", },
					HasAll = { "WorldUpgradeExchangeShop", },
				},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodDuoChanceTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodLegendaryChanceTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodEpicChanceTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodChamberStacksTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodDamageCapTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodDiminishingDodgeTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "EchoFirstMeeting" },
			},
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodChannelSpeedTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
				}
			},
			{
				Type = "Trait",
				Name = gods.GetInternalBoonName("EurydiceFoodRandomElementsTrait"),
				Rarity = "Common",
				GameStateRequirements =
				{
					{
			PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeElementalBoons" },
		},
				}
			},
}