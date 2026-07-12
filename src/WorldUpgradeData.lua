ResourceData.HadesSpearPoints.RevealGameStateRequirements = 
{
	{
				PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting09" },
			},
}

ResourceData.HadesSpearPoints.CostRevealRequirements = 
{
	{
				PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting09" },
			},
}

ResourceData.MixerMythic.CostRevealRequirements = 
{
	{
				PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting09" },
			},
}

ResourceData.MixerMythic.CostRevealRequirements = 
{
	{
				PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting09" },
			},
}

WorldUpgradeData.WorldUpgradeStormStop.Cost = {
    MixerIBoss = 2,
	MixerQBoss = 9,
	HadesSpearPoints = 1,
}

WorldUpgradeData.WorldUpgradeTimeStop.Cost = {
    MixerIBoss = 7,
	MixerMythic = 1,
}

--TODO: Need to include new HelpText for CharEurydice, Orpheus, food etc.

Incantations.addIncantation({
    Id = "StoryExpansionWorldUpgradeUnlockEurydice",
    Name = {
        en = "Calling to a Muse"
    },
    Description = {
        en = "Send out a beacon targeted at Orpheus's muse, Eurydice. May she be welcomed at the Crossroads, if she is capable of taking up the invitation."
    },
    FlavorText = {
        en = "Not being able to look back at your love is perhaps the greatest tragedy of all."
    },
    WorldUpgradeData = {
        AlwaysRevealImmediately = true,
        Icon = "ReadEmAndWeep-Story_ExpansionGUI\\CauldronItems\\cauldron_eurydiceunlock",
		Cost =
		{
			GiftPoints = 2,
            PlantHWheat = 2,
			MixerFBoss = 1,
		},
        GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_OrpheusUnlocksEurydice02" },
			},
    },
    IncantationVoiceLines =
		{
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_1080", Text = "{#Emph}Hear me, O Shades, on my authority: \n {#Emph}Give my demand all due priority." },
			},
		},
        RevealReactionVoiceLines = {
            { GlobalVoiceLines = "CauldronReactionVoiceLines" },
        },

    }
})
Incantations.addIncantation({
    Id = "StoryExpansionWorldUpgradeUpgradeEurydice",
    Name = {
        en = "Demand for Quality Ingredients"
    },
    Description = {
        en = "Transform some of the ingredients for Eurydice's meals into premium versions of themselves, so that she has a chance to create dishes of increased quality."
    },
    FlavorText = {
        en = "Food is only as good as the ingredients that go into it, though love and skill certainly help."
    },
    WorldUpgradeData = {
        AlwaysRevealImmediately = true,
        Icon = "ReadEmAndWeep-Story_ExpansionGUI\\CauldronItems\\cauldron_eurydiceimprove",
		Cost =
		{
			MixerOBoss = 3,
            Mixer5Common = 4,
			SuperGiftPoints = 5,
		},
        GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "StoryExpansion_EurydiceUnlocksEurydiceImprove" },
			},
            {
                PathTrue = { "GameState", "WorldUpgradesAdded", "StoryExpansionWorldUpgradeUnlockEurydice" },
            }
    },
    IncantationVoiceLines =
		{
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_1080", Text = "{#Emph}Hear me, O Shades, on my authority: \n {#Emph}Give my demand all due priority." },
			},
		},
        RevealReactionVoiceLines = {
            { GlobalVoiceLines = "CauldronReactionVoiceLines" },
        },
    OnActivateFinishedFunctionName = _PLUGIN.guid .. ".RandomiseFoodRarityFromCommon"
    }
})
Incantations.addIncantation({
    Id = "StoryExpansionWorldUpgradeSisyphusUpgrade",
    Name = {
        en = "Yielding Blood from a Stone"
    },
    Description = {
        en = "Enhance your relationship with Sisyphus, so that he may also offer you a {$Keywords.RunReward} when you run into him."
    },
    FlavorText = {
        en = "There is much to learn from being out in the world, but much more to learn from reflecting on yourself."
    },
    WorldUpgradeData = {
        AlwaysRevealImmediately = true,
        Icon = "ReadEmAndWeep-Story_ExpansionGUI\\CauldronItems\\cauldron_eurydiceunlock",
        --PLACEHOLDER icon
		Cost =
		{
			SuperGiftPoints= 3,
            OreIMarble = 8,
			MixerGBoss = 2,
		},
        GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "Placeholder" },
			},
    },
    IncantationVoiceLines =
		{
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_1080", Text = "{#Emph}Hear me, O Shades, on my authority: \n {#Emph}Give my demand all due priority." },
			},
		},
        RevealReactionVoiceLines = {
            { GlobalVoiceLines = "CauldronReactionVoiceLines" },
        },

    }
})
Incantations.addIncantation({
    Id = "StoryExpansionWorldUpgradeMegInbetweenRegions",
    --TODO: Set this to reset with story resetting
    Name = {
        en = "Preparing for a Fury's Oath"
    },
    Description = {
        en = "Allow Megaera to occasionally appear in the space at the start of an Underworld {$Keywords.Biome}, offering an oath you can swear to empower you."
    },
    FlavorText = {
        en = "When we do not stand by our word, we fall and are punished."
    },
    WorldUpgradeData = {
        AlwaysRevealImmediately = true,
        Icon = "ReadEmAndWeep-Story_ExpansionGUI\\CauldronItems\\cauldron_eurydiceunlock",
        --PLACEHOLDER icon
		Cost =
		{
			GiftPoints = 3,
		},
        GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "Placeholder" },
			},
    },
    IncantationVoiceLines =
		{
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_1080", Text = "{#Emph}Hear me, O Shades, on my authority: \n {#Emph}Give my demand all due priority." },
			},
		},
        RevealReactionVoiceLines = {
            { GlobalVoiceLines = "CauldronReactionVoiceLines" },
        },

    }
})

