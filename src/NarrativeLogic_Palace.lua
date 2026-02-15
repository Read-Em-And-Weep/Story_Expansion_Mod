PresetEventArgs.HeraAloneGreeting =
	{
		WithinDistance = 1050,
		VoiceLines =
		{
			GameStateRequirements =
			{
				{
					--
				},
			},
			{
				{
					PlayOnce = true,
					PlayOnceContext = "HeraIntialGreetingVO",
					-- SuccessiveChanceToPlay = 0.75,
					ObjectType = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Greet",
					SuccessiveChanceToPlayAll = 0.66,
					GameStateRequirements =
					{
						{
							PathFalse = { "CurrentRun", "SpeechRecord", "/VO/Hera_0219" }
						},
					},

					{ Cue = "/VO/Hera_0216", Text = "We welcome you.", PlayFirst = true },
					{ Cue = "/VO/Hera_0217", Text = "Don't be shy!" },
					{ Cue = "/VO/Hera_0218", Text = "Blessings to you!" },

				},
			},
		},
	}

PresetEventArgs.ZeusAloneGreeting = {
    WithinDistance = 1050,
		VoiceLines =
		{
			GameStateRequirements =
			{
				{
					--
				},
			},
			{
				{
					RandomRemaining = true,
					-- SuccessiveChanceToPlay = 0.75,
					ObjectType = "NPC_Zeus_Story_01",
					PreLineAnim = "Zeus_Greet",
					SkipCooldownCheckIfNonePlayed = true,

					{ Cue = "/VO/Zeus_0296", Text = "Greetings!" },
					{ Cue = "/VO/Zeus_0297", Text = "Young lady!" },
					{ Cue = "/VO/Zeus_0300", Text = "She arrives!", PlayFirst = true },
					{ Cue = "/VO/Zeus_0302", Text = "My niece!" },
					{ Cue = "/VO/Zeus_0303", Text = "We salute you." },
					{ Cue = "/VO/Zeus_0298", Text = "Welcome!", PlayFirst = true,
						GameStateRequirements =
						{
							{
								Path = { "GameState", "SpeechRecord" },
								HasAny = { "/VO/Zeus_0300" },
							},
						}
					},
					{ Cue = "/VO/Zeus_0299", Text = "Welcome back.", PlayFirst = true,
						GameStateRequirements =
						{
							{
								Path = { "GameState", "SpeechRecord" },
								HasAny = { "/VO/Zeus_0300" },
							},
						}
					},
					{ Cue = "/VO/Zeus_0301", Text = "Come forth!",
						GameStateRequirements =
						{
							{
								Path = { "GameState", "SpeechRecord" },
								HasAny = { "/VO/Zeus_0299" },
							},
						}
					},
				},
			},
		},
        
}


EnemyData.NPC_Hera_Story_01.ActivateRequirements = {
    {
        FunctionName = _PLUGIN.guid .. ".CanSpawnHeraAtPalace",
        FunctionArgs = {}
    },
}

EnemyData.NPC_Hera_Story_01.Using =
		{
            "NPC_Hera_Story_01",
			Sounds =
			{
				"/SFX/Menu Sounds/Lounge_GlassWithIce",
				"/SFX/Menu Sounds/Lounge_BottleCork",
				"/SFX/Menu Sounds/Lounge_BottlePour",
				"/Leftovers/World Sounds/Caravan Interior/SwallowDrink",
				"/SFX/Menu Sounds/Lounge_GlassesClinking",
                "/SFX/ScyllaCrowdApplause1",
			},
		}
EnemyData.NPC_Zeus_Story_01.ActivateRequirements = {
{
        FunctionName = _PLUGIN.guid .. ".CanSpawnZeusAtPalace",
        FunctionArgs = {}
    },
}

EnemyData.NPC_Zeus_Story_01.Using =
		{
            "NPC_Zeus_Story_01",
			Sounds =
			{
				"/SFX/Menu Sounds/Lounge_GlassWithIce",
				"/SFX/Menu Sounds/Lounge_BottleCork",
				"/SFX/Menu Sounds/Lounge_BottlePour",
				"/Leftovers/World Sounds/Caravan Interior/SwallowDrink",
				"/SFX/Menu Sounds/Lounge_GlassesClinking",
			},
		}

EnemyData.NPC_Demeter_Story_01.ActivateRequirements = {
    {
        FunctionName = _PLUGIN.guid .. ".CanSpawnDemeterAtPalace",
        FunctionArgs = {}
    },
}


