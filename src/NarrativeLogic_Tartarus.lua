function mod.SetUp_I_PostBoss01(eventSource, args)
    local rescues = {"NPC_Persephone_Frozen_StoryExpansion", "NPC_Zagreus_Frozen_StoryExpansion","NPC_Thanatos_Frozen_StoryExpansion","NPC_Megaera_Frozen_StoryExpansion","NPC_Achilles_Frozen_StoryExpansion","NPC_Dusa_Frozen_StoryExpansion","NPC_Orpheus_Frozen_StoryExpansion","NPC_Nyx_Frozen_StoryExpansion", }
    if not (IsGameStateEligible("StoryExpansionRescuingPersephone",game.EnemyData["NPC_Persephone_Hub_StoryExpansion"].ActivateRequirements)) then
	local characterName = "NPC_Persephone_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750
	elseif not (IsGameStateEligible("StoryExpansionRescuingZagreus",game.EnemyData["NPC_Zagreus_Hub_StoryExpansion"].ActivateRequirements)) then
	local characterName = "NPC_Zagreus_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750
	elseif not (IsGameStateEligible("StoryExpansionRescuingThanatos",game.EnemyData["NPC_Thanatos_Hub_StoryExpansion"].ActivateRequirements)) then
		local characterName = "NPC_Thanatos_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750
	elseif not (IsGameStateEligible("StoryExpansionRescuingMegaera",game.EnemyData["NPC_Megaera_Hub_StoryExpansion"].ActivateRequirements)) then
		local characterName = "NPC_Megaera_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750
	elseif not (IsGameStateEligible("StoryExpansionRescuingAchilles",game.EnemyData["NPC_Achilles_Hub_StoryExpansion"].ActivateRequirements)) then
		local characterName = "NPC_Achilles_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750
	elseif not (IsGameStateEligible("StoryExpansionRescuingOrpheus",game.EnemyData["NPC_Orpheus_Hub_StoryExpansion"].ActivateRequirements)) then
		local characterName = "NPC_Orpheus_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750
	elseif not (IsGameStateEligible("StoryExpansionRescuingDusa",game.EnemyData["NPC_Dusa_Hub_StoryExpansion"].ActivateRequirements)) then
		local characterName = "NPC_Dusa_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750
	elseif not (IsGameStateEligible("StoryExpansionRescuingNyx",game.EnemyData["NPC_Nyx_Hub_StoryExpansion"].ActivateRequirements)) then
		local characterName = "NPC_Nyx_Frozen_StoryExpansion"
        local character = mod.PlaceNPCAtId(eventSource, characterName, args)
        CreateAnimation({DestinationId= character.ObjectId, Name ="NightmareStasisFx_DeathArea"})
        SetColor({ Id = character.ObjectId, Color = Color.ChronosSand})
		character.Frozen = true
		SetThingProperty({ Property = "AnimFreeze", Value = true, DestinationId = character.ObjectId, DataValue = false })
        -- OffsetX = -1600, OffsetY = -750

	end
end

modutil.mod.Path.Wrap("DreamBedPresentation", function(base,usee, args, user)
    if IsGameStateEligible("IsARepeatRun", {{PathTrue = {"GameState", "TextLinesRecord", "StoryExpansionRescuingNyx"}}}) and not IsGameStateEligible("IsARepeatRun", {{PathTrue = {"GameState", "TextLinesRecord", "ZeusPalaceMeeting09"}}}) then
        return mod.NoStoryProgressionInUnderworld()
    elseif IsGameStateEligible("IsARepeatRun", {{PathTrue = {"GameState", "TextLinesRecord", "StoryExpansionObtainingHadesSpearPoint"}}}) and not IsGameStateEligible("IsARepeatRun", {{PathTrue = {"GameState", "WorldUpgrades", "WorldUpgradeTimeStop"}}})then
        return mod.NoStoryProgressionInUnderworld()
    end
    if IsGameStateEligible("IsFinalRun", {{PathTrue = {"GameState", "WorldUpgrades", "WorldUpgradeTimeStop"}}}) and IsGameStateEligible("FinalRun", {{Path= { "GameState", "TextLinesRecord" },HasNone = {"StoryExpansionEndingConversation", "StoryExpansionEndingConversation_B"}}}) then
        return mod.TimeTravelSetUp()
    end
    return base(usee, args, user)
end)

function mod.NoStoryProgressionInUnderworld()
    local textLines = 
			{
				Name = "StoryExpansionHadesSpearPointNotUnlockedEnd",
				PlayOnce = false,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "Portrait_Mel_Default_01",UsePlayerSource = true,
                    PreLineWait = 0.5,
PostLineThreadedFunctionName = "KillHero",
					PostLineFunctionArgs = { WaitTime = 5, MusicEndTime = 60 },
					Text = "It doesn't appear there's anything left for me to do here in the Underworld. Perhaps more trips to the surface are required for me to understand how to defeat my foe here. But for now, I should return to the Crossroads." },
EndVoiceLines = {
{
						PreLineWait = 0.35,
						UsePlayerSource = true,
		{ Cue = "/VO/Melinoe_1753", Text = "I'll be back!" },
					},
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )

end

modutil.mod.Path.Wrap("UseHadesSpearPresentation", function(base,usee, args, user)
    base(usee, args, user)
    local textLines = 
			{
				Name = "StoryExpansionObtainingHadesSpearPoint",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "Portrait_Mel_Default_01",UsePlayerSource = true,
                    PreLineWait = 0.5,
PostLineThreadedFunctionName = "KillHero",
					PostLineFunctionArgs = { WaitTime = 5, MusicEndTime = 60 },
					Text = "My Father's spear, soaked in the full power of the Chthonic Realm. It should be sufficient to end Typhon for good. All it needs now is to be infused with the power of our enemy through incantation." },
EndVoiceLines = {
{
						PreLineWait = 0.35,
						UsePlayerSource = true,
		{ Cue = "/VO/Melinoe_0115", Text = "For my family." },
					},
}

                }
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, args )
end)


function mod.TimeTravelSetUp()
    LoadPackages({Name = "Nyx"})
    LoadPackages({Name = "Zagreus"})
    LoadPackages({Name = "Persephone"})
    LoadPackages({Name = "Chronos"})
    LoadPackages({Name = "Achilles"})
    local textLines = 
			{
				Name = "StoryExpansionEndingConversation_B",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "Portrait_Mel_Intense_01",UsePlayerSource = true,
                    PreLineWait = 1.0,
                    PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.0, UseChronosSound = false },
					Text = "Alright, this is it. Time to end this once and for all, on my terms. {#Emph} Members of the House of Hades, hear my voice and aid me{#Prev}." },
					{
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_Hub_StoryExpansion",
                    PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0, UseChronosSound = false },
					Text = "Melinoë, we can hear you thus. We cannot, however, locate Hecate to aid in performing the incantation."},
										{ 
					Portrait = "Portrait_Mel_Intense_01",UsePlayerSource = true,
					Text = "Chronos has captured her. We shall have to perform the incantation without her aid. Is everyone present by the cauldron to serve as anchors for the spell?" },
										{
					Portrait = "Portrait_ZagPresent_Default_01",Speaker = "NPC_Zagreus_Hub_StoryExpansion",
					Text = "We're all here, Mel. I have to say, I've never been on this side of boon-based communication before."},
					{ 
					Portrait = "StoryExpansion_Thanatos_Default",Speaker = "NPC_Thanatos_Hub_StoryExpansion",
					Text = "Our power stands ready for you to draw upon, Princess. Know you have our faith, and our hope." },
										{
					Portrait = "StoryExpansion_Megaera_Default",Speaker = "NPC_Megaera_Hub_StoryExpansion",
					Text = "We have not supported you for so long to give up now. Take all the magick from us you need to achieve your goals."},
															{
					Portrait = "StoryExpansion_Orpheus_Default",Speaker = "NPC_Orpheus_Hub_StoryExpansion",
					Text = "I have already begun writing a ballad to celebrate your victory!"},
                    															{
					Portrait = "StoryExpansion_Dusa_Confident",Speaker = "NPC_Dusa_Hub_StoryExpansion",
					Text = "Go Melinoë! We're all here at the cauldron, ready for you to draw on our support!"},


                    { 
                        PreLineWait = 0.6,
					Portrait = "Portrait_ZagPresent_Serious_01",Speaker = "NPC_Zagreus_Hub_StoryExpansion",
					Text = "Melinoë, I hope you will make the right decision when it comes down to it. Know you have my support no matter what." },
{
					Portrait = "Portrait_Mel_Default_01",UsePlayerSource = true,
					Text = "Thank you for your support in this spell, everyone. I must leave you now to pierce the veil of time."},
					{
					Portrait = "Portrait_Persephone_Queen_01",Speaker = "NPC_Persephone_Hub_StoryExpansion",
					Text = "Be safe daughter. I don't think we can handle losing you again."},
                    					{
					Portrait = "Portrait_Achilles_Default_01",Speaker = "NPC_Achilles_Hub_StoryExpansion",
					Text = "Have our power with you for when you go to a time where we cannot aid, lass. We believe in you. "},

										{ 
					Portrait = "Portrait_Mel_Intense_01",UsePlayerSource = true,
                    PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0, UseChronosSound = false },
                                        					PortraitExitAnimation = "Portrait_Mel_Intense_01_Exit",
                    PostLineFunctionName = _PLUGIN.guid..".BedroomToChronosSanctumPresentation",
					Text = "{#Emph} With the collection of entropy and the banishment of monstrosity, I call upon the power to pierce time. May my bonds link me to the present, my enemy link me to the past and my spear to the future. Let me change the Fates' designs! Dissolution of Time!{#Prev}" },
                { Cue = "/VO/Chronos_0967",
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "Who goes there?! You lack the clopping of the Satyr's hooves, and have a countenance which I know not." },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					PreLineWait = 0.35,
					Text = "Chronos! I am Melinoë, the daughter of Hades. I come from a future where you are allowed to rise, and strike against my House, depriving me of my family." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "So I succeed in my goals then, granddaughter of mine? Except in dealing with you, it appears." },

				{ Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "Piercing the veil of time requires no insignificant power, as I'm sure you are aware. I can assure you that I have more than enough power left in me to do you in for good. No-one will suffer under your rule again."},

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					PreLineWait = 0.35,
					Text = "One cannot simply change the course of time, much less destroy Time itself. You are bluffing." },

				{ Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "Whether or not you believe me makes no difference. Already my Father's spear has destroyed the last remains of your wife, by felling Typhon. I'm sure it can cleave Time, for all the suffering you've caused me, just as easily." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "Enemy_Chronos_Knockdown_Frustrated",
					PreLineAnimTarget = 772221,
					Text = "{#Emph} Rhea... {#Prev}I... You dare speak to me of pain and suffering? Here I have rotted since an aeon prior to when you were but a twinkle in your father's eye! He and his brothers, traitors and usurpers!" },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,

					-- PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Zag_Empathetic_02", WaitTime = 5.0 },

					Text = "They're your children... my Father and Brother also used to fight. He'd grown isolated from Olympus, and Persephone, and each other. It didn't do them any good. What about you? Are you prepared to sweep the younger generation into your old grudge?" },

				{
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "If necessary, {#Emph}yes{#Prev}, of {#Emph}course! {#Prev}Your father and his brothers surely have already poisoned you and your entire generation against me! You would not have travelled back in time if you had not been. Strike, Granddaughter, and make hateful your heart." },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "..." },

                { 
					Portrait = "Portrait_Mel_Default_01",
					UsePlayerSource = true,
                    PreLineWait = 1.0,
					Text = "No. Our family has fought, child against parent for too long. I do not hold such hate in my heart, and from what I have seen of you in the past, I don't believe you truly do either. Let us end the cycle of violence, together, {#Emph} now{#Prev}." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Emote = "PortraitEmoteFiredUp",
					Text = "You do not know me, Granddaughter! My heart is cruel, and you should know from experience that I would gladly enact revenge against my sons and the traitors that supported them. What would you have me do instead?" },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,

					Text = "You would be a grandfather to my brother, and, once I was born, me. Swear an oath to never use your power against the House of Hades. In exchange, I will speak on your behalf to my family." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "And {#Emph}what... {#Prev}? I live a joy-filled life in which Grandfather Time is there to coddle the spoiled child of my rancorous son? Hades shall drive that accursed spear you wield through me on sight if you do not!" },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "You'll be under the protection of my merciful brother, Zagreus, who convinced me to give you this chance. It won't just be a joy-filled life, especially if you keep on. But it'll probably be better than whatever accursed magick {#Emph}this {#Prev}is! Now make your choice already. I don't have all night." },

				{ 
					PreLineWait = 0.5,
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					PortraitExitAnimation = "Portrait_Chronos_Averted_01_Exit",
					PostLineFunctionName = _PLUGIN.guid..".ChronosSanctumExitPresentation",
					Text = "{#Emph}<Scoff> {#Prev}So then, a future with such grandchildren as you, or the eternal void... how can I possibly decide...?" },
