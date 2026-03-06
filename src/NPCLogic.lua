import 'NPCData/NPCData_Zagreus.lua'
import 'NPCData/NPCData_Thanatos.lua'
import 'NPCData/NPCData_Persephone.lua'
import 'NPCData/NPCData_Achilles.lua'
import 'NPCData/NPCData_Dusa.lua'
import 'NPCData/NPCData_Megaera.lua'
import 'NPCData/NPCData_Nyx.lua'
import 'NPCData/NPCData_Orpheus.lua'
import 'NPCData/NPCData_Patroclus.lua'
import 'NPCData/NPCData_Eurydice.lua'
import 'NPCData/NPCData_Asterius.lua'
import 'NPCData/NPCData_Theseus.lua'
import 'NPCData/NPCData_Hypnos.lua'
import 'NPCData/NPCData_Sisyphus.lua'

--[[modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
  base(source, args)
  mod.HandleHubSpawns()
end)]]
-- Above handled by inserting into StartUnthreadedEvents, less jaring when packages load
-- weird thing about not loading the first time (need to do a run to get them to appear maybe?)

table.insert(HubRoomData.Hub_Main.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid .. ".HandleHubSpawns", Args = {}})
table.insert(HubRoomData.Hub_PreRun.StartUnthreadedEvents, {FunctionName = _PLUGIN.guid .. ".HandleEurydiceSpawn", Args = {}})


function mod.HandleHubSpawns()
    local newNPCList = {
        "NPC_Achilles_Hub_StoryExpansion",
        "NPC_Dusa_Hub_StoryExpansion",
        "NPC_Megaera_Hub_StoryExpansion",
        "NPC_Nyx_Hub_StoryExpansion",
        "NPC_Orpheus_Hub_StoryExpansion",
        "NPC_Persephone_Hub_StoryExpansion",
        "NPC_Thanatos_Hub_StoryExpansion",
        "NPC_Zagreus_Hub_StoryExpansion",
        "NPC_Hypnos_Hub_StoryExpansion",
        "NPC_Eurydice_Hub_StoryExpansion"
    }
    local compulsoryNPCs = {}
    local optionalNPCs = {}
    for k, characterName in pairs(newNPCList) do
        if IsGameStateEligible(characterName .. " Spawn",game.EnemyData[characterName].ActivateRequirements) and CurrentHubRoom and CurrentHubRoom.Name == game.EnemyData[characterName].SpawnMap then
           if IsGameStateEligible(characterName .. "Compulsory Spawn", game.EnemyData[characterName].RequirementsForOptional) then
                table.insert(optionalNPCs, characterName)
            else
                table.insert(compulsoryNPCs, characterName)
            end
        else
        end
    end
    local removeCount = 0
    if #optionalNPCs < 4 then
        for k, characterName in pairs(optionalNPCs) do
            if RandomChance(0.66) then
                removeCount = removeCount + 1
            end
        end
        if removeCount == 1 then
            RemoveRandomValue(optionalNPCs)
        elseif removeCount == 2 then
            RemoveRandomValue(optionalNPCs)
            RemoveRandomValue(optionalNPCs)
        end
    elseif #optionalNPCs < 6 then
        local amountToRemove = RandomInt(2,4)
        for variable = 1, amountToRemove, 1 do
        RemoveRandomValue(optionalNPCs)
        end
    else
        local amountToRemove = RandomInt(3,6)
        for variable = 1, amountToRemove, 1 do
        RemoveRandomValue(optionalNPCs)
        end
    end
    if CurrentRun.StoryExpansionCompulsoryNPCsHub == nil and CurrentRun.StoryExpansionOptionalNPCsHub == nil then
        CurrentRun.StoryExpansionCompulsoryNPCsHub = compulsoryNPCs
        CurrentRun.StoryExpansionOptionalNPCsHub = optionalNPCs
    end
    for k, characterName in pairs(CurrentRun.StoryExpansionCompulsoryNPCsHub) do
        mod.SpawnCharacterInHub(characterName)
    end
    for k, characterName in pairs(CurrentRun.StoryExpansionOptionalNPCsHub) do
        mod.SpawnCharacterInHub(characterName)
    end