EnemyData.NPC_Zeus_Story_01.InteractTextLineSets = {
    ZeusPalaceFirstMeeting =
			{
                Name = "ZeusPalaceFirstMeeting",
				PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Hera_Story_01",
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,
                				{ Cue = "/VO/Zeus_0275",
					-- PreLineAnim = "Zeus_Greet",
					-- PreLineAnim = "Zeus_Explaining",

					Text = "Welcome, young lady, to our family's glorious abode! You have our thanks for seeing to it that the monster Typhon failed to reach us here." },

				{ Cue = "/VO/Hera_0196",
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					-- PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					-- PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					Text = "And you have our regrets that my Lord Husband left you to confront that horrid creature on your own. Most of the others are still fortifying the Palace; forgive our rudeness." },

				{ Cue = "/VO/MelinoeField_3828", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "There's nothing to forgive, Queen Hera. I am honored to have met you and King Zeus face to face, and seen the glory of Olympus firsthand. I owe it to your generous support these many nights." },

				{ Cue = "/VO/Zeus_0276",
					PreLineAnim = "Zeus_Explaining",
					Text = "Come now, Melinoë, we have a shared objective after all! And so long as Chronos sits upon your father's throne, that objective remains incomplete." },

				{ Cue = "/VO/Hera_0197",
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "Hurrying her off when she only just arrived, Husband? Although we've little here for entertainment other than Apollo's plucking. At least our enemies shall be back at our gates before long!" },

				{ Cue = "/VO/MelinoeField_3829", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I don't think I can remain anyhow. I need to consult with the Witch of the Crossroads; she may have thoughts on how to rid ourselves of both our great foes at once." },

				{ Cue = "/VO/Zeus_0277",
					Text = "We shall find a means, of that I have no doubt! And until then, we shall be better prepared to meet their charge." },

				{ Cue = "/VO/Hera_0198",
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					PostLineFunctionName = "ActivateApollo",

					Text = "Go on, my dear. We're unaccustomed to expressing gratitude as you can plainly see. Until such time as your Lord Father and his own Queen are restored, there's little cause for cheer, I think." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3830", Text = "Perhaps soon enough." },
					},
				},
            },
            ZeusPalaceMeeting02 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceFirstMeeting" },
            },
        },
				Name = "ZeusPalaceMeeting02",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Hera_Story_01",

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,

				{ Cue = "/VO/Zeus_0278",
					Text = "We got that monstrous fiend once more, young lady, thanks most certainly to you! Such courage in the face of catastrophe, and our Palace remains safe and secure... and further reinforced, should Typhon try for us again." },

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "It's my pleasure to have been of service to our family, Queen Hera, and to see the wonders of these halls once more. Perhaps we may yet permanently dissuade Typhon soon." },

				{ Cue = "/VO/Zeus_0279",
					Portrait = "Portrait_Zeus_InPerson_01",
					PreLineAnim = "Zeus_Explaining",
					Text = "And what do you have in mind on that account? Our own research has yet to yield a force that could take Typhon without also taking this entire mountain down! He's even fiercer now than when he first attacked us long ago." },

				{ Cue = "/VO/MelinoeField_3841", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I've gathered useful specimens of Typhon's flesh, and we've been studying how we can use it in our craft. But we don't yet have meaningful progress to share..." },

				{ Cue = "/VO/Hera_0200",
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "Oh, come now. Driving back that monster more than once is progress meaningful enough! My Lord Husband thought that your first such victory could have simply been a fluke." },

				{ Cue = "/VO/Zeus_0280",
					Portrait = "Portrait_Zeus_InPerson_01",
					Text = "Now, what I said, dear wife, was that a single victory against Typhon did not prove more such victories could be achieved! But now you've demonstrated otherwise, Melinoë, and spurred our hope that we shall rid ourselves of this foul menace soon enough." },

                {  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "King Zeus, Queen Hera, I also wanted to ask you about your aether gate. I have been recieving visions of the past — Chronos's past — whenever I interact with it." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "That is odd. I was the one to weave the aether gate to protect against Typhon's attack, and nothing in my enchantment should react in this manner. Perhaps this is a manifestation of your own magick, Melinoë?" },

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",
					PreLineAnim = "Zeus_Explaining",
					Text = "Whatever the reason for these visions, it is best that you watch them carefully. As Athena advises, one must know their enemy to the same degree they know themself to succeed in battle." },

				{ Cue = "/VO/MelinoeField_3842", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "ActivateApollo",

					Text = "King Zeus, Queen Hera, by your leave I ought return with what I found, in case it leads to new discoveries about how we can do just that. Thank you all for your continued aid." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						ObjectType = "NPC_Zeus_Story_01",
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/Zeus_0281", Text = "You have our gratitude, in kind." },
					},
				},
			},
            ZeusPalaceMeeting03 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting02" },
            },
        },
				Name = "ZeusPalaceMeeting03",
                PlayOnce = true,
				UseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusAloneGreeting,

				{ 
					Text = "Typhon has been struck down thanks to your efforts once more, dear Melinoë! My children could learn a thing or two from your efforts." },

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "It was my pleasure to aid my family in this way, King Zeus. Unfortunately, Headmistress Hecate and I are no closer to dealing with Typhon for good. Where is Queen Hera tonight?" },

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",
					PreLineAnim = "Zeus_Explaining",
					Text = "My dear wife is busy reinvigorating the defensive spells holding our Palace secure. After you told her about your visions from the aether gate, she's become obsessed with finding any flaw in the enchantment." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "You should tell her that her magick is impeccable. Your palace's defenses are as powerful as they are ethereal. Speaking of these visions, I recieved another one now, of Chronos, Prometheus, and a Titaness called Rhea." },

				{
					Portrait = "Portrait_Zeus_InPerson_01",
					Text = "Rhea?! Did the vision give you any information about where she may be now?" },

                {  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "No, the vision only showed me how Chronos and her met. Why? Do you know this Rhea?" },
				{ 
					Portrait = "Portrait_Zeus_InPerson_01",
					PreLineAnim = "Zeus_Explaining",
					Text = "Rhea is...my mother. She's been missing since my brothers and I stood up against our father. We always worried that Chronos had done something to her in revenge for us claiming the throne, but we had no evidence." },

				{ UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "ActivateApollo",

					Text = "King Zeus, I apologise for not being able to tell you more about what happened to your mother. If I find anything else about her, I will let you know." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						ObjectType = "NPC_Zeus_Story_01",
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/Zeus_0281", Text = "You have our gratitude, in kind." },
					},
				},
			},
        ZeusPalaceMeeting05 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting04" },
            },
        },
				Name = "ZeusPalaceMeeting05",
                PlayOnce = true,
				UseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusAloneGreeting,

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "King Zeus, thank you for your aid in the fight against Typhon. While we at the Crossroads near a more permanent solution for the monster, it soothes me to know that we can rely on you whenever we face him." },

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",
					PreLineAnim = "Zeus_Explaining",
					Text = "I could hardly let me niece face against Typhon alone, or let our palace be destroyed! It is always a pleasure to aid you in battle. Forgive me for asking, but have you recieved any more news of my mother?" },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "My visions have shown me of her pregnancy of my Father, but they've revealed no evil plan of Chronos's. He seems to be in love with her, and I have a hard time seeing this version of him harming her." },

				{
					Portrait = "Portrait_Zeus_InPerson_01",
					Text = "I wish I could say that comforts me, but I know all too well how fast my father can go from love to apathy. But regardless, know that Olympus stands behind you in your quest to destroy Typhon and Chronos." },


				{ UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "ActivateApollo",

					Text = "For that I am grateful, King Zeus. We family must stick together, and I would have no chance of restoring mine without the aid of yours." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						ObjectType = "NPC_Zeus_Story_01",
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/Zeus_0307", Text = "You have our blessings." },
					},
				},
			},
        ZeusPalaceMeeting07 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting06" },
            },
        },
				Name = "ZeusPalaceMeeting07",
                PlayOnce = true,
				UseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusAloneGreeting,

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "King Zeus, are you alright? You seem much more tired than the last time I saw you." },

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",
					PreLineAnim = "Zeus_Explaining",
					Text = "It is nothing, dear Melinoë! The last battle took a bit out of me, but I'll be back up to fighting form in no time. How are the preparations on your end, niece?" },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "To destroy Typhon, I still need to obtain a few more of his Void Lens to complete the incantation. With every victory, we draw closer to his annihilation." },

				{
					Portrait = "Portrait_Zeus_InPerson_01",
					Text = "We shall try to hold for as long as we can here and trust in your magick. What of Rhea? Have your visions revealed any new information?" },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "My visions have told me that her life force was sapped due to a hateful curse placed on her from Ouranos — a curse so strong not even Mother Night could break it. Apparently, Chronos and Rhea concealed this information from you to stop you worrying." },
				{
					Portrait = "Portrait_Zeus_InPerson_01",
					Text = "A terrible curse sapping her strength? That is a destiny I wouldn't wish on even Chronos. At least knowing her fate may bring us peace now." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						ObjectType = "NPC_Zeus_Story_01",
						RequiredMinElapsedTime = 2,

								{ Cue = "/VO/Zeus_0306", Text = "Be safe." },
					},
				},
			},
            ZeusPalaceMeeting08 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting07" },
            },
        },
                Name = "ZeusPalaceMeeting08",
				PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Hera_Story_01",
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,
                

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					-- PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					-- PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					Text = "Melinoë, it is excellent to welcome you to our palace once more. It has been a long time since my Lord Husband and I have been able to greet you together." },

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Queen Hera, King Zeus, surely I have entered these halls often enough to not require a special welcome? Of course, seeing you is always welcome." },

				{ 
					PreLineAnim = "Zeus_Explaining",
					Text = "Niece, our supplies are not so deprived that we can't treat you like a honored guest. Though perhaps a grand feast will have to wait until we slay our foe for good." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "Truly, the only luxuries we can provide are Apollo's plucking and our warm manner. Our resources are currently being funnelled to Ares and Hephaestus in preparation of our contingency plan." },

				{ UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Hold on for a little longer, if you are able. I only need to obtain one more piece of flesh from Typhon to enact our incantation." },

				{ 
					Text = "We shall find a means of surviving, of that I have no doubt! Focus on completing your incantation, and we shall handle the rest of Chronos's forces." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					PostLineFunctionName = "ActivateApollo",

					Text = "I can already feel Typhon's storm trying to break through my enchantments now, even though you just slew him. Melinoë, it may be best you leave now before we have to shift our focus to him." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3854", Text = "Yes, Queen Hera." },
					},
				},
            },
            ZeusPalaceMeeting09 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting08" },
            },
        },
                Name = "ZeusPalaceMeeting09",
				PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Hera_Story_01",
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,
                

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					-- PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					-- PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					Text = "Melinoë, I must thank you for your aid once more. I anticipate you come with good news." },

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "King Zeus, I'm afraid I have found out what happened to your mother Rhea, and I fear it was not a good end." },

				{ 
					PreLineAnim = "Zeus_Explaining",
					Text = "My mother! I assumed she succumbed to Ouranos's curse. You mean to tell me she met a worse fate than that?" },


				{ UsePlayerSource = true,
                Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "When there was no way to break the curse, Chronos beseeched Almight Chaos for a cure. To cure Rhea, he transformed her into a being of pure hatred and monstrosity." },

				{ 
					Text = "You mean to say that our most foe... Typhon... is Rhea transformed? He gave up her form in order for her to survive?" },
				{ UsePlayerSource = true,
                Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Yes. Typhon is a being formed from all the worst parts of Lady Rhea. Needless anger, a lust for destruction, and a lack of ability to love and care." },

            { 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					-- PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					-- PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "That... I... Husband... I am truly sorry. I only knew your mother briefly but she was a beautiful light. Remember her as she was, and not what she became." },
				{ 
					Text = "..." },
                { PreLineWait = 1.0,
					Text = "No matter what the true nature of our foe, it is a threat to our lives and our rule. Melinoë, you must destroy Typhon. Are you close to completing your incantation?" },

				{ UsePlayerSource = true,
                Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I have obtained all the samples of Typhon I require. Now that I know about the truth at the monster's core, I have a much better idea about the additional reagent the spell should require, and it's found in the Underworld." },
				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					PostLineFunctionName = "ActivateApollo",

					Text = "Then we better not see you in person until the incantation is complete. We shall hold the fort, while you seek for your last reagent. Good luck, Melinoë." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						ObjectType = "NPC_Zeus_Story_01",
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/Zeus_0307", Text = "You have our blessings." },
					},
				},
            },
            ZeusPalaceAboutTyphonDeath01 =
			{
                Name = "ZeusPalaceAboutTyphonDeath01",
                Partner = "NPC_Hera_Story_01",
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TyphonDefeatedWithStormStop" },
					},
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeStormStop" },
					},
					-- stopgap just in case
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,

				{ 
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "Zeus_Explaining",
					Text = "Oh, my good niece, you were extraordinary, truly! So far as we can tell, no trace of that monstrosity remains! The deed is {#Emph}done. {#Prev}Typhon is {#Emph}dead." },

				{ 
					Portrait = "Portrait_Hera_InPerson_Displeased_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "My Lord Husband has been premature to declare victory before, so I shall not believe a {#Emph}word {#Prev}of this until I hear it from your lips; perhaps not even then!" },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "The Father of All Monsters is undone... not merely dead, but eradicated, using the power of the Titan of Time, and a bit of assistance from Father's favored spear, Gigaros." },

				{ 
					PreLineAnim = "Zeus_Greet",
					Text = "You hear {#Emph}that{#Prev}, Hera dear? I {#Emph}told {#Prev}you young Melinoë was certain to prevail on our behalf! Our family always triumphs when we stand together with a common purpose." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineWait = 0.35,
					Text = "...I remain utterly in shock. Well now, girl, if you have {#Emph}truly {#Prev}quashed that {#Emph}monstrous {#Prev}threat, then do prepare yourself for all of us to claim we never doubted you at any point. My Lord Husband is already starting." },
				{ 
					PreLineAnim = "Zeus_Greet",
					Text = "Wife, you do jest so! I never doubted Melinoë for a second. The contingency plan we prepared was your idea after all!" },
				{  UsePlayerSource = true,
                Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "King Zeus, I must inform you as well, that along with Typhon's death, the essence of your mother Rhea was unravelled as well." },
				{ 
					Text = "...We had expected as much, niece. While unfortunate, it brings me peace knowing that she will no longer suffer as a being of pure anger." },
				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "Perhaps in a nicer world, we could have freed her from the transformation, but as it were, we had already reconciled with the idea of losing Rhea." },
				{  UsePlayerSource = true,
                Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "She lives on through you King Zeus. You would do well to remember that." },
				{ 
					Text = "Thank you, Melinoë. Now, before you face our Father for the final time, we must have a celebratory feast!" },
				{  UsePlayerSource = true,
					Text = "King Zeus, this is far too generous, I simply cannot allow you to do that!" },
				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "Nonsense, girl! All of us wish to congratulate you, and many of our fellow Olympians wish to use this chance to meet you in person." },
				{  UsePlayerSource = true,
                PostLineFunctionName = _PLUGIN.guid..".CelebrationSounds",
					Text = "Perhaps a quick celebration, then. I still yet to face Chronos and reclaim the Underworld." },



				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "If you have not believe in me, King Zeus and Queen Hera, then perhaps Typhon would have been here in my stead. So thank you all... and now an even greater victory is within reach." },

				{
					Portrait = "Portrait_Zeus_InPerson_01",
					Text = "The Titan Chronos... you mean to likewise destroy him using the methods you employed this very night?" },

				{  UsePlayerSource = true,
					Text = "If necessary. Though this power that you witnessed was for Typhon alone, and likewise what we plan for Chronos is fit only for him. The deathless cannot be destroyed unless they threaten the very fabric of the weavings of the Fates." },

				{
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PostLineFunctionName = "ActivateApollo",

					Text = "You have done very well, Melinoë, and we Olympians owe you a debt. The Titan's forces may grow far more desperate now, a possibility for which we ought prepare. We shall lend you all the strength we can for your own final assault." },
				EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
			},
            ZeusPalaceMeetingRepeatable01 =
			{
                Name = "ZeusPalaceMeetingRepeatable01",
                Partner = "NPC_Hera_Story_01",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",
					PreLineAnim = "Zeus_Explaining",
					Text = "We've rid ourselves of Typhon for the time, but not for good. If Chronos stands between us and that outcome, then we urge you to pursue {#Emph}him {#Prev}next." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					PostLineFunctionName = "ActivateApollo",

					Text = "My Lord Husband does not mean to pressure you, I'm sure, my dear. But I thought we agreed that your efforts would be best to focus on the Underworld." },
				EndVoiceLines =
				{
					{
						PlayOnce = true,
						PlayOnceContext = "ZeusPalaceFarewellVO",
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3853", Text = "Your Majesty." },
					},
				},
			},
			ZeusPalaceMeetingRepeatable02 =
			{
                Name = "ZeusPalaceMeetingRepeatable02",
                Partner = "NPC_Hera_Story_01",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,

				{ Cue = "/VO/Zeus_0293",
					Text = "Another victory is ours! We are most grateful for your service to our family, Melinoë. May your defeat of Chronos be as swift." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Greet", PreLineAnimTarget = 723554,
					PostLineFunctionName = "ActivateApollo",

					Text = "I hate to hurry you along, Melinoë, but Typhon is already rising once more. Collect whatever reagent you need from the Underworld before returning here." },
				EndVoiceLines =
				{
					{
						PlayOnce = true,
						PlayOnceContext = "ZeusPalaceFarewellVO",
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3854", Text = "Yes, Queen Hera." },
					},
				},
			},
			ZeusPalaceMeetingRepeatable03 =
			{
                Name = "ZeusPalaceMeetingRepeatable03",
                Partner = "NPC_Hera_Story_01",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,

				{ Cue = "/VO/Hera_0214",
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "Again you sent that Typhon howling to the base of our mountain, though he is likely to return. But perhaps one of these nights shall be his last." },

				{ Cue = "/VO/Zeus_0294",
					Portrait = "Portrait_Zeus_InPerson_01",
					PostLineFunctionName = "ActivateApollo",

					Text = "We appreciate all of your aid, young lady, though do not leave Chronos unattended! Especially if his defeat is key to our final victory." },
				EndVoiceLines =
				{
					{
						PlayOnce = true,
						PlayOnceContext = "ZeusPalaceFarewellVO",
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3855", Text = "Thank you all." },
					},
				},
			},
			ZeusPalaceMeetingRepeatable04 =
			{
                Name = "ZeusPalaceMeetingRepeatable04",
                Partner = "NPC_Hera_Story_01",
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZeusHeraGreeting,

				{ Cue = "/VO/Hera_0215",
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "You're always welcome on these grounds, my dear, but we are {#Emph}never {#Prev}going to be at our finest so long as the threat of Typhon looms large." },

				{ 
					Portrait = "Portrait_Zeus_InPerson_01",
					PostLineFunctionName = "ActivateApollo",

					Text = "He's gone at least for now, but he'll be back. We will not be able to hold back the storm of Ouranos's curse for much longer. Retrieve what you need from the Underworld, and do not return until then." },
				EndVoiceLines =
				{
					{
						PlayOnce = true,
						PlayOnceContext = "ZeusPalaceFarewellVO",
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3856", Text = "We're getting closer." },
					},
				},
			},
		}

