import 'NarrativeLogic_Palace.lua'
import 'NarrativeLogic_Tartarus.lua'

function mod.PlaySurfaceFlashbacksManager(eventSource, args)
        AddInputBlock({ Name = "SurfaceFlashback" })
    if IsGameStateEligible("ViewingFirstFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback01"}}}) then
        mod.PlaySurfaceFlashback01(eventSource, args)
	elseif IsGameStateEligible("ViewingSecondFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback02"}}}) then
		mod.PlaySurfaceFlashback02(eventSource, args)
	elseif IsGameStateEligible("ViewingThirdFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback03"}}}) then
		mod.PlaySurfaceFlashback03(eventSource, args)
	elseif IsGameStateEligible("ViewingForthFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback04"}}}) then
		mod.PlaySurfaceFlashback04(eventSource, args)
	elseif IsGameStateEligible("ViewingFifthFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback05"}}}) then
		mod.PlaySurfaceFlashback05(eventSource, args)
	elseif IsGameStateEligible("ViewingSixthFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback06"}}}) then
		mod.PlaySurfaceFlashback06(eventSource, args)
	elseif IsGameStateEligible("ViewingSeventhFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback07"}}}) then
		mod.PlaySurfaceFlashback07(eventSource, args)
	elseif IsGameStateEligible("ViewingEighthFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback08"}}}) then
		mod.PlaySurfaceFlashback08(eventSource, args)
	elseif IsGameStateEligible("ViewingNinthFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback09"}}}) then
		mod.PlaySurfaceFlashback09(eventSource, args)
	elseif IsGameStateEligible("ViewingTenthFlashback", {{PathFalse = {"GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback10"}}}) and  IsGameStateEligible("ViewingTenthFlashback", {{PathTrue = { "GameState", "TyphonDefeatedWithStormStop" },}}) then
		mod.PlaySurfaceFlashback10(eventSource, args)
    end
    RemoveInputBlock({ Name = "SurfaceFlashback" })
end

modutil.mod.Path.Wrap("DisablePalaceForcefield", function(base, source, args)
    mod.PlaySurfaceFlashbacksManager(source, args)
    return base(source, args)
end)


function mod.PlaySurfaceFlashback01(source, args)
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback01",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

{ 
					PreLineWait = 2.8,
					Portrait = "StoryExpansion_Hooded_Chronos", Speaker = "StoryExpansionUnknownMaleSpeaker",
					Text = "Ouranos, Father, your time is up. Mother Gaia decreed your reign to end. Step aside now or face the rightful force of your son." },
				{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.5, UseChronosSound = false },
					Text = "You would {#Emph} dare {#Prev} raise your blade against me, Chronos? We are {#Emph} family {#Prev} and you belong to {#Emph} me{#Prev}. These oaths bind your loyalty to me and {#Emph} me {#Prev} alone." },
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "{#Emph}<Scoff> {#Prev} Family is not merely inherited. You provided no home, no guidance, and let your subjects rot to pursue my mother. You are a cruel father, and an even crueller king." },

							{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
                    												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.5, UseChronosSound = false },

					Text = "{#Emph}Ha! {#Prev} Cruel father I may be, yet you are a cruel son. My heart beats strongly in you. If you must, harden it and strike me thus, but know you will not be without retribution." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "{#Emph}Father..." },

{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
										PreLineWait = 0.8,
								PostLineFunctionName = _PLUGIN.guid .. ".BattleSounds", ExitPortraitImmediately = true,

					Text = "I will make stony my heart. It may be the only piece of advice you've given me. Prepare yourself for a fight, and to lose."},

							{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
								ExitPortraitImmediately =true,
					Text = "I'll admit, I thought you unable to slay me, Chronos."},
					{ 
						PreLineWait = 0.85,
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "{#Emph}Death to Ouranos{#Prev}. That was my vow to my mother, and I will enact it."},
					{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",

					Text = "You think yourself different from your father? Every child does.{#Emph}<Scoff> {#Prev} And you believe yourself capable of building a better world?" },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I know I can, Father. After all, I am nothing like you." },
					{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
                    												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 1.5, UseChronosSound = false },

					Text = "Then I will grant you a last boon: a curse on your name. You shall suffer, just as you have made me suffer. Your love shall ruin you. Children you cherish will strike you down. When your crown turns to dust in your hands, you shall fall alone. "},
										{ 
						PreLineWait = 0.85,
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "The world is no longer bound to your will. Your curse means nothing when our fates are decided by us, and us alone."},
										{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.0, UseChronosSound = true },
