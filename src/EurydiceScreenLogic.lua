import "EurydiceScreenData.lua"
function mod.OpenEurydiceFoodScreen()
local screen = DeepCopyTable( ScreenData.StoryExpansionFoodScreen )
	if IsScreenOpen( screen.Name ) then
		return
	end

	AltAspectRatioFramesShow()

	killTaggedThreads( CombatUI.HideThreadName )
	SetPlayerInvulnerable( screen.Name )
	OnScreenOpened( screen )
	HideCombatUI( screen.Name, screen.TraitTrayArgs )
	CreateScreenFromData( screen, screen.ComponentData )
	

	screen.ShopItemStartX = screen.ShopItemStartX + ScreenCenterNativeOffsetX
	screen.ShopItemStartY = screen.ShopItemStartY + ScreenCenterNativeOffsetY

	---UpdateStoreOptionsDictionary() may need to do a version of this idk yet


	local components = screen.Components
	ModifyTextBox({ Id = components.TitleText.Id, Text = "UpgradeChoiceMenu_Title_StoryExpansionEurydiceFood" })
	ModifyTextBox({ Id = components.FlavorText.Id, Text = "StoryExpansionFoodOffered_FlavorText01"})
	wait( 0.2 )
	mod.CreateFoodButtons( screen )

	screen.KeepOpen = true
	HandleScreenInput( screen )
end