EnemyData.NPC_Hera_Story_01.InteractTextLineSets = {
        ZeusPalaceFirstMeeting =
			{
                Name = "ZeusPalaceFirstMeeting",
				PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceMeeting02 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceFirstMeeting" },
            },
        },
				Name = "ZeusPalaceMeeting02",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceMeeting04 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting03" },
            },
        },
				Name = "ZeusPalaceMeeting04",
                PlayOnce = true,
				UseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HeraAloneGreeting,

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "And here you come triumphant once again, dearest Melinoë! Careful that you do not do so too often, or else my Lord Husband may become jealous of your success." },

				{  UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Queen Hera! It is wonderful to see you again. Speaking of King Zeus, where is he?" },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "He sends his apologies, but wise Athena called for his lightning to deal with a particularly persistant strain of Typhon's brood. If you forgive me for saying, Melinoë, you seem troubled by something. Is there some cause for concern?" },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "This may be a strange thing to ask, but you were around for his reign. In my visions, Chronos appears to be a much kinder ruler than the cruel Titan I have encountered now. What was the world like under the Usurper's authority?" },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "...This is a difficult topic to talk about Melinoë, especially considering I am the current Queen. I have a responsibility to maintain our sovereignty." },


                {  UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Queen Hera, as the Princess of the Underworld, I'm hardly just one of your subjects. You can be honest with me." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "In my youth, he was not evil, at least perhaps not in the way that you think. We were looked after, but we had little freedom. Nymphs danced the same every day, mortals lived in ignorant lethargy, trees grew on schedule, and deities performed their duties with no passion or love. It was a world banal in its perfection." },

				{ 
					UsePlayerSource = true,
                    PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "A golden age without any struggle... Bliss, without any sort of true fulfillment or growth..." },

                { 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "Then when we gods grew older, Chronos must have become bored of ruling such a world because he stopped paying it attention. The Fates decreed then that the world was rightfully ours, and we ushered forward an age marked by freedom and passion." },

{ 
					UsePlayerSource = true,
                    PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Yet Chronos could not abide by that ruling, and set about to kidnap the Fates, and reverse it." },


				{ Cue = "/VO/Portrait_Hera_InPerson_01", UsePlayerSource = true,
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					PostLineFunctionName = "ActivateApollo",

					Text = "While our reign may not be perfect, Melinoë, it is at least one where we are able to choose our own path, rather than living the path Chronos chooses. Of course, until Chronos and Typhon are dealt with, we have few options to choose between." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 3,

						{ Cue = "/VO/MelinoeField_4695", Text = "Something to look forward to." },
					},
				},
			},
            ZeusPalaceMeeting06 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting05" },
            },
        },
				Name = "ZeusPalaceMeeting06",
                PlayOnce = true,
				UseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HeraAloneGreeting,

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "Melinoë! Hurry into the warmth of the palace quickly. The calm between defeats of Typhon is becoming shorter and shorter." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "It's true then, Queen Hera, that Typhon is becoming stronger? Are running out of time to find a solution?" },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "Unfortunately, it appears that he is recovering his strength from the last time my Lord Husband slew him. We fear that Chronos is utilising his control of time to strengthen the monster further." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "{#Emph}Time{#Prev}. He knows that is a resource we are short of. The incantation Headmistress Hecate is preparing is not yet ready, and I will need to face Typhon more times before it can be completed." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "That is worrying news, Melinoë. While my protections on Olympus may hold, they cannot do so forever. Especially not against the kind of assult Typhon brings every night." },


                {  UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "And we cannot end Chronos's rule of the underworld until his pet monster has been toppled. Fitting that Time would engage in a war of attrition." },

				{ 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					PreLineAnim = "Hera_Pensive", PreLineAnimTarget = 723554,
					Text = "Melinoë, take heart that I have complete faith in your ability to defeat Typhon. If this goes on much longer, however, I fear I shall have to tell Hephaestus and Ares to begin preparing our contingency plan." },

				{ 
					UsePlayerSource = true,
                    PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "A contingency plan? Should we focus on completing this strategem instead of waiting on an incantation?" },

                { 
					Portrait = "Portrait_Hera_InPerson_01",
					Source = "NPC_Hera_Story_01",
					Text = "This 'contingency plan' of my sons involves creating a strong weapon fuelled by Olympian magick to destroy Typhon permanently, as well as the mountain we stand on and much of the surrounding countryside. Keep fighting still, Melinoë, so that we may claim a more elegant victory with your magick." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 3,

						{ Cue = "/VO/MelinoeField_3854", Text = "Yes, Queen Hera." },
					},
				},
			},
            ZeusPalaceMeeting08 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting07" },
            },
        },
				Name = "ZeusPalaceMeeting08",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceMeeting09 =
			{
                GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting08" },
            },
        },
				Name = "ZeusPalaceMeeting08",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceAboutTyphonDeath01 =
			{
                GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TyphonDefeatedWithStormStop" },
					},
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeStormStop" },
					},
					-- stopgap just in case
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				Name = "ZeusPalaceAboutTyphonDeath01",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceMeetingRepeatable01 =
			{
				Name = "ZeusPalaceMeetingRepeatable01",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceMeetingRepeatable02 =
			{
				Name = "ZeusPalaceMeetingRepeatable02",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceMeetingRepeatable03 =
			{
				Name = "ZeusPalaceMeetingRepeatable03",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
            ZeusPalaceMeetingRepeatable04 =
			{
				Name = "ZeusPalaceMeetingRepeatable04",
                PlayOnce = true,
				UseableOffSource = true,
                Partner = "NPC_Zeus_Story_01",
            },
}

EnemyData.NPC_Apollo_Story_01.InteractTextLineSets = {
    ApolloPalaceFirstMeeting =
			{
                Name = "ApolloPalaceFirstMeeting",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
				},

				{ Cue = "/VO/Apollo_0178",
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "You did it, sunshine! I'd say I knew you would, but the truth is, I had an inkling of doubt... especially once I saw Typhon for myself.", },

				{ Cue = "/VO/MelinoeField_3831", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "He was quite large, I'll give him that! It's a pleasure to finally meet you face-to-face like this, Cousin. You play most beautifully!" },

				{ Cue = "/VO/Apollo_0179",
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Oh, anything to take our minds off of what's happening. At least you bought us a bit of reprieve so I could play again at all. Typhon is going to be back, though, isn't he...?", },

				{ Cue = "/VO/MelinoeField_3832", UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I'd count on that. But I am going to be back as well. For now, please bolster your defenses, and make ready for the monster's next attack. I have something to ask of you, however. When I pierced your aether gate, I saw a vision of a past time. Is that normal?" },

                {
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "I've been known to give divine strikes of inspirations, but visions like that simply from interacting with the aether gate is unheard of, even with my powers over prophecy. Seems like something Hecate would know more about, sunshine.", },

				{ UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Between that and the samples of the monster's flesh I have acquired, I have much to talk about with my headmistress. Now I had better go... the Crossroads is expecting my return." },

                    
				{ Cue = "/VO/Apollo_0180",
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Can't you just contact her by Boon? I'll bring one forth for you in case that works. And thanks for everything, Cousin.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},
				EndVoiceLines =
				{
					{ GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
				-- see PalaceBoonExit01 =
			},
            			ApolloPalaceMeeting02 =
			{
                Name = "ApolloPalaceMeeting02",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceFirstMeeting"}
                    }
				},

				{ Cue = "/VO/Apollo_0182",
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "It's good to see you again, Cousin. Just as I was beginning to fear my song would be tonight's sole source of cheer!", },

				{ Cue = "/VO/MelinoeField_3843", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Apollo, good to see you too. Please give my regards to the others... I would have liked to meet, but had best be getting back." },

				{ 
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Of course, you must be on your last legs. The others surely would have liked to see you too, but they couldn't leave their posts. Please accept our apologies, and let us help you to return.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3849", Text = "We have this." },
					},

				},
			},
            			ApolloPalaceMeeting03 =
			{
                Name = "ApolloPalaceMeeting03",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceMeeting02"}
                    }
				},

								{ Cue = "/VO/Apollo_0184",
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "You truly think we'll soon get blasted Typhon well out of our way for good? That'd be a welcome change." },

				{ Cue = "/VO/MelinoeField_3848", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "If we can rid ourselves of Chronos, then we should be able to rid ourselves of the Father of All Monsters, too. And I have not been training all my life for this only to fail now." },

				{ Cue = "/VO/Apollo_0185",
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Well! Remind me never to get on your bad side, sunshine. You ready to head home? Always good to see you, though I'd best get back to singing so that everyone stays calm.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},

				EndVoiceLines =
				{
				    { GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalaceMeeting04 =
			{
                Name = "ApolloPalaceMeeting04",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceMeeting03"}
                    }
				},

								{ 
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "Cousin, you have no idea how jealous my siblings are that I am the one greeting you and not them." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "There will be plenty of time for us to mingle once Typhon and Chronos are dealt for good. Though admittedly, it is always good to see you Lord Apollo." },

				{ 
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "And the same to you, Cousin Melinoë. For now, however, it looks like you are eager to return to the Crossroads, and I can help you out!",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},

				EndVoiceLines =
				{
				    { GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalaceMeeting05 =
			{
                Name = "ApolloPalaceMeeting05",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceMeeting04"}
                    }
				},

								{ 
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "Welcome back sunshine! I hope you are not getting sick of my singing." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Sick of your singing? You would have to be much worse for me to tire of it." },

				{ 
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "It seems that the latest battle has not robbed you of your silver tongue, Cousin. I'll let you return to the Crossroads to rest, however.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},

				EndVoiceLines =
				{
				    { GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalaceMeeting06 =
			{
                Name = "ApolloPalaceMeeting06",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceMeeting05"}
                    }
				},

								{ 
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "Cousin, have you been getting closer to defeating Typhon for good? I'm not sure how much longer we can go on." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "There is still a long way to go before I'm ready to perform the incantation, but I get closer with each encounter." },

				{ 
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Then there's nothing else for us to do but keep fighting. I'll help in whatever way I can.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},

				EndVoiceLines =
				{
				    { GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalaceMeeting07 =
			{
                Name = "ApolloPalaceMeeting07",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
                    OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceMeeting06"}
                    }
				},

								{ 
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "Sunshine, please tell me you have good news." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Not yet, but I expect that the incantation should be completed any day now." },

				{ 
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "I'm not sure how many wounds of my Father I can heal before he won't be able to face Typhon again. You help us more than you know.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},

				EndVoiceLines =
				{
				    { GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalaceMeeting08 =
			{
                Name = "ApolloPalaceMeeting08",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceMeeting07"}
                    }
				},

								{ 
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "Cousin, I'm afraid I have no healing power left in me to close your wounds." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Apollo, I had no idea your power levels had drained so low. Is there any way for me to aid you?" },

				{ 
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Defeat Typhon permanently, sunshine, and we should recover before long. Thankfully, I still have enough power to send you home.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},

				EndVoiceLines =
				{
				    { GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalaceMeeting09 =
			{
                Name = "ApolloPalaceMeeting09",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
                    {
                        PathTrue = {"GameState", "TextLinesRecord", "ApolloPalaceMeeting08"}
                    }
				},

								{ 
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "Typhon is Grandmother Rhea? It almost makes me feel bad about bringing my force against her." },

				{  UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Little of Rhea remains in Typhon, Lord Apollo. I'm sure you know that not all diseases have their cures." },

				{ 
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "Yet I can't help but mourn what could have been. Sometimes it can be hard having to maintain morale with my music.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},

				EndVoiceLines =
				{
				    { GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalaceAboutTyphonDeath01 =
			{
                Name = "ApolloPalaceAboutTyphonDeath01",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
					{
						PathTrue = { "GameState", "TyphonDefeatedWithStormStop" },
					},
				},

				{ Cue = "/VO/Apollo_0187",
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "That monster, truly gone... you got him, forever! Not that my faith in you wavered since your initial victory, it's just... I still can't entirely believe it. So now for Chronos, then?" },

				{ Cue = "/VO/MelinoeField_3869", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Now for Chronos, then. One encouraging result can often spur another. And perhaps all of you shall have a brief reprieve. I'm certain you could use it." },

				{ Cue = "/VO/Apollo_0188",
					Portrait = "Portrait_Apollo_InPerson_Serious_01",
					Text = "With Prometheus and such still causing problems, we won't be getting all too comfortable just yet. Especially not while our main foe is out there still. Go get him, sunshine.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_3870", Text = "On it." },
					},
					{ GlobalVoiceLines = "ApolloSendOffVoiceLines" },
				},
			},
            ApolloPalacePostZeusChat01 =
			{
                Name = "ApolloPalacePostZeusChat01",
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				StatusAnimation = "StatusIconWantsToTalk",
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
				},

				{ Cue = "/VO/Apollo_0192",
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Ready to head back again? Here, let me light the way.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},
				EndGlobalVoiceLines = "ApolloSendOffVoiceLines",
			},
			ApolloPalacePostZeusChat02 =
			{
                Name = "ApolloPalacePostZeusChat02",
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				StatusAnimation = "StatusIconWantsToTalk",
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
				},

				{ Cue = "/VO/Apollo_0193",
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "Splendid work as usual, sunshine. We're all grateful you made the trip.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},
				EndGlobalVoiceLines = "ApolloSendOffVoiceLines",
			},
			ApolloPalacePostZeusChat03 =
			{
                Name = "ApolloPalacePostZeusChat03",
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				StatusAnimation = "StatusIconWantsToTalk",
				GameStateRequirements =
				{
					OrRequirements = {
					{{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Zeus_Story_01" },
					},},
                    {{
						PathTrue = { "CurrentRun", "UseRecord", "NPC_Hera_Story_01" },
					},}
                },
				},

				{ Cue = "/VO/Apollo_0194",
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "By now you'd probably much rather be where it isn't quite this bright.",
					PostLineFunctionName = "ResumeApolloSinging",
					PostLineThreadedFunctionName = "ActivatePalaceExitPoint",
				},
				EndGlobalVoiceLines = "ApolloSendOffVoiceLines",
			},

			-- pre-Zeus repeatable
			ApolloPalacePreZeusChat01 =
			{
                Name = "ApolloPalacePreZeusChat01",
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "UseRecord" },
						HasNone = { "NPC_Zeus_Story_01", "NPC_Hera_Story_01", "NPC_Chronos_02"},
					},
				},

				{
					PreLineWait = 0.35,
					Portrait = "Portrait_Apollo_InPerson_01",
					Text = "It's good to see you, sunshine, but I think someone else might like a word first.",
					PostLineFunctionName = "ResumeApolloSinging",
				},
			},

}

EnemyData.NPC_Demeter_Story_01.InteractTextLineSets = {
    DemeterPalaceFirstMeeting =
    {
        Name = "DemeterPalaceFirstMeeting",
        PlayOnce = true,
        UseableOffSource = true,
        InitialGiftableOffSource = true,
        GiftableOffSource = true,
        GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceFirstMeeting" },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.DemeterGreeting,

        {
            Cue = "/VO/Demeter_0196",
            -- PreLineAnim = "Demeter_Scoff",
            -- PreLineAnim = "Demeter_Moved",
            Text =
            "Oh, flower, it's truly {#Emph}you! {#Prev}Forgive me, I... we must maintain decorum here, but... I am very pleased to see you here before me, rather than within the dimness of a Boon."
        },

        {
            Cue = "/VO/MelinoeField_4318",
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Vulnerable_01",
            PreLineAnim = "MelTalkExplaining01",
            PreLineAnimTarget = "Hero",
            PostLineAnim = "MelTalkExplaining01ReturnToIdle",
            PostLineAnimTarget = "Hero",
            Text =
            "Lady Demeter, the honor is mine. I know that everyone's preoccupied contending with the siege, and it couldn't have been easy for you to be here now."
        },

        {
            Cue = "/VO/Demeter_0197",
            PreLineAnim = "Demeter_Moved",
            Text =
            "Please, call me grandmother; although perhaps not here. I was furious to have missed you when you visited before, and was not about to let that reoccur. But you cannot stay can you...?"
        },

        {
            Cue = "/VO/MelinoeField_4319",
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Empathetic_01",
            PreLineAnim = "MelTalkBrooding01",
            PreLineAnimTarget = "Hero",
            PostLineAnim = "MelTalkBrooding01ReturnToIdle",
            PostLineAnimTarget = "Hero",
            Text =
            "Unfortunately not. With Typhon dealt with for the moment, I had best be getting back. I'm so grateful to have met you like this! Shall I see you again?"
        },

        EndVoiceLines =
        {
            {
                PreLineWait = 0.38,
                ObjectType = "NPC_Demeter_Story_01",
                PreLineAnim = "Demeter_Scoff",

                { Cue = "/VO/Demeter_0198", Text = "If the Fates have any mercy in their hearts, then yes." },
            },
        },
    },
    DemeterPalaceMeeting02 =
    {
        Name = "DemeterPalaceMeeting02",
        PlayOnce = true,
        UseableOffSource = true,
        InitialGiftableOffSource = true,
        GiftableOffSource = true,
        GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "DemeterPalaceFirstMeeting" },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.DemeterGreeting,

        {
            -- PreLineAnim = "Demeter_Scoff",
            -- PreLineAnim = "Demeter_Moved",
            Text =
            "Granddaughter, you have done our line proud once more. Thanks to your aid, we have been able to push the storm back for another night."
        },

        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Vulnerable_01",
            PreLineAnim = "MelTalkExplaining01",
            PreLineAnimTarget = "Hero",
            PostLineAnim = "MelTalkExplaining01ReturnToIdle",
            PostLineAnimTarget = "Hero",
            Text =
            "I was simply doing my duty to my family, Grandmother. I deserve no praise beyond that. Has King Zeus told you about the visions of the past I have been recieving?"
        },

        {
            PreLineAnim = "Demeter_Scoff",
            Text =
            "Zeus has informed me about these visions. Be careful you do not grow soft after seeing Chronos. What troubles you about them?"
        },

        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Empathetic_01",
            PreLineAnim = "MelTalkBrooding01",
            PreLineAnimTarget = "Hero",
            PostLineAnim = "MelTalkBrooding01ReturnToIdle",
            PostLineAnimTarget = "Hero",
            Text =
            "Perhaps it is best that I ask a slightly different question. How did you feel when you found out you were pregnant with my mother?"
        },
        {
            Text =
            "To be honest, I was terrified. I'll admit flower, that I am frequently cruel and unbending. I thought that I would be a terrible mother, and to some extent I was, forcing my daughter to run away."
        },
        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Empathetic_01",
            Text =
            "Really? But your relationship with Persephone is wonderful now. And you've been nothing but caring to me."
        },
        {
            PreLineAnim =  "Demeter_Moved",
            Text =
            "Knowing you think so means much to me, granddaughter. But what you see now is the result of hard work, communication and forgiveness from your mother. We would not have our relationship now if she did not allow me to correct my mistakes earlier."
        },

        EndVoiceLines =
        {
            {
						PreLineWait = 0.4,
						UsePlayerSource = true,

						{ Cue = "/VO/MelinoeField_4673", Text = "Thank you for looking out for her." },
					},
        },
    },
    DemeterPalaceMeeting03 =
    {
        Name = "DemeterPalaceMeeting03",
        PlayOnce = true,
        UseableOffSource = true,
        InitialGiftableOffSource = true,
        GiftableOffSource = true,
        GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "DemeterPalaceMeeting02" },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.DemeterGreeting,

        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Pleased_01",
            PreLineAnim = "MelTalkExplaining01",
            PreLineAnimTarget = "Hero",
            PostLineAnim = "MelTalkExplaining01ReturnToIdle",
            PostLineAnimTarget = "Hero",
            Text =
            "Grandmother! It is good to see you again. How go your war efforts?"
        },

        {
            PreLineAnim = "Demeter_Scoff",
            Text =
            "It has grown more difficult as of late to steal control of the storm back from Typhon. To be honest, with how strong the monster has been getting, the only thing preventing the palace being destroyed is the reprieve you bring by striking him down."
        },

        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Vulnerable_01",
            PreLineAnim = "MelTalkBrooding01",
            PreLineAnimTarget = "Hero",
            PostLineAnim = "MelTalkBrooding01ReturnToIdle",
            PostLineAnimTarget = "Hero",
            Text =
            "I had no idea it was getting this bad. Do the Olympians still have the strength to aid me with their boons?"
        },
        {
            Text =
            "Granddaughter, you are our greatest hope of surviving this war, and do not let anyone tell you otherwise. Myself, and all of my family, would gladly give every drop of power we could to ensure your success."
        },
        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Vulnerable_01",
            Text =
            "Success means nothing if my family is not there beside me. Please, Grandmother, look after yourself."
        },
        {
            PreLineAnim =  "Demeter_Moved",
            Text =
            "I will always sacrifice myself if it would mean that you, your mother, and your brother would live. But this is not my first fight against Titans. I will try my hardest so that we will all make it out fine, Melinoë."
        },

        EndVoiceLines =
        {
            {
						PreLineWait = 0.4,
						UsePlayerSource = true,

						{ Cue = "/VO/MelinoeField_4322", Text = "We will." },
					},
        },
    },
    DemeterPalaceMeeting04 =
    {
        Name = "DemeterPalaceMeeting04",
        PlayOnce = true,
        UseableOffSource = true,
        InitialGiftableOffSource = true,
        GiftableOffSource = true,
        GameStateRequirements =
        {
            {
                PathTrue = { "GameState", "TextLinesRecord", "DemeterPalaceMeeting03" },
            },
            {
                PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionSurfaceFlashback09" },
            },
        },
        OnQueuedFunctionName = "CheckDistanceTriggerThread",
        OnQueuedFunctionArgs = PresetEventArgs.DemeterGreeting,

    
        {
            PreLineAnim = "Demeter_Scoff",
            Text =
            "Is it true, Granddaughter? That Typhon is actually the Titaness Rhea?"
        },

        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Vulnerable_01",
            PreLineAnim = "MelTalkBrooding01",
            PreLineAnimTarget = "Hero",
            PostLineAnim = "MelTalkBrooding01ReturnToIdle",
            PostLineAnimTarget = "Hero",
            Text =
            "In a way. The body, curse and hatred that makes up Typhon certainly is Rhea, but I don't believe there is any of her soul left in there."
        },
        {
            PreLineAnim =  "Demeter_Moved",
            Text =
            "Rhea was kind to Hestia, Hera and I when our father Hyperion was cruel. She took us in when no other titan would give us anything."
        },
        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Vulnerable_01",
            Text =
            "I'm sorry. This news must be hard for all of you to hear."
        },
        {
            PreLineAnim =  "Demeter_Moved",
            Text =
            "None of her may truly live on in that monster, but she lives on in our hearts and her actions made us better gods. Perhaps this is what it is like to be mortal."
        },
        {
            UsePlayerSource = true,
            Portrait = "Portrait_Mel_Vulnerable_01",
            Text =
            "From what I've learnt from shades, we are must closer to mortals in our love and loss than we would like to admit. May we never feel such loss again."
        },

        EndVoiceLines =
        {
           {
						PreLineWait = 0.38,
						ObjectType = "NPC_Demeter_Story_01",
						PreLineAnim = "Demeter_Scoff",

						{ Cue = "/VO/Demeter_0198", Text = "If the Fates have any mercy in their hearts, then yes." },
					},
        },
    },
    DemeterPalaceAboutTyphonDeath01 =
			{
                Name = "DemeterPalaceAboutTyphonDeath01",
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TyphonDefeatedWithStormStop" },
					},
					{
						-- fallback
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.DemeterGreeting,

				{ Cue = "/VO/Demeter_0200",
					-- PreLineAnim = "Demeter_Scoff",
					-- PreLineAnim = "Demeter_Moved",
					Text = "The storm has passed... that monster turned the weather such that not even Lord Zeus or I could stop it properly. But now he's gone, and we have you to thank." },

				{ Cue = "/VO/MelinoeField_4321", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Thanks are owed all around, Grandmother. Typhon gave in to the combined might of the gods. I merely concentrated our fell strength. Now to press this advantage." },

				{ Cue = "/VO/Demeter_0201",
					PreLineAnim = "Demeter_Scoff",
					Portrait = "Portrait_Demeter_InPerson_01",
					Text = "Perhaps not even Chronos can withstand what you unleashed. But be careful, Granddaughter. Make certain we shall meet again." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						RequiredMinElapsedTime = 2,

						{ Cue = "/VO/MelinoeField_4322", Text = "We will." },
					},
				},
			},
}


NarrativeData.NPC_Zeus_Story_01.InteractTextLinePriorities = {
    "ZeusPalaceFirstMeeting",
	"ZeusPalaceMeeting02",
    "ZeusPalaceMeeting03",
    "ZeusPalaceMeeting05",
    "ZeusPalaceMeeting07",
    "ZeusPalaceMeeting08",
    "ZeusPalaceMeeting09",
    "ZeusPalaceAboutTyphonDeath01",
}

NarrativeData.NPC_Hera_Story_01 = {}
NarrativeData.NPC_Hera_Story_01.InteractTextLinePriorities = {
"ZeusPalaceFirstMeeting",
	"ZeusPalaceMeeting02",
    "ZeusPalaceMeeting04",
    "ZeusPalaceMeeting06",
    "ZeusPalaceMeeting08",
    "ZeusPalaceMeeting09",
    "ZeusPalaceAboutTyphonDeath01",
}

NarrativeData.NPC_Demeter_Story_01.InteractTextLinePriorities = {
			"DemeterPalaceFirstMeeting",
"DemeterPalaceMeeting02",
"DemeterPalaceMeeting03",
"DemeterPalaceMeeting04",
"DemeterPalaceAboutTyphonDeath01",
}

NarrativeData.NPC_Apollo_Story_01.InteractTextLinePriorities = {
"ApolloPalaceFirstMeeting",
"ApolloPalaceMeeting02",
"ApolloPalaceMeeting03",
"ApolloPalaceMeeting04",
"ApolloPalaceMeeting05",
"ApolloPalaceMeeting06",
"ApolloPalaceMeeting07",
"ApolloPalaceMeeting08",
"ApolloPalaceMeeting09",
"ApolloPalaceAboutTyphonDeath01",
}

function mod.CanSpawnHeraAtPalace()
        if IsGameStateEligible("Viewing1Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceFirstMeeting"}}}) then
            return true
        elseif IsGameStateEligible("Viewing2Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting02"}}}) then
            return true
        elseif IsGameStateEligible("Viewing3Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting03"}}}) then
            return false
        elseif IsGameStateEligible("Viewing4Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting04"}}}) then
            return true
        elseif IsGameStateEligible("Viewing5Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting05"}}}) then
            return false
        elseif IsGameStateEligible("Viewing6Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting06"}}}) then
            return true
        elseif IsGameStateEligible("Viewing7Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting07"}}}) then
            return false
        else
            return true
        end

