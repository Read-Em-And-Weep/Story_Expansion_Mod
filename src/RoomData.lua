RoomData.I_PostBoss01.StartUnthreadedEvents =
		{
			{ FunctionName = "HideGameplayTimers" },
			{ FunctionName = "MirrorOffPresentation", },
			{
				FunctionName = "GenericPresentation",
				Args =
				{
					LoadVoiceBanks = { "Zagreus", "Chronos" },
				},
			},
            {
                FunctionName = _PLUGIN.guid .. ".SetUp_I_PostBoss01",
                Args = {
SpawnId = 772206,
                    Offset = {X = -1600, Y = -750},
                    GazeTarget = {X = -900, Y = 0}
                }
            },
			--[[{
				FunctionName = "CheckPriorityConversations",
				GameStateRequirements =
				{
					-- None
				},
				Args =
				{
					Conversations =
					{
						"ZagreusPastMeeting06",
						"ZagreusPastMeeting06_B",
						"ZagreusPastFirstMeeting",
						"ZagreusPastMeeting02",
						"ZagreusPastMeeting02_2",
						"ZagreusPastMeeting03",
						"ZagreusPastMeeting04",
						"ZagreusPastMeeting04_2",
						"ZagreusPastMeeting04_3",
						"ZagreusPastMeeting05",
						-- optional
						"ZagreusPastMeeting07",
					},
					IgnorePackages = true,
				},
			},
			{
				FunctionName = "CheckConversations",
			},]]
		}
RoomData.I_PostBoss01.ObstacleData =
		{
			-- Bed
			[310036] =
			{
				Name = "DreamBed01",
				InteractDistance = 250,
				UseText = "UseHouseBed",
				OnUsedFunctionName = "DreamBedPresentation",

				SetupEvents =
				{
					{
						FunctionName = "GenericPresentation",
						Args =
						{
							CreateAnimation = "IPostBossBedSparkles",
						},
					},
				},
			},

			-- Mirror of Night
			[741588] =
			{
				Name = "NightMirror01",
				InteractDistance = 250,
				UseText = "UseHouseMirror",
				OnUsedFunctionName = "TimeMirrorPresentation",
				OnUsedGameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "UseRecord", "DreamBed01" },
					},
					OrRequirements =
					{
						{
							{
								PathFalse = { "MapState", "ActiveObstacles", 800279 },
							},
						},
						{
							{
								PathTrue = { "CurrentRun", "UseRecord", "HadesSpear01" }
							},
						},
					},
				},
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "Blank",
						},
					}
				},
				DistanceTriggers =
				{
					{
						WithinDistance = 150,
						VoiceLines = { GlobalVoiceLines = "MirrorInitialInspectLines" },
					},
				},
			},

			-- Gigaros
			[800279] =
			{
				Name = "HadesSpear01",
				InteractDistance = 190,
				UseText = "UseHadesSpear",
				OnUsedFunctionName = "UseHadesSpearPresentation",
				SetupGameStateRequirements =
				{
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAny = { "StoryExpansionSurfaceFlashback09" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "StoryExpansionObtainingHadesSpearPoint" },
					},
				},
				DestroyIfNotSetup = true,

				SetupEvents =
				{
					{
						FunctionName = "GenericPresentation",
						Args =
						{
							SetAlpha = 0.0,
							UseableOff = true,
						},
					},
				},

				DistanceTriggers =
				{
					{
						TriggerObjectType = "MetaUpgradeScreen",
						WithinDistance = 150,
						Repeat = true,
						FunctionName = "PingHadesSpear",
					},
				},
			},

			-- Zagreus Mirror
			--[[[772206] =
			{
				Name = "ZagreusPastMirrorLinesTrigger",
				DistanceTriggers =
				{
					{
						WithinDistance = 600,
						VoiceLines = { GlobalVoiceLines = "ZagreusPastMirrorLines" },
					},
				},
			},
			[772208] =
			{
				Name = "ZagreusPastMirror",
				DistanceTriggers =
				{
					{
						Name = "ZagreusInterrupt",
						WithinDistance = 450,
						VoiceLines = { GlobalVoiceLines = "ZagreusPastGreetingLines" },
					},
				},
			},]]

			-- fake exit to I_DeathAreaRestored
			[420896] =
			{
				Name = "I_PostBossExit",
				DistanceTriggers =
				{
					{
						WithinDistance = 350,
						Repeat = true,
						VoiceLines =
						{
							PlayOnceFromTableThisRun = true,
							RandomRemaining = true,
							PlayOnce = true,
							PlayOnceContext = "ZagBedroomExitAttemptVO",
							UsePlayerSource = true,
							GameStateRequirements =
							{
								{
									PathTrue = { "CurrentRun", "CurrentRoom", "InDreamState" },
								},
								{
									Path = { "CurrentRun", "TextLinesRecord" },
									HasNone = { "ZagreusPastMeeting06", "ZagreusPastMeeting06_B" },
								},
							},
							Cooldowns =
							{
								{ Name = "MelinoeAnyQuipSpeech", Time = 3 },
							},

							{ Cue = "/VO/MelinoeField_1263", Text = "No turning back.", PlayFirst = true },
							{ Cue = "/VO/MelinoeField_1264", Text = "Not going there." },
							{ Cue = "/VO/MelinoeField_1267", Text = "Not this way..." },
						},
					},
				},

				HideRewardPreview = true,

				InteractDistance = 350,
				InteractOffsetX = 45,
				InteractOffsetY = 135,
				AutoActivate = true,
			},

			-- satyr sack
			[742074] =
			{
				Name = "SatyrSack01",
				DistanceTriggers =
				{
					{
						WithinDistance = 150,
						VoiceLines =
						{
							PlayOnce = true,
							PlayOnceContext = "ZagBedroomObservationVO",
							UsePlayerSource = true,
							GameStateRequirements =
							{
								NamedRequirementsFalse = { "HecateMissing" },
							},
							Cooldowns =
							{
								{ Name = "MelinoeAnyQuipSpeech", Time = 3 },
							},
							{ Cue = "/VO/MelinoeField_3407", Text = "Such an awful mess..." },
						},
					},
				},
			},

		}

		