end

function mod.HandleEurydiceSpawn()
    local characterName = "NPC_Eurydice_Hub_Traits_StoryExpansion"
    if IsGameStateEligible("EurydiceSpawn", game.EnemyData[characterName].ActivateRequirements) and CurrentHubRoom and CurrentHubRoom.Name == game.EnemyData[characterName].SpawnMap then
        mod.SpawnCharacterInHub(characterName)
    end
    if CurrentRun and not CurrentRun.StoryExpansionFoodOptions then
        mod.ChooseFoodOptions()
    end
end


function mod.SpawnCharacterInHub(characterName)
    if not CurrentHubRoom then
        return
    end
    if CurrentHubRoom and CurrentHubRoom.Name ~= game.EnemyData[characterName].SpawnMap then
        return
    end 
    return mod.SpawnCharacter(characterName)
end

function mod.SpawnCharacter(characterName)
    local newUnit = DeepCopyTable(game.EnemyData[characterName])
    local spawnPointId = game.EnemyData[characterName].SpawnId
    

    if CurrentHubRoom ~= nil and CurrentHubRoom.Name == "Hub_Main" and characterName == "NPC_Thanatos_Hub_StoryExpansion" then
        Destroy({ Ids = { 590510, 590509, 590508, 2000031 } })
    end
    
    local offset = { X = 0, Y = 0 }

    if game.EnemyData[characterName].Offset then
        offset = { X = game.EnemyData[characterName].Offset.X, Y = game.EnemyData[characterName].Offset.Y }
    end

    newUnit.ObjectId = SpawnUnit({ Name = characterName, Group = "Standing", DestinationId = spawnPointId, OffsetX =
    offset.X, OffsetY = offset.Y })


    if not game.EnemyData[characterName].SetUpAI then
        game.SetupUnit(newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, IgnoreAssert = true, })
    else
        game.SetupUnit(newUnit, CurrentRun, { PreLoadBinks = true, IgnoreAssert = true, })
    end
    if game.EnemyData[characterName].GazeTarget then
        local gazeTarget = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = spawnPointId, OffsetX = game
        .EnemyData[characterName].GazeTarget.X, OffsetY = game.EnemyData[characterName].GazeTarget.Y })
        AngleTowardTarget({ Id = newUnit.ObjectId, DestinationId = gazeTarget })
    end
    if game.EnemyData[characterName].Scale then
        SetScale({Id = newUnit.ObjectId, Fraction = game.EnemyData[characterName].Scale})
    end

    CheckAvailableTextLines(newUnit)
    SetAvailableUseText(newUnit)
end


function mod.SpawnCharacterAtMe(characterName)
    MapState.StoryExpansionCharacterId = MapState.StoryExpansionCharacterId or {} 
    local newUnit = DeepCopyTable(game.EnemyData[characterName])
    local spawnPointId = CurrentRun.Hero.ObjectId
    

    if CurrentHubRoom ~= nil and CurrentHubRoom.Name == "Hub_Main" and characterName == "NPC_Thanatos_Hub_StoryExpansion" then
        Destroy({ Ids = { 590510, 590509, 590508, 2000031 } })
    end
    
    local offset = { X = 20, Y = 20 }


    newUnit.ObjectId = SpawnUnit({ Name = characterName, Group = "Standing", DestinationId = spawnPointId, OffsetX =
    offset.X, OffsetY = offset.Y })

    MapState.StoryExpansionCharacterId[characterName] = newUnit.ObjectId

    if not game.EnemyData[characterName].SetUpAI then
        game.SetupUnit(newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, IgnoreAssert = true, })
    else
        game.SetupUnit(newUnit, CurrentRun, { PreLoadBinks = true, IgnoreAssert = true, })
    end
    if game.EnemyData[characterName].GazeTarget then
        local gazeTarget = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = spawnPointId, OffsetX = game
        .EnemyData[characterName].GazeTarget.X, OffsetY = game.EnemyData[characterName].GazeTarget.Y })
        AngleTowardTarget({ Id = newUnit.ObjectId, DestinationId = gazeTarget })
        MapState.StoryExpansionCharacterGazeTarget = MapState.StoryExpansionCharacterGazeTarget or {}
        MapState.StoryExpansionCharacterGazeTarget[characterName] = gazeTarget
    end
    if game.EnemyData[characterName].Scale then
        SetScale({Id = newUnit.ObjectId, Fraction = game.EnemyData[characterName].Scale})
    end

    CheckAvailableTextLines(newUnit)
    SetAvailableUseText( newUnit )

    return newUnit