end

function mod.CanSpawnZeusAtPalace()
        if IsGameStateEligible("Viewing1Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceFirstMeeting"}}}) then
            return true
        elseif IsGameStateEligible("Viewing2Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting02"}}}) then
            return true
        elseif IsGameStateEligible("Viewing3Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting03"}}}) then
            return true
        elseif IsGameStateEligible("Viewing4Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting04"}}}) then
            return false
        elseif IsGameStateEligible("Viewing5Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting05"}}}) then
            return true
        elseif IsGameStateEligible("Viewing6Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting06"}}}) then
            return false
        elseif IsGameStateEligible("Viewing7Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting07"}}}) then
            return true
        else
            return true
        end
end

function mod.CanSpawnDemeterAtPalace()
    if IsGameStateEligible("Viewing1Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceFirstMeeting"}}}) then
            return false
        elseif IsGameStateEligible("Viewing2Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting02"}}}) then
            return true
        elseif IsGameStateEligible("Viewing3Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting03"}}}) then
            return false
        elseif IsGameStateEligible("Viewing4Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting04"}}}) then
            return false
        elseif IsGameStateEligible("Viewing5Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting05"}}}) then
            return true
        elseif IsGameStateEligible("Viewing6Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting06"}}}) then
            return true
        elseif IsGameStateEligible("Viewing7Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting07"}}}) then
            return false
        elseif IsGameStateEligible("Viewing8Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting07"}}}) then
            return false
        elseif IsGameStateEligible("Viewing9Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting07"}}}) then
            return true
        elseif IsGameStateEligible("Viewing10Conv", {{PathFalse = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting07"}},{
						PathTrue = { "GameState", "TyphonDefeatedWithStormStop" },
					},
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeStormStop" },
					},}) then
            return true
        else
            return false
        end