EndVoiceLines = {		
}

                }

    if GameState.TextLinesRecord.StoryExpansionNyxAboutHecateMissing then
    textLines = 
			{
				Name = "StoryExpansionEndingConversation",
				PlayOnce = true,
				--NEED TO CHANGE LATER
				UseableOffSource = true,
				StatusAnimation = false,
				SkipContextArt = true,
				UseText = "StoryExpansionFreeNPC",
				InteractDistance = 300,

				{ 
					Portrait = "Portrait_Mel_Intense_01",UsePlayerSource = true,
                    PreLineWait = 1.0,
                    PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.0, UseChronosSound = false },
					Text = "Alright, this is it. Time to end this once and for all, on my terms. {#Emph} Members of the House at the Crossroads, hear my voice and aid me{#Prev}." },
					{
					Portrait = "Portrait_Nyx_Default_01",Speaker = "NPC_Nyx_Hub_StoryExpansion",
                    PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0, UseChronosSound = false },
					Text = "Melinoë, we can hear you thus. Has you defeat of Chronos revealed Hecate's location?"},
										{ 
					Portrait = "Portrait_Mel_Intense_01",UsePlayerSource = true,
					Text = "Unfortunately not. We shall have to perform the incantation without her aid. Is everyone present by the cauldron to serve as anchors for the spell?" },
										{
					Portrait = "Portrait_ZagPresent_Default_01",Speaker = "NPC_Zagreus_Hub_StoryExpansion",
					Text = "We're all here, Mel. I have to say, I've never been on this side of boon-based communication before."},
					{ 
					Portrait = "StoryExpansion_Thanatos_Default",Speaker = "NPC_Thanatos_Hub_StoryExpansion",
					Text = "Our power stands ready for you to draw upon, Princess. Know you have our faith, and our hope." },
										{
					Portrait = "StoryExpansion_Megaera_Default",Speaker = "NPC_Megaera_Hub_StoryExpansion",
					Text = "We have not supported you for so long to give up now. Take all the magick from us you need to achieve your goals."},
															{
					Portrait = "StoryExpansion_Orpheus_Default",Speaker = "NPC_Orpheus_Hub_StoryExpansion",
					Text = "I have already begun writing a ballad to celebrate your victory!"},
                                        															{
					Portrait = "StoryExpansion_Dusa_Confident",Speaker = "NPC_Dusa_Hub_StoryExpansion",
					Text = "Go Melinoë! We're all here at the cauldron, ready for you to draw on our support!"},




                    { 
                        PreLineWait = 0.6,
					Portrait = "Portrait_ZagPresent_Serious_01",Speaker = "NPC_Zagreus_Hub_StoryExpansion",
					Text = "Melinoë, I hope you will make the right decision when it comes down to it. Know you have my support no matter what." },
{
					Portrait = "Portrait_Mel_Default_01",UsePlayerSource = true,
					Text = "Thank you for your support in this spell, everyone. I must leave you now to pierce the veil of time."},
					{
					Portrait = "Portrait_Persephone_Queen_01",Speaker = "NPC_Persephone_Hub_StoryExpansion",
					Text = "Be safe daughter. I don't think we can handle losing you again."},
                    {
					Portrait = "Portrait_Achilles_Default_01",Speaker = "NPC_Achilles_Hub_StoryExpansion",
					Text = "Have our power with you for when you go to a time where we cannot aid, lass. We believe in you. "},
										{ 
					Portrait = "Portrait_Mel_Intense_01",UsePlayerSource = true,
                    					PortraitExitAnimation = "Portrait_Mel_Intense_01_Exit",
                    PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 0, UseChronosSound = false },
                    PostLineFunctionName = _PLUGIN.guid..".BedroomToChronosSanctumPresentation",
					Text = "{#Emph} With the collection of entropy and the banishment of monstrosity, I call upon the power to pierce time. May my bonds link me to the present, my enemy link me to the past and my spear to the future. Let me change the Fates' designs! Dissolution of Time!{#Prev}" },
                
                    { Cue = "/VO/Chronos_0967",
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "Who goes there?! You lack the clopping of the Satyr's hooves, and have a countenance which I know not." },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					PreLineWait = 0.35,
					Text = "Chronos! I am Melinoë, the daughter of Hades. I come from a future where you are allowed to rise, and strike against my House, depriving me of my family." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "So I succeed in my goals then, granddaughter of mine? Except in dealing with you, it appears." },

				{ Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "Piercing the veil of time requires no insignificant power, as I'm sure you are aware. I can assure you that I have more than enough power left in me to do you in for good. No-one will suffer under your rule again."},

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					PreLineWait = 0.35,
					Text = "One cannot simply change the course of time, much less destroy Time itself. You are bluffing." },

				{ Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "Whether or not you believe me makes no difference. Already my Father's spear has destroyed the last remains of your wife by felling Typhon. I'm sure it can cleave Time just as easily in return for all the suffering you've caused me." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "Enemy_Chronos_Knockdown_Frustrated",
					PreLineAnimTarget = 772221,
					Text = "{#Emph} Rhea... {#Prev}I... You dare speak to me of pain and suffering? Here I have rotted since an aeon prior to when you were but a twinkle in your father's eye! He and his brothers, traitors and usurpers!" },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,

					-- PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Zag_Empathetic_02", WaitTime = 5.0 },

					Text = "They're your children... my Father and Brother also used to fight. He'd grown isolated from Olympus, and Persephone, and each other. It didn't do them any good. What about you? Are you prepared to sweep the younger generation into your old grudge?" },

				{
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "If necessary, {#Emph}yes{#Prev}, of {#Emph}course! {#Prev}Your father and his brothers surely have already poisoned you and your entire generation against me! You would not have travelled back in time if you had not been. Strike, Granddaughter, and make hateful your heart." },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "..." },

                { 
					Portrait = "Portrait_Mel_Default_01",
					UsePlayerSource = true,
                    PreLineWait = 1.0,
					Text = "No. Our family has fought, child against parent for too long. I do not hold such hate in my heart, and from what I have seen of you in the past, I don't believe you truly do either. Let us end the cycle of violence, together, {#Emph} now{#Prev}." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Emote = "PortraitEmoteFiredUp",
					Text = "You do not know me, Granddaughter! My heart is cruel, and you should know from experience that I would gladly enact revenge against my sons and the traitors that supported them. What would you have me do instead?" },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,

					Text = "You would be a grandfather to my brother, and, once I was born in this time, me. Swear an oath to never use your power against the House of Hades. In exchange, I will speak on your behalf to my family." },

				{ 
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					Text = "And {#Emph}what... {#Prev}? I live a joy-filled life in which Grandfather Time is there to coddle the spoiled child of my rancorous son? Hades shall drive that accursed spear you wield through me on sight if you do not!" },

				{ 
					Portrait = "Portrait_Mel_Intense_01",
					UsePlayerSource = true,
					Text = "You'll be under the protection of my merciful brother, Zagreus, who convinced me to give you this chance. It won't just be a joy-filled life, especially if you do not allow yourself to forgive. But it'll probably be better than whatever accursed magick {#Emph}this {#Prev}is! Now make your choice already. I don't have all night." },

				{ 
					PreLineWait = 0.5,
					Source = "NPC_Chronos_Story_01",
					Portrait = "Portrait_Chronos_Averted_01",
					PortraitExitAnimation = "Portrait_Chronos_Averted_01_Exit",
					PostLineFunctionName = _PLUGIN.guid..".ChronosSanctumExitPresentation",
					Text = "{#Emph}<Scoff> {#Prev}So then, a future with such grandchildren as you, or the eternal void... how can I possibly decide...?" },
EndVoiceLines = {		
}

                }
                end
    PlayTextLines( {Name = "Flashback", ObjectId = CurrentRun.Hero.ObjectId}, textLines, {} )
end

