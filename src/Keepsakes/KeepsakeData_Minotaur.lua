if not gods.IsKeepsakeRegistered("StoryExpansionAllySummonKeepsake") then
gods.CreateKeepsake({
    characterName = "Asterius",
    internalKeepsakeName = "StoryExpansionAllySummonKeepsake",

    RarityLevels = {
        Common = 0.5,
        Rare = 1,
        Epic = 1.5,
        Heroic = 2.5,
    },

    Keepsake = {
        displayName = "Stuffed Bull",
        description = "The next time you lose a {!Icons.ExtraChanceMisc}, summon {#BoldFormat} Theseus {#Prev} and {#BoldFormat} Asterius {#Prev} to join the fight to deal at most {$TooltipData.RemainingUses} damage before leaving.",
        signoffMax = "From {#AwardMaxFormat}Asterius{#Prev}{!Icons.ObjectiveSeparatorDark}Sometimes, all you need is for a single person to acknowledge you.",
        trayExpired = "This {$Keywords.KeepsakeAlt}'s effect has expired for this night."
    },

    Icons = {
        iconPathOverrides = {
        iconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
		maxCornerIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_small\\Demeter",
		maxIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_big\\Demeter",
        }
    },

    ExtraFields = {
        BlockedByEnding = true,
		OnLastStandFunction = 
		{
			Name = _PLUGIN.guid..".TryKeepsakeTheseusAndAsteriusSpawn",
			FunctionArgs = 
			{
                GameStateRequirements = {
				NamedRequirementsFalse = { "HecateMissing" },
                {
					PathFalse = { "CurrentRun", "CurrentRoom", "StoryExpansionBlockAllySummonKeepsake" }
				},
                },
				Uses = 1,
			}
		},
        EncounterEndFunctionName = _PLUGIN.guid..".EndEncounterRemoveSpawnedTheseusAndAsterius",
		EncounterEndFunctionArgs =
		{
		},

        RemainingUses = {BaseValue = 10000}
    },

    ExtractValues = {
        {
				Key = "BlessingRarityBonus",
				ExtractAs = "RarityValue",
				Format = "StoryExpansionFoodRarity",
				SkipAutoExtract = true,
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end