end

function mod.SpawnFieldSisyphus()
    local sisyphusData =  DeepCopyTable(game.EnemyData["NPC_Sisyphus_Field_StoryExpansion"])
    if not sisyphusData.StoryExpansionMapData then return end
    local currentRoom = CurrentRun.CurrentRoom
    if not currentRoom then return end
    if not sisyphusData.StoryExpansionMapData[currentRoom.Name] then return end
    local sisyphus = mod.PlaceNPCAtId({}, "NPC_Sisyphus_Field_StoryExpansion",sisyphusData.StoryExpansionMapData[currentRoom.Name] )
    SetAvailableUseText(sisyphus)
    MapState.RoomRequiredObjects[sisyphus.ObjectId] = sisyphus
    if currentRoom.Name == "I_Story01" then
        mod.DestroyCerberus()
    end
end

function mod.DestroyCerberus()
    local cerberusId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Cerberus_Field_01" })
    Destroy({Ids = {cerberusId}})
end


function mod.SpawnCharacterInHubAtRotatingSpot(characterNames)
    local rotatingSpawnPoint = {SpawnId = 558175, Offset = {X = -400, Y = 300}, GazeTarget = {X = -800, Y = 600}}
end


game.OnControlPressed({'Gift', function()
	--return mod.SpawnCharacterAtMe("NPC_Patroclus_Field_StoryExpansion")
    --return mod.HandleThanatosSpawn(CurrentRun.CurrentRoom.Encounter, {})
    --return print(IsGameStateEligible("Spawn",game.EnemyData["NPC_Persephone_Hub_StoryExpansion"].ActivateRequirements))
    --return Destroy({ Ids = GetIdsByType({ Name = "NPC_Persephone_Hub_StoryExpansion"}) }) --SetupStoryResetObject()
    --GameState.TextLinesRecord.StoryExpansionSurfaceFlashback01 = nil
   --[[ ActivatePrePlaced({Name = "JustTestingLol"},{Types =
					{
						"NPC_Selene_01",
					},})]]
    --mod.PlaceNPCAtId({},"NPC_Sisyphus_Field_StoryExpansion",{SpawnId = 558175, Offset = {X = -400, Y = 300}, GazeTarget = {X = -800, Y = 600}})

    return mod.FlipAValue()--mod.SpawnFieldSisyphus()--mod.SpawnCharacterAtMe("NPC_Sisyphus_Field_StoryExpansion")
    --mod.SpawnCharacterAtMe("NPC_Hypnos_Field_StoryExpansion")
    --mod.SpawnMegaera()--print(GameState.TextLinesRecord["StoryExpansionFreeingPersephoneDialogue"] )
end})


function mod.CountInList(list, value)
    local count = 0
    for k, entry in ipairs(list) do
        if entry == value then
            count = count + 1
        end
    end
    return count
end