end

-- NEED TO OVERRIDE THE FUNCTION IN STORY_PALACE_01 CHECKPRIORITYCONVERSATIONS (Maybe? Write Conversations then check. Removing the conversations may fix this)


RoomData.Q_Story01.ObstacleData =
{
    [792347] =
    {
        Name = "EndRunBoon",
        UseText = "UsePalaceExit",
        AnimOffsetZ = 110,
        OnUsedGameStateRequirements =
        {
            {
                Path = { "CurrentRun", "CurrentRoom", "UseRecord" },
                HasAny = { "NPC_Apollo_Story_01" },
            },
            OrRequirements =
            {
                -- demeter isn't present
                {
                    {
                        FunctionName = "RequiredAlive",
                        FunctionArgs = { Units = { "NPC_Demeter_Story_01", }, Alive = false },
                    },
                },
                -- demeter is present and you talked to her
                {
                    {
                        PathTrue = { "CurrentRun", "CurrentRoom", "UseRecord", "NPC_Demeter_Story_01" },
                    },
                },
            },
        },
        OnUsedFunctionName = "UseDummyLoot",
        SpeakerName = "Hecate",
        LoadPackages = { "Hecate" },
        InteractDistance = 180,
        InteractTextLineSets =
        {
            PalaceBoonExit01 =
            {
                PlayOnce = true,
                GameStateRequirements =
                {
                    --
                },

                {
                    Cue = "/VO/MelinoeField_3834",
                    UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Vulnerable_01",
                    PortraitExitAnimation = "Portrait_Mel_Vulnerable_01_Exit",
                    PreLineAnim = "MelTalkPensive01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkPensive01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PostLineFunctionName = "BoonInteractPresentation",
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text =
                    "I'm unaccustomed to being on this side! I see... Erebus, I think. Wait, Headmistress, is that {#Emph}you? {#Prev}Can you hear me?"
                },

                {
                    Cue = "/VO/HecateField_0328",
                    Source = "NPC_Hecate_01",
                    PreLineWait = 1.25,
                    PortraitExitWait = 0.25,
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    NarrativeContextArt = "DialogueBackground_Erebus",
                    PostLineRemoveContextArt = true,
                    PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
                    Text =
                    "{#Emph}In the name of Hades. Olympus, I accept this message! {#Prev}...Melinoë? If you can even hear me yonder, I bid you to return. We have matters to discuss."
                },

                {
                    Cue = "/VO/MelinoeField_3835",
                    UsePlayerSource = true,

                    Portrait = "Portrait_Mel_Proud_01",
                    PreLineAnim = "MelTalkExplaining01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkExplaining01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PreLineWait = 0.35,
                    PostLineThreadedFunctionName = "KillHero",
                    PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },

                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text =
                    "...I have to go now, everyone. Please take care, and let the others know I'm sorry to have missed them. I'll return!"
                },
                EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
            },
            PalaceBoonExitTyphonDestroyed01 =
            {
                PlayOnce = true,
                GameStateRequirements =
                {
                    {
                        PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceAboutTyphonDeath01" },
                    },
                },
                {
                    Cue = "/VO/MelinoeField_3926",
                    UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Proud_01",
                    PreLineAnim = "MelTalkBrooding01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkBrooding01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PostLineThreadedFunctionName = "KillHero",
                    PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text = "...Now for Chronos. I'll be counting on your blessings, everyone!"
                },
                EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
            },
            PalaceBoonExitPostTrueEnding01 =
            {
                PlayOnce = true,
                GameStateRequirements =
                {
                    {
                        PathTrue = { "GameState", "ReachedTrueEnding" },
                    },
                },
                {
                    Cue = "/VO/MelinoeField_5022",
                    UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Proud_01",
                    PreLineAnim = "MelTalkPensive01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkPensive01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PostLineThreadedFunctionName = "KillHero",
                    PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text =
                    "...It sounds like I may not be visiting again anytime soon, so... thank you all, and please let the others know I wish them well. Let's keep in touch by Boon!"
                },
                EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
            },
            PalaceBoonExit02 =
            {
                PlayOnce = true,
                GameStateRequirements =
                {
                    {
                        PathTrue = { "GameState", "TextLinesRecord", "ZeusPalacePostTrueEnding01" },
                    },
                },
                {
                    Cue = "/VO/MelinoeField_3927",
                    UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Proud_01",
                    PreLineAnim = "MelTalkPensive01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkPensive01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PostLineThreadedFunctionName = "KillHero",
                    PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text = "...It has been wonderful to see you all! Farewell for now!"
                },
                EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
            },

            -- repeatable
            PalaceBoonExitRepeatable01 =
            {
                GameStateRequirements =
                {
                    {
                        PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting02" },
                    },
                },

                {
                    Cue = "/VO/MelinoeField_3923",
                    UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Proud_01",
                    PreLineAnim = "MelTalkExplaining01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkExplaining01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PostLineThreadedFunctionName = "KillHero",
                    PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text = "...Goodbye for now, everyone! May you be safe and well when next we meet."
                },
                EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
            },
            PalaceBoonExitRepeatable02 =
            {
                GameStateRequirements =
                {
                    {
                        Path = { "GameState", "TextLinesRecord" },
                        HasAny = { "ZeusPalaceMeeting03", "ZeusPalaceMeeting03_A", "ZeusPalaceMeeting03_B" },
                    },
                },

                {
                    Cue = "/VO/MelinoeField_3925",
                    UsePlayerSource = true,
                    Portrait = "Portrait_Mel_Proud_01",
                    PreLineAnim = "MelTalkBrooding01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkBrooding01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PostLineThreadedFunctionName = "KillHero",
                    PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text = "...We're getting closer, everyone. Please stay safe!"
                },
                EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
            },
            PalaceBoonExitRepeatable03 =
            {
                GameStateRequirements =
                {
                    {
                        Path = { "GameState", "TextLinesRecord" },
                        HasAny = { "ZeusPalaceMeeting04", "ZeusPalaceMeeting04_B" },
                    },
                },

                {
                    Cue = "/VO/MelinoeField_3924",
                    UsePlayerSource = true,
                    PreLineAnim = "MelTalkBrooding01",
                    PreLineAnimTarget = "Hero",
                    PostLineAnim = "MelTalkBrooding01ReturnToIdle",
                    PostLineAnimTarget = "Hero",

                    PostLineThreadedFunctionName = "KillHero",
                    PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
                    BoxAnimation = "DialogueSpeechBubble",
                    BoxExitAnimation = "DialogueSpeechBubbleOut",
                    TextColor = Color.DialogueText,
                    UseRoomContextArt = true,
                    PostLineRemoveContextArt = true,
                    Text = "...Should Typhon rise again, I shall return!"
                },
                EndGlobalVoiceLines = "ZeusSendOffVoiceLines",
            },
        },
    },
}