function mod.BedroomToChronosSanctumPresentation()
    
    StopSecretMusic()
	EndAmbience()

	FullScreenFadeOutAnimation( "RoomTransitionIn_TimeWarp_Slow" )

	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	wait(2.0)

	SetAudioEffectState({ Name = "Reverb", Value = 1.0 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.65 })

	-- Set up the camera and overlays
	ClearCameraClamp({ LerpTime = 0 })
	FocusCamera({ Fraction = 0.82, Duration = 0 })
	PanCamera({ Id = 772217 }) -- offscreen camera target
	SetAlpha({ Id = ScreenAnchors.DialogueBackgroundId, Fraction = 0.0, Duration = 0.0 })
	StopAnimation({ Name = SessionMapState.NightmareVignetteAnimationName, DestinationId = ScreenAnchors.FullscreenAlertFxAnchor })
	
	-- PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })

	wait(2.0)

	AudioState.AmbienceId = PlaySound({ Name = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE", Duration = 0.5 })

	wait(1.0)
	thread( DisplayInfoBanner, nil,
		{
			Text = "Location_Sanctum",
			SubtitleText = "Location_Sanctum_Subtitle",
			Delay = 1.5,
			SubtitleDelay = 0.5,
			SubtitleOffsetY = 15,
			Duration = 3.5,
			Layer = "Overlay",
			AnimationName = "LocationBackingIrisSmallIn",
			AnimationOutName = "LocationBackingIrisSmallOut",
			IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
			IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		} )

	-- Begin the dramatic narrative sequence...
	local chronosId = 772221
	local heroId = CurrentRun.Hero.ObjectId

	SetAlpha({ Id = heroId, Fraction = 1, Duration = 0 })
	SetScale({ Id = heroId, Fraction = 1.0, })
	Teleport({ Id = heroId, DestinationId = 772219 })
	AdjustZLocation({ Id = heroId, Distance = 0 - GetZLocation({ Id = heroId }) })
	AngleTowardTarget({ Id = heroId, DestinationId = chronosId })
	SetAnimation({ Name = "Enemy_Chronos_Knockdown_FireLoop", DestinationId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Chronos_Story_01" }) })

	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionOut_TimeWarp_Slow" )

	PanCamera({ Id = chronosId, Duration = 14.0 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscendedHel", Delay = 0.25 })

	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow", Delay = 2 })
	waitUnmodified( 1.0 )
	SecretMusicPlayer( "/Music/MusicStyx1_MC_Chronos" )

	waitUnmodified( 7.0 )

	thread( PlayVoiceLines, GlobalVoiceLines.ChronosSanctumGreetingLines )
	thread( SatyrBattleSounds )
	waitUnmodified( 14.0 )
	PanCamera({ Id = 800310, Duration = 9, })
	waitUnmodified( 3.0 )

	MoveHeroToRoomPosition({ MoverId = heroId, DestinationId = 772234, DisableCollision = true, Speed = 500 })

	waitUnmodified( 3.1 )

	SetAlpha({ Id = ScreenAnchors.DialogueBackgroundId, Fraction = 1.0, Duration = 0.5 })

end

GlobalVoiceLines.ChronosSanctumGreetingLines = {{
		ObjectTypes = { "NPC_Chronos_01", "NPC_Chronos_Story_01" },
		PreLineWait = 0.9,
		AllowTalkOverTextLines = true,

		{ Cue = "/VO/Chronos_0962", Text = "{#Emph}Pah! {#Prev}What {#Emph}now...?" },
		{ Cue = "/VO/Chronos_0963", Text = "What is all that infernal {#Emph}racket?", },
		{ Cue = "/VO/Chronos_0964", Text = "Silence, fools, lest we be {#Emph}caught!", PreLineWait = 1.5 },
		{ Cue = "/VO/Chronos_0965", Text = "Guards! Guards...? {#Emph}Guards!!", PreLineWait = 1.2 },
		{ Cue = "/VO/Chronos_0966", Text = "{#Emph}Nrgh..." },
	},
}

function mod.ChronosSanctumExitPresentation( )


	AdjustRadialBlurDistance({ Fraction = 3.0, Duration = 2 })
	AdjustRadialBlurStrength({ Fraction = 2, Duration = 2 })

	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal5FilterSweep" })

	SetSoundCueValue({ Names = { "Section" }, Id = AudioState.SecretMusicId, Value = 10 })
	AudioState.SecretMusicId = nil
	AudioState.SecretMusicName = nil

	thread( PlayVoiceLines, GlobalVoiceLines.ChronosCorneredVoiceLines )
    wait(0.25)	
    SetAnimation({ Name = "Melinoe_TyphonKill", DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 1.2 })
	wait( 1.4 )
	wait( 0.25 )
	FullScreenFadeOutAnimation( "RoomTransitionIn_TimeWarp_Alt", "ChronosSand" )
	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 1 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 1 })

	EndAmbience()
	--PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscendedHel" })

	waitUnmodified( 1.5 )

	local nextRoom = CreateRoom( RoomData.I_ChronosFlashback01 )
	CurrentRun.CurrentRoom = nextRoom
	RequestSave({ StartNextMap = nextRoom.Name, SaveName = "_Temp", DevSaveName = CreateDevSaveName( CurrentRun ) })
	LoadMap({ Name = nextRoom.Name, LoadBackgroundColor = nextRoom.LoadBackgroundColor })
	-- see SetupFlashback03
end


GlobalVoiceLines.ChronosCorneredVoiceLines =
{
	{

		PreLineWait = 0.76,
		AllowTalkOverTextLines = true,
        UsePlayerSource = true,

			{ Cue = "/VO/MelinoeField_5017", Text = "Back to the abyss!" },

	},
	{
		ObjectTypes = { "NPC_Chronos_01", "NPC_Chronos_Story_01" },
		AllowTalkOverTextLines = true,

		{ Cue = "/VO/Chronos_1306", Text = "No, wait!" },
	},
}

EnemyData.NPC_Zagreus_Past_01.InteractTextLineSets = nil

EncounterData.Story_DeathAreaRestored.UnthreadedEvents = {
    {
				FunctionName = "SurpriseNPCPresentation",
				Args =
				{
					SourceId = 774366,
					SkipAngleTowardTarget = true,
					SkipCameraLock = true,
					PanIds = { 560366, 772454 },
					TextLineSet =
					{
						-- see also TrueEnding02, TrueEndingFinale01
						TrueEnding01 =
						{
                            Name = "TrueEnding01",
							PlayOnce = true,
							SkipContextArt = true,
							UseableOffSource = true,
							InitialGiftableOffSource = true,
							GiftableOffSource = true,
							PreBlockSpecialInteract = true,
							PostBlockSpecialInteract = true,
							SkipAngleTowardTarget = true,

							{ Cue = "/VO/HecateField_0323",
								Source = "NPC_Hecate_01",
								-- Emote = "PortraitEmoteFiredUp",
								Text = "Prepare to suffer for all that you've done, wretch! Or shall I stay my hand merely because you made the mistake of loosening your hold on me?" },

							{ Cue = "/VO/Chronos_1520",
								PreLineWait = 0.35,
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								Text = "...All of these... newfound thoughts... within my mind...! Was all of this {#Emph}your {#Prev}doing, witch? I... have no memory of you, and yet.... Who {#Emph}are {#Prev}you...?" },

							{ Cue = "/VO/MelinoeField_5144",
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Intense_01",
								PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
								PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",

								SecretMusicMutedStems = { "Bass" },

								Text = "Chronos...! Headmistress, {#Emph}wait! {#Prev}I can... I think I can explain." },

							{ Cue = "/VO/HecateField_0324",
								Source = "NPC_Hecate_01",
								Emote = "PortraitEmoteSurprise",
								Text = "Melinoë! Where are we? One instant I discovered that our enemy invaded Erebus, then next I know he's groveling about my feet! How is this possible? What have you done...?" },

							{ 
								UsePlayerSource = true,
								PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
								PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
								Portrait = "Portrait_Mel_Vulnerable_01",

								PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Mel_Intense_01", WaitTime = 5.85 },

								Text = "Headmistress, you... you don't remember... because you weren't able to serve as a conduit for the spell. As for you, Chronos! Who am I now to you...?" },

							{ Cue = "/VO/Chronos_1465",
								PreLineWait = 0.5,
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								Text = "You are... my granddaughter... Melinoë... whom I know both from this life, and an altogether different one... which I now realize... was but a dream. A {#Emph}delusion! {#Prev}So then... all I have left... is {#Emph}this?" },

							{ 
                                Source = "NPC_Hecate_01",
								SecretMusicActiveStems = { "Bass" },

								Text = "All that you see is what you wrought in your hate, Titan! Melinoë, there must be something wrong. If our incantation were successful, he would be gone, not merely weakened with false memories." },

                            { 
								UsePlayerSource = true,
								PreLineAnim = "Melinoe_Defiant", PreLineAnimTarget = "Hero",
								Portrait = "Portrait_Mel_Intense_01",

								Text = "This other life... how much of it do you recall?" },

							{ Cue = "/VO/Chronos_1466",
								PreLineWait = 0.5,
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",

								SecretMusicMutedStems = { "Guitar" },

								Text = "...Your youth, here in this House, with me. How you delighted in a hiding-game, when you were but a girl! How you and Zagreus would fight, but out of love... not in the way we fought this very night. I did not realize there could have been this {#Emph}other {#Prev}past we shared... this {#Emph}better {#Prev}past." },

							{ Cue = "/VO/HecateField_0427",
								Source = "NPC_Hecate_01",
								-- Emote = "PortraitEmoteFiredUp",

								SecretMusicActiveStems = { "Guitar", "Drums" },

								Text = "A better past...? {#Emph}Nonsense! {#Prev}None of it occurred! Nothing has {#Emph}changed! {#Prev}You should be {#Emph}gone{#Prev}, Titan...! Not flooded with false memories!" },

							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Vulnerable_01",
								PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
								PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",

								SecretMusicMutedStems = { "Drums" },

								Text = "...All these memories that sprang to his mind... I remember them as well. A life I could have lived... had the Titan never struck. A life we created by choosing to forgive." },

							{ Cue = "/VO/Chronos_1467",
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- Emote = "PortraitEmoteFiredUp",
								PreLineAnim = "Enemy_Chronos_Knockdown_Frustrated", PreLineAnimTarget = 774365,

								SecretMusicActiveStems = { "Drums", },
								-- SecretMusicMutedStems = { "Drums" },

								Text = "But I {#Emph}struck! {#Prev}Ever-hated and shunned! Finish what you set your mind to, Granddaughter! For I have no desire to exist in such a world, with all of you, like {#Emph}this! {#Prev}Not for one moment longer...!" },

							{ Cue = "/VO/HecateField_0428",
								Source = "NPC_Hecate_01",
								Emote = "PortraitEmoteAnger",
								-- PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",

								-- SecretMusicActiveStems = { "Drums", },
								SecretMusicMutedStems = { "Guitar" },

								Text = "{#Emph}Silence! {#Prev}Melinoë, come to your senses. Whatever you did, this wretch is finished, and shan't be using his old tricks again! {#Emph}End him!" },

							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Intense_01",
								PreLineAnim = "Melinoe_Defiant", PreLineAnimTarget = "Hero",

								SecretMusicMutedStems = { "Drums" },

								Text = "Wait, please Headmistress, let me prove this to you...! Chronos! Grandfather. I am giving you one last chance here, as I did in the past time. Make your choice. Will you be ruled by hate, or love?" },

                            							{
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- Emote = "PortraitEmoteFiredUp",

								-- SecretMusicMutedStems = { "Drums" },

								Text = "I..." },
{
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- Emote = "PortraitEmoteFiredUp",

								-- SecretMusicMutedStems = { "Drums" },

								Text = "What I've done is unforgivable, Melinoë. I took your family, your childhood, and forced you into vengeance." },
							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Proud_01",
								PreLineAnim = "Melinoe_Defiant", PreLineAnimTarget = "Hero",

								SecretMusicMutedStems = { "Drums" },

								Text = "That's the thing I've learnt about forgiveness. It is not up to you whether or not you recieve it. Nothing you've taken from me was lost forever; I've reclaimed my family, gave myself another childhood, and found a new purpose outside of vengeance. I'm now offering you the same opportunity." },

                            {
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- Emote = "PortraitEmoteFiredUp",

								-- SecretMusicMutedStems = { "Drums" },

								Text = "Thank you, Granddaughter. Whatever can I do to make up for it?" },

                            							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Intense_01",
								PreLineAnim = "Melinoe_Defiant", PreLineAnimTarget = "Hero",

								SecretMusicMutedStems = { "Drums" },

								Text = "Join your power with mine now and summon our family together. It's not just me that requires an apology after all." },

							{ 
								Source = "NPC_Hecate_01",
								Emote = "PortraitEmoteAnger",
								-- PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",


								Text = "Melinoë, you {#Emph} cannot {#Prev} be indulging in this {#Emph} foolishness{#Prev}! Do your duty, and {#Emph} finish him off!" },



							{ 
								Emote = "PortraitEmoteSurprise",
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								PortraitExitAnimation = "Portrait_Chronos_Confused_01_Exit",
								PostLineFunctionName = _PLUGIN.guid..".SummonFamilyMembers",
								PostLineRemoveContextArt = true,

								SecretMusicActiveStems = { "Guitar", },
								SecretMusicMutedStems = { "Bass" },

								Text = "{#Emph}<Gasp> {#Prev}Our family...? They... why, Hades remains bound as yet! I had him bound... for all this time, and had intended on recapturing Persephone and Zagreus. What have I done...?" },
                                

							{ Cue = "/VO/Hades_0403",
								Emote = "PortraitEmoteFiredUp",
								Portrait = "Portrait_Hades_Chained_02",
								Source = "NPC_Hades_Story_01",
								PreLineWait = 0.2,
								Text = "My family...! Where are we...? Is this... my {#Emph}House? {#Prev}Father...! What is the meaning of all this?!" },

							{ 
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								Text = "{#Emph}Oh{#Prev}, Hades... perhaps the Princess can explain." },

                                { 
								Emote = "PortraitEmoteSurprise",
								Source = "NPC_Persephone_01",
								Portrait = "Portrait_Persephone_Queen_Joyful_01",
								PortraitExitAnimation = "Portrait_Persephone_Queen_Joyful_01_Exit",
								Text = "Melinoë...! You're alright! When you cast your incantation, we felt the drain on us immediately and quickly exhausted all of our magick. When were inundated with memories of another life, we feared the worst." },

							{ 
								PreLineWait = 0.35,
								Source = "NPC_Zagreus_01",
								Portrait = "Portrait_ZagPresent_Pained_01",
								Text = "This other life... I remember it... You, growing up with Grandfather... Does that mean... you chose to spare him?" },

                            							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Default_01",
								PreLineAnim = "Melinoe_Defiant", PreLineAnimTarget = "Hero",


								Text = "He stands before you now, does he not? I thought about what you said, and the king he used to be, and I could not let our family continue down that path." },


							{ 
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								PreLineWait = 0.35,
								SecretMusic = "/Music/MusicHadesReset2_MC",
								SecretMusicSection = 0,
								SecretMusicActiveStems = { "Guitar", },
								SecretMusicMutedStems = { "Drums", "Bass" },

								Text = "I beg you reconsider and give me {#Emph}death! {#Prev}Go on and send me to the blasted void, already! {#Emph}You{#Prev}, Son, or that witch, or {#Emph}you{#Prev}, Granddaughter, one of you! I have lost my wife, my kingdom, and now my family! You long for a world without me — it is {#Emph}yours! " },

							{ 
								Source = "NPC_Zagreus_01",
								Portrait = "Portrait_ZagPresent_Unwell_01",
								PreLineAnim = "Zagreus_KnockedDown_End", PreLineAnimTarget = 774442,
								Text = "Grandfather, no...! How could you say that after all we've been through together? You may have made mistakes, but you deserve a chance to make up for it, and be a part of our family properly." },

							{ 
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								ExitPortraitImmediately = true,
								PreLineAnim = "Enemy_Chronos_Knockdown_Frustrated", PreLineAnimTarget = 774365,

								-- SecretMusicActiveStems = { "Drums" },

								Text = "I {#Emph}took {#Prev}this place, Zagreus. And {#Emph}ruined {#Prev}it! You need not advocate for me again. You never knew my real self. Merely a... {#Emph}possibility{#Prev}, and nothing more. And you, Melinoë... to think I... put you through all this. Take your vengeance." },

							{
								UsePlayerSource = true,
								PreLineWait = 0.65,
								-- Emote = "PortraitEmoteFiredUp",
								Portrait = "Portrait_Mel_Intense_01",
								SecretMusic = "/Music/MusicPlayer/PersephoneThemeMusicPlayer",

								Text = "I have already forgiven you, Grandfather. This guilt is a greater punishment than any I would be willing to give. Our family's had enough for now. Who else recalls what happened? Memories, as vivid as any you hold dear, but of a separate life we might have lived...!" },

							{ Cue = "/VO/Persephone_0133",
								Source = "NPC_Persephone_01",
								Portrait = "Portrait_Persephone_Queen_Apprehensive_01",
								PortraitExitAnimation = "Portrait_Persephone_Queen_Apprehensive_01_Exit",
								PreLineAnim = "Persephone_Sitting_End", PreLineAnimTarget = 774443,
								Text = "I... I do. You were... insatiably curious as a child, and... sometimes too much even for me to handle, so... Zagreus, and Chronos, they... often helped take care of you." },

							{
								Portrait = "Portrait_Hades_Chained_02",
								Source = "NPC_Hades_Story_01",
								PreLineWait = 0.5,
								Text = "...I, too, remember now. That Father was with us, after a time-travelling version of Melinoë brought him to us. Yet all the while... I have been a prisoner. {#Emph}His {#Prev}prisoner, {#Emph}here {#Prev}in this time of ours..." },

							{ Cue = "/VO/HecateField_0431",
								Source = "NPC_Hecate_01",

								SecretMusic = "/Music/RemembranceScreenAmbience2",

								PreLineAnim = "Hecate_Hub_Affirm",
								PreLineAnimTarget = 774366, -- Hecate

								Text = "Queen Persephone, Lord Hades, do {#Emph}not {#Prev}believe these {#Emph}falsehoods {#Prev}coursing through your minds! Even your son and daughter seem susceptible. You {#Emph}all {#Prev}have been manipulated by the Titan's spell!" },

							{ Cue = "/VO/MelinoeField_5151",
								UsePlayerSource = true,
								PreLineWait = 0.5,
								Portrait = "Portrait_Mel_Intense_01",
								AngleId = 560366,
								AngleTowardTargetId = 774366,
								PreLineAnim = "Melinoe_Defiant", PreLineAnimTarget = "Hero",
								PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Mel_Vulnerable_01", WaitTime = 6.2 },

								Text = "Headmistress, that's not true! Don't you understand? The Dissolution of Time... this is how I manifested it. You always said the task was mine, as were the methods I employed. This was the path I chose." },

							{ Cue = "/VO/HecateField_0432",
								Source = "NPC_Hecate_01",
								Emote = "PortraitEmoteAnger",

								SecretMusic = "/Music/MusicHadesReset3_MC",
								SecretMusicSection = 0,
								SecretMusicActiveStems = { "Guitar", "Drums" },
								SecretMusicMutedStems = { "Bass" },

								PreLineAnim = "Hecate_Hub_Stern_Start",
								PreLineAnimTarget = 774366, -- Hecate
								PostLineAnim = "Hecate_Hub_Stern_End",
								PostLineAnimTarget = 774366, -- Hecate

								Text = "Then you failed! {#Emph}Death to Chronos {#Prev}was the task, yet {#Emph}there {#Prev}he is! Melinoë... what could possibly have compelled you to take such a course?" },

							{ Cue = "/VO/MelinoeField_5152",
								UsePlayerSource = true,
								Emote = "PortraitEmoteFiredUp",
								Portrait = "Portrait_Mel_Vulnerable_01",
								ExitPortraitImmediately = true,
								PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
								PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",

								SecretMusicMutedStems = { "Drums" },

								Text = "Your own teachings! To think for myself, not just... do as I'm told! But if you still believe destroying Chronos will make our problems go away... then what are you waiting for?" },

							{ Cue = "/VO/HecateField_0433",
								Source = "NPC_Hecate_01",
								PreLineWait = 1.0,
								PreLineAnim = "Hecate_Hub_Scoff",
								PreLineAnimTarget = 774366, -- Hecate
								ExitPortraitImmediately = true,

								EndSecretMusic = true,

								Text = "...I shall never forgive this Titan for what he has done... to this world, your family, you, or me." },

							{ 
								Source = "NPC_Persephone_01",
								PreLineWait = 0.85,
								Portrait = "Portrait_Persephone_Queen_Apprehensive_01",
								ExitPortraitImmediately = true,
								PreLineAnim = "Persephone_DismissQuick_Start",
								PreLineAnimTarget = 774443,
								SecretMusic = "/Music/MusicPlayer/Iris/EndThemeACOUSTICMusicPlayer",

								Text = "Dear Hecate... my handmaiden. I've never heard such pain in you. Whether you choose to forgive Chronos is a decision to be made solely at your discretion. We owe you a great debt for raising Melinoë." },

							{ Cue = "/VO/Hades_0406",
								Portrait = "Portrait_Hades_Chained_02",
								ExitPortraitImmediately = true,
								Source = "NPC_Hades_Story_01",
								PreLineWait = 0.35,

								Text = "...In our moment of peril, you were the only one we could count on, esteemed Witch of the Crossroads. For that and more, you have our gratitude. For all eternity." },
								
							{ Cue = "/VO/HecateField_0434",
								Portrait = "Portrait_Hec_Averted_01",
								Source = "NPC_Hecate_01",
								PreLineAnim = "HecateHubGreet",
								PreLineAnimTarget = 774366, -- Hecate

								ExitPortraitImmediately = true,
								PostLineFunctionName = _PLUGIN.guid..".BeginTimeCollapse",

								PreLineWait = 0.85,

								Text = "...I did no more than was my charge, O King and Queen. And I remain, as ever, at your service.... Well then, Melinoë... what now...?" },

							{ 
								Source = "NPC_Zagreus_01",
								Portrait = "Portrait_ZagPresent_Unwell_01",

								PreLineWait = 2.5,
                                SecretMusic = "/Music/MusicHadesReset3_MC",

								Text = "What was that? And what is going on? What are these strange fissures?" },

                            { 
								Source = "NPC_Hecate_01",
								PreLineWait = 1.0,
								PreLineAnim = "Hecate_Hub_Scoff",
								PreLineAnimTarget = 774366, -- Hecate
								

								Text = "...Time Rifts. I knew you were up to something, Chronos! Cease this infernal magick {#Emph} now!" },
                            { 
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- PostLineRemoveContextArt = true,
								Text = "They certainly carry the magick of time in them, but they are not my work. These rifts are unstable and destructive. I know not their origin." },
							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Default_01",
								AngleId = 560366,
								AngleTowardTargetId = 774365,
								PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
								PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",

								Text = "{#Emph} Dissolution of Time... {#Prev} I tore the veil of time asunder and rewove it, but the cut still occurred." },
{ 
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- PostLineRemoveContextArt = true,
                                
								Text = "...Time is malleable, yes, and tolerates stretching, twisting, bending and even stopping. It does not permit reversal. If you ripped through time without repairing it, it would continue in a path of destruction." },

							{ 
								Source = "NPC_Persephone_01",
								Portrait = "Portrait_Persephone_Queen_Apprehensive_01",
								PreLineWait = 0.5,
								Text = "Time is rebelling to destroy itself? Please tell me this situation is not as bad as it sounds." },
                            { 
								Source = "NPC_Hecate_01",
								PreLineAnim = "Hecate_Hub_Scoff",
								PreLineAnimTarget = 774366, -- Hecate
								

								Text = "If what the Titan claims is true, this is nothing less than a cataclysm. Left untreated, the destruction of Time would cause the destruction of all that is." },


							{ 
								Portrait = "Portrait_Hades_Chained_01",
								Source = "NPC_Hades_Story_01",
                                ExitPortraitImmediately = true,
								Text = "Then we must not let it remain untreated. Witch of the Crossroads, in your experience, is there anything we can do to prevent such an eventuality? Some incantation or enchantment that we can perform?" },
                            { 
								Source = "NPC_Hecate_01",
								PreLineWait = 0.25,

								Text = "I... Lord Hades, though my knowledge of magick is advanced, I know of no way to prevent the unmaking of Time, only ideas on how to survive it. Even that would only be available to Melinoë and myself." },
{ 
								Source = "NPC_Zagreus_01",
								Portrait = "Portrait_ZagPresent_Defiant_01",

								Text = "So that's it? The end of Time and everything else? There is truly nothing else we can do?" },

							{ 
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- PostLineRemoveContextArt = true,
								ExitPortraitImmediately = true,
								PreLineWait = 0.8,
								Text = "Perhaps nothing that you can do. But I am the Titan of Time. I can hold the fraying ends of Time together to prevent any more decay." },

							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Vulnerable_01",
								AngleId = 560366,
								AngleTowardTargetId = 774365,
								PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
								PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
								Text = "That power... you would have to give up your form... Grandfather, you've finally gained a family and you're already leaving it behind? Surely there is some other way that does not require us losing you!" },
							{ 
								Source = "NPC_Chronos_01",
								Portrait = "Portrait_Chronos_Confused_01",
								-- PostLineRemoveContextArt = true,
								ExitPortraitImmediately = true,
                                PostLineFunctionName = _PLUGIN.guid..".ChronosSacrifice",


								Text = "Though I did not truly know you long, Melinoë, you are a truly wonderful goddess. There are very few beings in the world who would have offered forgiveness after all that I have taken from you. Let me finally choose to be kind and repay you." },
							{ 
								UsePlayerSource = true,
								Portrait = "Portrait_Mel_Vulnerable_01",
								AngleId = 560366,
								AngleTowardTargetId = 774365,
                                PreLineWait = 1.2,
                                SecretMusic = "/Music/MusicPlayer/Iris/EndThemeACOUSTICMusicPlayer",
                                
								Text = "Grandfather...!" },
{ 
								UsePlayerSource = true,
                                PreLineWait = 0.8,
								Portrait = "Portrait_Mel_Vulnerable_01",
								AngleId = 560366,
								AngleTowardTargetId = 774365,
                                ExitPortraitImmediately = true,

								Text = "He's gone. I can feel it. He descended into the abyss of Time at the cost of his physical form." },
                                
                            { 
								Source = "NPC_Hades_Story_01",
								Portrait = "Portrait_Hades_Chained_02",
                                PreLineWait = 0.8,

								Text = "Father truly was capable of change in the end. It is a shame that it had to come at so high a cost." },

                                { 
								Source = "NPC_Hecate_01",
								ExitPortraitImmediately = true,

								Text = "Dry your eyes, Melinoë. Not all is lost yet. What was the first thing I taught you about our craft?" },
{ 
								UsePlayerSource = true,
                                PreLineWait = 0.8,
								Portrait = "Portrait_Mel_Vulnerable_01",
								AngleId = 560366,
								AngleTowardTargetId = 774366,
                                ExitPortraitImmediately = true,

								Text = "The biggest limits on our magick are self-imposed. {#Emph} Alter my thoughts{#Prev}. If no incantation for what I want exists, it is up to me to make it." },
                            
                                                            { 
								Source = "NPC_Hecate_01",
								PostLineFunctionName = "HadesOfficialDecree",
                                ExitPortraitImmediately = true,
								Text = "It would require a great deal of power and struggle, and perhaps a complete restructuring of the Fates' designs, but what is witchcraft for if not making our wills manifest? There is hope yet." },


							{ 
								Portrait = "Portrait_Persephone_Queen_01",
								Source = "NPC_Persephone_01",
								PreLineWait = 0.85,
								Text = "Then it is decided. Melinoë, you work on restoring Chronos. In the meantime, there is much to be done in restoring the House to its former glory." },
                            
							{ 
                                UsePlayerSource = true,
                                Portrait = "Portrait_Mel_Default_01",
								-- PostLineRemoveContextArt = true,
								ExitPortraitImmediately = true,
								PreLineWait = 0.8,
								Text = "To move forward... Yes. I long to see the House that I remember in my new memories. To the restoration of the House!" },

							EndFunctionName = _PLUGIN.guid..".DeathAreaRestorationPresentation",
							EndFunctionArgs =
							{
								Conversations =
								{
									"ZagreusTrueEnding01",
									"CerberusTrueEnding01",
									"PersephoneTrueEnding01",
									"AchillesTrueEnding01",
									"HadesTrueEnding01",
									"SeleneTrueEnding01",
								},
							},
						},
						-- the story continues in FamilyRescuePresentation & TrueEnding02
					},
				},
			},
}

