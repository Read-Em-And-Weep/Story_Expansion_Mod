mod.FCombatRooms = {"F_Combat01",
		"F_Combat02",
		"F_Combat03",
		"F_Combat04",
		"F_Combat05",
		"F_Combat06",
		"F_Combat07",
		"F_Combat08",
		"F_Combat09",
		"F_Combat10",
		"F_Combat11",
		"F_Combat12",
		"F_Combat13",
		"F_Combat14",
		"F_Combat15",
		"F_Combat16",
		"F_Combat17",
		"F_Combat18",
		"F_Combat19",
		"F_Combat20",
		"F_Combat21",
		"F_Combat22",}
mod.GCombatRooms = {
	"G_Combat01",
		"G_Combat02",
		"G_Combat03",
		"G_Combat04",
		"G_Combat05",
		"G_Combat06",
		"G_Combat07",
		"G_Combat08",
		"G_Combat09",
		"G_Combat10",
		"G_Combat11",
		"G_Combat12",
		"G_Combat13",
		"G_Combat14",
		"G_Combat15",
		"G_Combat16",
		"G_Combat17",
		"G_Combat18",
		"G_Combat19",
		"G_Combat20",
}
mod.HCombatRooms = {
	"H_Combat01",
		"H_Combat02",
		"H_Combat03",
		"H_Combat04",
		"H_Combat05",
		"H_Combat06",
		"H_Combat07",
		"H_Combat08",
		"H_Combat09",
		"H_Combat10",
		"H_Combat11",
		"H_Combat12",
		"H_Combat13",
		"H_Combat14",
		"H_Combat15",
}
mod.ICombatRooms = {
	"I_Combat01",
		"I_Combat01",
		"I_Combat02",
		"I_Combat03",
		"I_Combat03",
		"I_Combat04",
		"I_Combat04",
		"I_Combat05",
		"I_Combat06",
		"I_Combat07",
		"I_Combat08",
		"I_Combat09",
		"I_Combat09",
		"I_Combat10",
		"I_Combat10",
		"I_Combat11",
		"I_Combat11",
		"I_Combat12",
		"I_Combat12",
		"I_Combat13",
		"I_Combat14",
		"I_Combat15",
		"I_Combat16",
		"I_Combat17",
		"I_Combat18",
		"I_Combat18",
		"I_Combat19",
		"I_Combat20",
		"I_Combat21",
		"I_Combat21",
		"I_Combat22",
		"I_Combat22",
		"I_Combat23",
		"I_Combat24",
}
mod.NCombatRooms = {
"N_Combat01",
		"N_Combat02",
		"N_Combat03",
		"N_Combat04",
		"N_Combat05",
		"N_Combat06",
		"N_Combat07",
		"N_Combat08",
		"N_Combat09",
		"N_Combat10",
		"N_Combat11",
		"N_Combat12",
		"N_Combat13",
		"N_Combat14",
		"N_Combat15",
		"N_Combat16",
		"N_Combat17",
		"N_Combat18",
		"N_Combat19",
		"N_Combat20",
		"N_Combat21",
		"N_Combat22",
		"N_Combat23",
}

mod.OCombatRooms = {
"O_Combat01",
		"O_Combat02",
		"O_Combat03",
		"O_Combat04",
		"O_Combat05",
		"O_Combat06",
		"O_Combat07",
		"O_Combat08",
		"O_Combat09",
		"O_Combat10",
		"O_Combat11",
		"O_Combat12",
		"O_Combat13", -- Backup if there is nothing eligible before PreBoss
		"O_Combat14",
		"O_Combat15",
}

mod.PCombatRooms = {
	"P_Combat01",
		"P_Combat02",
		"P_Combat03",
		"P_Combat04",
		"P_Combat05",
		"P_Combat06",
		"P_Combat07",
		"P_Combat08",
		"P_Combat09",
		"P_Combat10",
		"P_Combat11",
		"P_Combat12",
		"P_Combat13",
		"P_Combat14",
		"P_Combat15",
		"P_Combat16",
		"P_Combat17",
		"P_Combat18",
		"P_Combat19",
}