function mod.CreateFoodButtons(screen)
	local itemLocationStartY = screen.ShopItemStartY
	local itemLocationYSpacer = screen.ShopItemSpacerY
	local itemLocationMaxY = itemLocationStartY + 4 * itemLocationYSpacer

	local itemLocationStartX = screen.ShopItemStartX
	local itemLocationXSpacer = screen.ShopItemSpacerX
	local itemLocationMaxX = itemLocationStartX + 1 * itemLocationXSpacer

	local itemLocationX = itemLocationStartX
	local itemLocationY = itemLocationStartY

	local components = screen.Components

	local numButtons = 3
	local firstUseable = false
	for itemIndex = 1, numButtons do
		local upgradeData = CurrentRun.StoryExpansionFoodOptions[itemIndex]
		if upgradeData ~= nil then
			if not upgradeData.Processed then
				if upgradeData.Type == "Trait" then
					upgradeData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = upgradeData.Name, Rarity = upgradeData.Rarity })
					upgradeData.Type = "Trait"
					SetTraitTextData( upgradeData )
				upgradeData.Processed = true
			--elseif upgradeData.Type == "Trait" then
			--	RecalculateStoreTraitDurations( upgradeData )
			end
            SetTraitTextData( upgradeData )

			local tooltipData = upgradeData

			local purchaseButtonKey = "PurchaseButton"..itemIndex			
			local purchaseButton = DeepCopyTable( ScreenData.UpgradeChoice.PurchaseButton )
			purchaseButton.Animation = upgradeData.InfoBackingAnimation
			purchaseButton.X = itemLocationX
			purchaseButton.Y = itemLocationY
			components[purchaseButtonKey] = CreateScreenComponent( purchaseButton )
			if not instant then
				SetAlpha({ Id = components[purchaseButtonKey].Id, Fraction = 0.1 })
				SetAlpha({ Id = components[purchaseButtonKey].Id, Fraction = 1, Duration = 0.05 * itemIndex, EaseIn = 0, EaseOut = 1 })
			end
			local highlight = ShallowCopyTable( ScreenData.UpgradeChoice.Highlight )
			highlight.X = purchaseButton.X
			highlight.Y = purchaseButton.Y
			components[purchaseButtonKey.."Highlight"] = CreateScreenComponent( highlight )
			components[purchaseButtonKey].Highlight = components[purchaseButtonKey.."Highlight"]
	
			if upgradeData.Icon ~= nil then
				local icon = DeepCopyTable( ScreenData.UpgradeChoice.Icon )
				icon.X = itemLocationX + ScreenData.UpgradeChoice.IconOffsetX
				icon.Y = itemLocationY + ScreenData.UpgradeChoice.IconOffsetY 
				icon.Animation = upgradeData.Icon
				components["Icon"..itemIndex] = CreateScreenComponent( icon )
			end
			local purchaseButtonTitleKey = "PurchaseButtonTitle"..itemIndex
			components[purchaseButtonTitleKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = itemLocationX, Y = itemLocationY })

			local needsQuestIcon = false
			if not GameState.TraitsTaken[upgradeData.Name] and not GameState.ItemInteractions[upgradeData.Name] and HasActiveQuestForName( upgradeData.Name ) then
				needsQuestIcon = true
			end
			if needsQuestIcon then
				components[purchaseButtonKey.."QuestIcon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu",
					X = itemLocationX + ScreenData.UpgradeChoice.QuestIconOffsetX - ScreenData.UpgradeChoice.ButtonOffsetX,
					Y = itemLocationY + ScreenData.UpgradeChoice.QuestIconOffsetY })
				SetAnimation({ DestinationId = components[purchaseButtonKey.."QuestIcon"].Id, Name = "QuestItemFound" })
				-- Silent toolip
				CreateTextBox({ Id = components[purchaseButtonKey].Id, TextSymbolScale = 0, Text = "TraitQuestItem", Color = Color.Transparent, LuaKey = "TooltipData", LuaValue = tooltipData })
			end
			
			local rarity = upgradeData.Rarity
			local customRarityLevels =
			{
			Common ="TraitLevel_Keepsake1",
			Rare = "TraitLevel_Keepsake2",
			Epic ="TraitLevel_Keepsake3",
			Heroic = "TraitLevel_Keepsake4",
			} 
			local customRarityColors = {
				Common = Color.BoonPatchCommon,
				Rare = Color.BoonPatchRare,
				Epic = Color.BoonPatchEpic,
				Heroic = Color.BoonPatchHeroic
			}
			local rarityText = customRarityLevels[rarity]
			local rarityColor = customRarityColors[rarity]

			local titleText = DeepCopyTable( ScreenData.UpgradeChoice.TitleText )
			titleText.Id = components[purchaseButtonTitleKey].Id
			titleText.Color = rarityColor
			titleText.Text = GetTraitTooltip( upgradeData )
			titleText.LuaKey = "TempTextData"
			titleText.LuaValue = upgradeData
			CreateTextBox( titleText )

			local descriptionText = DeepCopyTable( ScreenData.UpgradeChoice.DescriptionText )
			descriptionText.Id = components[purchaseButtonKey].Id
			descriptionText.Text = GetTraitTooltip( upgradeData )
			descriptionText.LuaKey = "TooltipData"
			descriptionText.LuaValue = upgradeData
			CreateTextBoxWithFormat( descriptionText )
			
			SetInteractProperty({ DestinationId = components[purchaseButtonKey].Id, Property = "TooltipOffsetX", Value = -800 })
			

			local costText = DeepCopyTable( ScreenData.UpgradeChoice.CostText )
			costText.Text = rarityText
			costText.Id = components[purchaseButtonTitleKey].Id
			CreateTextBox( costText )


			local statLines = ShallowCopyTable(upgradeData.StatLines)
			if upgradeData.CustomStatLinesWithShrineUpgrade ~= nil and GetNumShrineUpgrades( upgradeData.CustomStatLinesWithShrineUpgrade.ShrineUpgradeName ) > 0 then
				statLines = upgradeData.CustomStatLinesWithShrineUpgrade.StatLines
			end
			local statLineData = upgradeData
			if statLines then
				for lineNum, statLine in ipairs(statLines) do
					if statLine ~= "" then

						local offsetY = (lineNum - 1) * ScreenData.UpgradeChoice.LineHeight

						local statLineLeft = DeepCopyTable(ScreenData.UpgradeChoice.StatLineLeft)
						statLineLeft.Id = components[purchaseButtonKey].Id
						statLineLeft.Text = statLine
						statLineLeft.OffsetY = offsetY
						statLineLeft.LuaValue = statLineData
						statLineLeft.AppendToId = descriptionText.Id
						CreateTextBoxWithFormat( statLineLeft )

						local statLineRight = DeepCopyTable(ScreenData.UpgradeChoice.StatLineRight)
						statLineRight.Id = components[purchaseButtonKey].Id
						statLineRight.Text = statLine
						statLineRight.OffsetY = offsetY
						statLineRight.AppendToId = descriptionText.Id
						statLineRight.LuaValue = statLineData
						CreateTextBoxWithFormat( statLineRight )

					end
				end
			end

			local button = components[purchaseButtonKey]
			button.Screen = screen
			AttachLua({ Id = button.Id, Table = button })
			button.Data = upgradeData
			button.WeaponName = currentWeapon
			button.Index = itemIndex
			button.TitleId = components[purchaseButtonTitleKey].Id
			button.OnPressedFunctionName = _PLUGIN.guid..".HandleFoodSelection"
            --TODO ONPRESSEDFUNCTIONNAME
			button.OnMouseOverFunctionName = "MouseOverWellShopButton"
			button.OnMouseOffFunctionName = "MouseOffWellShopButton"
			if not firstUseable then
				TeleportCursor({ OffsetX = itemLocationX, OffsetY = itemLocationY, ForceUseCheck = true })
				firstUseable = true
			end
			if instant then
				ModifyTextBox({ Id = components[purchaseButtonKey].Id, FadeTarget = 1, FadeDuration = 0})
				ModifyTextBox({ Id = components[purchaseButtonTitleKey].Id, FadeTarget = 1, FadeDuration = 0})
			end
            if CurrentRun.CurrentRoom.StoryExpansionFoodScreen == nil then
                CurrentRun.CurrentRoom.StoryExpansionFoodScreen = {}
            end
			if CurrentRun.CurrentRoom.StoryExpansionFoodScreen.Buttons == nil then
				CurrentRun.CurrentRoom.StoryExpansionFoodScreen.Buttons = {}
			end
			table.insert(CurrentRun.CurrentRoom.StoryExpansionFoodScreen.Buttons, components[purchaseButtonKey])
		end
		itemLocationX = itemLocationX + itemLocationXSpacer
		if itemLocationX >= itemLocationMaxX then
			itemLocationX = itemLocationStartX
			itemLocationY = itemLocationY + itemLocationYSpacer
		end
	end