function mod.SummonFamilyMembers( source, args )

	Destroy({ Id = ScreenAnchors.DialogueBackgroundId })

	SecretMusicPlayer( "/Music/EndThemeAcoustic" )
	wait( 0.3 )

	local zagreusId = 774442
	SetAlpha({ Id = zagreusId, Fraction = 1.0, Duration = 0.2 })
	SetAnimation({ DestinationId = zagreusId, Name = "Zagreus_KnockedDown_Start" })
	CreateAnimation({ DestinationId = zagreusId, Name = "ChronosTeleportFxFront" })	
	UseableOff({ Id = zagreusId })
	wait( 0.2 )
	thread( PlayVoiceLines, GlobalVoiceLines.FamilyEntranceVoiceLines )
    	thread( PlayVoiceLines, GlobalVoiceLines.FamilyUnfrozenVoiceLinesZag )


	local hadesId = 774441
	SetAlpha({ Id = hadesId, Fraction = 1.0, Duration = 0.2 })
	CreateAnimation({ DestinationId = hadesId, Name = "ChronosTeleportFxFront" })
	UseableOff({ Id = hadesId })
	wait( 0.3 )

	local persephoneId = 774443
	SetAlpha({ Id = persephoneId, Fraction = 1.0, Duration = 0.2 })
	SetAnimation({ DestinationId = persephoneId, Name = "Persephone_Sitting_Start" })
	CreateAnimation({ DestinationId = persephoneId, Name = "ChronosTeleportFxFront" })
	UseableOff({ Id = persephoneId })
	thread( PlayVoiceLines, GlobalVoiceLines.FamilyUnfrozenVoiceLines )

	wait( 5.3 )

	CreateDialogueBackground()
