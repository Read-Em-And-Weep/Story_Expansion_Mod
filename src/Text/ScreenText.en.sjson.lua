local newScreenTextOrder =
{
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
}

local newScreenTextData = {
    {
      Id = "StoryExpansionOathScreen_Title",
      DisplayName = "Fury's Vows",
    },
    {
      Id = "StoryExpansionOathScreen_Subtitle",
      DisplayName = "in the underworld, those who follow their word are rewarded, while oathbreakers suffer.",
    },
    {
      Id = "StoryExpansionOathScreen_GiveHint",
      DisplayName = "you swear:",
    },
    {
      Id = "StoryExpansionOathScreen_GetHint",
      DisplayName = "you recieve:",
    },
    {
      Id = "StoryExpansionPatroclusChoiceMenu_Title",
      DisplayName = "Pilfered Goods",
    },
    {
      Id = "StoryExpansionPatroclusChoiceMenu_FlavorText01",
      DisplayName = "after all, why should only the titans benefit from quality supplies.",
    },
    {
      Id = "StoryExpansionUpgradeChoiceMenu_Thanatos",
      DisplayName = "Boons of Thanatos",
    },
    {
      Id = "StoryExpansionThanatosUpgrade_FlavorText01",
      DisplayName = "gentle death, the most beloved of ends, is still none-the-less feared.",
    },
    {
      Id = "StoryExpansionThanatosUpgrade_FlavorText02",
      DisplayName = "for all but the immortals, death comes, but now its power lies in your grasp.",
    },
    {
      Id = "StoryExpansionThanatosUpgrade_FlavorText03",
      DisplayName = "for a being so final, death has been kind and strong for the house.",
    },
    {
      Id = "StoryExpansionThanatosMessage",
      DisplayName = "Death Approaches"
    },
    {
      Id = "StoryExpansionLongAgo",
      DisplayName = "Long Ago..."
    },
    {
      Id = "StoryExpansionNotLongAgo",
      DisplayName = "Not So Long Ago..."
    },
    {
      Id = "StoryExpansionLongAgoAfterABattle",
      DisplayName = "After A Long Fight..."
    },
    {
      Id = "StoryExpansion_EurydiceFoodHint",
      DisplayName = "a hearty snack is required for fighting. take one, and enjoy the flavors.",
    },
    {
      Id = "UpgradeChoiceMenu_Title_StoryExpansionEurydiceFood",
      DisplayName = "Home-Cooked Meals.",
    },
    {
      Id = "StoryExpansionFoodOffered_FlavorText01",
      DisplayName = "good food brings people together.",
    },
    {
      Id = "StoryExpansionFoodOffered_FlavorText02",
      DisplayName = "perhaps you could one day cook as well, if only you practiced.",
    },
    {
      Id = "StoryExpansionFoodOffered_FlavorText03",
      DisplayName = "maybe it's not the dishes themselves, but the love that goes into them.",
    },
    {
      Id = "StoryExpansionFoodOffered_FlavorText04",
      DisplayName = "variety is the spice of life.",
    },
    {
      Id = "StoryExpansionFoodOffered_FlavorText05",
      DisplayName = "even though you feel full, you have room for just one bite more.",
    },
    {
      Id = "StoryExpansionShrineScreen_NextPage",
      DisplayName = "{CF} NEXT PAGE",
    },
}

local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/ScreenText.en.sjson')

sjson.hook(screenTextFile, function(data)
    for _, newScreenText in ipairs(newScreenTextData) do
        table.insert(data.Texts, sjson.to_object(newScreenText, newScreenTextOrder))
    end
end)
