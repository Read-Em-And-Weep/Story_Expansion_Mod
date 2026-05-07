mod.NyxNPCData = {
    NPC_Nyx_Hub_StoryExpansion = {
		Name = "NPC_Nyx_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "558175",
		Offset = {X = -250, Y = -230},
		GazeTarget = {X = -230, Y = -150},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
  
		    ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingNyxDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},

		Portrait = "Portrait_Nyx_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        LoadPackages = { "Nyx", },

		InteractTextLineSets = {
        StoryExpansion_NyxChat01 = {
				Name = "StoryExpansion_NyxChat01",
				UseableOffSource = true,
				{
					Text = "Darkness guide you, child."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat02 = {
				Name = "StoryExpansion_NyxChat02",
				UseableOffSource = true,
				{
					Text = "I am preoccupied, so please excuse me, child."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat03 = {
				Name = "StoryExpansion_NyxChat03",
				UseableOffSource = true,
				{
					Text = "Take care of yourself, child."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_NyxChat04 = {
				Name = "StoryExpansion_NyxChat04",
				UseableOffSource = true,
				{
					Text = "I shall be watching over you, and our House alike."
				},
			},
			StoryExpansion_NyxChat05 = {
				Name = "StoryExpansion_NyxChat05",
				UseableOffSource = true,
				{
					Text = "Go, fulfill your purpose, child."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat06 = {
				Name = "StoryExpansion_NyxChat06",
				UseableOffSource = true,
				{
					Text = "You are always welcome in my company, Princess."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_NyxChat07 = {
				Name = "StoryExpansion_NyxChat07",
				UseableOffSource = true,
				{
					Text = "Do not despair, and hold to your resolve, child."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat08 = {
				Name = "StoryExpansion_NyxChat08",
				UseableOffSource = true,
				{
					Text = "Remember there are those who love you, Princess."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat09 = {
				Name = "StoryExpansion_NyxChat09",
				UseableOffSource = true,
				{
					Text = "Do not let circumstances rattle your resolve, child."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_NyxChat10= {
				Name = "StoryExpansion_NyxChat10",
				UseableOffSource = true,
				{
					Text = "The life the Fates apportioned to you lies ahead, Princess."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat11= {
				Name = "StoryExpansion_NyxChat11",
				UseableOffSource = true,
				{
					Text = "I shall keep you safe during your stay here, child, so you may take risks when you travel tonight."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat12= {
				Name = "StoryExpansion_NyxChat11",
				UseableOffSource = true,
				{
					Text = "I am well, though thank you for your remembering me, child."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat13= {
				Name = "StoryExpansion_NyxChat13",
				UseableOffSource = true,
				{
					Text = "It pleases me having these brief exchanges, child."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat14= {
				Name = "StoryExpansion_NyxChat14",
				UseableOffSource = true,
				{
					Text = "I'm afraid I'm too busy solving the problems arisen from Chronos's usurping to be of much company tonight, Princess."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat15= {
				Name = "StoryExpansion_NyxChat15",
				UseableOffSource = true,
				{
					Text = "My faith in you has never faltered, Princess."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat16= {
				Name = "StoryExpansion_NyxChat16",
				UseableOffSource = true,
				{
					Text = "Though your journeys take you elsewhere, still it pleases me to see you, Princess."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat17 = {
				Name = "StoryExpansion_NyxChat17",
				UseableOffSource = true,
				{
					Text = "My children who have met you or remember you are better for it, O Melinoë, Princess."
				},
				GameStateRequirements = {
					{
					}
				},
			},
			StoryExpansion_NyxChat18 = {
				Name = "StoryExpansion_NyxChat18",
				UseableOffSource = true,
				{
					Text = "Thanatos spoke well of your fighting prowess. I am heartened that the Nocturnal Arms aid you in such a way."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat19 = {
				Name = "StoryExpansion_NyxChat19",
				UseableOffSource = true,
				{
					Text = "It is heartening to see some my children fulfilled their duty to you in my absence. Were that they all so thoughtful."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_NyxChat20 = {
				Name = "StoryExpansion_NyxChat20",
				UseableOffSource = true,
				{
					Text = "The nature of this realm, my child, is not fully known or understood, not by anyone within it or above."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat21 = {
				Name = "StoryExpansion_NyxChat21",
				UseableOffSource = true,
				{
					Text = "Go, and serve this House."
				},
				GameStateRequirements = {
					{
					},
				},
			},
			StoryExpansion_NyxChat22 = {
				Name = "StoryExpansion_NyxChat22",
				UseableOffSource = true,
				{
					Text = "Go, in honor of your birthmother, the Queen."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat23 = {
				Name = "StoryExpansion_NyxChat23",
				UseableOffSource = true,
				{
					Text = "Perhaps another night we may join our magick together. Tonight, however, we both have our duties."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat24 = {
				Name = "StoryExpansion_NyxChat24",
				UseableOffSource = true,
				{
					Text = "Go, my champion, and make terrified our enemies."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_NyxChat25 = {
				Name = "StoryExpansion_NyxChat25",
				UseableOffSource = true,
				{
					Text = "I sense the remnants of my Aspect of the Black Coat on you tonight. I trust it aided you well."
				},
				GameStateRequirements = {
					{
						PathTrue = {"GameState", "TextLinesRecord", "Placeholder"}
					}
				},
			},
			StoryExpansion_NyxChat26 = {
				Name = "StoryExpansion_NyxChat26",
				UseableOffSource = true,
				{
					Text = "Not long ago, Nemesis and I spoke of you. Perhaps you should do the same with her."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat27 = {
				Name = "StoryExpansion_NyxChat27",
				UseableOffSource = true,
				{
					Text = "I trust that Eris has not been {#Emph}too {#Prev}much of an impediment of late."
				},
				GameStateRequirements = {
				},
			},
			StoryExpansion_NyxChat28 = {
				Name = "StoryExpansion_NyxChat28",
				UseableOffSource = true,
				{
					Text = "The Fated List remains within your care, and you have Moros to watch over it."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_NyxChat29 = {
				Name = "StoryExpansion_NyxChat29",
				UseableOffSource = true,
				{
					Text = "May the Nocturnal Arms continue to make manifest your will and wrath."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_NyxChat30 = {
				Name = "StoryExpansion_NyxChat30",
				UseableOffSource = true,
				{
					Text = "Hypnos asked about you recently, as though I had not already told him."
				},
				GameStateRequirements = {
{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosFinalDreamMeeting01" },
					},
				},
			},
			StoryExpansion_NyxChat31 = {
				Name = "StoryExpansion_NyxChat31",
				UseableOffSource = true,
				{
					Text = "May the blessing of faithful Selene guide you well beyond this point."
				},
				GameStateRequirements = {

				},
			},
			StoryExpansion_NyxChat32 = {
				Name = "StoryExpansion_NyxChat32",
				UseableOffSource = true,
				{
					Text = "Your brother has been doing well, and often I see the resemblance between you."
				},
				GameStateRequirements = {

				},
			},
    },	
	},
	NPC_Nyx_Frozen_StoryExpansion = {
		Name = "NPC_Nyx_Frozen_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		
		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
  
        ActivateRequirements =
		{

		},



		Portrait = "Portrait_Nyx_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },
		        LoadPackages = { "Nyx", },


		InteractTextLineSets = {
        StoryExpansionFreeingNyxDialogue =
			{
				Name = "StoryExpansionFreeingNyxDialogue",
				PlayOnce = true,
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,
				PreEventFunctionName = _PLUGIN.guid .. ".FreeNPCFromChronos",

				{ 
					PreLineWait = 2.8,
					SecretMusicMutedStems = { "Drums" },
					Portrait = "Portrait_Nyx_Default_01",
					PreLineAnim = "Nyx_Greeting",
																	PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.15, UseChronosSound = false },
					Text = "Melinoë, it is excellent to finally meet you. You should be proud of all that you have accomplished." },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "You know who I am, O Night? And of what I have struggled against and done?" },
				{
					Portrait = "Portrait_Nyx_Default_01",
					Text = "Though I have been trapped in Time by the Titan, much of my power has remained with the Unseen, aiding you. You have carried my strength through your incantations, the Nocturnal Arms, and the Oath of the Unseen." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkTalking01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Then you deserve a much greater thanks than I am currently able to give. I would have accomplished nothing without your aid." },
{ 
					Portrait = "Portrait_Nyx_Default_01",
					Text = "My aid would be for naught without your talent, training and determination. Now, however, I suggest we return to the Crossroads. I have many ideas for incantations to solve our problems I wish to discuss with Hecate." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Thank you for lending me you power. I know Hecate is eager to reunite with you once more, and it will be one step closer to dealing with Chronos for good.",
				PostLineThreadedFunctionName = "KillHero",
					PostLineFunctionArgs = { WaitTime = 5, MusicEndTime = 60 },},
EndVoiceLines = {
	{
						PreLineWait = 0.35,
						UsePlayerSource = true,
{ Cue = "/VO/Melinoe_1629", Text = "See you in the Crossroads." },
					},
				
}


				}
	}
},
}

for newNPCName, newNPCData in pairs(mod.NyxNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end