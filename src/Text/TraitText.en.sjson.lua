local newTraitTextOrder =
{
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
}

local newTraitTextData = {
    {
      Id = "StoryExpansionTraitLevel_Food1",
      DisplayName = "Tasty",
    },
    {
      Id = "StoryExpansionTraitLevel_Food2",
      DisplayName = "{#RareFormat} ",
    },
    {
      Id = "StoryExpansionTraitLevel_Food3",
      DisplayName = "{#EpicFormat}Yummy",
    },
    {
      Id = "StoryExpansionTraitLevel_Food4",
      DisplayName = "{#HeroicFormat}Delicious",
    },
    {
      Id = "StoryExpansionEurydiceFoodMorePotentPomsTrait_Tray",
      DisplayName = "Pom Porridge",
      InheritFrom = "BaseBoonMultiline",
      Description = "The next {$TooltipData.RemainingUses} {$Keywords.PomNoPlural} you claim will offer more {$Keywords.PomLevel}",
    },
    {
      Id = "StoryExpansionDecayingDamageProtectionKeepsake_Tray",
      InheritFrom = "BaseBoonMultiline",
      DisplayName = "Bouldy Jr.",
      Description = "Take {#UpgradeFormat}-{$TooltipData.ExtractData.CurrentBonus}% {#Prev}damage, but lose {#BoldFormatGraft}{$TooltipData.ExtractData.DecayRate}% {#Prev}of this bonus after each {$Keywords.EncounterAlt}.",
    }
}

local traitTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/TraitText.en.sjson')

sjson.hook(traitTextFile, function(data)
    for _, newScreenText in ipairs(newTraitTextData) do
        table.insert(data.Texts, sjson.to_object(newScreenText, newTraitTextOrder))
    end
end)