--TODO: Update Unlock Requirements for the two upgrades

--[[Incantations to add
    - Meg appearing mid run (resets)
    - Allow Zag to visit the surface (reset)
    - Lower time for growth from Persephone (does not reset)
    - Meg find Fury Sisters incantation (resets)
    - Summon Eurydice
    - Eurydice food quality
    - Enable Theseus and Minotaur (sending out a signal to allied shades)
    - A new ambrosia alternative that involves you actually making something in alchemy (like a cake! Or Ambrosial Apple Pie) for new relationship levels (???)
    - How does the game handle new relationship levels after uninstall?
    
    - Freeing of Time
        - Fates' String (Plotline with Zagreus, Persephone and Hades? Moros should be involved if it's to do with fate)
            - Maybe this is the helping mortals plotline
            - Maybe just latch this onto the Fates plotline
        - Empowered Omphalos (Plotline involving collecting stones of each of the gods in shops, link to each of the gods as a story?)
        - Purified Fleece (Plotline exploring the witching aspect of the game, with Hecate, Selene, Medea and Circe? Maybe throw in some of the other witchy characters?)
        - Divine Inspiration (Plotline related to restoring Orpheus's inspiration?)

        - After doing it will require you complete a run against Rivals Chronos
    - Freeing of Monstrosity
        - Need to complete Freeing of Time (so some reagent from that, inverse of gaining Entropy), Dark Ephialtes (?) to link to Mel's nightmare aspect
        - Order/Singularity (Chaos questline? Maybe about growing closer with the progeny of Nyx?)
            - Chaos Trial reward for an extended chaos trial of above + below together with fear
        - Water of Resurrection (Questline themed around gaining samples of all the Underworld rivers?)
            - Link to a purifying rivers plotline of Eurydice, or maybe this can be a Hades/Persephone plotline
        - Sacred Dream - based on a Hypnos plotline ?
        - Maybe link it to the Freeing of Time from his bonds, after a questline about getting Hades, Poesidon and Zeus to forgive him

        - After doing it will require you complete a run against Rivals Typhon
]]