ExitPortraitImmediately = true,
					Text = "{#Emph} Ha... {#Prev}. You are much more like me than you know. Even if my curse carries no power, it will come true. It will be a dethroning of your own making. {#Emph} Death to Chronos..."},
										{ 
						PreLineWait = 1.2,
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Goodbye Father. Perhaps history will remember you more kindly than I."},


EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback02(source, args)
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback02",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
                    PreLineWait = 2.8,
					Text = "I'm no fool, Prometheus. What are you trying to flatter me into now? And why does it need to be in this field?" },

							{
					Portrait = "StoryExpansion_Hooded_Prometheus",Speaker = "Prometheus",

					Text = "It's to do with my newest creation. I'm finally ready to show it to you. You promise you'll be kind?" },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "If you were after kindness, you would have shown your brother. I'm known for honest feedback." },
							{
					Portrait = "StoryExpansion_Hooded_Prometheus",Speaker = "Prometheus",

					Text = "I call them mortals. They're like us Titans, but much weaker, and with limited lifespans."},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Perhaps I'm missing something here. What is it exactly that they... {#Emph} do{#Prev}? What purpose do they serve?" },
												{
					Portrait = "StoryExpansion_Hooded_Prometheus",Speaker = "Prometheus",

					Text = "They don't have a single purpose. Mortals exist to live, to change, to grow beyond our expectations. Isn't that limitless potential incredible?"},
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "But they're so… fragile. Quick to hunger, strife and death. Is that not unnecessary?" },
																	{
					Portrait = "StoryExpansion_Hooded_Prometheus",Speaker = "Prometheus",

					Text = "Mortals may be fragile, but they persist and learn from it! Is that not a beauty of its own?"},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					ExitPortraitImmediately = true,
					Text = "Their anguish is pointless. For beings this feeble, it is a simple matter to undo their scrapes." },
															{ 
					Portrait = "StoryExpansion_Hooded_Prometheus",Speaker = "Prometheus",
					PreLineWait = 0.3,
					Text = "If you always carry someone, my king, they'll never learn to stand. What will they learn then?" },
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "They will know only the peace of our Golden Age. No fear of tomorrow, hunger, or grief. Does that not satisfy you, Prometheus?" },
															{ 
					Portrait = "StoryExpansion_Hooded_Prometheus",Speaker = "Prometheus",
					Text = "..." },
					{ 
					Portrait = "StoryExpansion_Hooded_Prometheus",Speaker = "Prometheus",
					Text = "Of course, my king. That is all I can desire." },



EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.BattleSounds()
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgoAfterABattle",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAffection" })
	wait(0.2)
	PlaySound({ Name = "/SFX/Player Sounds/AthenaDashImpact"})
		PlaySound({ Name = "/SFX/AthenaWrathHolyShield"})
	PlaySound({ Name = "/SFX/Menu Sounds/KeepsakeAthenaGorgon" })
	wait(0.3)
					PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteShocked" })
						PlaySound({ Name = "/SFX/Player Sounds/AthenaDashImpact"})

	PlaySound({ Name = "/SFX/AthenaWrathHolyShield"})


	wait(0.5)
		PlaySound({ Name = "/SFX/TimeSlowStart" })
PlaySound({ Name = "/VO/MelinoeEmotes/EmoteGasping" })
			PlaySound({ Name = "/SFX/Enemy Sounds/Exalted/EnemyShieldBlock" })

		wait(0.2)