end

function mod.BeginTimeCollapse()
    wait( 1.2 )
    SessionMapState.StoryExpansionTimeCurrentlyBreaking = true
	ShakeScreen({ Speed = 800, Distance = 15, Duration = 0.5, FalloffSpeed = 1400, Angle = 90 })
    thread(mod.CreateTimeDistortions)
end

function mod.CreateTimeDistortions()
    while SessionMapState.StoryExpansionTimeCurrentlyBreaking do
        local offsetX = RandomInt(-750, 750)
        local offsetY = RandomInt(-750, 750)
        local angle = RandomInt(-180,180)
        local scale = RandomInt(1, 3)
        wait(0.25)
        CreateAnimation({Name = "ChronosRiftInteriorIn", DestinationId = 774365, OffsetX = offsetX, OffsetY = offsetY , Angle = angle, Scale = scale, PlaySpeed = 0.1})
                StopAnimation({Name = "ChronosRiftUnderglow", DestinationId = 774365, PreventChain = true})
        StopAnimation({Name = "ChronosRiftDisplacement", DestinationId = 774365, PreventChain = true})
        wait(1.5)
        StopAnimation({Name = "ChronosRiftInteriorIn", DestinationId = 774365, PreventChain = true})
        CreateAnimation({Name = "ChronosRippleExplosion", DestinationId = 774365, OffsetX = offsetX, OffsetY = offsetY , Angle = (angle+90), Scale = scale})
        StopAnimation({Name = "ChronosRippleExplosionDisplacement", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionDisplacement2", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionGlow", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionGlowDark", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionGlowSoftArc", DestinationId = 774365, PreventChain = true})
        wait(0.5)
    end
            StopAnimation({Name = "ChronosRiftInteriorIn", DestinationId = 774365, PreventChain = true})
        StopAnimation({Name = "ChronosRippleExplosionDisplacement", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionDisplacement2", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionGlow", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionGlowDark", DestinationId = 774365, PreventChain = true})
                StopAnimation({Name = "ChronosRippleExplosionGlowSoftArc", DestinationId = 774365, PreventChain = true})
end

function mod.ChronosSacrifice()
    SessionMapState.StoryExpansionTimeCurrentlyBreaking = nil
    	Destroy({ Id = ScreenAnchors.DialogueBackgroundId })
    SetAnimation({DestinationId = 774365, Name = "Enemy_Chronos_BattleOutro_End", })
    wait(5.3)
    
    Destroy({ Id = 774365 }) -- old chronos
    CreateDialogueBackground()
end

function mod.DeathAreaRestorationPresentation(source, args )

	args = args or {}

	-- StopSecretMusic()

	waitUnmodified( 0.5 )

	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })
	FullScreenFadeOutAnimation( "RoomTransitionIn_Right" )
	
	thread( mod.PlayDeathRestorationVoiceLines )
	--wait( 5.8 )
	wait( 5.3 )
	mod.DeathAreaRestorationIllustrationPresentation()

	StopSound({ Id = AudioState.AmbienceId, Duration = 0.5 })
	AudioState.AmbienceId = nil
	AudioState.AmbienceName = nil

	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 3.0, OffsetY = -500, Retarget = true })
	SetCameraClamp({ Ids = CurrentRun.CurrentRoom.RestoredCameraClamps, SoftClamp = CurrentRun.CurrentRoom.SoftClamp })
	waitUnmodified( 1.5 )

	Teleport({ Id = CurrentRun.Hero.ObjectId, DestinationId = 421154 })
	SetAnimation({ Name = "MelinoeIdle", DestinationId = CurrentRun.Hero.ObjectId })
	SetupMelWalk()

	-- teleport the characters
	local persephoneId = 774443
	SetAnimation({ DestinationId = persephoneId, Name = "Persephone_Idle" })
	-- Teleport({ Id = persephoneId, DestinationId = 800751 })
	Teleport({ Id = persephoneId, DestinationId = 800751 })
	UseableOn({ Id = persephoneId })
	SetInteractProperty({ DestinationId = persephoneId, Property = "OffsetX", Value = -10 })
	SetInteractProperty({ DestinationId = persephoneId, Property = "OffsetY", Value = 110 })
	SetInteractProperty({ DestinationId = persephoneId, Property = "Distance", Value = 120 })

	local zagreusId = 774442
	SetAnimation({ DestinationId = zagreusId, Name = "Zagreus_Idle" })
	SetGoalAngle ({ Id = zagreusId, Angle = 210, CompleteAngle = true })
	Teleport({ Id = zagreusId, DestinationId = 391547 })
	UseableOn({ Id = zagreusId })

	local hecateId = 774366
	Teleport({ Id = hecateId, DestinationId = 774445 })
	SetGoalAngle ({ Id = hecateId, Angle = 201, CompleteAngle = true })

	Destroy({ Id = 774441 }) -- chained hades

	ActivatePrePlaced( source,
	{
		Types = { "NPC_Selene_01", "NPC_Nyx_Story_01" },
	})

	CheckPriorityConversations( source, args ) -- activates the other NPCs

	AudioState.AmbienceId = PlaySound({ Name = "/Ambience/MusicExploration4AMBIENCEIris", Duration = 0.5 })
	SetAudioEffectState({ Name = "Reverb", Value = 1.75 })
	SetAudioEffectState({ Name = "GlobalEcho", Value = 0.1 })

	SessionMapState.BlockCodex = nil

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = 774444 })

	waitUnmodified( 2.0 )

	LockCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 4, Retarget = true })

	FullScreenFadeInAnimation( "RoomTransitionOut_Down" )
	thread( PlayVoiceLines, GlobalVoiceLines.TimeToGoVoiceLines )

	waitUnmodified( 2.0 )