mod.QCombatRooms = {
	"Q_Combat01",
		"Q_Combat02",
		"Q_Combat03",
		"Q_Combat04",
		"Q_Combat05",
		"Q_Combat06",
		"Q_Combat07",
		"Q_Combat08",
		"Q_Combat09",
		"Q_Combat12",
		"Q_Combat13",
		"Q_Combat14",
		"Q_Combat15",
		"Q_Combat16",
}
function mod.AddEncounterToEncounterSet(encounterName, rooms, repeats)
	if IsEmpty(rooms) or encounterName == nil then
		return
	end
	repeats = repeats or 1
	for key, roomName in ipairs(rooms) do
		if RoomData[roomName] then
		for v = 1, repeats, 1 do
			table.insert(RoomData[roomName].LegalEncounters, encounterName)
		end
	end
	end
end

import 'EncounterData_Patroclus.lua'
import 'EncounterData_Thanatos.lua'
import 'EncounterData_TheseusAndMinotaur.lua'


function mod.SpawnPatroclusForRandomEvents(eventSource, args)
    	RandomSynchronize( 3 )
	local roomData = RoomData[CurrentRun.CurrentRoom.Name]
	local newUnit = DeepCopyTable( EnemyData.NPC_Patroclus_Field_StoryExpansion )
	local spawnPointId = SelectSpawnPoint( CurrentRun.CurrentRoom, newUnit, eventSource, args )
	newUnit.ObjectId = SpawnUnit({ Name = "NPC_Patroclus_Field_StoryExpansion", Group = "Standing", DestinationId = spawnPointId })
	SetupUnit( newUnit, CurrentRun, { IgnoreAI = true, } )
	SetUnitInvulnerable( newUnit )
	AngleTowardTarget({ Id = newUnit.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	MapState.RoomRequiredObjects[newUnit.ObjectId] = newUnit
	SessionMapState.Patroclus = newUnit
	CheckAvailableTextLines( newUnit )
	SetAvailableUseText( newUnit )


	-- Just in case Nemesis gives you a SpellDrop
	if newUnit.NextInteractLines ~= nil and newUnit.NextInteractLines.PrePortraitExitFunctionName == "NemesisTradeChoice" then
		LoadVoiceBanks({ Name = "Selene" })
	end

end

--[[function mod.TrackThanatosChallengeProgress(encounter, victim, killer)
	if victim.IgnoreThanatosChallengerTracker then
		return
	end

	local maxTimeSincePlayerDamage = encounter.MaxTimeSincePlayerDamage or 5
	if killer ~= nil and killer.ObjectId == encounter.StoryExpansionThanatosId then
		encounter.StoryExpansionThanatosKills = encounter.StoryExpansionThanatosKills + 1
		UpdateObjectiveDescription("StoryExpansionThanatosKills", "Objective_StoryExpansionThanatosKills",
			"StoryExpansionThanatosKills", encounter.StoryExpansionThanatosKills)
	elseif killer ~= nil and killer == CurrentRun.Hero then
		encounter.StoryExpansionPlayerKills = encounter.StoryExpansionPlayerKills + 1
		UpdateObjectiveDescription("StoryExpansionPlayerKills", "Objective_StoryExpansionPlayerKills",
			"StoryExpansionPlayerKills", encounter.StoryExpansionPlayerKills)
	elseif killer.DamageType ~= nil and killer.DamageType == "Ally" then
		encounter.StoryExpansionPlayerKills = encounter.StoryExpansionPlayerKills + 1
		UpdateObjectiveDescription("StoryExpansionPlayerKills", "Objective_StoryExpansionPlayerKills",
			"StoryExpansionPlayerKills", encounter.StoryExpansionPlayerKills)
	elseif victim ~= nil and victim.TimeOfLastPlayerDamage ~= nil and _worldTime - victim.TimeOfLastPlayerDamage < maxTimeSincePlayerDamage then
		encounter.StoryExpansionPlayerKills = encounter.StoryExpansionPlayerKills + 1
		UpdateObjectiveDescription("StoryExpansionPlayerKills", "Objective_StoryExpansionPlayerKills",
			"StoryExpansionPlayerKills", encounter.PlayerKills)
	end
end

function mod.ThanatosPreSpawnPresentation( eventSource )

	HideCombatUI("ThanatosIntro")

	AdjustColorGrading({ Name = "Thanatos", Duration = 0.5 })
	AdjustFullscreenBloom({ Name = "Subtle", Duration = 0.5 })
	ShakeScreen({ Distance = 7, Speed = 400, FalloffSpeed = 2000, Duration = 0.5 })
	PlaySound({ Name = "/SFX/ThanatosEntranceSound" })

	wait( 0.5, RoomThreadName )

	--thread( PlayVoiceLines, HeroVoiceLines.ThanatosSpawningVoiceLines, true )

	wait( 1.5, RoomThreadName )
	thread( DisplayLocationText, nil, { Text = "ThanatosMessage", Delay = 0.95, FadeColor = {0, 1, 0.7, 1} } )
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscendedDark" })

	AdjustColorGrading({ Name = "Off", Duration = 3.0, Delay = 3.0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.5, Delay = 3.0 })

	wait( 0.5, RoomThreadName )

	--SecretMusicPlayer( "/Music/ThanatosTheme_MC" )
	--SetSoundCueValue({ Names = { "Keys" }, Id = SecretMusicId, Value = 1 })
	--SetSoundCueValue({ Names = { "Drums" }, Id = SecretMusicId, Value = 0 })

end

function mod.HandleThanatosSpawn( eventSource )
	local currentRun = CurrentRun
	local currentRoom = CurrentRun.CurrentRoom
	local currentEncounter = eventSource

	local newUnit = DeepCopyTable( EnemyData.NPC_Thanatos_Field_StoryExpansion )
	local spawnPointId = SelectSpawnPoint( currentRoom, newUnit, { SpawnNearId = currentRun.Hero.ObjectId, SpawnRadius = 500 })
	if spawnPointId == nil then
		DebugPrint({ Text = "Thanatos no spawn point; spawning on player." })
		spawnPointId = currentRun.Hero.ObjectId
	end
	newUnit.ObjectId = SpawnUnit({ Name = "NPC_Thanatos_Field_StoryExpansion", Group = "Standing", DestinationId = spawnPointId })
	currentEncounter.StoryExpansionThanatosId = newUnit.ObjectId
	SetupEnemyObject( newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, } )
	UseableOff({ Id = newUnit.ObjectId })
	ActivatedObjects[newUnit.ObjectId] = newUnit
	mod.ThanatosSpawnPresentation( newUnit )
	SetupAI( CurrentRun, newUnit )

	currentRun.StoryExpansionThanatosSpawns = currentRun.StoryExpansionThanatosSpawns + 1

end

function mod.ThanatosSpawnPresentation( thanatos )

	AddInputBlock({ Name = "ThanatosSpawnPresentation" })
	SetPlayerInvulnerable( "ThanatosSpawnPresentation" )

	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = thanatos.ObjectId })

	wait( 0.5, RoomThreadName )

	PanCamera({ Ids = thanatos.ObjectId, Duration = 1.5, EaseIn = 0.05, EaseOut = 0.3 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })

	AngleTowardTarget({ Id = thanatos.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })

	wait( 0.35, RoomThreadName )

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = thanatos.ObjectId })

	wait( 2.0, RoomThreadName )

	ProcessTextLines( thanatos.BossPresentationIntroTextLineSets )
	ProcessTextLines( thanatos.BossPresentationTextLineSets )
	ProcessTextLines( thanatos.BossPresentationRepeatableTextLineSets )

	--if TextLinesRecord["ThanatosFirstAppearance"] then
		wait( 0.5, RoomThreadName )
	--else
	--	wait( 2.0, RoomThreadName )
	--end

	if not PlayRandomRemainingTextLines( thanatos, thanatos.BossPresentationIntroTextLineSets ) then
		if not PlayRandomRemainingTextLines( thanatos, thanatos.BossPresentationTextLineSets ) then
			PlayRandomRemainingTextLines( thanatos, thanatos.BossPresentationRepeatableTextLineSets )
		end
	end

	ShowCombatUI("ThanatosIntro")

	LockCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 1.25 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })

	wait( 0.8, RoomThreadName )

	RemoveInputBlock({ Name = "ThanatosSpawnPresentation" })
	SetPlayerVulnerable( "ThanatosSpawnPresentation" )
