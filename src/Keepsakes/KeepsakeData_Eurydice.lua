if not gods.IsKeepsakeRegistered("StoryExpansionFreeMealKeepsake") then
gods.CreateKeepsake({
    characterName = "Eurydice",
    internalKeepsakeName = "StoryExpansionFreeMealKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Heroic = 4,
    },

    Keepsake = {
        displayName = "Sampling Platter",
        description = "Gain a random {$Keywords.StoryExpansionMeal} made by Eurydice at {$TooltipData.ExtractData.RarityValue} {$Keywords.StoryExpansionFoodRarity}.",
        signoffMax = "From {#AwardMaxFormat}Eurydice{#Prev}{!Icons.ObjectiveSeparatorDark}A hearty meal brings together everyone, whether they be god or mortal.",
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
		AcquireFunctionName = _PLUGIN.guid..".GrantRandomFoodOfRarity",
        AcquireFunctionArgs = {
            Rarity = {BaseValue = 1},
            ReportValues = {BlessingRarityBonus = "Rarity"}
        }
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