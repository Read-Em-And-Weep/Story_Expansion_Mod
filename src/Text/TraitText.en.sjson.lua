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
      DisplayName = "{#RareFormat}Appetizing",
    },
    {
      Id = "StoryExpansionTraitLevel_Food3",
      DisplayName = "{#EpicFormat}Delicious",
    },
    {
      Id = "StoryExpansionTraitLevel_Food4",
      DisplayName = "{#HeroicFormat}Decadent",
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
    },
    {
      Id = "StoryExpansionNoManaMetaUpgrade",
      DisplayName = "Vow of Naivety",
      Description = "You will have access to {#ShrinePenaltyFormat}-{$MetaUpgradeData.StoryExpansionNoManaMetaUpgrade.DisplayValue}% {#Prev}of your {!Icons.ManaUp} this night.",
    },
    {
      Id = "StoryExpansionNoManaMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I forget my teachings, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionNoManaMetaUpgrade_Short",
      DisplayName = "Naivety"
    },
    {
      Id = "StoryExpansionHammerlessMetaUpgrade",
      DisplayName = "Vow of Simplicity",
      Description = "You {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionHammerlessMetaUpgrade.DisplayValue} {#Prev}run into {!Icons.Hammer} this night.",
    },
    {
      Id = "StoryExpansionHammerlessMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I eschew sharpening my blade, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionHammerlessMetaUpgrade_Short",
      DisplayName = "Simplicity"
    },
    {
      Id = "StoryExpansionLowManaStartMetaUpgrade",
      DisplayName = "Vow of Panic",
      Description = "You start {$Keywords.RoomPlural} with {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionLowManaStartMetaUpgrade.DisplayValue}%{#Prev}{!Icons.Mana}.",
    },
    {
      Id = "StoryExpansionLowManaStartMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I regularly do not prepare myself, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionLowManaStartMetaUpgrade_Short",
      DisplayName = "Panic"
    },
    {
      Id = "StoryExpansionEnemyDodgeMetaUpgrade",
      DisplayName = "Vow of Riposte",
      Description = "Foes have a {#ShrinePenaltyFormat}+{$MetaUpgradeData.StoryExpansionEnemyDodgeMetaUpgrade.DisplayValue}% {#Prev}chance to dodge your attacks.",
    },
    {
      Id = "StoryExpansionEnemyDodgeMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I telegraph my attacks clearly, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionEnemyDodgeMetaUpgrade_Short",
      DisplayName = "Riposte"
    },
    {
      Id = "StoryExpansionEclipseMetaUpgrade",
      DisplayName = "Vow of Eclipse",
      Description = "You {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionEclipseMetaUpgrade.DisplayValue} {#Prev} run into any rewards from {#BoldFormat}Selene {#Prev}this night.",
    },
    {
      Id = "StoryExpansionEclipseMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I reject the light, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionEclipseMetaUpgrade_Short",
      DisplayName = "Eclipse"
    },
    {
      Id = "StoryExpansionFirstHitMetaUpgrade",
      DisplayName = "Vow of Arrogance",
      Description = "In each {$Keywords.EncounterAlt}, the first hit you take deals {#ShrinePenaltyFormat}+{$MetaUpgradeData.StoryExpansionFirstHitMetaUpgrade.DisplayValue}% {#Prev}bonus damage.",
    },
    {
      Id = "StoryExpansionFirstHitMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I am felled for my hubris, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionFirstHitMetaUpgrade_Short",
      DisplayName = "Arrogance"
    },
    {
      Id = "StoryExpansionBlindRewardMetaUpgrade",
      DisplayName = "Vow of Secrets",
      Description = "{$Keywords.RoomAlt} {#BoldFormat}Reward {#Prev}previews have a {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionBlindRewardMetaUpgrade.DisplayValue}% {#Prev}chance to be hidden this night.",
    },
    {
      Id = "StoryExpansionBlindRewardMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I reject my foresight, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionBlindRewardMetaUpgrade_Short",
      DisplayName = "Secrets"
    },
    {
      Id = "StoryExpansionPurgingMetaUpgrade",
      DisplayName = "Vow of Purging",
      Description = "After vanquishing a {$Keywords.Boss}, you will {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionPurgingMetaUpgrade.DisplayValue} {#Prev}to purge a {$Keywords.GodBoon} to move on.",
    },
    {
      Id = "StoryExpansionPurgingMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I will sacrifice my strength, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionPurgingMetaUpgrade_Short",
      DisplayName = "Purging"
    },
    {
      Id = "StoryExpansionNoElementsMetaUpgrade",
      DisplayName = "Vow of Rudiments",
      Description = "{$Keywords.GodBoonPlural} {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionNoElementsMetaUpgrade.DisplayValue} {#Prev}have elemental affinities.",
    },
    {
      Id = "StoryExpansionNoElementsMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I forego my connection to the Earth, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionNoElementsMetaUpgrade_Short",
      DisplayName = "Rudiments"
    },
    {
      Id = "StoryExpansionTaxMetaUpgrade",
      DisplayName = "Vow of Taxes",
      Description = "Every {$Keywords.RoomAlt} costs {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionTaxMetaUpgrade.DisplayValue}{#Prev}{!Icons.Currency} to move through, if you have it.",
    },
    {
      Id = "StoryExpansionTaxMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I abide by a universal certainty, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionTaxMetaUpgrade_Short",
      DisplayName = "Taxes"
    },
    {
      Id = "StoryExpansionNoHelpMetaUpgrade",
      DisplayName = "Vow of Isolation",
      Description = "You {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionNoHelpMetaUpgrade.DisplayValue} {#Prev}encounter various allies in person this night.",
    },
    {
      Id = "StoryExpansionNoHelpMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I stand by myself, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionNoHelpMetaUpgrade_Short",
      DisplayName = "Isolation"
    },
    {
      Id = "StoryExpansionPomLevelsMetaUpgrade",
      DisplayName = "Vow of Decay",
      Description = "The first {$Keywords.PomNoPlural} in each {$Keywords.Biome} {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionPomLevelsMetaUpgrade.DisplayValue} {#Prev}become {!Icons.Onion} instead.",
    },
    {
      Id = "StoryExpansionPomLevelsMetaUpgrade_Flavor",
      DisplayName = "“Upon this night my mother's power wanes, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionPomLevelsMetaUpgrade_Short",
      DisplayName = "Decay"
    },
    {
      Id = "StoryExpansionExpirationMetaUpgrade",
      DisplayName = "Vow of Expiry",
      Description = "{$Keywords.GodBoonPlural} have a {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionExpirationMetaUpgrade.DisplayValue}% {#Prev}chance to be {$Keywords.StoryExpansionExpiringTrait}.",
    },
    {
      Id = "StoryExpansionExpirationMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I make transient agreements, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionExpirationMetaUpgrade_Short",
      DisplayName = "Expiry"
    },
    {
      Id = "StoryExpansionKeepsakeLevelMetaUpgrade",
      DisplayName = "Vow of Vanity",
      Description = "Your {$Keywords.Keepsakes} are will have {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionKeepsakeLevelMetaUpgrade.DisplayValue} {#Prev}less rank(s) {#ItalicFormat}(if possible){#Prev}.",
    },
    {
      Id = "StoryExpansionKeepsakeLevelMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I weaken my bonds, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionKeepsakeLevelMetaUpgrade_Short",
      DisplayName = "Vanity"
    },
    {
      Id = "StoryExpansionLoweredRarityMetaUpgrade",
      DisplayName = "Vow of Fealty",
      Description = "{$Keywords.GodBoonPlural} will be at most {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionLoweredRarityMetaUpgrade.DisplayValue}{#Prev}{#Prev}{#Prev}. {$Keywords.Duo} blessings are also possible.",
    },
    {
      Id = "StoryExpansionLoweredRarityMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I devote myself to the gods, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionLoweredRarityMetaUpgrade_Short",
      DisplayName = "Fealty"
    },
    {
      Id = "StoryExpansionLessChoicesMetaUpgrade",
      DisplayName = "Vow of Forsaking",
      Description = "{$Keywords.GodBoonPlural} will offer {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionLessChoicesMetaUpgrade.DisplayValue} {#Prev}fewer blessings to choose from.",
    },
    {
      Id = "StoryExpansionLessChoicesMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I limit my choices, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionLessChoicesMetaUpgrade_Short",
      DisplayName = "Forsaking"
    },
    {
      Id = "StoryExpansionDevotionWeaponMetaUpgrade",
      DisplayName = "Vow of Betrayal",
      Description = "A random god will aid the {$Keywords.Boss} of the first {#ShrinePenaltyFormat}{$MetaUpgradeData.StoryExpansionDevotionWeaponMetaUpgrade.DisplayValue} {#Prev}{$Keywords.BiomePlural}.",
    },
    {
      Id = "StoryExpansionDevotionWeaponMetaUpgrade_Flavor",
      DisplayName = "“Upon this night I am betrayed by my allies, that Fear may spread.”",
    },
    {
      Id = "StoryExpansionDevotionWeaponMetaUpgrade_Short",
      DisplayName = "Betrayal"
    },
    {
      Id = "StoryExpansionExpiringStatLine",
      InheritFrom = "BaseStatLine",
      DisplayName = "{!Icons.Bullet}{#PropertyFormat}{$Keywords.BossPluralAlt} Remaining:",
      Description = "{#UpgradeFormat}{$TooltipData.StoryExpansionExpiringRemaining}",
    }
}

local traitTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/TraitText.en.sjson')

sjson.hook(traitTextFile, function(data)
    for _, newScreenText in ipairs(newTraitTextData) do
        table.insert(data.Texts, sjson.to_object(newScreenText, newTraitTextOrder))
    end
end)