end]]

function mod.BeginThanatosEncounter(encounter )
	if CurrentRun.CurrentRoom and TableLength(CurrentRun.CurrentRoom.Encounters) == 1 then
		StartEncounterEffects( encounter )
	end
end

function mod.HandleThanatosSpawn(encounter, args)
	if ( encounter.SpawnsSkipped or encounter.BlockAthenaEncounterKeepsake ) and not args.Force then
		return
	end
	args = args or {}
	waitUnmodified( 1.0 )
	if CurrentRun.Hero.IsDead then
		return
	end
	if args.LoadPackages then
		LoadPackages( { Names = args.LoadPackages, IgnoreAssert = true } )
	end

	encounter.ActiveEnemyCap = encounter.ActiveEnemyCap or encounter.ActiveEnemyCapMax
	encounter.ActiveEnemyCap = math.max(encounter.ActiveEnemyCap, 8)
	if CurrentRun.CurrentRoom.RoomSetName == "H" then -- Need to account to passive encounters
		encounter.ActiveEnemyCap = math.min(encounter.ActiveEnemyCap, 5)
	end

	while encounter.InProgress do

		waitUntil("RequiredKillEnemyKilledOrSpawned", RoomThreadName)
		waitUnmodified( 2.0 )
		if encounter.SpawnsComplete then
			break
		end
	end
	if encounter.SpawnsSkipped or CurrentRun.Hero.IsDead then
		return
	end
	if args.FromTrait or ( encounter.ExpireTrait and HeroHasTrait( encounter.ExpireTrait ))then
		local traitName = gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake")
		local traitData = GetHeroTrait( traitName )
		traitData.RemainingUses = traitData.RemainingUses - 1
		traitData.CustomTrayText = traitData.ZeroBonusTrayText
		
		if encounter.ExpireTrait then
			args = ShallowCopyTable( traitData.UniqueEncounterArgs.EncounterThreadedFunctions.Args )
		end
		ReduceTraitUses( traitData, { Force = true })
	end
	table.insert(CurrentRun.BlockedKeepsakes, gods.GetInternalKeepsakeName("StoryExpansionSummonThanatosKeepsake"))
	mod.ThanatosSpawnPresentation(encounter, args)
