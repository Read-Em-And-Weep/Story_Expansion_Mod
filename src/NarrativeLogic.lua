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
					Text = "Mother, I am at your service, as always. Why have you called me here?" },
				{
					Portrait = "StoryExpansion_Hooded_Gaia",Speaker = "StoryExpansionUnknownFemaleSpeaker",
                    PreLineWait = 0.5,
					Text = "My son, tonight you fulfill your destiny. You will take this scythe and use it to kill Ouranos, the Sky Incarnate. I have tired of him and his pathetic attempts at companionship." },
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "StoryExpansionUnknownMaleSpeaker",

					Text = "{#Emph}Mother{#Prev}! You cannot be asking me to take up arms against my Father! Please do not ask stand against my family." },

							{
					Portrait = "StoryExpansion_Hooded_Gaia",Speaker = "StoryExpansionUnknownFemaleSpeaker",
                    												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.5, UseChronosSound = false },

					Text = "You {#Emph}can {#Prev}and you {#Emph}will{#Prev}. You are my creation and you {#Emph}will {#Prev} follow my commands. Or else, you will feel the full fury of the Earth." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "StoryExpansionUnknownMaleSpeaker",
					Text = "I... I..." },

{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "StoryExpansionUnknownMaleSpeaker",
										PreLineWait = 0.8,

					Text = "...I am your loyal servant, Mother. Point me towards your enemies, and I shall be your sword."},

							{
					Portrait = "StoryExpansion_Hooded_Gaia",Speaker = "StoryExpansionUnknownFemaleSpeaker",
                                        												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 1.5, UseChronosSound = false },

					Text = "{#Emph}Oh{#Prev}, Chronos, my son, I am glad you have come around. {#Emph} Death to Ouranos {#Prev}!"},
					{ 
						PreLineWait = 0.85,
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "{#Emph}Death to Ouranos{#Prev}..."},

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
					PreLineWait = 2.8,
					Portrait = "StoryExpansion_Hooded_Chronos", Speaker = "NPC_Chronos_01",
					Text = "Father, your time is up. Do you not hear the death knells of you reign, as decreed by Mother Gaia? Step aside now, or face the rightful force of your son." },
				{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.5, UseChronosSound = false },
					Text = "You would {#Emph} dare {#Prev} raise your blade against me, Chronos? We are {#Emph} family{#Prev}. Those oaths bind your loyalty to me and {#Emph} me {#Prev} alone." },
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "{#Emph} <Scoff> {#Prev} What good are these bonds when you have done nothing for me? You provided me no home, no guidance, and left the beings of this world you rule to rot so you could further pursue my mother. You were a cruel father, but an even crueller king." },

							{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
                    												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.5, UseChronosSound = false },

					Text = "If I am to be a cruel father, then you are a cruel son. I can see it in you, a heart just as black and selfish as mine. If you must, harden it and strike me thus, but know you crimes will not be without punishment." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "{#Emph}Father..." },

