if not gods.IsKeepsakeRegistered("StoryExpansionAllySummonKeepsake") then
gods.CreateKeepsake({
    characterName = "Asterius",
    internalKeepsakeName = "StoryExpansionAllySummonKeepsake",

    RarityLevels = {
        Common = 1.5,
        Rare = 2,
        Epic = 2.5,
        Heroic = 3.5,
    },

    Keepsake = {
        displayName = "Bull Horn",
        description = "The next time you lose a {!Icons.ExtraChanceMisc}, summon {#BoldFormat} Theseus {#Prev} and {#BoldFormat} Asterius {#Prev} to join the fight to deal at most {$TooltipData.RemainingUses} damage before leaving.",
        signoffMax = "From {#AwardMaxFormat}Asterius{#Prev}{!Icons.ObjectiveSeparatorDark}Morality must be learnt, but reformation can always be possible.",
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
        --update Decay manually in description
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

modutil.mod.Path.Wrap("FormatExtractedValue", function(base,value,extractData)
if extractData.Format and extractData.Format == "StoryExpansionFoodRarity" then
    local table = {"StoryExpansionTasty","StoryExpansionAppetizing", "StoryExpansionYummy", "StoryExpansionDelicious"}
    return "{$Keywords." ..table[value].."}"
end
return base(value, extractData)
end)