
if not gods.IsKeepsakeRegistered("StoryExpansionGodsentHexKeepsake") then
gods.CreateKeepsake({
    characterName = "Theseus",
    internalKeepsakeName = "StoryExpansionGodsentHexKeepsake",

    RarityLevels = {
        Common = 1,
        Rare = 2,
        Epic = 3,
        Heroic = 4,
    },

    Keepsake = {
        displayName = "Blessed Laurel",
        description = "Your {$Keywords.Spell} may be {$Keywords.FirstTimeSpell}, and this effect activates {#UpgradeFormat} +{$TooltipData.ExtractData.Uses} {#Prev} time(s) in each {$Keywords.RoomAlt}.",
        signoffMax = "From {#AwardMaxFormat}Theseus{#Prev}{!Icons.ObjectiveSeparatorDark}To do nothing while others suffer is tantamount to enabling the suffering itself.",
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
        OlympianSpellCountAddition = { BaseValue = 1 },
    },

    ExtractValues = {
        {
				Key = "OlympianSpellCountAddition",
				ExtractAs = "Uses",
			},
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end

local duoTalents = {"PotionPoseidonTalent", "TimeSlowDemeterTalent", "LaserApolloTalent", "PolymorphZeusTalent","SummonHeraTalent","MeteorHestiaTalent","LeapHephaestusTalent","TransformAphroditeTalent","MoonBeamAresTalent"}

for k,v in ipairs(duoTalents) do
    table.insert(TraitData[v].GameStateRequirements.OrRequirements, {
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", gods.GetInternalKeepsakeName("StoryExpansionGodsentHexKeepsake") },
					},
				})
end