end

function mod.DeathAreaRestorationIllustrationPresentation()
    	local illustrationId = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_Overlay", Animation = "StoryExpansionHouseRenovation", X = ScreenCenterX + 960, Y = ScreenCenterY, Alpha = 0.0 })

	PlaySound({ Name = "/SFX/Menu Sounds/AdminConstructionSound", Delay = 0.25 })
	AltAspectRatioFramesShow()
	FullScreenFadeInAnimation( "RoomTransitionOut_Right" )

	local loopingSoundId = PlaySound({ Name = "/Leftovers/Object Ambiences/ReconstructionAmbience" })

	SetAlpha({ Id = illustrationId, Fraction = 1.0, Duration = 0.01 })
	Shift({ Id = illustrationId, OffsetX = -1920, OffsetY = 0, Duration = 44.0, EaseIn = 0, EaseOut = 1.0 })
	waitUnmodified( 43.0 )

	StopSound({ Id = loopingSoundId, Duration = 0.4 })
	loopingSoundId = nil

	FullScreenFadeOutAnimation( "RoomTransitionIn_Down" )
	waitUnmodified( 0.5 )
	AltAspectRatioFramesHide()

	Destroy({ Id = illustrationId })

end

function mod.PlayDeathRestorationVoiceLines()
    PlayVoiceLines(GlobalVoiceLines.DeathAreaRestorationVoiceLines)
    wait(3.55)
    local narration1 = PlaySpeech({ Name = "/VO/Storyteller_0523", SubtitleColor = Color.NarratorVoice, UseSubtitles = true, Actor = nil })
    SetVolume({Id = narration1, Value = 0}) 
    wait(12.5)
    AudioState.ActiveSpeechIds[narration1] = nil
    print("pass 1")
    local narration2 = PlaySpeech({ Name = "/VO/Storyteller_0517", Queue = nil, SubtitleColor = Color.NarratorVoice, UseSubtitles = true, Actor = nil })
    SetVolume({Id = narration2, Value = 0})
        wait(10.5)
        print("pass 2")
            AudioState.ActiveSpeechIds[narration2] = nil

    local narration3 = PlaySpeech({ Name = "/VO/Storyteller_0524", Queue = nil, SubtitleColor = Color.NarratorVoice, UseSubtitles = true, Actor = nil })
    SetVolume({Id = narration3, Value = 0})
    print("pass 3")
     wait(4.7)
            AudioState.ActiveSpeechIds[narration3] = nil

    local narration4 = PlaySpeech({ Name = "/VO/Storyteller_0525", Queue = nil, SubtitleColor = Color.NarratorVoice, UseSubtitles = true, Actor = nil })
    SetVolume({Id = narration4, Value = 0})
    AudioState.ActiveSpeechIds[narration4] = nil
    print("pass 4")
end

GlobalVoiceLines.DeathAreaRestorationVoiceLines =
{
	{
		PreLineWait = 0.45,
		PlayOverTextLines = true,
		AllowTalkOverTextLines = true,
		Source = { LineHistoryName = "NPC_Hades_01", SubtitleColor = Color.HadesVoice },

		{ Cue = "/VO/Hades_0382", Text = "Then be so kind as to get these chains off me, so we can get to work!" },
	},
	--[[{
		PreLineWait = 3.55,
		Source = { LineHistoryName = "Speaker_Homer", SubtitleColor = Color.NarratorVoice, SpeechParams = {Chipmunk = 0.33} },

		{ Cue = "/VO/Storyteller_0523", Text = "{#Emph}And so, the Princess of the Dead remained in the House of Hades with her rescued family members, to aid in the recovery of however much was not forever lost.", TextLimit = 300, NoTarget = false },
		{ Cue = "/VO/Storyteller_0517", PreLineWait = 1.25, Text = "{#Emph}The rightful Underworld King and Queen were swift to organize this relatively painless task, and Shades of the Dead still loyal to their cause answered the call.", TextLimit = 300, NoTarget = false },
		{ Cue = "/VO/Storyteller_0524",PreLineWait = 1.25, Text = "{#Emph}They all picked up many pieces of the past...", NoTarget = false },
		{Cue = "/VO/Storyteller_0525",  PreLineWait = 1.25, Text = "{#Emph}...and soon, the House grew more like how it used to be. But then, a summons from Olympus arrived, and the Princess knew her stay had reached its end...", TextLimit = 300, NoTarget = false },
	},]]
}


EnemyData.NPC_Zagreus_01.InteractTextLineSets = {
    ZagreusTrueEnding01 =
			{
                Name = "ZagreusTrueEnding01",
				PlayOnce = true,
				UseableOffSource = true,
				SkipContextArt = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.ZagreusEndingGreeting,

				{ Cue = "/VO/Zagreus_0085",
					-- Portrait = "Portrait_Zag_Empathetic_01",
					-- Portrait = "Portrait_Zag_Serious_01",
					PreLineAnim = "Zagreus_Talk_Start",
					AngleTowardHero = true,
					Text = "Well, I think we can fix up the rest of this place on our own. Thank you for all your help. Especially the part where you liberated us from our temporal prisons and whatnot!" },

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Casual_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Believe me, I had nothing better to do! Anyhow, you know that you are always welcome at the Crossroads. I expect you to visit from time to time." },

				{ 
					Portrait = "Portrait_ZagPresent_Empathetic_01",
					Text = "I'll definitely be visiting. I can't leave behind all the friends I made there, or my little sister. Speaking of, have you made any progress on the incantation to save Grandfather?" },

				{ UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Empathetic_01",
                    ExitPortraitImmediately = true,
					Text = "I've got a strong base for it, but I can't figure out a few of the required reagents. I fear I need more experience to discover it." },
                {
					PostLineThreadedFunctionName = "DisplayInfoToast",
					PostLineFunctionArgs = { Duration = 2, Title = "WorldUpgradeAdded", Text = "StoryExpansionWorldUpgradeSaveChronos" },
				},
				{ 
					-- Portrait = "Portrait_Zag_Serious_01",
                    PreLineWait = 2,
					Text = "I'm sure you'll work it out. Besides, we have plenty of things of things to occupy ourselves with in the meantime. Hypnos still sleeps, the Underworld is still in disarray, and many members of the House are still missing." },

				{ UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Proud_01",
                    PostLineFunctionName = "DeathAreaRestoredUpdateHallwayBlocks",
					PostLineThreadedFunctionName = "HugZagreus",
					PostLineThreadedFunctionArgs = { Silent = true },
					Text = "We'll find solutions. We make a great team, both in this life and in our alternate lives. Right now, I'd simply settle for a calmer one. Look after yourself until we meet again, Brother." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.1,
						ObjectType = "NPC_Zagreus_01",
						PreLineFunctionName = "RestoreAchillesInteraction",
						{ Cue = "/VO/Zagreus_0087", Text = "I will. You take care, too." },
					},
				},
			},
}

EnemyData.NPC_Achilles_01.InteractTextLineSets = {
    			AchillesTrueEnding01 =
			{
                Name = "AchillesTrueEnding01",
				PlayOnce = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				SkipContextArt = true,
				StatusAnimation = false, -- played via script
				OnQueuedThreadedFunctionName = "BlockAchillesInteraction",
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.AchillesEndingGreeting,

				{ 
					-- PreLineAnim = "Demeter_Scoff",
					-- PreLineAnim = "Demeter_Moved",
					Text = "Heading out? Olympus doesn't like to be kept waiting, I know. We all wish that you could stay here in the House, with us." },

				{ 
					Portrait = "Portrait_Mel_Pleased_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					Text = "And I would love to stay here with you, Sir Achilles. But there is work to be done, and I can't leave the home and friends I've made at the Crossroads. You're always welcome to visit." },

				{ 
                    PostLineFunctionName = "DeathAreaRestoredUpdateHallwayBlocks",
					Text = "You would hunt me down if I did not. Beside, you are just as much a member of the House without living here. It is therefore my duty to guard you, and Hypnos. I shall await for whenever we may meet again." },


				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,

						{ Cue = "/VO/MelinoeField_5164", Text = "As shall I." },
					},
				},
			},

}

