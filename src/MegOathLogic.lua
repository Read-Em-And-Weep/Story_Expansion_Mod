import 'MegOathScreenData.lua'
function mod.MegaeraOathChoice(source, args, screen)
	RemoveInputBlock({ Name = "PlayTextLines" })
	screen.AllowAdvancedTooltip = true

	RandomSynchronize(9)

	local eligibleGiveOptions = {}
	for i, giveOption in ipairs(args.GiveOptions) do
		if giveOption.GameStateRequirements == nil or IsGameStateEligible(giveOption, giveOption.GameStateRequirements) then
			table.insert(eligibleGiveOptions, giveOption)
		end
	end
	local chosenGiveOption = GetRandomValue(eligibleGiveOptions)
	local eligibleGetOptions = {}
	for i, getOption in ipairs(args.GetOptions) do
		if getOption.GameStateRequirements == nil or IsGameStateEligible(getOption, getOption.GameStateRequirements) then
			table.insert(eligibleGetOptions, getOption)
		end
	end
	local chosenGetOption = GetRandomValue(eligibleGetOptions)
	--NemesisTradePreChoicePresentation( source, args )
	mod.OpenMegOathScreen(source, args, chosenGiveOption, chosenGetOption)
	AddInputBlock({ Name = "PlayTextLines" })
	screen.AllowAdvancedTooltip = false
	if source.Accepted then
		screen.OnCloseFinishedFunctionName = _PLUGIN.guid .. ".AcceptMegOath"
		args.ChosenGiveOption = chosenGiveOption
		args.ChosenGetOption = chosenGetOption
		screen.OnCloseFinishedFunctionArgs = args
	end
end