function mod.FlipAValue() -- DEBUG
    --[[if GameState.ReachedTrueEnding then
        GameState.ReachedTrueEnding = nil
    else
        GameState.ReachedTrueEnding = true
    end]]
    --[[if GameState.TextLinesRecord.StoryExpansion_OrpheusUnlocksEurydice02 then
        GameState.TextLinesRecord.StoryExpansion_OrpheusUnlocksEurydice02 = nil
    else
        GameState.TextLinesRecord.StoryExpansion_OrpheusUnlocksEurydice02 = true
    end]]
end

function mod.SetUpAsteriusCombat() -- DEBUG
    local asterius = mod.SpawnCharacterAtMe("NPC_Minotaur_Field_01_StoryExpansion")
    SetupAI(asterius)
    local theseus = mod.SpawnCharacterAtMe("NPC_Theseus_Field_01_StoryExpansion")
    SetupAI(theseus)
end

function mod.PlaceNPCAtId(eventSource, characterName, args)

    local newUnit = DeepCopyTable(game.EnemyData[characterName])
    local spawnPointId = args.SpawnId
    local offset = args.Offset or {}
    offset.X = offset.X or 0
    offset.Y = offset.Y or 0
    offset.Z = offset.Z or 0

    newUnit.ObjectId = SpawnUnit({ Name = characterName, Group = "Standing", DestinationId = spawnPointId, OffsetX =
    offset.X, OffsetY = offset.Y, OffsetZ = offset.Z })
            game.SetupUnit(newUnit, CurrentRun, { IgnoreAI = true, PreLoadBinks = true, IgnoreAssert = true, })

    if args.GazeTarget then
        local gazeTarget = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = spawnPointId, OffsetX = args.GazeTarget.X, OffsetY = args.GazeTarget.Y })
        AngleTowardTarget({ Id = newUnit.ObjectId, DestinationId = gazeTarget })
    end
    if not args.SkipTextSetUp then
    CheckAvailableTextLines(newUnit)
    end
    return newUnit
end

