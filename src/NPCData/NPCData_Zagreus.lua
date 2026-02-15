mod.ZagreusNPCData = {
    NPC_Zagreus_Hub_StoryExpansion = {
        Name = "NPC_Zagreus_Hub_StoryExpansion",
		InheritFrom = {"NPC_Neutral"},
        
        SpawnMap = "Hub_Main",
        SpawnId = "558175",
		Offset = {X = 500, Y = 400},
		GazeTarget = {X = 450, Y = 450},
        
        RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,



        OnUsedFunctionName = "UseNPC",

		ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingZagreusDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},
		
        Portrait = "Portrait_ZagPresent_Default_01",
		AnimOffsetZ = 30,
		Groups = { "NPCs" },
		LoadPackages = { "Zagreus", "BiomeIHouse",},



		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,

InteractTextLineSets = {
        ModdedZagChat01 =
			{
				Partner = "NPC_Thanatos_Hub_StoryExpansion",
				PlayOnce = true,
				UseableOffSource = true,
				UseText = "UseListenNPC",
				BlockDistanceTriggers = true,
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
			},
    }
},
NPC_Zagreus_Frozen_StoryExpansion = {
		Name = "NPC_Zagreus_Frozen_StoryExpansion",
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



		Portrait = "Portrait_ZagPresent_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        LoadPackages = { "Zagreus", "BiomeIHouse"},

		InteractTextLineSets = {
        StoryExpansionFreeingZagreusDialogue =
			{
				Name = "StoryExpansionFreeingZagreusDialogue",
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
					Portrait = "Portrait_ZagPresent_Unwell_01",
					PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0, UseChronosSound = false },
					Text = "{#Emph} Ugh... {#Prev} Blood and darkness... What happened? Where am I? And.. {#Emph} Ah{#Prev}! Who are you?" },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Prince Zagreus, this is going to be difficult for you to accept, but... I'm Melinoë... your sister." },
				{ 
					Portrait = "Portrait_ZagPresent_Serious_01",

					Text = "Try another lie {#Emph} \"dear sister\"{#Prev}. I held Melinoë in my arms earlier today, and unless she had a {#Emph} major {#Prev} growth spurt since then, you two are not the same." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "{#Emph}<Sigh> {#Prev}No, Zagreus, I really am your sister. You've been frozen in time after Chronos attacked the House. I'm here to rescue you from his grasp." },
{ 
					PreLineWait = 0.85,
					Portrait = "Portrait_ZagPresent_Unwell_01",
										PreLineAnim = "Zagreus_Talk_Start",

					Text = "I... I vaguely remember something like that. So you truly are Melinoë? What happened? How long has it been? Where is everyone else?" },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Chronos trapped the members of the House beyond the reach of everyone but me. I have already freed Mother, but we must escape now before the Titan finds us."},
					{ 
						PreLineWait = 0.85,
					Portrait = "Portrait_ZagPresent_Defiant_01",
					Text = "Melinoë, let us make a stand now. If we free Father, Nyx, Thanatos, Megaera and the other members of the House, we should be able to reclaim our home."},	
							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "The spell I used to find you draws upon the vows of fealty to the House to draw us into a shared dream, where I can then free you. The enchantment is demanding, and I fear I shant be able to muster up this kind of mystic sleep until I return to the Crossroads where Lord Hypnos resides."},
										{ 
					Portrait = "Portrait_ZagPresent_Empathetic_01",
										PreLineAnim = "Zagreus_Talk_Start",

					Text = "Better to live on and fight another day, I always say! Truthfully however, I did very little of that, and much more fighting my way through the Underworld until I stopped dying. I assume your journey was similar?"},

					{ 
					Portrait = "Portrait_Mel_Pleased_01",
					Text = "Yes, my quest has been filled with much of the same. Now, we must rest on our laurels before Chronos should wakes and captures us both. Let me show you what my magick can accomplish.",
					PostLineThreadedFunctionName = "KillHero",
					PostLineFunctionArgs = { WaitTime = 5, MusicEndTime = 60 },
},
EndVoiceLines = {
	{
						PreLineWait = 0.35,
						UsePlayerSource = true,
{ Cue = "/VO/Melinoe_1629", Text = "See you in the Crossroads." },
					},
				
}


				}
	}
}
}

for newNPCName, newNPCData in pairs(mod.ZagreusNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end