{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
										PreLineWait = 0.8,
								PostLineFunctionName = _PLUGIN.guid .. ".BattleSounds",

					Text = "I will make stony my heart. It may be the only good piece of advice you've ever given me. Prepare yourself for a fight, and to lose."},

							{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",

					Text = "I'll admit, I did not think you would be able to slay me Chronos. This may be the most furious, and paradoxically the most proud, I have ever been of you."},
					{ 
						PreLineWait = 0.85,
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "{#Emph}Death to Ouranos{#Prev}. That was my vow to my mother, and I will enact it now."},
					{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
                    												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 1.5, UseChronosSound = false },

					Text = "Then I will grant you once last boon, a curse on you and your name. You shall suffer, just as you have made me suffer. You stole your mother's love from me, so too shall my curse take your love from you. Your children will end you, just as you ended me."},
										{ 
						PreLineWait = 0.85,
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "The world is no longer bound by your rule, Father. Your curse means nothing when our fates will be decided by us, and us alone."},
										{
					Portrait = "StoryExpansion_Hooded_Ouranos",Speaker = "StoryExpansion_NPC_Ouranos",
PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.0, UseChronosSound = true },
					Text = "{#Emph} Ha... {#Prev} You are much more like me than you know. Whether or not my curse carries power, it will come true. I see the ugliness inside of you, and it will be a downfall of your own making. {#Emph} Death to Chronos..."},
										{ 
						PreLineWait = 1.2,
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Goodbye Father. May you be remembered more favourably than you were."},



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
				Name = "StoryExpansionSurfaceFlashback03",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					PreLineWait = 2.8,
					Portrait = "StoryExpansion_Hooded_Chronos", Speaker = "NPC_Chronos_01",
					Text = "Prometheus, why have you brought me to this den of... {#Emph} needless violence{#Prev}? I have duties I need to be attending to; the nymphs and satyrs are still fighting, not to mention the nereids complaints about the centaurs that won't stop partying." },
				{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
                    PreLineWait = 0.5,
					Text = "And that is exactly {#Emph} why {#Prev} I've brought you along. You've got to find a way to relax, my king, and let out that aggression before it all bursts out of you. And besides, it's a formal wrestling tournament, not some immoral fight club." },
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "Prometheus, I made you my advisor for your wisdom and foresight about state matters, not for you to meddle in my matters." },

							{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",

					Text = "Trust in my foresight now, my king. I've seen something, or rather, someone, you'll find very interesting." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I'm much too busy for this Prometheus..." },

{ 
					Portrait = "nil",Speaker = "StoryExpansionUnknownAnnouncer",
										PreLineWait = 0.8,

					Text = "And she's completely stormed through the competition! Is there anyone, {#Emph} anyone{#Prev}, in the audience daring enough to take on the monster?"},

							{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",

					Text = "Over here! I've got a buddy just dying to take on the champion!"},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.2, UseChronosSound = false },
					Text = "Prometheus! What are you doing? I didn't sign up for this!"},
					{ 
					Portrait = "nil",Speaker = "StoryExpansionUnknownAnnouncer",
					Text = "And it seems like we've got a volunteer from the audience to take her on. Make way for the brave Titan who thinks he can take on the reigning conqueror!"},
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "{#Emph} Oh... {#Prev} Hello. I... {#Emph} um{#Prev}... don't believe we've ever met. Do you, {#Emph} uh {#Prev} come here often?"},

												{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansionUnknownFemaleSpeaker",
					Text = "Does the reigning champion of this competition come here often? You'll have to ask the organisers whether or not I do. You look quite nervous, Titan King; afraid you'll lose?"},
{ 
					Portrait = "nil",Speaker = "StoryExpansionUnknownAnnouncer",
					Text = "LET THE FIGHT BEGIN!",
						PostLineFunctionName = _PLUGIN.guid .. ".BattleSounds",
},
					{ 
					Portrait = "nil",Speaker = "StoryExpansionUnknownAnnouncer",
					Text = "...and in expected fashion, our champion has pulled ahead and pummelled this lovely volunteer into the ground!",
				},
				{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansionUnknownFemaleSpeaker",
					Text = "You did well, Titan King. Not many can handle fighting me for so long. You were evasive and fast, like a sandstorm.",
				},
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I really enjoyed fighting you too. You're a {#Emph} beautiful {#Prev} fighter. I would love to... {#Emph} um... {#Prev} test myself against you again, my lady.",
				},
				{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					PreLineWait = 0.3,
					Text = "{#Emph} Oh{#Prev}, you're cute. Sure, I'll fight you again. The name's Rhea, and don't you forget it Sandstorm.",
				},
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.25,
					Text = "{#Emph} Rhea...",
				},

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
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
                    PreLineWait = 2.8,
					Text = "So, my king, you must admit that my idea of taking you to that wrestling match all those months ago was a good one, and that you can trust my judgement." },
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "Yes, Prometheus, as I have said plenty of times since then, you taking me to meet Rhea was an excellent idea. She has certainly, {#Emph} ahem {#Prev} brightened up my life since I met her." },

							{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",

					Text = "And not only your life, but you become a much better king since you met her. Everyone has been saying how much kinder you are now!" },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Are you suggesting I was cruel before? I'm also not an idiot, Prometheus. What are you trying to butter me up for now?" },
							{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",

					Text = "Well it's to do with my newest creation. I'm finally ready to show it to you. You promise you'll be kind?"},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I thought you said I was the kind king after meeting Rhea. Besides, if it was kindness you were after, you would have shown your brother. I'm known for honest feedback." },
												{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",

					Text = "I call them mortals. They're like us Titans, but much weaker, and with limited lifespans."},
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Perhaps I'm missing something here. What is it exactly that they... {#Emph} do{#Prev}? What is their purpose?" },
																	{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",

					Text = "That's just it! They don't have a single purpose. They exist to live, to change, to grow beyond our expectations of them. Isn't that limitless potential beautiful?"},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "If you say so... but what do you want me to do with them?" },
															{ 
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					Text = "Give them a place in your kingdom. Let them live upon the land and thrive. I know that with a little help, these mortals will be able to do great things." },
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "If this is the cost of your advice and foresight, I shall gladly bare it. Know that under my kingdom, these mortals shall know no struggle or woe." },
															{ 
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					Text = "Thank you, my king." },
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
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
                    PreLineWait = 2.8,
					Text = "Sandstorm, I have some {#Emph} important {#Prev} news I need to tell you. You want to prepare yourself." },
				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "Rhea, please, tell me, is everything alright? Is there someone I need to fight?" },

							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "{#Emph} Ha!{#Prev} I'm better at fighting than you, and you know it! This is, however, a fight of an entirely different sort." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Rhea, my wife, please speak plainly. You are worrying me." },
							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "Well, recently I felt a new power in me. A new life. One a little like you, and a little like me."},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "You mean to say... you are {#Emph} pregnant{#Prev}?" },
												{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "Yes! With a little boy, none-the-less! {#Emph} Oh{#Prev}, Sandstorm, aren't you excited to pamper the prince?"},
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "I... Rhea... I'm not sure that'll I be a good father to him." },
																	{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "...Chronos, you cannot still can't be taking about what your father said seriously."},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I fear you see my in a much kinder light than I am. He was right about the cruel heart I have inside." },
															{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "We all have aspects from our parents, that we love or hate. It is what we do with these parts that matter. Stone heart or not, Sandstorm, you have been loving to me, to your subjects, and I'm sure you will be to our children. So long as you focus on the parts that matter." },
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "...Have I ever told you how wise you are, wife? I don't know how I could do this job without you. I love you." },
															{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "I don't know what {#Emph} <cough> {#Prev} you'd do without me either. I keep this place running while you worry about the rest of the kingdom. I love you too. {#Emph} <cough>{#Prev}" },
																				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Are you alright? That's a nasty cough." },
																				{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "The pregnancy has just been draining my strength. I'll be back to full strength in no time. Trust me, dear? {#Emph} <cough>{#Prev}" },
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
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
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
                    PreLineWait = 2.8,

					Text = "Rhea, you haven't been getting better, have you?" },

							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "...{#Emph} <cough> {#Prev}" },
					{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
						PreLineWait = 0.4,
					Text = "...To tell you the truth, no. I feel weaker every day. But I need to get up. How are the children?" },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I'm not sure how much longer they will buy my excuses for your condition. Especially with it getting worse. Besides, you were always better with them than I." },
							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "We need to consider what we will do if my condition continues to worsen. You'll have to {#Emph} <cough> {#Prev} look after me, Zeus, Poseidon, Hades and the world. Even with your control of time, there's no way you could handle all that."},
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "No. I {#Emph} refuse {#Prev} to be placed in that position. If I have to fight Chaos themselves for that, then I will." },
												{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "You couldn't even best me, so what makes you think {#Emph} <cough> {#Prev} Almighty Chaos would be more of a pushover? Be real Sandstorm, this is a decision you may have to make. If it comes down to it, I want you to forget about me."},
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "Rhea... I can't {#Emph} ever {#Prev} do that to you." },
																	{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "For the sake of our children and the world, you {#Emph} can {#Prev} and you {#Emph} will{#Prev}. Now please, let me rest. It has been a {#Emph} <cough> {#Prev} draining day."},
															{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					PreLineWait = 0.85,
					Text = "Father? Is Mother in here? She promised she would play with us earlier." },
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "I think it would be best if you leave now, boy. She is not up to playing games. Besides, do you not have duties to fulfill." },
															{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					Text = "I... Yes Father. I just wanted to have some fun." },
																				{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "You are a prince of the Titan regime. Therefore you have certain responsibilities and I expect you to meet them. And please, Zeus, try to avoid bothering you mother again." },
																				{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					Text = "...Yes, Father. I understand." },

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
	LoadPackages({Name = "Nyx"})
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
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
                    PreLineWait = 2.8,

					Text = "Lady Nyx, thank you for coming. I would not have called you here if I was not desperate." },

							{
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_01",

					Text = "Yes, I am sure you have become desperate. Already, we forces of nature have stopped receiving the care that you promised us after deposing Ouranos. I hear Prometheus has also gotten testy about your treatment of his mortals." },
{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "With due respect, O Night, I am trying my best. It has been a difficult time. I would appreciate your help with my wife, if you are able." },
							{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "{#Emph} Uh... {#Prev} Nyx... is that you?"},
					{ 
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_01",
					Text = "Oh Rhea, it hurts to see you like this. You were always so full of life. Ouranos's curse is crueller than anything I could have thought of." },
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "{#Emph}Ouranos's curse... {#Prev} you mean, it's real? And Rhea's condition... it's my fault for bringing the curse down upon her? And the other parts of the curse, they are true too?" },
																	{
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_01",

					Text = "I cannot tell you what parts of Ouranos's curse have power, only that it is the Sky's persisting strength draining Rhea's."},
																	{
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",

					Text = "Choosing to love you was never a curse, Sandstorm. I would do it over again, even with the cost."},
															{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Oh, Rhea, I would bare the cost for you if I could. Nyx, is there anything you or your children can do for her?" },
															{ 
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_01",
					Text = "The magick of this curse is dark, hateful, and incredibly tightly woven. It is far beyond my power to break it and heal her." },
																				{ 
					Portrait = "StoryExpansion_Hooded_Rhea",Speaker = "StoryExpansion_NPC_Rhea",
					Text = "So this is the end of our story. Remember what I asked of you, Chronos. Move on from me once I'm gone." },
																				{ 
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_01",
					Text = "While there may be nothing I can do, there is one more powerful than I. I can speak on your behalf to my ancestor, but you alone must bear the cost of their boon." },
					{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Yes. {#Emph} Yes{#Prev}! This is exactly what we were looking for! Nyx, thank you truly. When Rhea returns to herself, you will be rewarded." },
																									{ 
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_01",
					Text = "Do not count your blessings before you have paid, Chronos. I fear the price may be too high, even for you." },
										{ 
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "If Rhea survives, no cost will be too great. I will give up myself, my kingdom, all I own. Perhaps I am selfish like my father in that way." },

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

					Text = "Do you not hear the death knells of you reign, as decreed by Fates? Have you not heard nature screaming out for a new regime?" },
{ 
					Portrait = "Portrait_LordHades_01",Speaker = "NPC_LordHades_01",
					Text = "You have rejected your duties to the beings of this world for too long. They have now stepped up and gifted us the Infernal Arms, for us to subdue you." },
							{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",

					Text = "You would strike against your family? After all I have done for you? Family {#Emph} shares{#Prev}, not takes."},
					{ 
					Portrait = "Portrait_Zeus_InPerson_01",Speaker = "NPC_Zeus_01",
					Text = "You were never the {#Emph} sharing {#Prev} type. Your soul is cruel, Father. Already your allies stand against you." },
										{ 
					Portrait = "Portrait_LordHades_01",Speaker = "NPC_LordHades_01",
					Text = "For the sake of our mother and your old allies, we will offer you this one chance. We will return tomorrow, with our forces behind us. Use the rest of today to decide whether you prefer to abdicate or to perish, Father." },
																	{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 1.5, UseChronosSound = false },
					Text = "It seems Ouranos's curse was true after all. Go. I have affairs to deal with before meeting your threat tomorrow. I too urge you to reconsider. You have no idea the depths of my cruelty."},
										{ 
					Portrait = "Portrait_Poseidon_Default_InPerson_01",Speaker = "NPC_Poseidon_01",
					Text = "There is little you could do to suprise us. Enjoy your last day, Father. We will relish in our victory tomorrow." },

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
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
                    PreLineWait = 2.8,

					Text = "Approach, supplicant, and ask. My descendant has made a plea on your behalf, and I have been moved to listen. Respond." },
					{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Almighty Chaos, I seek your aid in unravelling Ouranos's curse on my wife, Rhea. In his dying hatred, he has taken her strength with cruel and dark magick beyond the ability of Lady Nyx to cure."},
										{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
					Text = "But not beyond my abilities to heal. I assume my descendant has already informed you that my blessings come with their own prices." },
										{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Yes, and I am willing to pay {#Emph} anything {#Prev} for Rhea to be cured."},
					{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
					Text = "You are not the one recieving my blessing. You will not be the one to bare the associated curse." },
										{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "Rhea..."},
					{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
					Text = "Here is my offer. I will guarantee her survival. The curse will not sap aside any of her strength, and I will restore it. In exchange, she will be consumed by her rage and transformed into a monstrosity." },
{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					Text = "..."},
					{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 1.5,
					Text = "...But she will not be harmed? Her health shall be restored?"},
										{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
					Text = "Underneath all the anger and horror, she will be perfectly well. With how strong Ouranos's curse is, there is no other option that will save her from complete oblivion. Will you pay the price?" },
{
					Portrait = "StoryExpansion_Hooded_Chronos",Speaker = "NPC_Chronos_01",
					PreLineWait = 1.5,
					Text = "...{#Emph}Yes{#Prev}. Though she may hate it, my heart is set on saving her no matter the cost. I have paid too much to turn back."},
					{ 
					Portrait = "Portrait_Chaos_Default_01",Speaker = "NPC_Chaos_01",
													PostLineFunctionName = _PLUGIN.guid .. ".TyphonSounds",
					Text = "Very well. Let her be transformed into a true monstrosity. {#Emph} So mote it be{#Prev}." },

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

					Text = "I may not have your powers of foresight, Prometheus, but even I can see that the end is nigh. Typhon is falling, and so too is the last remenant of my wife." },
					{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					Text = "It is not over until the last fighter falls, my king. Hold onto your hope and love for a little longer."},
										{ 
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					Text = "I've not been your king for a while, Prometheus. And I haven't been the king you deserve for a much longer time. I'm sorry it took me so long to see that." },
										{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					Text = "The Chronos I took with me to wrestling matches and first showed mortals to was always my king. Even when I stood with the Olympians, I would not kneel for them. I chose the kind Titan I once knew."},
					{ 
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "We've sure made a mess of things. Maybe the world would have been better off without us. At least then my wife wouldn't have had to suffer as that monster." },
										{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					Text = "We've both made mistakes, Chronos. But we've both made beautiful things too. Maybe we immortals are just as capable of growth as mortals."},
					{ 
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "Prometheus, please use your foresight and answer me honestly. Was all of this — the reviving, the fighting, the freeing of Typhon — worth it?" },
{
					Portrait = "Portrait_Prometheus_Default_01",Speaker = "Prometheus",
					Text = "...Yes. Though you may not see it yet, my king, I promise you that. It is worth all of the struggle in the world."},
					{
					Portrait = "Portrait_Chronos_Default_01",Speaker = "NPC_Chronos_01",
					PreLineWait = 0.8,
					Text = "You're a good friend, Prometheus. Thank you for standing with me, until the end."},

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