function mod.OpenMegOathScreen(source, args, chosenGiveOption, chosenGetOption)
	InvalidateCheckpoint()

	local screen = DeepCopyTable(ScreenData.StoryExpansionOathScreen)
	screen.Source = source
	screen.Args = args
	screen.ChosenGiveOption = chosenGiveOption
	screen.ChosenGetOption = chosenGetOption
	local giveItemData = nil
	local frameAnim = nil
	if screen.ChosenGiveOption.SellTrait then
		GenerateSellTraitShop(CurrentRun.CurrentRoom, { SellOptionCount = 1, PrioritizeCommonTraits = true })
		for i, sellData in pairs(CurrentRun.CurrentRoom.SellOptions) do
			giveItemData = CurrentRun.Hero.TraitDictionary[sellData.Name][1]
			frameAnim = GetTraitFrame(giveItemData)
			SetTraitTextData(giveItemData)
		end
	elseif screen.ChosenGiveOption.UseGetCost then
		chosenGiveOption.Cost = RandomInt(chosenGetOption.CostResourceMin, chosenGetOption.CostResourceMax)
		giveItemData = ShallowCopyTable(ResourceData[chosenGetOption.CostResourceName])
		giveItemData.Cost = chosenGiveOption.Cost
		giveItemData.DisplayName = "TradeScreen_TradeCost"
		giveItemData.ResourceName = chosenGetOption.CostResourceName
	elseif screen.ChosenGiveOption.UseGetDamage then
		chosenGiveOption.DamageAmount = RandomInt(chosenGetOption.DamageAmountMin, chosenGetOption.DamageAmountMax)
		giveItemData = chosenGiveOption
		giveItemData.DisplayName = "TradeScreen_DamageAmount"
	else
		giveItemData = TraitData[chosenGiveOption.Name] or ConsumableData[chosenGiveOption.Name]
		if TraitData[chosenGiveOption.Name] then
			--SetTraitTextData( giveItemData )
		end
	end
	
	HideCombatUI(screen.Name)
	UnblockCombatUI("PlayTextLines")
	OnScreenOpened(screen)
	CreateScreenFromData(screen, screen.ComponentData)
	local components = screen.Components

	-- Give Option

	local rarity = giveItemData.Rarity or "Common"
	local rarityColor = Color["BoonPatch" .. rarity]
	local rarityText = "Boon_" .. rarity
	local giveItemIcon = giveItemData.TradeIcon or giveItemData.Icon or giveItemData.SurfaceShopIcon or
	giveItemData.IconPath
	if giveItemIcon ~= nil then
		SetAnimation({ Name = giveItemIcon, DestinationId = components.GiveInfoBoxIcon.Id })
		SetAlpha({ Id = components.GiveInfoBoxIcon.Id, Fraction = 1.0, Duration = 0.2 })
		if frameAnim ~= nil then
			SetAnimation({ Name = frameAnim, DestinationId = components.GiveInfoBoxFrame.Id })
			SetAlpha({ Id = components.GiveInfoBoxFrame.Id, Fraction = 1.0, Duration = 0.2 })
			SetScale({ Id = components.GiveInfoBoxIcon.Id, Fraction = components.GiveInfoBoxFrame.Scale })
		end

		rarityColor = giveItemIcon.CustomRarityColor or rarityColor
		rarityText = giveItemIcon.CustomRarityName or rarityText
	end

	ModifyTextBox({
		Id = components.GiveInfoBoxName.Id,
		Text = giveItemData.DisplayName or giveItemData.Name,
		Color = rarityColor,
		LuaKey = "TooltipData",
		LuaValue = giveItemData,
	})

	ModifyTextBox({
		Id = components.GiveInfoBoxBacking.Id,
		Text = giveItemData.DisplayName or giveItemData.Name,
		UseDescription = true,
		LuaKey = "TooltipData",
		LuaValue = giveItemData,
	})

	if giveItemData.ResourceName ~= nil then
		local text = "TradeScreen_CurrentMoney"
		if not HasResource(giveItemData.ResourceName, chosenGiveOption.Cost) then
			text = "TradeScreen_CurrentMoney_CantAfford"
		end
		ModifyTextBox({
			Id = components.GiveInfoBoxSubText.Id,
			Text = text,
			LuaKey = "TempTextData",
			LuaValue = { Amount = GameState.Resources[giveItemData.ResourceName] },
		})
	end

	--[[
	local backingAnim = ScreenData.UpgradeChoice.RarityBackingAnimations[rarity]
	if backingAnim ~= nil then
		SetAnimation({ Name = backingAnim, DestinationId = components.GiveInfoBoxBacking.Id })
	end
	]]

	--[[
	ModifyTextBox({ Id = components.GiveInfoBoxRarity.Id,
		Text = rarityText,
		Color = rarityColor
	})
	]]

	--[[
	if giveItemData.StatLines ~= nil then
		local statLine = giveItemData.StatLines[1]
		ModifyTextBox({ Id = components.GiveInfoBoxStatLineLeft.Id, AppendToId = components.GiveInfoBoxBacking.Id, Text = statLine, LuaKey = "TooltipData", LuaValue = giveItemData, FadeTarget = 1.0 })
		ModifyTextBox({ Id = components.GiveInfoBoxStatLineRight.Id, AppendToId = components.GiveInfoBoxBacking.Id, Text = statLine, UseDescription = true, LuaKey = "TooltipData", LuaValue = giveItemData, FadeTarget = 1.0 })
	end
	]]

	-- Get Option
	--DebugPrint({ Text = "chosenGetOption.Name = "..tostring(chosenGetOption.Name) })

	local getItemData = ShallowCopyTable(TraitData[chosenGetOption.Name] or ConsumableData[chosenGetOption.Name] or
	LootData[chosenGetOption.Name])
	if chosenGetOption.Overrides ~= nil then
		for key, value in pairs(chosenGetOption.Overrides) do
			if getItemData[key] ~= nil then
				getItemData[key] = value
			end
		end
	end
	if getItemData.AddResources ~= nil then
		getItemData.DisplayName = "TradeScreen_ResourceCost"
		getItemData.ResourceName = chosenGetOption.DisplayName or getItemData.Name
		getItemData.Cost = GetFirstValue(getItemData.AddResources)
	end
	if getItemData.DropMoney ~= nil then
		local moneyMultiplier = GetTotalHeroTraitValue("MoneyMultiplier", { IsMultiplier = true })
		if giveItemData.MoneyMultiplier then
			moneyMultiplier = moneyMultiplier - (giveItemData.MoneyMultiplier - 1)
		end
		getItemData.DropMoney = round(getItemData.DropMoney * moneyMultiplier)
	end

	local getItemIcon = getItemData.TradeIcon or getItemData.Icon or getItemData.SurfaceShopIcon
	if getItemIcon ~= nil then
		SetAnimation({ Name = getItemIcon, DestinationId = components.GetInfoBoxIcon.Id })
		SetAlpha({ Id = components.GetInfoBoxIcon.Id, Fraction = 1.0, Duration = 0.2 })
		--SetAlpha({ Id = components.GetInfoBoxFrame.Id, Fraction = 1.0, Duration = 0.2 })
	end

	ModifyTextBox({
		Id = components.GetInfoBoxName.Id,
		Text = getItemData.DisplayName or chosenGetOption.DisplayName or getItemData.Name,
		LuaKey = "TooltipData",
		LuaValue = getItemData,
	})

	ModifyTextBox({
		Id = components.GetInfoBoxBacking.Id,
		Text = chosenGetOption.DisplayName or getItemData.Name,
		UseDescription = true,
		LuaKey = "TooltipData",
		LuaValue = getItemData,
	})

	if getItemData.AddResources ~= nil then
		ModifyTextBox({
			Id = components.GetInfoBoxSubText.Id,
			Text = "TradeScreen_CurrentMoney",
			LuaKey = "TempTextData",
			LuaValue = { Amount = GameState.Resources[getItemData.ResourceName] },
		})
	elseif getItemData.DropMoney ~= nil then
		ModifyTextBox({
			Id = components.GetInfoBoxSubText.Id,
			Text = "TradeScreen_CurrentMoney",
			LuaKey = "TempTextData",
			LuaValue = { Amount = GameState.Resources.Money },
		})
	end

	--[[
	if getItemData.StatLines ~= nil then
		local statLine = getItemData.StatLines[1]
		ModifyTextBox({ Id = components.GetInfoBoxStatLineLeft.Id, AppendToId = components.GetInfoBoxBacking.Id, Text = statLine, LuaKey = "TooltipData", LuaValue = getItemData, FadeTarget = 1.0 })
		ModifyTextBox({ Id = components.GetInfoBoxStatLineRight.Id, AppendToId = components.GetInfoBoxBacking.Id, Text = statLine, UseDescription = true, LuaKey = "TooltipData", LuaValue = getItemData, FadeTarget = 1.0 })
	end
	]]

	if giveItemData.ResourceName ~= nil and not HasResource(giveItemData.ResourceName, giveItemData.Cost) then
		SetAlpha({ Id = components.AcceptButton.Id, Fraction = 0.0, Duration = 0.0 })
		UseableOff({ Id = components.AcceptButton.Id })
	end

	-- Short delay to let animations finish and prevent accidental input
	wait(0.5)
	--TeleportCursor({ DestinationId = components.SpellDescription.Id, ForceUseCheck = true })
	screen.KeepOpen = true
	HandleScreenInput(screen)
	thread(mod.MegaeraExitPresentation, source)