end

function mod.ThanatosSpawnPresentation(encounter, args)
	local encounterData = EncounterData[encounter.Name]
	args = args or {}
	
	SetPlayerInvulnerable( "ThanatosSpawnPresentation" )
	AddTimerBlock( CurrentRun, "ThanatosPresence", { MapState = true } )
	local thanatos = DeepCopyTable( EnemyData.NPC_Thanatos_Field_StoryExpansion)
	local spawnPointId = SelectSpawnPoint( CurrentRun.CurrentRoom, thanatos, { SpawnNearId = CurrentRun.Hero.ObjectId, SpawnRadius = 700, SpawnRadiusMin = 400 })
	spawnPointId = spawnPointId or CurrentRun.Hero.ObjectId
	thanatos.ObjectId = SpawnUnit({ Name = "NPC_Thanatos_Field_StoryExpansion", Group = "Standing", DestinationId = spawnPointId })
	thanatos.OccupyingSpawnPointId = spawnPointId
	local overrideRarity = {}
	if args.RarityLevelBonus then
		overrideRarity[TraitRarityData.WeaponRarityUpgradeOrder[args.RarityLevelBonus]] = 1
		thanatos.BoonRaritiesOverride = overrideRarity
		if args.RarityLevelBonus > 1 then
			thanatos.IgnoreTempRarityBonus = true
		end
	end
	SetupUnit( thanatos, CurrentRun, { IgnoreAI = true, IgnorePackages = true, } )
	SetAlpha({ Id = thanatos.ObjectId, Fraction = 0.0, Duration = 0 })

	UseableOff({ Id = thanatos.ObjectId })

	PlaySound({ Name = "/SFX/AthenaBoonChoice" })

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscendedArthurChoir" })

	thread( DisplayInfoBanner, nil, { 
		Text = "StoryExpansionThanatosMessage", 
		Delay = 0.2,
		TextFadeColor = {1, 0.8, 0.4, 1},
		AnimationName = "StoryExpansionDeathBackgroundIn",
		AnimationOutName = "StoryExpansionDeathBackgroundOut", 
		FontScale = 1.1,
	} )

	wait( 0.8 )

	AdjustColorGrading({ Name = "Thanatos", Duration = 2.5 })
	BloomRequestStart({ SourceName = "ThanatosSpawnPresentation", BloomType = "Subtle", Duration = 0.5 })


	AdjustRadialBlurDistance({ Fraction = 0.5, Duration = 2.0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 2.0 })

	wait( 1.5, RoomThreadName )


	Rumble({ Duration = 0.3, RightFraction = 0.17 })

	HideCombatUI("ThanatosIntro")

	PanCamera({ Ids = thanatos.ObjectId, Duration = 0.5, EaseIn = 0.05, EaseOut = 0.03 })

	wait( 0.4, RoomThreadName )
	AngleTowardTarget({ Id = thanatos.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = thanatos.ObjectId })
	SetAlpha({ Id = thanatos.ObjectId, Fraction = 1.0, Duration = 0 })
	wait( 0.1, RoomThreadName )

	MapState.BlockRespawns = true
	MapState.BlockSpawns = true

	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.25 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0.25 })
	BloomRequestEnd({ SourceName = "Subtle", Duration = 0.5 })
	AdjustColorGrading({ Name = "Off", Duration = 0.5 })



	for id, enemy in pairs( ShallowCopyTable( RequiredKillEnemies ) ) do -- Avoid modification while iterating
		thread( DisplayDamageText, enemy, { DamageAmount = 9999, IsCrit = true } )
		CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = enemy.ObjectId })
		thread( Kill, enemy, { BlockRespawns = true } )
		waitUnmodified(0.01)
	end
	for id, enemy in pairs( ShallowCopyTable( ActiveEnemies ) ) do -- Get aggroed, but not required enemies as well.
		if enemy.IsAggroed then
			thread( DisplayDamageText, enemy, { DamageAmount = 9999, IsCrit = true } )
			CreateAnimation({ Name = "ThanatosDeathsHead_Small", DestinationId = enemy.ObjectId })
			thread( Kill, enemy, { BlockRespawns = true } )
			waitUnmodified(0.01)
		end
	end

	ExpireProjectiles({ ExcludeNames = WeaponSets.ExpireProjectileExcludeProjectileNames, BlockSpawns = true })

	PlaySound({ Name = "/SFX/ThanatosAttackBell", Id = thanatos.ObjectId })
	ProcessTextLines( thanatos, thanatos.InteractTextLineSets )

	wait( 0.7, RoomThreadName )

	CheckAvailableTextLines( thanatos )
	SetAvailableUseText( thanatos )

	ShowCombatUI("ThanatosIntro")

	LockCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 1.25 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })

	SetPlayerVulnerable( "ThanatosSpawnPresentation" )

	wait( 0.3, RoomThreadName )

	UseableOn({ Id = thanatos.ObjectId })
