import "ScreenData_Fate.lua"

function mod.OpenFateManipulationScreen()
    local screen = DeepCopyTable( ScreenData.StoryExpansionFateManipulationScreen )
	if IsScreenOpen( screen.Name ) then
		return
	end

	AltAspectRatioFramesShow()

	killTaggedThreads( CombatUI.HideThreadName )
	SetPlayerInvulnerable( screen.Name )
	OnScreenOpened( screen )
	HideCombatUI( screen.Name, screen.TraitTrayArgs )
	CreateScreenFromData( screen, screen.ComponentData )
	

	--screen.ShopItemStartX = screen.ShopItemStartX + ScreenCenterNativeOffsetX
	--screen.ShopItemStartY = screen.ShopItemStartY + ScreenCenterNativeOffsetY

	---UpdateStoreOptionsDictionary() may need to do a version of this idk yet
	--local flavorTexts = {"StoryExpansionFoodOffered_FlavorText01", "StoryExpansionFoodOffered_FlavorText02", "StoryExpansionFoodOffered_FlavorText03", "StoryExpansionFoodOffered_FlavorText04", "StoryExpansionFoodOffered_FlavorText05"}
	--local flavorText = RemoveRandomValue(flavorTexts)

	local components = screen.Components
	--ModifyTextBox({ Id = components.SubtitleText.Id, Text = flavorText})
	wait( 0.2 )

	GameState.StoryExpansionFateManipulationsActive = GameState.StoryExpansionFateManipulationsActive or {}
	screen.CurrentFateManipulationVisible = screen.UpgradesOrder[1]
	mod.CreateFateGodIcons( screen )
	mod.SetFateManipulationScreenText(screen)
	SetAlpha({Id = components.FateManipulationSpool.Id, Fraction = 1, Duration = 0.2, EaseIn = 0, EaseOut = 1})
	mod.CreateSpoolThread(screen)

	screen.KeepOpen = true
	HandleScreenInput( screen )
end

function mod.SetFateManipulationScreenText(screen)
	local components = screen.Components
	ModifyTextBox({ Id = components.DialogueTitleText.Id, Text = screen.CurrentFateManipulationVisible .. "_Title" })
	ModifyTextBox({ Id = components.DialogueExplainText.Id, Text = screen.CurrentFateManipulationVisible .. "_Explain" })
	SetAlpha({Id = components.DialogueTitleText.Id, Fraction = 1, Duration = 0.2, EaseIn = 0, EaseOut = 1})
	SetAlpha({Id = components.DialogueExplainText.Id, Fraction = 1, Duration = 0.2, EaseIn = 0, EaseOut = 1})
end

function mod.FateManipulationScreenPrevUpgrade(screen,button)
	local components = screen.Components
	local currentUpgrade = screen.CurrentFateManipulationVisible
	local key = GetKey(screen.UpgradesOrder, currentUpgrade)
	if key == 1 then
		key = TableLength(screen.UpgradesOrder)
	else
		key = key - 1
	end
	screen.CurrentFateManipulationVisible = screen.UpgradesOrder[key]
	mod.SetFateManipulationScreenText(screen)
	mod.UpdateSpoolThreads(screen)
end

function mod.FateManipulationScreenNextUpgrade(screen,button)
	local components = screen.Components
	local currentUpgrade = screen.CurrentFateManipulationVisible
	local key = GetKey(screen.UpgradesOrder, currentUpgrade)
	if key == TableLength(screen.UpgradesOrder) then
		key = 1
	else
		key = key + 1
	end
	screen.CurrentFateManipulationVisible = screen.UpgradesOrder[key]
	mod.SetFateManipulationScreenText(screen)
	mod.UpdateSpoolThreads(screen)
end

function mod.CreateSpoolThread(screen)
	local components = screen.Components
	local maxThreads = 4
	for i= 1,maxThreads,1 do
		local thread = CreateScreenComponent({
				Name = "BlankObstacle",
				Group = screen.ComponentData.DefaultGroup,
				X = ScreenCenterX + 150+220+365/3*(i-1),
				Y = ScreenCenterY + 264 + 65,
				Animation = "StoryExpansionFateManipulationThread",
				Scale = 1,
				Alpha = 0,
			})
			components["FateThread"..i] = thread
	end
	mod.UpdateSpoolThreads(screen)
end

function mod.UpdateSpoolThreads(screen)
	local components = screen.Components
	local maxThreads = mod.GetMaxAvailableThreads()
	local numThreads = math.max(maxThreads - mod.GetThreadsBeingUsed(), 0)
	for i=1,maxThreads,1 do
		if i <= numThreads then
			local currentUpgrade = screen.CurrentFateManipulationVisible
			SetColor({Id = components["FateThread"..i].Id,  Color = screen.ColorMap[currentUpgrade], Duration = 0.2, EaseIn = 0, EaseOut = 1})
			SetAlpha({Id = components["FateThread"..i].Id, Fraction = 1, Duration = 0.2, EaseIn = 0, EaseOut = 1})
		else
			SetAlpha({Id = components["FateThread"..i].Id, Fraction = 0, Duration = 0.2, EaseIn = 0, EaseOut = 1})
		end
	end
end

function mod.GetThreadsBeingUsed()
	return TableLength(GameState.StoryExpansionFateManipulationsActive)
end

function mod.GetMaxAvailableThreads()
	return 4
end