PlaySound({ Name = "/SFX/Menu Sounds/KeepsakeAthenaGorgon" })
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteFiredUpLASTCHANCE"})

PlaySound({ Name = "/SFX/AthenaWrathHolyShield"})
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAffection" })
	wait(0.2)
	PlaySound({ Name = "/SFX/Player Sounds/AthenaDashImpact"})
	PlaySound({ Name = "/SFX/Menu Sounds/KeepsakeAthenaGorgon" })
	wait(0.3)
			PlaySound({ Name = "/SFX/Enemy Sounds/Exalted/EnemyShieldBlock" })
					PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteShocked" })
					PlaySound({ Name = "/VO/MelinoeEmotes/EmoteGasping" })
						PlaySound({ Name = "/SFX/Player Sounds/AthenaDashImpact"})
	PlaySound({ Name = "/SFX/AthenaWrathHolyShield"})

	wait(0.5)
		PlaySound({ Name = "/SFX/TimeSlowStart" })
			PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteFiredUpLASTCHANCE"})


	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAffection" })
	wait(0.2)
	PlaySound({ Name = "/SFX/Player Sounds/AthenaDashImpact"})
	wait(0.3)
					PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteShocked" })
						PlaySound({ Name = "/SFX/Player Sounds/AthenaDashImpact"})

	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteFiredUpLASTCHANCE"})
						PlaySound({ Name = "/VO/MelinoeEmotes/EmoteGasping" })

	wait(0.5)
		PlaySound({ Name = "/SFX/TimeSlowStart" })

		PlaySound({ Name = "/SFX/Enemy Sounds/Hades/HadesSkullExplode" })

			PlaySound({ Name = "/SFX/WrathOver"})
			wait(1.0)
	PlaySound({ Name = "/SFX/TimeSlowStart" })

		PlaySound({ Name = "/SFX/Enemy Sounds/Hades/HadesSkullExplode" })
					PlaySound({ Name = "/SFX/Enemy Sounds/Exalted/EnemyShieldBlock" })


			PlaySound({ Name = "/SFX/WrathOver"})
end

function mod.PlaySurfaceFlashback03(source, args)
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback03",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansionUnknownFemaleSpeaker",
                    PreLineWait = 2.8,
					Text = "The world has been much more peaceful since you took over, Chronos. I'm no longer too afraid of the sky watching to frolic and explore!" },
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "Rhea, it's far from flawless yet, my love. The winds are too strong, and I've yet to be able to keep the plants on schedule." },

							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "{#Emph} Ha! {#Prev} Only you would notice these things. Everyone else enjoys paradise, and you're already planning on improving it. Have you tried, perhaps, asking the plants nicely?" },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "The crown is my burden. It is maintenance that keeps our paradise stable." },
							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "And I can't imagine anyone else doing it. You've allowed us to finally breathe freely."},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "My duty is easiest to manage when it is shared. It is lighter upon two heads." },
												{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "Then I will be here, if your hands are ever too small to grasp. You won't have to carry it alone."},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I know it will endure, darling, with you beside me." },
															{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "Always." },

EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback04(source, args)
	LoadPackages({Name = "Prometheus"})
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback04",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
                    PreLineWait = 2.8,
					Text = "Is something the matter, my love? You are rather withdrawn tonight." },

							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "…" },
					{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "Well, I'll admit there is something I must tell you." },
					{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.5, ExitPortraitImmediately = true,
					Text = "…Chronos… we're going to have a child." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.3,
					Text = "Rhea…? Are you… certain?" },
							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "I can feel him growing. A little bit of {#Emph} you {#Prev} and a little bit of {#Emph} me{#Prev}."},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "…A child? Ours? …I never thought that… our own…" },
												{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "Isn't it wonderful, Chronos?"},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "…a little prince…" },
															{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "A jewel for the Titan crown! Our own son! I’m thinking of the name, Hades."},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "A strong name indeed. Do you think he’ll have your eyes or mine?" },
					{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "There’s so much I can’t wait to show him. The stars, the wilds, the rivers… the mountains… "},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "There is much to prepare for… lessons to plan, ceremonies to organise, tutors to summon… " },
					{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "We’ll manage it. For now, though, he can just be… ours."},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "…yes, darling… our blessing." },
					
EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback05(source, args)
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback05",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
                    PreLineWait = 2.8,
					Text = "Perhaps, Poseidon, if you did not fool with you brother, you would already have mastered this move. It is not fitting of a Titan prince to disappoint. " },

					{ 
					Portrait = "StoryExpansion_Hooded_Poseidon",Speaker = "NPC_Poseidon_01",

					Text = "But Father! We were just playing together! He did nothing wrong!" },

							{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "I did not raise you to be so defiant. Do you think I had time for play when I slew Ouranos? You shall practice until you have shown yourself competent at disarming your foes." },
{ 
					Portrait = "StoryExpansion_Hooded_Poseidon",Speaker = "NPC_Poseidon_01",
					Text = "Will you watch me if I succeed?" },
							{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
								ExitPortraitImmediately =true,
					Text = "If you improve, I will. After all, son, your mastery is of interest to me."},
					{ 
					Portrait = "StoryExpansion_Hooded_Poseidon",Speaker = "NPC_Poseidon_01",
					PreLineWait = 0.3, ExitPortraitImmediately = true,
					Text = "…Yes Father. I’ll be better tomorrow. I wish both you and Mother a good night." },
												{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 1.2,
					Text = "…Must you be so hard on them, Chronos? They are still young, after all."},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Young and blessed with the security of the throne. We did not have such protections when we were small, my love. " },
															{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "Surely you can allow them some freedom? They have not been out to see the peace you’ve created. I know Poseidon longs to see the depths of the oceans." },
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "The world will still be there when they are fully prepared for it. Besides, if you objected so much to my discipline, why did you not intervene?" },
					{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "..." },
					{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "…How long do you intend to keep their childhood from them?" },
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Until they prove themselves capable and can act appropriately. They have much to live up to, after all, and we cannot fail them." },
					{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					ExitPortraitImmediately = true,
					Text = "Even if you had another child? You would treat them the same?" },
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					ExitPortraitImmediately = true, PreLineWait = 0.2,
					Text = "I would. It does not do well to have favourites after all. That way only leads to rebellion. Is there something you mean to tell me?" },
					{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.7,
					Text = "…No. Not right now." },

EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback06(source, args)
	LoadPackages({Name = "Zeus"})
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback06",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
                    PreLineWait = 2.8, ExitPortraitImmediately = true,

					Text = "Love… how long do you intend to stay by this empty cradle?" },

							{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.5, ExitPortraitImmediately = true,
					Text = "…I never heard him cry. Before he turned as cold as stone. You at least held him. I never got the chance." },
					{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
						PreLineWait = 0.4,
					Text = "…I’m sure he’s at peace wherever he is now." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					ExitPortraitImmediately = true,
					Text = "Do you think he knew I loved him… before he passed? How special he was?" },
							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
						
					Text = "You cannot stay here forever, Chronos. The world needs you to maintain order."},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "It will wait. My son has been taken from me." },
												{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					ExitPortraitImmediately = true,
					Text = "And what of Hades and Poseidon? They grieve their brother too."},
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.3, ExitPortraitImmediately = true,
					Text = "I will not fail them as well… I cannot lose another child.  They will be safe, here with me, sheltered from the world." },
																	{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.3, ExitPortraitImmediately= true,
					Text = "Chronos…"},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I’ll increase their training. Nothing will be able to stand against or hurt us." },
															{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.3, ExitPortraitImmediately = true,
					Text = "Chronos… I’m sorry… I’ll let you grieve alone, then." },
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.5, ExitPortraitImmediately = true,
					Text = "…Never again. Any pain, any opposition, any danger, I’ll be prepared for. I promise you, Zeus… the son I never knew." },

EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback07(source, args)
	LoadPackages({Name = "Zeus"})
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback07",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
                    PreLineWait = 2.8,

					Text = "Mother? Is that you? How fare my brothers?" },

							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "The same as ever. It seems Chronos never intends to let them free from the palace." },
{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					Text = "Father has been neglecting his duties to the world too. From what I’ve heard, nature itself seems discontent with him." },
							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "This was not the life I meant for you, my child. When I hid you from Chronos… I thought your ‘death’ would let you grow up free."},
					{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					ExitPortraitImmediately = true,
					Text = "You freed me from him. And I will free my brothers from his cage too." },
										{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.2,
					Text = "…He grieved you, Zeus, and loved you all. I’m afraid my lie was what transformed him." },
					{
										Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					ExitPortraitImmediately = true,

					Text = "What he is doing is not love. I will do what you cannot, Mother. Someone needs to free us all from his rule. To let us breathe freely again."},												
					{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.2,
					Text = "…Zeus, surely you do not mean…"},
																	{
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					ExitPortraitImmediately = true,
					Text = "Already the Fates have thrown their support behind me. Cyclopes, nymphs and satyrs stand ready. Someone must stand against him, Mother. I hope you understand."},
															{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
										PreLineWait = 0.3,

					Text = "I will ensure my sons’ safety. At all costs." },
															
EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback08(source, args)
	LoadPackages({Name = "Zeus"})
	LoadPackages({Name = "Poseidon"})
	LoadPackages({Name = "Hades"})
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback08",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
                    PreLineWait = 2.8,

					Text = "Father, the time of your rule is up. Step aside now, or face the rightful force of your sons." },

--TODO: Versions of the wrath portraits that don't include the god appearance streaks
							{
					Portrait = "Portrait_Poseidon_Default_InPerson_01",Speaker = "NPC_Poseidon_01",

					Text = "Do you not hear the death knells of your reign, as decreed by the Fates? Nature screams out for a new regime." },
{ 
					Portrait = "Portrait_LordHades_01",Speaker = "NPC_LordHades_01",
					Text = "You have rejected your duties to the beings of this world for too long, Father. They have now stepped up and gifted us the Infernal Arms, for us to subdue you." },
							{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "You would strike against your family? After all I have done for you and all I protected you from? Family shelters and shares, not takes."},
					{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					Text = "You were never the {#Emph} sharing {#Prev} type. You are callous, Father. Already your allies stand against you." },
										{ 
					Portrait = "Portrait_LordHades_01",Speaker = "NPC_LordHades_01",
					Text = "For the sake of our mother and your old allies, we will offer you this one chance. We will return tomorrow, with our forces behind us. Use the rest of today to decide whether you prefer to abdicate or perish, Father." },
																	{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 1.5, UseChronosSound = false },
					Text = "It seems Ouranos's curse was true after all. I never thought you would use what I taught against me. Go. I too urge you to reconsider. You are no sons of mine. You have no idea the lengths I can go."},
										{ 
					Portrait = "Portrait_Poseidon_Default_InPerson_01",Speaker = "NPC_Poseidon_01",
					Text = "There are few savageries you could surprise us with. Choose wisely, Father. No matter what happens, this ends tomorrow, with us as the victors." },

EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback09(source, args)
	LoadPackages({Name = "Chaos"})
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback09",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
                    PreLineWait = 2.8,

					Text = "Almighty Chaos, I thank you for your aid. Chronos has fallen, and we could not have breached his defences without your power." },
										{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
					ExitPortraitImmediately = true,
					Text = "Whether you could or could not is of little interest. Now you pay the price. You have taken my boon – will you take the curse?" },
										{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.2,
					Text = "…I thought I was saving everyone I loved, but I was the one who brought my fears to life. If this is the cost for my mistakes, then… yes, I will bear it."},
					{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
					Text = "Fascinating. Few accept the price power demands. I did not anticipate any would willingly surrender their own existence." },
										{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "For my children, it is worth it. I stood aside for too long."},
					{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
													PostLineFunctionName = _PLUGIN.guid .. ".TyphonSounds",
					Text = "Your reasoning is of no matter. Our oath is not so easily unmade. Farewell, Motherhood. Rise, Typhon." },