end

function mod.UseThanatos(thanatos, args, user)
	mod.AngleStoryExpansionNPCToHero(thanatos)
	UseLoot(thanatos, args, user) 
		mod.ThanatosExitPresentation( thanatos, args )
end

function mod.ThanatosExitPresentation(source, args)
	args = args or {}
	
	UseableOff({ Id = source.ObjectId })
	source.SpecialInteractFunctionName = nil
	source.CanReceiveGift = false
	source.NextInteractLines = nil
	RefreshUseButton( source.ObjectId, source )

	wait( 0.5 )

	-- SetAnimation({ Name = "Icarus_Offer_End", DestinationId = source.ObjectId })

	--thread( PlayVoiceLines, source.ExitVoiceLines )

	AdjustColorGrading({ Name = "Thanatos", Duration = 1.5 })
	BloomRequestStart({ SourceName = "ThanatosExitPresentation", BloomType = "Subtle", Duration = 0.5 })

	AdjustRadialBlurDistance({ Fraction = 0.3, Duration = 0.5 })
	AdjustRadialBlurStrength({ Fraction = 1.2, Duration = 0.5 })
	PlaySound({ Name = "/SFX/AthenaWrathHolyShield", Id = source.ObjectId })

	wait( args.WaitTime or 0.5 )

	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = source.ObjectId })
	SetAlpha({ Id = source.ObjectId, Fraction = 0.0, Duration = 0.05 })


	wait ( 0.45 )


	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.25 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.25 })
	BloomRequestEnd({ SourceName = "Subtle", Duration = 0.5 })
	AdjustColorGrading({ Name = "Off", Duration = 0.5 })

	source.NextInteractLines = nil
	source.Mute = true
	UseableOff({ Id = source.ObjectId })
	MapState.RoomRequiredObjects[source.ObjectId] = nil
	SetUnitProperty({ DestinationId = source.ObjectId, Property = "CollideWithObstacles", Value = false })
	SetUnitProperty({ DestinationId = source.ObjectId, Property = "CollideWithUnits", Value = false })
	SetThingProperty({ DestinationId = source.ObjectId, Property = "StopsProjectiles", Value = false })
	RefreshUseButton( source.ObjectId, source )
	StopStatusAnimation( source )
	RemoveScreenEdgeIndicator( source )

	RemoveTimerBlock( CurrentRun, "ThanatosPresence" )