function mod.FreeNPCFromChronos(source)
    SetAnimation({ Name = "Melinoe_Hover_End", DestinationId = CurrentRun.Hero.ObjectId })
    AddInputBlock({ Name = "FamilyRescuePresentation" })
	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	wait( 0.01 )
        AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = characterId })

    	SetAnimation({ Name = "Melinoe_Gesture", DestinationId = CurrentRun.Hero.ObjectId, SpeedMultiplier = 0.8 })
	CreateAnimation({ Name = "MelHPostBossHandFxLeft", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Add" })
	CreateAnimation({ Name = "MelHPostBossHandFxRight", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Add" })
	CreateAnimation({ Name = "MelHPostBossHandFxLeftB", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Add" })
	CreateAnimation({ Name = "MelHPostBossHandFxRightB", DestinationId = CurrentRun.Hero.ObjectId, Group = "FX_Standing_Add" })

	PlaySound({ Name = "/Leftovers/World Sounds/MapText" })

	PlaySound({ Name = "/SFX/Player Sounds/IrisDeathMagic2", Id = CurrentRun.Hero.ObjectId, Delay = 2.5 })

    local characterId = source.ObjectId
	PlaySound({ Name = "/Leftovers/World Sounds/MelEpicSpell" })
	AdjustColorGrading({ Name = "Mythmaker", Duration = 0.3 })
	AdjustFullscreenBloom({ Name = "NewType07", Duration = 0.1 })

	ShakeScreen({ Speed = 900, Distance = 8, FalloffSpeed = 2000, Duration = 1.05 })
	thread( DoRumble, { { ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 1.0 }, } )

    wait(3.5)

    AdjustFullscreenBloom({ Name = "Off", Duration = 1.0 })
	AdjustColorGrading({ Name = "Off", Duration = 3.0 })

    StopAnimation({ Name = "MelHPostBossHandFxLeft", DestinationId = CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MelHPostBossHandFxRight", DestinationId = CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MelHPostBossHandFxLeftB", DestinationId = CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MelHPostBossHandFxRightB", DestinationId = CurrentRun.Hero.ObjectId })
	StopAnimation({ DestinationId = characterId, Name = "NightmareStasisFx_DeathArea", IncludeCreatedAnimations = true  })
    CreateAnimation({DestinationId = characterId, Name = "NightmareStasisFxEnd"})
    thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1625", Text = "Be free..." }} )
    CreateAnimation({ Name = "ChronosGoldifyFx", DestinationId = characterId })
    source.Frozen = false
    SetThingProperty({ Property = "AnimFreeze", Value = false, DestinationId = source.ObjectId, DataValue = false })


    AngleTowardTarget({ Id = characterId, DestinationId = CurrentRun.Hero.ObjectId })
    AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = characterId })


    SetColor({ Id = characterId, Color = {255,255,255,255}})

    
    RemoveInputBlock({ Name = "FamilyRescuePresentation" })
end

function mod.AngleStoryExpansionNPCToHero(source)
    	local npcId = source.ObjectId
	local arcThreshold = source.TurnInPlaceAngleMin or 50
	local facingAngle = GetAngle({ Id = npcId })
	local angleToTarget = GetAngleBetween({ Id = npcId, DestinationId = CurrentRun.Hero.ObjectId })
	local arcDistance = CalcArcDistance( facingAngle, angleToTarget )

    		if arcDistance > arcThreshold then
    AngleTowardTarget({ Id = npcId, DestinationId = CurrentRun.Hero.ObjectId })


            end
end

function mod.TheseusAndMinotaurKeepsakeSpawn(args)
    args = args or {}
    local asterius = mod.PlaceNPCAtId({},"NPC_Minotaur_Field_01_StoryExpansion", {SpawnId = (SelectLootSpawnPoint(CurrentRun.CurrentRoom) or CurrentRun.Hero.ObjectId), SkipTextSetUp = true})
    SetAlpha({ Id = asterius.ObjectId, Fraction = 0, Duration = 0.1 })
    UseableOff({Id = {asterius.ObjectId}})
    local theseus = mod.PlaceNPCAtId({},"NPC_Theseus_Field_01_StoryExpansion",{SpawnId = (SelectLootSpawnPoint(CurrentRun.CurrentRoom) or CurrentRun.Hero.ObjectId), SkipTextSetUp = true})
    SetAlpha({ Id = theseus.ObjectId, Fraction = 0, Duration = 0.1 })
    UseableOff({Id = {theseus.ObjectId}})
    asterius.SummonedByKeepsake = true
    theseus.SummonedByKeepsake = true

    wait(1.5)
    mod.TheseusAndMinotaurEnterPresentation()
    SetupAI(asterius)
    SetupAI(theseus)
end

function mod.TheseusAndMinotaurEnterPresentation()
    local theseusId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Theseus_Field_01_StoryExpansion" })
    local minotaurId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Minotaur_Field_01_StoryExpansion" })

	if CurrentRun.Hero.IsDead or theseusId == nil or minotaurId == nil then
		return
	end

    local theseus = ActiveEnemies[theseusId]
	local minotaur = ActiveEnemies[minotaurId]

    if theseus == nil or minotaur == nil then
        return
    end

    if theseus.Exiting and minotaur.Exiting then
        return
    end

	SetAlpha({ Id = theseus.ObjectId, Fraction = 0, Duration = 0.1 })
	SetAlpha({ Id = minotaur.ObjectId, Fraction = 0, Duration = 0.1 })


    CreateAnimation({ Name = "TeleportDisappear", DestinationId = theseus.ObjectId })
	SetAlpha({ Id = theseus.ObjectId, Fraction = 1, Duration = 0.1 })

    	CreateAnimation({ Name = "TeleportDisappear", DestinationId = minotaur.ObjectId })
	SetAlpha({ Id = minotaur.ObjectId, Fraction = 1, Duration = 0.1 })


    if CheckRoomExitsReady( CurrentRun.CurrentRoom ) then
		UnlockRoomExits( CurrentRun, CurrentRun.CurrentRoom )
	end
end

function mod.EurydiceTavernaStartPresentation( source, args )
	args = args or {}
        	AddInputBlock({ Name = "EurydiceTaverna" })

	FullScreenFadeOutAnimation( "RoomTransitionIn_Radial" )
	-- FadeOut({ Color = Color.Black, Duration = 0.5 })

	waitUnmodified( 0.25 )

	if args.IsOdysseus then
		OdysseusAtTaverna( source, args )
		waitUnmodified( 0.2 )
	end
    
    LoadMap({ Name = "Hub_Main", ResetBinks = false })
            local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu_TraitTray_Overlay", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })

    local currentRoom = CurrentHubRoom
    currentRoom.HeroEndPoint = 589539
    currentRoom.CameraEndPoint = 589539
    PanCamera({ Id = 589539, Duration = 0 })
	Teleport({ Id = CurrentRun.Hero.ObjectId, DestinationId = 589539 })

    local eurydiceId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Eurydice_Hub_StoryExpansion" })
	Teleport({ Id = eurydiceId, DestinationId = source.TavernaTeleportId or 589538 })

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = eurydiceId })

	--[[if not args.IsOdysseus then
		AngleTowardTarget({ Id = eurydice, DestinationId = CurrentRun.Hero.ObjectId, CompleteAngle = true })
	end]]

	-- covers character rotation
	waitUnmodified( 0.3 )

	-- PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	Destroy({ Id = fullscreenBlackImageId })
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Radial" )
    waitUnmodified( 0.7 )
	-- FadeIn({ Duration = 0.5 })
    mod.LoadEurydiceandHeroPackages()
        	RemoveInputBlock({ Name = "EurydiceTaverna" })
end

function mod.LoadEurydiceandHeroPackages()
    local textLines = 
			{
				-- NOT REALLY WORKING, do what Arachne does instead
				Name = "StoryExpansion_EurydiceTestTaverna01Pt2",
				PlayOnce = true,
				{
					SkipContextArt = true,
                    Portrait = "StoryExpansion_Eurydice_Default",
					PreLineWait = 0.35,
					Text = "That Music Maker you summoned is excellent. The technique and ability to transition between styles so seamlessly… it is beautiful." },

				{  UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Do you feel inspired by them? I could always approach them and ask whether they would be willing to perform a duet with you. I’m sure the Crossroads would love to hear a piece performed by both of you." },

				{ 
					SkipContextArt = true,
					PreLineWait = 0.35,
                    Portrait = "StoryExpansion_Eurydice_Default",
					Text = "...Would that I felt up to it, my friend. Maybe another day… but perhaps we could talk about something else in the meantime." },

				{ UsePlayerSource = true,
					SkipContextArt = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					PreLineWait = 0.35,
					Text = "I must ask, where does your talent in music come from? I’ll admit that I can sing, but my skills with the lyre leave much to be desired." },

				{ 
					SkipContextArt = true,
                    Portrait = "StoryExpansion_Eurydice_Default",
					Text = "It was all happenstance, believe it or not. I met Lord Apollo in my youth, when he gave me my lyre and took me under his wing. From there, I earned my talent with hard work and continuous effort." },

				{ UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "That’s incredible, Orpheus! I never knew you had such a rich history with your music. I just assumed that you were born with your skill." },

				{ 
					SkipContextArt = true,
                    Portrait = "StoryExpansion_Eurydice_Default",
					Text = "Of course not, my friend. The struggle to improve is what makes someone a true artist. It is what drives us to perform. What drives you, Melinoe?" },
								{ UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					PreLineWait = 0.35,
					Text = "…I used to think it was to restore my family’s throne and return with them to live in the Underworld afterwards, but it’s not working out how I planned. I feel a bit lost, to be honest." },
									{ 
					SkipContextArt = true,
                    Portrait = "StoryExpansion_Eurydice_Default",
					Text = "I would not have gone far without the aid of my muse. Even the songs she had no hand in, I wrote from my feelings for her. She gave me a sense of purpose and belonging. Perhaps you need to find a similar home to anchor you." },
								{ UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Default_01",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
										PostLineThreadedFunctionName =  _PLUGIN.guid.. ".EurydiceTavernaEndPresentation",
					PostLineFunctionArgs = { Sound2 = "/EmptyCue", Sound3 = "/EmptyCue", TimeTicks = 20 },
					PreLineWait = 0.35,
					Text = " …I shall think on it. Though Orpheus, let us not brood on these depressing matters, and instead celebrate this night and atmosphere. Here’s to us!" },
            }
    local eurydiceId = GetClosestUnitOfType({Id = CurrentRun.Hero.ObjectId, DestinationId = "NPC_Eurydice_Hub_StoryExpansion"})
    local eurydice = ActiveEnemies[eurydiceId]
    PlayTextLines(eurydice, textLines, {} )
end

function mod.EurydiceTavernaEndPresentation( source, args )
    	AddInputBlock({ Name = "EurydiceTaverna" })    
    
    args = args or {}

	FullScreenFadeOutAnimation( "RoomTransitionIn_Radial" )
        LoungeRevelryPresentation(source,  { Sound2 = "/EmptyCue", Sound3 = "/EmptyCue", TimeTicks = 20 })

	-- FadeOut({ Color = Color.Black, Duration = 0.5 })
	waitUnmodified( 0.25 )
	if args.IsOdysseus then
		SetAnimation({ Name = "Odysseus_Idle", DestinationId = source.ObjectId })
		AngleTowardTarget({ Id = source.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	end

    LoadMap({ Name = "Hub_PreRun", ResetBinks = false })
                local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu_TraitTray_Overlay", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })


	if CurrentRun.Hero.IsDead then
		mod.TeleportToEurydiceConversationStartingPoint( source, args )
	end

	waitUnmodified( 8.0 )

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })
    	Destroy({ Id = fullscreenBlackImageId })
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Radial" )
	waitUnmodified( 0.7 )
        local textLines = 
			{
				-- NOT REALLY WORKING, do what Arachne does instead
				Name = "StoryExpansion_EurydiceTestTaverna01Pt3",
				PlayOnce = true,
				{
                    Source = "NPC_Eurydice_Hub_Traits_StoryExpansion",
					PreLineWait = 0.35,

					PostLineThreadedFunctionName = "InCombatTextEvent",
					PostLineThreadedFunctionArgs = GameData.PostTavernaArgs,

					Text = "Thank you, Melinoe. I very much enjoyed your company, and the drink. Shall we do this again at some opportunity?" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.36,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_0769", Text = "Of course." },
					},
				},
            }
    local eurydiceId = GetClosestUnitOfType({Id = CurrentRun.Hero.ObjectId, DestinationId = "NPC_Eurydice_Hub_Traits_StoryExpansion"})
    local eurydice = ActiveEnemies[eurydiceId]
    PlayTextLines({ObjectId = CurrentRun.Hero.ObjectId, Name = "EurydiceTavernaManager"}, textLines, {} )
        	RemoveInputBlock({ Name = "EurydiceTaverna" })
end

function mod.TeleportToEurydiceConversationStartingPoint( source, args )
	args = args or {}
    local eurydiceId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Eurydice_Hub_Traits_StoryExpansion" })
	Teleport({ Id = CurrentRun.Hero.ObjectId, DestinationId = eurydiceId, OffsetY = 50 })
	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = eurydiceId })

	if not args.HeroOnly then
		AngleTowardTarget({ Id = eurydiceId, DestinationId = CurrentRun.Hero.ObjectId, CompleteAngle = true })
		source.SuppressTrackPlayer = nil
	end

    local currentRoom = CurrentHubRoom
    
    currentRoom.HeroEndPoint = eurydiceId
    currentRoom.CameraEndPoint = eurydiceId

end