function mod.CelebrationSounds()
    local apolloId = GetClosestUnitOfType(({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Apollo_Story_01"}))
    local apollo = ActiveEnemies[apolloId]
    PauseApolloSinging(apollo, {})

    local args = {}
    rom.audio.load_bank("Content\\Audio\\Desktop\\BiomeHub.bank")
    FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    local fullscreenBlackImageId = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu_TraitTray_Overlay", Animation = "Backgrounds/rectangle_01", Scale = 10, Color = Color.Black })
    wait(2.0)
	thread( PlayVoiceLines,{		PreLineWait = 1.25,
		BreakIfPlayed = true,
		UsePlayerSource = true,
		AllowTalkOverTextLines = true,
		{ Cue = "/VO/Melinoe_5027", Text = "Thank you all for standing by my side!" },
}, false )


	wait(1.5)
	PlaySound({ Name = "/SFX/Menu Sounds/Lounge_GlassWithIce" })
	wait(0.5)
	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_BottleCork" })
	wait(0.5)
	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_BottlePour" })
	wait(1.0)
	PlaySound({ Name = args.Sound2 or "/EmptyCue" })
	wait(0.5)
	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })
	wait(0.5)

	thread( DisplayInfoBanner, nil, {
		TitleText = "LoungeIntermissionMessage",
		TitleTextOffsetX = 81,
		LangTitleTextOffsetX = {	
			{ Code = "el", Value = 0 },
			{ Code = "ja", Value = 0 },
			{ Code = "ko", Value = 0 },
			{ Code = "ru", Value = 0 },
			{ Code = "uk", Value = 0 },
		},
		TextRevealSound = "/Leftovers/Menu Sounds/EmoteExcitement",
		Color = Color.Gold,
		TextColor = Color.White,
		TextOffsetY = 20,
		TitleFont = "SpectralSCLightTitling",
		SubtitleFont = "SpectralSCLightTitling",
		AnimationName = "LocationBackingIrisSmallIn",
		AnimationOutName = "LocationBackingIrisSmallOut",
		Layer = "ScreenOverlay",
		AdditionalAnimation = "GodHoodRays",
		} )

	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })
    	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_BottlePour" })
        	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_BottleCork" })


	wait(0.5)
	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_GlassesClinking" })
	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_GlassesClinking" })

	wait(0.5)
	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })
	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_GlassesClinking" })
    	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_BottlePour" })

	wait(0.5)
	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })
	PlaySound({ Name = args.Sound3 or "/EmptyCue" })
	wait(0.5)
	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })
	wait(0.5)
	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })
    	PlaySound({ Name = args.Sound or "/SFX/Menu Sounds/Lounge_GlassesClinking" })
	wait(0.5)
	AdjustFullscreenBloom({ Name = "Menu", Duration = 0.3 })
	AdjustColorGrading({ Name = "Ascension", Duration = 0.3 })
	AdjustColorGrading({ Name = "Off", Duration = 5.0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 5.0 })
	PlaySound({ Name = args.Sound or "/Leftovers/World Sounds/Caravan Interior/SwallowDrink" })
	wait(1.0)

    
        	Destroy({ Id = fullscreenBlackImageId })
	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
    ResumeApolloSinging(apollo, {})
