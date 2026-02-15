mod.PersephoneNPCData = mod.PersephoneNPCData or {
    NPC_Persephone_Hub_StoryExpansion = {
		Name = "NPC_Persephone_Hub_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},

		SpawnMap = "Hub_Main",
        SpawnId = "561464",
		Offset = {X = -165, Y = -50},
		GazeTarget = {X = -455, Y = 555},
        Scale = 0.85,
	
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
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingPersephoneDialogue" },
			}
		},
		RequirementsForOptional = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},



		Portrait = "Portrait_Persephone_Queen_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        LoadPackages = { "Persephone", "BiomeIHouse"},

		InteractTextLineSets = {
        ModdedThanChat01Placeholder =
			{
				StatusAnimation = "StatusIconWantsToTalkImportant",
				UseableOffSource = true,
				{ Cue = "/VO/Zagreus_0176",
					Text = "All right, Little Sister, let's give these Shades of Elysium a match to remember!" },
			},
    },	
	},
	NPC_Persephone_Frozen_StoryExpansion = {
		Name = "NPC_Persephone_Frozen_StoryExpansion",
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



		Portrait = "Portrait_Persephone_Queen_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        LoadPackages = { "Persephone", "BiomeIHouse"},

		InteractTextLineSets = {
        StoryExpansionFreeingPersephoneDialogue =
			{
				Name = "StoryExpansionFreeingPersephoneDialogue",
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
					Portrait = "Portrait_Persephone_Queen_FiredUp_01",
																	PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0.15, UseChronosSound = false },
					Text = "...Where am I...? What is going on? Where is Chronos? Answer me, on my authority as Queen of the Underworld!" },
				{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lady Persephone, I am here on behalf of Headmistress Hecate to rescue you from Chronos. For now, I have struck him down but my magic will not hold for long. We must escape before you fall back into his hands." },
				{ 
					Portrait = "Portrait_Persephone_Queen_FiredUp_01",
												PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.8, UseChronosSound = false },

					Text = "You expect me to simply {#Emph}believe {#Prev}Hecate sent you to rescue me? That you slew Chronos? For all this power you claim you have, I know of no gods capable of facing the Titan King alone. Tell me the truth, or face the full wrath of the Underworld's Queen." },

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "{#Emph}<Sigh> {#Prev}I had hoped to have this conversation once we had returned to safety... very well. Lady Persephone, I am... your daughter, Melinoë." },
{ 
					Portrait = "Portrait_Persephone_Queen_Joyful_01",
					Text = "Melinoë...! You're... you're all grown up? But... how long have I been trapped? {#Emph} Oh{#Prev}, my heart, I've missed so much." },

{ 
					Portrait = "Portrait_Persephone_Queen_FiredUp_01",
										PreLineWait = 0.25,

					Text = "Wait, Melinoë, you cannot be here! If Chronos finds you, you'll be frozen in time. I will attempt to hold him off while you make your escape, but you have to leave immediately!"},	

							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Mother, I am here to rescue you. I will not leave you behind - not again."},
					{ 
						PreLineWait = 0.85,
					Portrait = "Portrait_Persephone_Queen_Apprehensive_01",
					Text = "My sweet Melinoë, you have grown into such a beautiful and courageous goddess. If you are so sure, then I will support your plan. Where are Hades, your brother, and the rest of the House?"},	
							{UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
							PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.8, UseChronosSound = true },
					Text = "The Titan has imprisoned and hidden them throughout Tartarus. I wish we had the time to free them now, but already Chronos wakes."},
					{ 
					Portrait = "Portrait_Persephone_Queen_Apprehensive_01",
					Text = "Then I will I trust you to rescue the rest of our family, just as you rescued me. Now, however, is the time to retreat and evaluate our next step.",
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

for newNPCName, newNPCData in pairs(mod.PersephoneNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end