end
end

function mod.HandleFoodSelection( screen, button )
	local upgradeData = button.Data
	

	PlaySound({ Name = screen.PurchaseSound })
	CurrentRun.StoryExpansionFoodSelected = true
	AddTraitToHero({ TraitData = upgradeData, SkipQuestStatusCheck = true, SkipAddToHUD = true})
    GameState.StoryExpansionLastFoodChosen = upgradeData

		SetAnimation({ Name = "WellShopOut", DestinationId = screen.Components.ShopBackground.Id })
		mod.CloseFoodScreen( screen, button )
        	CurrentRun.CurrentRoom.StoryExpansionFoodScreen.Buttons = {}

end

function mod.CloseFoodScreen(screen, button)
    	local components = screen.Components
	local useableOffButtonIds = {}
    for index = 1, 3 do
		if components["PurchaseButton"..index] and components["PurchaseButton"..index].Id then
			table.insert(useableOffButtonIds, components["PurchaseButton"..index].Id)
		end
	end
	if screen.Components.ShopBackgroundEurydice ~= nil then
		SetAnimation({ DestinationId = screen.Components.ShopBackgroundEurydice.Id, Name = "StoryExpansionEurydiceOfferFoodOut" })
	end
    --UseableOff({ Ids = useableOffButtonIds })
        AltAspectRatioFramesHide()
    OnScreenCloseStarted( screen )
    CloseScreen( GetAllIds( screen.Components ), 0.15 )
	OnScreenCloseFinished( screen )
	ShowCombatUI( screen.Name )
    SetPlayerVulnerable( screen.Name )
end

modutil.mod.Path.Wrap("StartNewRun", function(base, prevRun, args)
    local valueToReturn = base(prevRun, args)
    if GameState.StoryExpansionLastFoodChosen then
        AddTraitToHero({ TraitData = GameState.StoryExpansionLastFoodChosen, SkipQuestStatusCheck = true, SkipAddToHUD = true})
		if GameState.StoryExpansionLastFoodChosen.AcquireFunctionName then
			thread(CallFunctionName, GameState.StoryExpansionLastFoodChosen.AcquireFunctionName, GameState.StoryExpansionLastFoodChosen.AcquireFunctionArgs, GameState.StoryExpansionLastFoodChosen)
		end
        GameState.StoryExpansionLastFoodChosen = nil
    end
    return valueToReturn
end)

modutil.mod.Path.Wrap("KillHero", function(base,victim, triggerArgs)
	mod.ChooseFoodOptions()
	return base(victim,triggerArgs)
end)

function mod.ChooseFoodOptions()
    local eligibleFoods ={}
    CurrentRun.StoryExpansionFoodOptions = {}
    --CurrentRun.StoryExpansionFoodOptionsRarities = {}
    for i, option in ipairs(PresetEventArgs["StoryExpansionEurydiceFoodChoices"]) do
		if option.GameStateRequirements == nil or IsGameStateEligible(option, option.GameStateRequirements) then
			if option.Rarity == "Common" or option.Rarity == "Rare" or option.Rarity == "Epic" or option.Rarity == "Heroic" then
                option.Rarity = "Common"
				if RandomChance(0.25) then
                    option.Rarity = "Rare"
                end
                if RandomChance(0.1) then
                    option.Rarity = "Epic"
                end
                if RandomChance(0.05) then 
                    option.Rarity = "Heroic"
                end
            end
            table.insert(eligibleFoods, option)
		end
	end
    for variable =1, 3, 1 do
        if #eligibleFoods > 0 then
            --local chosenFood = RemoveRandomValue(eligibleFoods)
            --table.insert(CurrentRun.StoryExpansionFoodOptions, chosenFood[1])
            table.insert(CurrentRun.StoryExpansionFoodOptions, RemoveRandomValue(eligibleFoods))
            --table.insert(CurrentRun.StoryExpansionFoodOptionsRarities, chosenFood[2])
        end
    end
end

function mod.EquipAllFoods() --Debug
    CurrentRun.StoryExpansionFoodOptions = {}
    --CurrentRun.StoryExpansionFoodOptionsRarities = {}
    for i, option in ipairs(PresetEventArgs["StoryExpansionEurydiceFoodChoices"]) do
		local traitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = option.Name, Rarity = "Epic" })
		AddTraitToHero({ TraitData = traitData, SkipQuestStatusCheck = true, SkipAddToHUD = true})
		if traitData.AcquireFunctionName then
		thread(CallFunctionName, traitData.AcquireFunctionName, traitData.AcquireFunctionArgs, traitData)
		end
	end
end