end

function mod.AcceptMegOath(screen, args)
	AddInputBlock({ Name = "TradeDoExchange" })
	if args.TradePreCostFunctionName ~= nil then
		CallFunctionName(args.TradePreCostFunctionName, screen, args)
	end

	local giveOption = args.ChosenGiveOption
	local getOption = args.ChosenGetOption

	if TraitData[giveOption.Name] then
		AddTrait(game.CurrentRun.Hero, giveOption.Name, "Common")
		local trait = GetHeroTrait(giveOption.Name)
		if trait.AcquireFunctionName then
			CallFunctionName(trait.AcquireFunctionName, trait.AcquireFunctionArgs)
		end
	end

	if args.TradePostCostFunctionName ~= nil then
		CallFunctionName(args.TradePostCostFunctionName, screen, args)
	end

	local item = nil
	--[[if ConsumableData[getOption.Name] ~= nil or getOption.Name == "SpellDrop" then
		local consumableId = SpawnObstacle({ Name = getOption.Name, DestinationId = screen.Source.ObjectId, Group = "Standing" })
		item = CreateConsumableItem( consumableId, getOption.Name, 0, { RunProgressUpgradeEligible = true, DataOverrides = getOption.Overrides } )
		item.NPCDrop = true
		ApplyConsumableItemResourceMultiplier( CurrentRun.CurrentRoom, item )
	else
		getOption.SpawnPoint = screen.Source.ObjectId
		item = CreateLoot( getOption )
	end]]

	if TraitData[getOption.Name] then
		AddTrait(game.CurrentRun.Hero, getOption.Name, "Common")
		local trait = GetHeroTrait(getOption.Name)
		if trait.AcquireFunctionName then
			CallFunctionName(trait.AcquireFunctionName, trait.AcquireFunctionArgs)
		end
	end

	if item then
		item.FromTrade = true
		screen.Source.ItemGiven = item
		MapState.RoomRequiredObjects[item.ObjectId] = item

		local forceAngle = GetAngleBetween({ Id = screen.Source.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		ApplyForce({ Id = item.ObjectId, Speed = getOption.Force or args.GetItemForce, Angle = forceAngle, SelfApplied = true })
		ApplyUpwardForce({ Id = item.ObjectId, Speed = getOption.UpwardForce or args.GetItemUpwardForce })
	end
	RemoveInputBlock({ Name = "TradeDoExchange" })

	--[[if screen.Source.PostTradeEvents ~= nil then
		RunEventsGeneric( screen.Source.PostTradeEvents, screen.Source )
	end]]
end

function mod.BanAllManaBoons()
	local traitsToBan = { "AphroditeManaBoon", "ApolloManaBoon", "AresManaBoon", "DemeterManaBoon", "HephaestusManaBoon",
		"HeraManaBoon", "HestiaManaBoon", "PoseidonManaBoon", "ZeusManaBoon" }
	for key, name in pairs(traitsToBan) do
		CurrentRun.BannedTraits[name] = true
	end
end

function mod.BanAllRushBoons()
	local traitsToBan = { "AphroditeSprintBoon", "ApolloSprintBoon", "AresSprintBoon", "DemeterSprintBoon", "HephaestusSprintBoon",
		"HeraSprintBoon", "HestiaSprintBoon", "PoseidonSprintBoon", "ZeusSprintBoon" }
	for key, name in pairs(traitsToBan) do
		CurrentRun.BannedTraits[name] = true
	end
end

function mod.DecreaseMaxGods()
	if CurrentRun.MaxGodsPerRun then
		CurrentRun.MaxGodsPerRun = CurrentRun.MaxGodsPerRun - 1
	end
	if HeroData.MaxGodsPerRun then
		HeroData.MaxGodsPerRun = HeroData.MaxGodsPerRun - 1
	end
end

function mod.NotReachedMaxGods(args)
	return (not ReachedMaxGods(args))
end

function mod.IsWeaponAtNotMinRank()
	local currentWeaponName = GetEquippedWeapon()
	local currentWeaponData = WeaponData[currentWeaponName]

	local traitName = GameState.LastWeaponUpgradeName[currentWeaponName]
	if traitName == nil then
		traitName = ScreenData.WeaponUpgradeScreen.FreeUnlocks[currentWeaponName]
	end
	if not traitName then
		return false
	end

	return (GetWeaponUpgradeLevel(traitName) ~= 1)
end

modutil.mod.Path.Wrap("CalculateDamageMultipliers", function(base, attacker, victim, weaponData, triggerArgs)
	local multipliers = base(attacker, victim, weaponData, triggerArgs)
	damageReductionMultipliers = damageReductionMultipliers
	damageMultipliers = damageMultipliers
	lastAddedMultiplierName = lastAddedMultiplierName or ""
	if HeroHasTrait(gods.GetInternalBoonName("MegaeraOathInCastDamage")) and attacker and attacker ~= CurrentRun.Hero and victim == CurrentRun.Hero and attacker.ActiveEffects and ContainsAnyKey(attacker.ActiveEffects, { "ImpactSlow" }) then
		local trait = GetHeroTrait(gods.GetInternalBoonName("MegaeraOathInCastDamage"))
		local newDamageMultipliers = trait.StoryExpansionInCastDamage
		return (multipliers + newDamageMultipliers * damageReductionMultipliers)
	end
	return multipliers
end)

function mod.EquipRivals(args)
	args = args or {}
	if args.RivalsLevel then
		GameState.ShrineUpgrades = GameState.ShrineUpgrades or {}
		GameState.ShrineUpgrades["BossDifficultyShrineUpgrade"] = args.RivalsLevel
	end
end

modutil.mod.Path.Wrap("CreateStackLoot", function(base, args)
	args = args or {}
	if args.StackNum == nil then
		args.StackNum = 1
	end
	if HeroHasTrait(gods.GetInternalBoonName("MegaeraBlessingStackUpgradeBoost")) then
		local trait = GetHeroTrait(gods.GetInternalBoonName("MegaeraBlessingStackUpgradeBoost"))
		args.StackNum = args.StackNum + trait.StackUpgradeAdditionalLevels
	end
	return base(args)
end)

modutil.mod.Path.Wrap("UseEscapeDoor", function(base, usee, args)
	if not StoredGameState then
		StoredGameState = {}
	end
	StoredGameState.ShrineUpgrades = ShallowCopyTable(GameState.ShrineUpgrades) or {}
	StoredGameState.ActiveShrineBounty = GameState.ActiveShrineBounty
	return base(usee, args)
end)

modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
	if StoredGameState ~= nil then
		GameState.ShrineUpgrades = StoredGameState.ShrineUpgrades
		GameState.ActiveShrineBounty = StoredGameState.ActiveShrineBounty
		GameState.SpentShrinePointsCache = GetTotalSpentShrinePoints()

		StoredGameState = nil
	end
	base(source, args)
end)



modutil.mod.Path.Wrap("SetTraitsOnLoot", function(base, lootData, args)
	base(lootData, args)
	if lootData.GodLoot and HeroHasTrait(gods.GetInternalBoonName("MegaeraBlessingRandomHeroicChance")) then
		local trait = GetHeroTrait(gods.GetInternalBoonName("MegaeraBlessingRandomHeroicChance"))
		for itemIndex, itemData in ipairs(lootData.UpgradeOptions) do
			if (itemData.Rarity == "Common" or itemData.Rarity == "Rare" or itemData.Rarity == "Epic") and not itemData.IsElementalTrait and RandomChance(trait.StoryExpansionCommonToHeroicChance) then
				itemData.Rarity = "Heroic"
			end
		end
	end
end)

function mod.AddRerolls(args)
	AddRerolls({}, args)
end

function mod.TryMegaeraSpawn()
	if CurrentRun.UseRecord.NPC_Megaera_Field_StoryExpansion then
		return
	end
	if CurrentRun.CurrentRoom.Name == "G_Intro" then
		if RandomChance(11/50) then --11/50
			return mod.SpawnMegaera()
		end
	end
	if CurrentRun.CurrentRoom.Name == "H_Intro" then
		if RandomChance(11/39) then --11/39
			return mod.SpawnMegaera()
		end
	end
	if CurrentRun.CurrentRoom.Name == "I_Intro" then
		if RandomChance(11/28) then --11/28
			return mod.SpawnMegaera()
		end
	end
	--therefore an overall 66% chance to encounter on an Underworld run
end

table.insert(RoomData.G_Intro.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid..".TryMegaeraSpawn", GameStateRequirements ={NamedRequirementsFalse = { "StandardPackageBountyActive", },}})
table.insert(RoomData.H_Intro.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid..".TryMegaeraSpawn",GameStateRequirements ={NamedRequirementsFalse = { "StandardPackageBountyActive", },}})
table.insert(RoomData.I_Intro.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid..".TryMegaeraSpawn",GameStateRequirements ={NamedRequirementsFalse = { "StandardPackageBountyActive", },}})