end

function mod.SpawnMegaera()

	
	local thanatos = DeepCopyTable( EnemyData.NPC_Megaera_Field_StoryExpansion)
	local spawnPointId = SelectSpawnPoint( CurrentRun.CurrentRoom, thanatos, { SpawnNearId = CurrentRun.Hero.ObjectId, SpawnRadius = 700, SpawnRadiusMin = 400 })
	spawnPointId = spawnPointId or CurrentRun.Hero.ObjectId
	if CurrentRun.CurrentRoom.Name == "G_Intro" then
		spawnPointId = 410264
	elseif CurrentRun.CurrentRoom.Name == "H_Intro" then
		spawnPointId = 621444
	elseif CurrentRun.CurrentRoom.Name == "I_Intro" then
		spawnPointId = 699326
	end
	thanatos.ObjectId = SpawnUnit({ Name = "NPC_Megaera_Field_StoryExpansion", Group = "Standing", DestinationId = spawnPointId })
	thanatos.OccupyingSpawnPointId = spawnPointId
	SetupUnit( thanatos, CurrentRun, { IgnoreAI = true, IgnorePackages = true, } )
	

	
	Track({ Ids = {thanatos.ObjectId}, DestinationIds = {CurrentRun.Hero.ObjectId} })
	CreateAnimation({ Name = "TeleportDisappear", DestinationId = thanatos.ObjectId })
	SetAlpha({ Id = thanatos.ObjectId, Fraction = 1.0, Duration = 0 })
	
	ProcessTextLines( thanatos, thanatos.InteractTextLineSets )

	wait( 0.7, RoomThreadName )

	CheckAvailableTextLines( thanatos )
	SetAvailableUseText( thanatos )
	MapState.RoomRequiredObjects[thanatos.ObjectId] = thanatos

	UseableOn({ Id = thanatos.ObjectId })
end