end

EncounterData.Story_Palace_01.StartRoomUnthreadedEvents = {
    {
				FunctionName = "ActivatePrePlaced",
				Args =
				{
					LegalTypes =
					{
						"NPC_Zeus_Story_01",
						"NPC_Hera_Story_01",
						"NPC_Apollo_Story_01",
                        "NPC_Demeter_Story_01",
					},
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
					IgnorePartnerExists = true,
					Conversations =
					{
						"ZeusPalaceFirstMeeting",
						"ZeusPalaceMeeting02",
						"ZeusPalaceMeeting03",
						"ZeusPalaceMeeting04",
                        "ZeusPalaceMeeting05",
						"ZeusPalaceMeeting06",
                        "ZeusPalaceMeeting07",
						"ZeusPalaceMeeting08",
                        "ZeusPalaceMeeting09",
						"ZeusPalaceMeeting04_B",
						"ZeusPalaceAboutTyphonDeath01",
                        "DemeterPalaceFirstMeeting",
"DemeterPalaceMeeting02",
"DemeterPalaceMeeting03",
"DemeterPalaceMeeting04",
"DemeterPalaceAboutTyphonDeath01",
						"DemeterPalacePostTrueEnding01",
						"DemeterPalacePostTrueEnding01_B",
						"DemeterPalaceAboutTyphonDeath01",
						"ZeusPalacePostTrueEnding01",
					},
				},
			},
			{
				FunctionName = "SetupApolloMusic",
				Args =
				{
					ApolloId = 723553,
					Params =
					{
						LowPass = 0.0,
						Vocals = 1.0,
					},
				},
			},
			--[[
			{
				FunctionName = "ActivatePrePlacedObstacles",
				GameStateRequirements =
				{
					RequiredTextLines = { "PersephoneMeeting09" },
				},
				Args =
				{
					Groups = { "TravelBags" },
				},
			},
			]]--
		}
--TODO: FIRST POSTGAME CLEAR (IDK What that will look like yet)