EnemyData.NPC_Hades_02.InteractTextLineSets.HadesTrueEnding01 = {
	Name = "HadesTrueEnding01",			
    PlayOnce = true,
				UseableOffSource = true,
				UseText = "UseNPC",
				StatusAnimation = false, -- played via script
				InitialGiftableOffSource = true,
				PreBlockSpecialInteract = true,
				GiftableOffSource = true,
				SkipContextArt = true,
				OnQueuedFunctionName = "OverwriteSelf",
				OnQueuedFunctionArgs =
				{
					AllowSpecialInteractInPartnerConversation = true,
					BlockChatting = true,
				},


				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Default_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Father? You seem troubled. Tell me what is on your mind so I may take some of the burden." },
				
                    {
					Text = "Through all of our searching and repair of the Underworld, we still have found no trace of the Fates or the missing denizens of the House. With Father gone, we have no way of narrowing down the search." },

                    { UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",

					Text = "That is worrying, but I hypothesize that we should be able to find them. I believe that the Fated List may provide us some guidance as to the location of the Fates. As for the rest of the House, if our current methods are not providing results, then we may need to change them." },

				{ 
					Text = "We may be doomed to live forever... but we need not be bound to our old ways. You have shown us all that we are capable of growth and change, daughter, and that is a lesson we must not forget." },
						
				{ Cue = "/VO/MelinoeField_5168", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Mel_Empathetic_01", WaitTime = 2.1 },

					Text = "Indeed. {#Emph}Erm{#Prev}, Father...? Thank you for all your hospitality. It gladdens me to see you doing well." },

				{ 
					PreLineAnim = "Hades_Unchained_Hello",
					Portrait = "Portrait_LordHades_Averted_01",
					Text = "I would not be if not for you, Daughter. I trust that we shall see each other again soon. " },

				{ UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					PostLineFunctionName = "DeathAreaRestoredUpdateHallwayBlocks",
					Text = "Yes, well... Father, I wish you the best with the ongoing Underworld renovations. Though I cannot stay, my chariot is here." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						ObjectType = "NPC_Hades_02",

						{ Cue = "/VO/Hades_0251", Text = "Shadows conceal you." },
					},
				},
}

