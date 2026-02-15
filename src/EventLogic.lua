function mod.PatroclusBenefitChoice( source, args, screen )
	RemoveInputBlock({ Name = "PlayTextLines" })

	RandomSynchronize( 9 )

	source.UpgradeOptions = {}
	source.BlockReroll = true
	local options = ShallowCopyTable( args.UpgradeOptions )
	local eligibleOptions = {}
	local priorityOptions = {}
	for i, option in pairs( options ) do
		if option.GameStateRequirements == nil or IsGameStateEligible( source, option.GameStateRequirements ) then
			if option.PriorityRequirements ~= nil and IsGameStateEligible( source, option.PriorityRequirements ) then
				table.insert( priorityOptions, option )
			else
				table.insert( eligibleOptions, option )
			end
		end
	end
	for i = 1, 3 do
		if not IsEmpty( priorityOptions ) then
			local option = RemoveRandomValue( priorityOptions )
			table.insert( source.UpgradeOptions, option )
			option.SlotEntranceAnimation = option.PrioritySlotEntranceAnimation
		elseif not IsEmpty( eligibleOptions ) then
			local option = RemoveRandomValue( eligibleOptions )
			if option.Rarity and TableLength( eligibleOptions ) > 0 and not PassRarityCheck( option.Rarity ) then
				option = RemoveRandomValue( eligibleOptions )
			end
			table.insert( source.UpgradeOptions, option )
		end
	end
	if args.PortraitShift ~= nil then
		args.PortraitShift.Id = screen.PortraitId
		Move( args.PortraitShift )
	end
	OpenUpgradeChoiceMenu( source, args )
	screen.OnCloseFinishedFunctionName = _PLUGIN.guid .. ".PatroclusPostChoicePresentation"

	AddInputBlock({ Name = "PlayTextLines" })
end

function mod.PatroclusPostChoicePresentation(screen, args)

	PlaySound({ Name = screen.Source.ConfirmSound or "/SFX/Menu Sounds/GodBoonChoiceConfirm" })

	wait( 0.02 )
	AdjustColorGrading({ Name = screen.Source.ColorGrade or "ItemGet", Duration = 0.2 })
	SetAnimation({ Name = screen.Source.UpgradeAcquiredAnimation or "MelinoeEquip", DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "ItemGet", DestinationId = CurrentRun.Hero.ObjectId, Scale = 2.0 })
	CreateAnimation({ Name = "ItemGetVignette", OffsetX = ScreenCenterX, OffsetY = ScreenCenterY, Scale = 2.0, UseScreenLocation = true })
	wait( screen.Source.UpgradeAcquiredAnimationDelay or 0.25 )
	AdjustColorGrading({ Name = "Off", Duration = 0.5 })


end