function mod.MegaeraExitPresentation(source)
	UseableOff({ Id = source.ObjectId })
	source.SpecialInteractFunctionName = nil
	source.CanReceiveGift = false
	source.NextInteractLines = nil
	RefreshUseButton( source.ObjectId, source )	
	wait( 1.0 )
	CreateAnimation({ Name = "TeleportDisappear", DestinationId = source.ObjectId })
	SetAlpha({ Id = source.ObjectId, Fraction = 0.0, Duration = 0.05 })
	MapState.RoomRequiredObjects[source.ObjectId] = nil
end

function mod.HandleNaturalTheseusMinotaurSpawn( eventSource )
	local currentRun = CurrentRun
	local currentRoom = CurrentRun.CurrentRoom
	local currentEncounter = eventSource

	local newTheseus = DeepCopyTable( EnemyData.NPC_Theseus_Field_01_StoryExpansion )
	local newMinotaur = DeepCopyTable(EnemyData.NPC_Minotaur_Field_01_StoryExpansion)
	local spawnPointId = SelectLootSpawnPoint(CurrentRun.CurrentRoom)
	spawnPointId = spawnPointId or currentRun.Hero.ObjectId
	newTheseus.ObjectId = SpawnUnit({ Name = "NPC_Theseus_Field_01_StoryExpansion", Group = "Standing", DestinationId = spawnPointId })
	newMinotaur.ObjectId = SpawnUnit({ Name = "NPC_Minotaur_Field_01_StoryExpansion", Group = "Standing", DestinationId = spawnPointId, OffsetX = -50, OffsetY = -50 })

	newTheseus.OccupyingSpawnPointId = spawnPointId
	

	currentEncounter.StoryExpansionTheseusId = newTheseus.ObjectId
	SetupUnit( newTheseus, CurrentRun, { IgnoreAI = true, } )
	SetupUnit( newMinotaur, CurrentRun, { IgnoreAI = true, } )
	UseableOff({ Id = newTheseus.ObjectId })
	MapState.RoomRequiredObjects[newTheseus.ObjectId] = newTheseus
	UseableOff({ Id = newMinotaur.ObjectId })
	MapState.RoomRequiredObjects[newMinotaur.ObjectId] = newMinotaur
	-- dummy enemy
	mod.NaturalTheseusMinotaurSpawnPresentation( newTheseus, newMinotaur )
end

function mod.NaturalTheseusMinotaurSpawnPresentation(theseus, minotaur)
		HideCombatUI("HeraclesIntro")
	local encounter = CurrentRun.CurrentRoom.Encounter
		local encounterData = EncounterData[encounter.Name]
	SetPlayerInvulnerable( "HeraclesSpawnPresentation" )
		AddInputBlock({ Name = "HeraclesSpawnPresentation" })

	PanCamera({ Ids = theseus.ObjectId, Duration = 1.5, EaseIn = 0.05, EaseOut = 0.03 })
	LockCamera({Ids = theseus.ObjectId, Duration = 1.5})
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })
	PlaySound({ Name = "/Leftovers/SFX/GoalScoredNEW" })

	AngleTowardTarget({ Id = theseus.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	AngleTowardTarget({ Id = minotaur.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })

	wait( 0.3, RoomThreadName )

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = theseus.ObjectId })

	wait( 0.1, RoomThreadName )
	wait( 0.5, RoomThreadName )

	ProcessTextLines( theseus, theseus.BossIntroTextLineSets )

	RemoveInputBlock({ Name = "HeraclesSpawnPresentation" })
	SetPlayerVulnerable( "HeraclesSpawnPresentation" )

	local textLines = GetRandomEligibleTextLines( theseus, theseus.BossIntroTextLineSets, GetNarrativeDataValue( theseus, "BossIntroTextLinePriorities" ) )
	PlayTextLines( theseus, textLines )

	ShowCombatUI("HeraclesIntro")

	LockCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 1.25 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })

	SetPlayerVulnerable( "HeraclesSpawnPresentation" )

	SetupAI(theseus )
	SetupAI(minotaur)
end