EnemyData.NPC_Selene_01.InteractTextLineSets.SeleneTrueEnding01 = {
        Name = "SeleneTrueEnding01",				
    PlayOnce = true,
				UseableOffSource = true,
				SkipContextArt = true,
				Partner = "NPC_Nyx_Story_01",
				UseText = "UseListenNPC",
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				StatusAnimation = false,
				InteractDistance = 350,

				GameStateRequirements =
				{
					{
						PathFalse = { "CurrentRun", "Hero", "IsDead" }
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.SeleneTrueEndingGreeting,
				OnQueuedThreadedFunctionName = "CenterInteractRange",
				
				PreEventFunctionName = "OverwriteSelf",
				PreEventFunctionArgs =
				{
					BlockChatting = true,
				},

				{ Cue = "/VO/Nyx_0032",
					Source = "NPC_Nyx_Story_01",
					PreLineFunctionName = "SetupEndSceneZoom",
					PreLineWait = 0.35,
					PreLineAnim = "Nyx_Greeting",
					PreLineAnimTarget = 774446,
					Text = "...My faithful Eye of Night, my child, thank you for ensuring that our realm remains secure, and keeping watch above it all. I never doubted that I could count on you." },

				{ Cue = "/VO/Selene_0372",
					Text = "But Mother, had our watch been more dependable, then none of this would have transpired..." },

				{ Cue = "/VO/Nyx_0122",
					Source = "NPC_Nyx_Story_01",
					Text = "Trying times shall always come about, testing our resolve. Thus we grow strong, as do the bonds we share. Even now, I sense the powerful connection between you and the Princess of the Underworld." },

				{ UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Proud_01",
					Text = "It was my honor to work with Sister Selene, O Nyx. She has always been my guiding light. I'm just pleased that I allowed you to reunite." },

				{ Cue = "/VO/Nyx_0123",
					Source = "NPC_Nyx_Story_01",
					Text = "A reunion you made possible, with Hecate and the Unseen. Your services shall be remembered, O Melinoë, Princess. Now go... for there are more reunions to be had." },

				{ Cue = "/VO/Selene_0373",
					PortraitExitAnimation = "Portrait_Selene_InPerson_01_Exit",
					-- PostLineRemoveContextArt = true,
					-- PostLineFunctionName = "NyxFarewellPresentation",
					Text = "Thank you, Mother, and farewell for now." },

				--[[
				{ Cue = "/VO/Nyx_0032",
					Source = "NPC_Nyx_Story_01",
					PreLineFunctionName = "SetupEndSceneZoom",
					PreLineWait = 0.35,
					PreLineAnim = "Nyx_Greeting",
					PreLineAnimTarget = 774446,
					Text = "...My faithful Eye of Night, my child, thank you for ensuring that our realm remains secure, and keeping watch above it all. I never doubted that I could count on you." },

				{ Cue = "/VO/Selene_0372",
					Text = "But Mother, had our watch been more dependable, then none of this would have transpired... I failed you, yet you praise me?" },

				{ Cue = "/VO/Nyx_0033",
					Source = "NPC_Nyx_Story_01",
					Text = "Trying times shall always come about. Now go, and whenever you ride through the dark of the sky, remember I am always there." },

				{ Cue = "/VO/Selene_0373",
					PortraitExitAnimation = "Portrait_Selene_InPerson_01_Exit",
					PostLineRemoveContextArt = true,
					PostLineFunctionName = "NyxFarewellPresentation",
					Text = "Thank you, Mother, and farewell for now." },
					]]--

				{ Cue = "/VO/MelinoeField_5171",
					UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PortraitExitAnimation = "Portrait_Mel_Proud_01_Exit",
					PostLineFunctionName = _PLUGIN.guid .. ".EnsembleRidersEnterPresentation",
					Text = "I must say, I did not expect that we could ever draw you down this far, Sister Selene. I thought perhaps not even Headmistress could in all her experience!" },

				{ Cue = "/VO/Selene_0374",
					PreLineThreadedFunctionName = "EnsembleFamilyEnterPresentation",
					Text = "If you are ready, little star, then let us go, lest we outstay our greetings and farewells. I am honored to have seen these halls, and to return to shadow with you on this night in victory, not haste." },

				{ 
					Source = "NPC_Hecate_01",
					Text = "Come, Melinoë, for all the reasons that Selene says. It's a long ride back to the Crossroads." },

				{ Cue = "/VO/MelinoeField_3903",
					UsePlayerSource = true,
					Portrait = "Portrait_Mel_Pleased_01",
					Text = "{#Emph}<Sigh> {#Prev}Then let's be off. If only Artemis were here, this could have been a proper Silver Sisters reunion, couldn't it?" },
				EndVoiceLines =
				{
					{
						ObjectType = "NPC_Selene_01",
						PreLineThreadedFunctionName = "ChariotDeparturePresentation",

						{ Cue = "/VO/Selene_0377", Text = "Then let us ride into the dark above." },
						{ Cue = "/VO/Selene_0378", Text = "...And do be careful to hold on as we depart.", PreLineWait = 0.8 },
					},
					{
						PreLineWait = 0.8,
						ObjectType = "NPC_Nyx_Story_01",
						PreLineAnim = "Nyx_Greeting",

						{ Cue = "/VO/Nyx_0034", Text = "Farewell." },
					},
					{
						PreLineWait = 0.5,
						ObjectType = "NPC_Persephone_01",
						PreLineAnim = "Persephone_Greet_Start",

						{ Cue = "/VO/Persephone_0013", Text = "Farewell!!" },
					},
					{
						PreLineWait = 0.3,
						ObjectType = "NPC_Zagreus_01",
						PreLineAnim = "Zagreus_Greet",

						{ Cue = "/VO/Zagreus_0088", Text = "Goodbye!" },
					},
					{
						PreLineWait = 0.3,
						ObjectType = "NPC_Hades_02",
						PreLineAnim = "Hades_Unchained_Hello",
						PostLineFunctionName = "DeathAreaRestoredToCreditsPresentation",

						{ Cue = "/VO/Hades_0214_C", Text = "Goodbye, Daughter." },
					}
				},

}

EnemyData.NPC_Persephone_01.InteractTextLineSets.PersephoneTrueEnding01 = 
    {
        Name = "PersephoneTrueEnding01",
				PlayOnce = true,
				UseableOffSource = true,
				-- Partner = "NPC_Chronos_02",
				Partner = "NPC_Hecate_Story_01",
				SkipContextArt = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				-- StatusAnimation = false, -- played via script
				OnQueuedFunctionName = "OverwriteSelf",
				OnQueuedFunctionArgs =
				{
					AllowSpecialInteractInPartnerConversation = true,
					BlockChatting = true,
				},

				{ Cue = "/VO/Persephone_0137",
					PreLineThreadedFunctionName = "HugPersephone",
					PreLineThreadedFunctionArgs = { Silent = true },
					Portrait = "Portrait_Persephone_Queen_01",
                    					Emote = "PortraitEmoteCheerful",
					-- Portrait = "Portrait_Persephone_Queen_FiredUp_01",
					-- Portrait = "Portrait_Persephone_Queen_Calculating_01",
					-- Portrait = "Portrait_Persephone_Queen_Joyful_01",
					-- PreLineAnim = "Persephone_Greet_Start",
					-- PostLineAnim = "Persephone_Greet_End",
					-- PreLineAnim = "Persephone_DismissA_Start",
					-- PostLineAnim = "Persephone_DismissB_End",

					Text = "My beautiful daughter... we were just talking about you! How you were as a child, both in this life and the other. Growing up is so difficult... and you had to do it twice." },

				{ Cue = "/VO/MelinoeField_5157",
					UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Empathetic_01",
					Text = "Which makes me beyond fortunate. Hecate was the best caretaker I can imagine. And I'm so grateful to have experienced a life with you, Mother... where there was so much warmth. And now you've met this other side of me." },

				{ 
					Portrait = "Portrait_Persephone_Queen_01",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Persephone_Queen_Calculating_01", WaitTime = 4.1 },

					Text = "And I've enjoted getting to know this other side of you even better. And, Hecate...? You're certain it's no burden to you... to continue looking after her, just in case?" },

				{ Cue = "/VO/HecateField_0435",
					Source = "NPC_Hecate_01",
					PreLineAnim = "HecateHubGreet",
					-- PreLineAnimTarget = 774458, -- Chronos
					PreLineAnimTarget = 774366, -- Hecate
					Text = "I swore to you that no harm shall come to your daughter, O Queen, and that vow remains. And I shall always care for her, whether she resides with me or not." },

				{ Cue = "/VO/Persephone_0139",
					Portrait = "Portrait_Persephone_Queen_01",
					PreLineAnim = "Persephone_Greet_Full",
					Text = "Then it's settled...! And, Melinoë... for what it's worth... I likewise opted not to live at home when I was in my youth!" },

				{
					Source = "NPC_Hecate_01",
					PreLineAnim = "Hecate_Hub_Scoff",
					-- PreLineAnimTarget = 774458, -- Chronos
					PreLineAnimTarget = 774366, -- Hecate
					Text = "Please reconsider this, Melinoë... you cannot be serious about returning to that dusty glade. Your rightful home is here, with the family and House you've worked so hard to restore. To serve the Unseen..." },

				{ Cue = "/VO/MelinoeField_5158",
					UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "...is to serve in shadow. I know full well, Headmistress, and do not make this decision lightly, but... I can't leave the Crossroads. Especially when we've so much left to do." },

				{ 
					Portrait = "Portrait_Persephone_Queen_01",

					Text = "You are always welcome back here, should you desire to return. But this new venture of yours... I'm not sure I quite understand it." },

				{ 
					UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "While Chronos may have stopped the destruction of Time, it appears he was not able to repair the tears already made. I plan to slip into these, into a time where I was not able to subdue Chronos and Typhon, correcting these possibilities and closing the rifts. I was born for this role." },

				{ 
					Portrait = "Portrait_Persephone_Queen_01",
					PreLineAnim = "Persephone_DismissA_Start",
					PostLineAnim = "Persephone_DismissB_End",

					Text = "You were born for much more. But the House will support you in this endeavour and I'm sure Olympus will too. As for your brother, well... he always turns up!" },

				{ 
					UsePlayerSource = true,
					-- Portrait = "Portrait_Mel_Pleased_01",
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",

					Text = "I have to do this. It was my reckless use of magick that caused Time to shred in the first place." },
				{ 
					Portrait = "Portrait_Persephone_Queen_01",
					PreLineAnim = "Persephone_DismissA_Start",
					PostLineAnim = "Persephone_DismissB_End",
                    ExitPortraitImmediately = true,

					Text = "Melinoë, what happened is {#Emph} not {#Prev} your fault. We all agreed to your plan and by working on your incantation to free Chronos, you've done more than anyone else as repentance." },
				{ 
					UsePlayerSource = true,
					-- Portrait = "Portrait_Mel_Pleased_01",
					Portrait = "Portrait_Mel_Vulnerable_01",
                    PreLineWait = .45,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",

					Text = "Thank you, Mother. But if there is even a chance of rescuing Grandfather this way, I need to attempt it. All this is going to be an adjustment, though, isn't it? Even if I'll see you all again soon." },



				{ Cue = "/VO/Persephone_0142",
					Emote = "PortraitEmoteCheerful",
					Portrait = "Portrait_Persephone_Queen_Joyful_01",
					PostLineFunctionName = "DeathAreaRestoredUpdateHallwayBlocks",

					Text = "{#Emph}Ah, hahaha! {#Prev}An adjustment is putting it mildly. Now go make your rounds, and I'll see you off before you depart. I love you, baby girl." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_5161", Text = "I love you too, Mother." },
					},
				},
}

function mod.EnsembleRidersEnterPresentation( source )

	local hecateId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Hecate_Story_01" })
	local hecate = ActiveEnemies[hecateId]
	if hecate ~= nil then
		Destroy({ Id = hecate.ChatBubbleId })
	end


	SetGoalAngle({ Id = hecateId, Angle = 160 })

	SetAnimation({ DestinationId = ScreenAnchors.DialogueBackgroundId, Name = "DialogueBackgroundOut" })

	waitUnmodified( 0.1 )
	Destroy({ Id = ScreenAnchors.DialogueBackgroundId })

	-- teleport in Hecate
	SetAlpha({ Id = hecateId, Fraction = 0.0, Duration = 0.35 })

	wait( 0.5, RoomThreadName )
	SecretMusicPlayer( "/Music/ArtemisTheme_MC" )

	Teleport({ Id = hecateId, DestinationId = 555692 })
	SetAnimation({ Name = "HecateHubGreet", DestinationId = hecateId })
	CreateAnimation({ Name = "HecateTeleportFxFront", DestinationId = hecateId, Group = "FX_Standing_Add" })
	SetAlpha({ Id = hecateId, Fraction = 1.0, Duration = 0.2 })
 
	wait( 1.0, RoomThreadName )
end

EncounterData.Story_EndCredits.StartRoomUnthreadedEvents =
		{
			{
				FunctionName = "GenericPresentation",
				Args =
				{
					LoadVoiceBanks = { "Artemis", "Apollo", "Selene" },
					LoadPackages = { "Artemis", "Hecate","Apollo", "Selene" },
				},
			},
			{
				FunctionName = "SetupEndingCredits",
			},
		}

EncounterData.Story_EndCredits.UnthreadedEvents =
		{
			{
				FunctionName = "SurpriseNPCPresentation",
				Args =
				{
					IntroWait = 1.5,
					SourceId = 780625,
					SkipPan = true,
					SkipAngleTowardTarget = true,
					SkipCameraLock = true,
					TextLineSet =
					{
						TrueEndingFinale01 =
						{
                            Name = "TrueEndingFinale01",
							PlayOnce = true,
							UseableOffSource = true,
							SkipContextArt = true,

							{ UsePlayerSource = true,
							PreLineWait = 0.25,
								Text = "Is this the view you see every night, Sister Selene? It's beautiful." },

							{ 
								Source = "NPC_Selene_01",
								Portrait = "Portrait_Selene_InPerson_01",
								PortraitExitAnimation = "Portrait_Selene_InPerson_01_Exit",
									Text = "...I suppose I have grown used to it, doing this journey every night. I find the company on this trip far more charming then the sky." },
							
									{ UsePlayerSource = true,
									PreLineWait = 0.35,
									Portrait = "Portrait_Mel_Vulnerable_01",
									PortraitExitAnimation = "Portrait_Mel_Vulnerable_01_Exit",
								Text = "Thank you for your support... both of you. I would not have been able to achieve any of this without you. Especially you, Headmistress. It is thanks to your teachings that I was able to reunite with my family." },

							{
								Source = "NPC_Hecate_Story_01",
								Portrait = "Portrait_Hec_Default_01",
								PreLineWait = 0.75,
								PortraitExitAnimation = "Portrait_Hec_Default_01_Exit",
								PostLineFunctionName = _PLUGIN.guid..".TwinsEntrancePresentation",
								Text = "I have no doubt you would have achieved your aims with or without my aid, Melinoë. It does no good to dwell on hypotheticals. Let us instead celebrate our victory and this beautiful night.",
							},

							-- Twins Enter
							{ Cue = "/VO/MelinoeField_3907", UsePlayerSource = true,
								PreLineWait = 0.5,
								Portrait = "Portrait_Mel_Pleased_01",
								Text = "Lord Apollo! And Lady Artemis!" },

							{ 
								Source = "NPC_Apollo_Story_01",
								Portrait = "Portrait_Apollo_InPerson_01",
								Text = "It's a beautiful night, Lady Selene! And {#Emph}you {#Prev}must be the esteemed Witch of the Crossroads! You've trained my cousin very well indeed, to have brought down Typhon and redeemed Chronos with nary a scratch!" },

							{ 
								Source = "NPC_Artemis_01",
								Text = "Fine, Apollo, I was incorrect for once, no need to boast. Melinoë, I may have wagered that you'd cut the Titan to ribbons sooner than forgive him." },

							{  UsePlayerSource = true,
								Portrait = "Portrait_Mel_Proud_01",
								PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteSurprise", Portrait = "Portrait_Mel_Hesitant_01", WaitTime = 6.5 },
								Text = "I know it's unimaginable, but I truly believe that he has changed. And I intend to prove it to you, and the rest of Olympus. Speaking of, why are you here... rather than celebrating at your House?" },

							{
								PostLineFunctionName = "CreditsSecretMusicOff",
								Source = "NPC_Apollo_Story_01",
								Portrait = "Portrait_Apollo_InPerson_01",
								Text = "Well we consider it a Palace, but we thought we'd take some of the celebration to you! Besides, we've been appointed to escort you to the Crossroads as a symbol of our family's unity, and come bearing a gift. Shall we be off?" },

							EndVoiceLines =
							{
								{
									PreLineWait = 1.1,
									PlayOverTextLines = true,
									AllowTalkOverTextLines = true,
									Source = { LineHistoryName = "NPC_Selene_01", SubtitleColor = Color.SeleneVoice },

									{ Cue = "/VO/Selene_0381", Text = "We ride." },
								},
								{
									PreLineWait = 0.4,
									PlayOverTextLines = true,
									AllowTalkOverTextLines = true,
									Source = { LineHistoryName = "NPC_Artemis_01", SubtitleColor = Color.ArtemisVoice },

									{ Cue = "/VO/Artemis_0384", Text = "Here we go." },
								},
							},
						},
					},
				},
				GameStateRequirements =
				{
					{
						PathFalse = { "SessionMapState", "SkipCreditsPreamble" },
					},
				},
			},
			{
				FunctionName = "EndingCreditsPresentation",
				Args =
				{
					CameraPanId = 780638,
					CameraZoom = 0.75,
					ChariotId = 780625,
				},
			},
		}
    

function mod.TwinsEntrancePresentation( source )

	waitUnmodified( 0.1 )
	SetAnimation({ DestinationId = ScreenAnchors.DialogueBackgroundId, Name = "DialogueBackgroundOut" })
	waitUnmodified( 0.1 )	
	Destroy({ Id = ScreenAnchors.DialogueBackgroundId })
	thread( PlayVoiceLines, GlobalVoiceLines.ChronosExitReactionVoiceLines )
	wait(0.5)

	local notifyName = "ChariotAnimationComplete"
	NotifyOnAnimationTimeRemaining({ Id = source.ObjectId, Animation = "Horse_FlyingIdle_Chronos_Idle", Remaining = 0.032, Notify = notifyName, Timeout = 10 })
	waitUntil( notifyName )

	SetAnimation({ Name = "Horse_FlyingIdle_Twins_In", DestinationId = source.ObjectId })
	PlayVoiceLines( GlobalVoiceLines.TwinsEntranceVoiceLines )

	waitUnmodified( 4, RoomThreadName )

	waitUnmodified( 0.5 )
	CreateDialogueBackground()

end

HeroVoiceLines.StoryExpansionCorrectedNextStopPostTrueEndingVoiceLines = {
		{
			PreLineWait = 0.85,
			TriggerCooldowns = { Name = "MelinoeAnyQuipSpeech" },

			{ Cue = "/VO/Melinoe_5741", Text = "Only question is where to begin.",},
			-- { Cue = "/VO/Melinoe_5672", Text = "Grandfather should be somewhere up ahead..." },
			-- { Cue = "/VO/Melinoe_5671", Text = "Let's see how this goes...", PreLineWait = 1.0 },
		},
	}

for i, entry in ipairs(HubRoomData.Hub_PreRun.ThreadedEvents) do
	if entry.FunctionName == "PreRunCameraPresentation" and entry.Args and entry.Args.PanVoiceLines then
entry.Args.PanVoiceLines = HeroVoiceLines.StoryExpansionCorrectedNextStopPostTrueEndingVoiceLines
	end
end