EndVoiceLines = {
	{
						PreLineWait = 0.75,
						UsePlayerSource = true,
                    		{ Cue = "/VO/MelinoeField_0536", Text = "What?!" },
					},
				
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.PlaySurfaceFlashback10(source, args)
	LoadPackages({Name = "Chronos"})
	LoadPackages({Name = "Prometheus"})
	AddInputBlock({ Name = "LowerPalacePresentation" })
	UseableOff({ Id = source.ObjectId })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	Halt({ Id = CurrentRun.Hero.ObjectId })
	EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
	EndAutoSprint()
	
	wait( 0.05 )

	if IsGameStateEligible( source, args.ForceWalkRequirements ) then
		SetupMelWalk()
	end
    wait(0.8)

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
    wait(1.2)
	SetAnimation({ Name = "MelinoeInteract", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 0.5 })
    wait(0.8)

        thread( PlayVoiceLines, {{ Cue = "/VO/Melinoe_1951", Text = "{#Emph}<Gasp>" }} )
    SessionState.InFlashback = true
    	HideGameplayTimers()
        wait(0.5)
	FullScreenFadeInAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    StopSecretMusic()
	EndAmbience()

    	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })


	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "StoryExpansionNotLongAgo",
			Delay = 0.8,
			Duration = 5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )

    DoomContextArtPresentation()
    local textLines = 
			{
				Name = "StoryExpansionSurfaceFlashback10",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
                    PreLineWait = 2.8,

					Text = "I may not have your powers of foresight, Prometheus, but even I can see that the end is nigh. Typhon is falling, and so too is the last remnant of my wife." },
					{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					Text = "Until the last fighter falls, my king, war rages. Grasp hope a little longer."},
										{ 
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					Text = "I've not been your king for an age, Prometheus. I haven't been the king you deserve for a much greater time. It took me far too long to see that." },
										{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					ExitPortraitImmediately= true,
					Text = "You were always my king. Even when I stood with the Olympians, I would not kneel for them. I chose the kind Titan I knew."},
					{ 
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "We've sure made a mess of things. Perhaps the world would have been better off had we never ruled." },
										{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					ExitPortraitImmediately = true,
					Text = "We've both made mistakes, Chronos. We've both made beautiful things too. Maybe we immortals are just as capable of growth as mortals."},
					{ 
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "Prometheus, use your foresight and answer me honestly. Was all of this — the reviving, the fighting, the freeing of Typhon — worth it?" },
{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					ExitPortraitImmediately = true,
					Text = "...Yes. Though you may not see it yet, my king, I promise you that. I would not have advised it otherwise. This future is worth all the struggle in the world."},
					{
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "You're a good friend, Prometheus. Then I will fight with all my might. Thank you for standing with me, until the end."},

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
    StopSecretMusic()
    	Destroy({ Id = fullscreenBlackImageId })
        Destroy({Ids = SessionMapState.DoomContextArtIds})
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    wait(2.5)
end

function mod.TyphonSounds()
PlaySound({Name = "/SFX/Enemy Sounds/Typhon/TyphonTuskSlam"})
PlaySound({Name = "/SFX/Enemy Sounds/Typhon/TyphonWindBreathAttack"})
wait(0.2)
PlaySound({Name = "/SFX/Enemy Sounds/Typhon/EmotePowerAttacking"})
end


--TODO: Add the rescuing dialogues to TrueEndingCriticalPathEventsOccurred to Prevent Moros Spawn
--TODO: Add important dialogues to ArtemisSingingBlockedByEvents
--TODO: add important dialogue to forceWalkRequirements so you're not forced to walk at Palace
--TODO: go through important dialogue to see what needs to be changed to fit new story, and what requirements need to be updated

NamedRequirementsData.NearTrueEnding = {
		{
			PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeTimeStop" },
		},
		{
			PathFalse = { "CurrentRun", "ActiveBounty" },
		},
		{
			PathFalse = { "GameState", "ReachedTrueEnding" },
		},
}