RoomData.I_PostBoss01.EnterVoiceLines =
		{
			{
				PlayOnce = true,
				PlayOnceContext = "ZagChamberFinalEntranceVO",
				PreLineWait = 1.2,
				BreakIfPlayed = true,
				GameStateRequirements =
				{
					NamedRequirements = { "HecateMissing" },
				},
				TriggerCooldowns = { "MelinoeAnyQuipSpeech" },

				{ Cue = "/VO/MelinoeField_5040", Text = "Hold on, Headmistress..." },
			},
			{
				PlayOnce = true,
				PlayOnceContext = "ZagChamberEntranceVO",
				PreLineWait = 1.0,
				BreakIfPlayed = true,
				GameStateRequirements =
				{
					{
					},
				},
				TriggerCooldowns = { "MelinoeAnyQuipSpeech" },

				{ Cue = "/VO/MelinoeField_3404", Text = "The Prince's chambers... the Mirror..." },
				{ Cue = "/VO/MelinoeField_3405", Text = "Just as it was..." },
				{ Cue = "/VO/MelinoeField_1259", Text = "So much dust..." },
			},
		}



--[[mod.RoomData = {I_PostBoss01 =
	{
		InheritFrom = { "BaseI" },
		RichPresence = "#RichPresence_PostBossUnderworld",
		LegalEncounters = { "Empty" },

		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasFishingPoint = false,
		HasExorcismPoint = false,

		BlockCombat = true,

		GameStateRequirements =
		{
			-- None
		},

		EntranceFunctionName = "RoomEntranceIPostBoss",
		RequiresLinked = true,
		LinkedRoom = "I_ChronosFlashback01",
		ExitPreviewAnim = "ExitDownPreview",
		IgnoreMusic = true,
		BlockRunProgressUI = true,
		EntranceDirection = "Right",
		NoReward = true,
		NoReroll = true,
		ZoomFraction = 0.9,

		FlipHorizontalChance = 0.0,
		IntroSequenceDuration = 0.9,

		SkipLastKillPresentation = true,
		ChallengeSpawnChance = 0.0,
		WellShopSpawnChance = 0.0,
		SecretSpawnChance = 0.0,

		ReverbValue = -1,
		GlobalEcho = 0,

		StartUnthreadedEvents =
		{
			{ FunctionName = "HideGameplayTimers" },
			{ FunctionName = "MirrorOffPresentation", },
			{
				FunctionName = "GenericPresentation",
				Args =
				{
					LoadVoiceBanks = { "Zagreus", "Chronos" },
				},
			},
			{
				FunctionName = "ActivatePrePlaced",
				Args =
				{
					Types = { "NPC_Zagreus_Past_01" },
				},
			},
			{
				FunctionName = "CheckPriorityConversations",
				GameStateRequirements =
				{
					-- None
				},
				Args =
				{
					Conversations =
					{
						"ZagreusPastMeeting06",
						"ZagreusPastMeeting06_B",
						"ZagreusPastFirstMeeting",
						"ZagreusPastMeeting02",
						"ZagreusPastMeeting02_2",
						"ZagreusPastMeeting03",
						"ZagreusPastMeeting04",
						"ZagreusPastMeeting04_2",
						"ZagreusPastMeeting04_3",
						"ZagreusPastMeeting05",
						-- optional
						"ZagreusPastMeeting07",
					},
					IgnorePackages = true,
				},
			},
			{
				FunctionName = "CheckConversations",
			},
		},

		ObstacleData =
		{
			-- Bed
			[310036] =
			{
				Name = "DreamBed01",
				InteractDistance = 250,
				UseText = "UseHouseBed",
				OnUsedFunctionName = "DreamBedPresentation",

				SetupEvents =
				{
					{
						FunctionName = "GenericPresentation",
						Args =
						{
							CreateAnimation = "IPostBossBedSparkles",
						},
					},
				},
			},

			-- Mirror of Night
			[741588] =
			{
				Name = "NightMirror01",
				InteractDistance = 250,
				UseText = "UseHouseMirror",
				OnUsedFunctionName = "TimeMirrorPresentation",
				OnUsedGameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "UseRecord", "DreamBed01" },
					},
					OrRequirements =
					{
						{
							{
								PathFalse = { "MapState", "ActiveObstacles", 800279 },
							},
						},
						{
							{
								PathTrue = { "CurrentRun", "UseRecord", "HadesSpear01" }
							},
						},
					},
				},
				SetupEvents =
				{
					{
						FunctionName = "OverwriteSelf",
						Args =
						{
							Animation = "Blank",
						},
					}
				},
				DistanceTriggers =
				{
					{
						WithinDistance = 150,
						VoiceLines = { GlobalVoiceLines = "MirrorInitialInspectLines" },
					},
				},
			},

			-- Gigaros
			[800279] =
			{
				Name = "HadesSpear01",
				InteractDistance = 190,
				UseText = "UseHadesSpear",
				OnUsedFunctionName = "UseHadesSpearPresentation",
				SetupGameStateRequirements =
				{
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAny = { "ZagreusPastMeeting04_3" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "ZagreusPastMeeting05" },
					},
				},
				DestroyIfNotSetup = true,

				SetupEvents =
				{
					{
						FunctionName = "GenericPresentation",
						Args =
						{
							SetAlpha = 0.0,
							UseableOff = true,
						},
					},
				},

				DistanceTriggers =
				{
					{
						TriggerObjectType = "MetaUpgradeScreen",
						WithinDistance = 150,
						Repeat = true,
						FunctionName = "PingHadesSpear",
					},
				},
			},

			-- Zagreus Mirror
			[772206] =
			{
				Name = "ZagreusPastMirrorLinesTrigger",
				DistanceTriggers =
				{
					{
						WithinDistance = 600,
						VoiceLines = { GlobalVoiceLines = "ZagreusPastMirrorLines" },
					},
				},
			},
			[772208] =
			{
				Name = "ZagreusPastMirror",
				DistanceTriggers =
				{
					{
						Name = "ZagreusInterrupt",
						WithinDistance = 450,
						VoiceLines = { GlobalVoiceLines = "ZagreusPastGreetingLines" },
					},
				},
			},

			-- fake exit to I_DeathAreaRestored
			[420896] =
			{
				Name = "I_PostBossExit",
				DistanceTriggers =
				{
					{
						WithinDistance = 350,
						Repeat = true,
						VoiceLines =
						{
							PlayOnceFromTableThisRun = true,
							RandomRemaining = true,
							PlayOnce = true,
							PlayOnceContext = "ZagBedroomExitAttemptVO",
							UsePlayerSource = true,
							GameStateRequirements =
							{
								{
									PathTrue = { "CurrentRun", "CurrentRoom", "InDreamState" },
								},
								{
									Path = { "CurrentRun", "TextLinesRecord" },
									HasNone = { "ZagreusPastMeeting06", "ZagreusPastMeeting06_B" },
								},
							},
							Cooldowns =
							{
								{ Name = "MelinoeAnyQuipSpeech", Time = 3 },
							},

							{ Cue = "/VO/MelinoeField_1263", Text = "No turning back.", PlayFirst = true },
							{ Cue = "/VO/MelinoeField_1264", Text = "Not going there." },
							{ Cue = "/VO/MelinoeField_1267", Text = "Not this way..." },
						},
					},
				},

				HideRewardPreview = true,

				InteractDistance = 350,
				InteractOffsetX = 45,
				InteractOffsetY = 135,
				AutoActivate = true,
			},

			-- satyr sack
			[742074] =
			{
				Name = "SatyrSack01",
				DistanceTriggers =
				{
					{
						WithinDistance = 150,
						VoiceLines =
						{
							PlayOnce = true,
							PlayOnceContext = "ZagBedroomObservationVO",
							UsePlayerSource = true,
							GameStateRequirements =
							{
								NamedRequirementsFalse = { "HecateMissing" },
							},
							Cooldowns =
							{
								{ Name = "MelinoeAnyQuipSpeech", Time = 3 },
							},
							{ Cue = "/VO/MelinoeField_3407", Text = "Such an awful mess..." },
						},
					},
				},
			},

		},

		InspectPoints =
		{
			[772209] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "ZagreusPastFirstMeeting" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "ZagreusPastMeeting04" },
					},
					-- NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_I_PostBoss01_01 =
					{
						{ Cue = "/VO/Storyteller_0413",
							Text = "{#Emph}The chambers of the missing Underworld Prince lie in a perpetual state of utter disarray; marked by the passage of Time, but otherwise untouched, for who would dare?" },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/MelinoeField_3859", Text = "Just as we surmised..." },
						},
					},
				},
			},
			[772210] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "Inspect_I_PostBoss01_01" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "ZagreusPastMeeting04" },
					},
					-- NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_I_PostBoss01_02 =
					{
						{ Cue = "/VO/Storyteller_0414",
							Text = "{#Emph}The ancient Mirror of Night, that conduit of dark primordial power from before Time took hold, lies forgotten amid the myriad possessions of the captive Underworld Prince." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							RequiredMinElapsedTime = 3,
							{ Cue = "/VO/MelinoeField_3860", Text = "An ordinary mirror, nothing more..." },
						},
					},

				},
			},

		},

		EnterVoiceLines =
		{
			{
				PlayOnce = true,
				PlayOnceContext = "ZagChamberFinalEntranceVO",
				PreLineWait = 1.2,
				BreakIfPlayed = true,
				GameStateRequirements =
				{
					NamedRequirements = { "HecateMissing" },
				},
				TriggerCooldowns = { "MelinoeAnyQuipSpeech" },

				{ Cue = "/VO/MelinoeField_5040", Text = "Hold on, Headmistress..." },
			},
			{
				PlayOnce = true,
				PlayOnceContext = "ZagChamberEntranceVO",
				PreLineWait = 1.0,
				BreakIfPlayed = true,
				GameStateRequirements =
				{
					{
					},
				},
				TriggerCooldowns = { "MelinoeAnyQuipSpeech" },

				{ Cue = "/VO/MelinoeField_3404", Text = "The Prince's chambers... the Mirror..." },
				{ Cue = "/VO/MelinoeField_3405", Text = "Just as it was..." },
				{ Cue = "/VO/MelinoeField_3406", Text = "All right, Brother..." },
				{ Cue = "/VO/MelinoeField_1259", Text = "So much dust..." },
				{ Cue = "/VO/MelinoeField_3408", Text = "Hold on, Brother..." },
			},
		},

	}
}
]]

ProcessDataInheritance(RoomData.I_PostBoss01, RoomData)