function mod.CreateFateGodIcons(screen)
    local components = screen.Components
	local gods = {"ZeusUpgrade", "HeraUpgrade", "PoseidonUpgrade", "DemeterUpgrade", "HestiaUpgrade", "ApolloUpgrade", "AphroditeUpgrade", "HephaestusUpgrade", "AresUpgrade"}
	
	local itemLocationX = ScreenCenterX - (188*2)*2
	local itemLocationY = ScreenCenterY - 116*2.5

	for index, god in ipairs(gods) do

		local buttonName = "StoryExpansionButtonFateItem"
		local button = CreateScreenComponent({
				Name = buttonName,
				Group = screen.ComponentData.DefaultGroup,
				X = itemLocationX,
				Y = itemLocationY,
				Animation = LootData[god].DoorIcon,
				Scale = 1,
				Alpha = 0,
			})
			SetAlpha({Id=button.Id, Fraction = 1, Duration = 0.2, EaseIn = 0, EaseOut = 1})
			components["ItemButton"..god] = button
			button.God = god
			AttachLua({ Id = button.Id, Table = button })
			button.Screen = screen

			local glow = CreateScreenComponent({
				Name = "BlankObstacle",
				Group = screen.ComponentData.DefaultGroup,
				X = itemLocationX,
				Y = itemLocationY+30+90,
				Angle = RandomInt(0,364),
				Animation = "StoryExpansionFateManipulationWrap",
				Scale = 1.5,
				Alpha = 0,
			})
			if GameState.StoryExpansionFateManipulationsActive[button.God] then
				SetColor({Id = glow.Id, Color = screen.ColorMap[GameState.StoryExpansionFateManipulationsActive[button.God]], Duration = 0.2, EaseIn = 0, EaseOut = 1})
				SetAlpha({Id = glow.Id, Fraction = 1.0, Duration = 0.2, EaseIn = 0, EaseOut = 1})
			end
		--SetAlpha({Id = glow.Id, Alpha = 0.0})

		--SetColor({Id = glow.Id, Color = Color.Red})


		components["ItemButton"..god.."glow"] = glow
		button.Glow = glow
		itemLocationX = itemLocationX + 188*2
		if index == 5 then
			itemLocationX = ScreenCenterX - (188*2)*1.5
			itemLocationY = itemLocationY + 116*2
		end
		button.OnMouseOverFunctionName = _PLUGIN.guid..".FateScreenMouseOverGodIcon"
		button.OnMouseOffFunctionName = _PLUGIN.guid..".FateScreenMouseOffGodIcon"
		button.OnPressedFunctionName = _PLUGIN.guid..".InteractWithFateGodIcon"
	end
end

function mod.InteractWithFateGodIcon(screen, button)
	local components = screen.Components
	local currentUpgrade = screen.CurrentFateManipulationVisible
	local changeMade =false
	if GameState.StoryExpansionFateManipulationsActive[button.God] then
		local glow = button.Glow
		SetAlpha({Id = glow.Id, Alpha = 0.0, Duration = 0.2, EaseIn = 0, EaseOut = 1})
		GameState.StoryExpansionFateManipulationsActive[button.God] = nil
		changeMade = true
	else
		if (mod.GetMaxAvailableThreads()-mod.GetThreadsBeingUsed()) > 0 then
		local glow = button.Glow
		SetColor({Id = glow.Id, Color = screen.ColorMap[currentUpgrade], Duration = 0.2, EaseIn = 0, EaseOut = 1})
		SetAlpha({Id = glow.Id, Fraction = 1.0, Duration = 0.2, EaseIn = 0, EaseOut = 1})
		GameState.StoryExpansionFateManipulationsActive[button.God] = currentUpgrade
		changeMade = true
		else
			local spool = screen.Components.FateManipulationSpool
			Shake({ Id = spool.Id, Distance = 3, Speed = 1000, Duration = 0.2 })
			Flash({ Id = spool.Id, Speed = 4, MinFraction = 0.5, MaxFraction = 0, Color = Color.Red, Duration = 0.125, ExpireAfterCycle = true })
			PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo", Id = spool.Id })
			if CheckCountInWindow( "BlockedFateSpool", 1.0, 2 ) then
				thread( PlayVoiceLines, HeroVoiceLines.InteractionBlockedVoiceLines, true )
			end
		end
	end
	if changeMade then
	mod.UpdateSpoolThreads(screen)
	end
end

function mod.FateScreenMouseOverGodIcon(button)
	if not button then return end
	if CheckCooldown( "MouseOverKeepsakeSound", 0.1 ) then
		PlaySound({ Name = "/SFX/Menu Sounds/MirrorMenuToggleKeepsakes", Id = button.Id })
	end
	SetScale({ Id = button.Id, Fraction = 1.25, Duration = 0.1, EaseIn = 0, EaseOut = 1, SkipGeometryUpdate = true })
end

function mod.FateScreenMouseOffGodIcon(button)
	if not button then return end
	SetScale({ Id = button.Id, Fraction = 1, Duration = 0.1, EaseIn = 0, EaseOut = 1, SkipGeometryUpdate = true })
end

function mod.CloseFateManipulationScreen(screen, button)
    	local components = screen.Components
    --UseableOff({ Ids = useableOffButtonIds })
        AltAspectRatioFramesHide()
    OnScreenCloseStarted( screen )
    CloseScreen( GetAllIds( screen.Components ), 0.15 )
	OnScreenCloseFinished( screen )
	ShowCombatUI( screen.Name )
    SetPlayerVulnerable( screen.Name )
end