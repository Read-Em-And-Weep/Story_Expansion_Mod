local newHelpTextOrder =
{
    "Id",
    "InheritFrom",
    "DisplayName",
    "Description",
}

local newHelpTextData = {
    {
      Id = "NPC_Achilles_Hub_StoryExpansion",
      DisplayName = "Achilles",
      Description = "Forgotten Hero",
    },
    {
      Id = "NPC_Achilles_Frozen_StoryExpansion",
      DisplayName = "Achilles",
      Description = "Forgotten Hero",
    },
    {
      Id = "NPC_Dusa_Hub_StoryExpansion",
      DisplayName = "Dusa",
      Description = "Duty-Bound Gorgon",
    },
    {
      Id = "NPC_Dusa_Frozen_StoryExpansion",
      DisplayName = "Dusa",
      Description = "Duty-Bound Gorgon",
    },
    {
      Id = "NPC_Eurydice_Hub_Traits_StoryExpansion",
      DisplayName = "Eurydice",
      Description = "Carefree Muse",
    },
    {
      Id = "NPC_Eurydice_Hub_StoryExpansion",
      DisplayName = "Eurydice",
      Description = "Carefree Muse",
    },
    {
      Id = "NPC_Hypnos_Hub_StoryExpansion",
      DisplayName = "Hypnos",
      Description = "Sleep Incarnate",
    },
    {
      Id = "NPC_Theseus_Field_01_StoryExpansion",
      DisplayName = "Theseus",
      Description = "Hero of Athens",
    },
    {
      Id = "NPC_Minotaur_Field_01_StoryExpansion",
      DisplayName = "Asterius",
      Description = "Bull of Minos",
    },
    {
      Id = "NPC_Megaera_Hub_StoryExpansion",
      DisplayName = "Megaera",
      Description = "First of the Furies",
    },
    {
      Id = "NPC_Megaera_Frozen_StoryExpansion",
      DisplayName = "Megaera",
      Description = "First of the Furies",
    },
    {
      Id = "NPC_Megaera_Field_StoryExpansion",
      DisplayName = "Megaera",
      Description = "First of the Furies",
    },
    {
      Id = "NPC_Nyx_Hub_StoryExpansion",
      DisplayName = "Nyx",
      Description = "Night Incarnate",
    },
    {
      Id = "NPC_Nyx_Frozen_StoryExpansion",
      DisplayName = "Nyx",
      Description = "Night Incarnate",
    },
    {
      Id = "NPC_Orpheus_Hub_StoryExpansion",
      DisplayName = "Orpheus",
      Description = "Court Musician",
    },
    {
      Id = "NPC_Orpheus_Frozen_StoryExpansion",
      DisplayName = "Orpheus",
      Description = "Court Musician",
    },
    {
      Id = "NPC_Patroclus_Field_StoryExpansion",
      DisplayName = "Patroclus",
      Description = "Fallen Warrior",
    },
    {
      Id = "NPC_Persephone_Hub_StoryExpansion",
      DisplayName = "Persephone",
      Description = "Queen of the Underworld",
    },
    {
      Id = "NPC_Persephone_Frozen_StoryExpansion",
      DisplayName = "Persephone",
      Description = "Queen of the Underworld",
    },
    {
      Id = "NPC_Thanatos_Hub_StoryExpansion",
      DisplayName = "Thanatos",
      Description = "Death Incarnate",
    },
    {
      Id = "NPC_Thanatos_Frozen_StoryExpansion",
      DisplayName = "Thanatos",
      Description = "Death Incarnate",
    },
    {
      Id = "NPC_Thanatos_Field_StoryExpansion",
      DisplayName = "Thanatos",
      Description = "Death Incarnate",
    },
    {
      Id = "NPC_Zagreus_Hub_StoryExpansion",
      DisplayName = "Zagreus",
      Description = "Prince of the Underworld",
    },
    {
      Id = "NPC_Zagreus_Frozen_StoryExpansion",
      DisplayName = "Zagreus",
      Description = "Prince of the Underworld",
    },
    {
      Id = "NPC_Sisyphus_Field_StoryExpansion",
      DisplayName = "Sisyphus",
      Description = "Free Soul",
    },
    {
      Id = "StoryExpansionUnknownMaleSpeaker",
      DisplayName = "???",
      Description = "Unknown Male Speaker",
    },
    {
      Id = "StoryExpansionUnknownFemaleSpeaker",
      DisplayName = "???",
      Description = "Unknown Female Speaker",
    },
    {
      Id = "StoryExpansion_NPC_Ouranos",
      DisplayName = "Ouranos",
      Description = "Sky Incarnate",
    },
    {
      Id = "StoryExpansionUnknownAnnouncer",
      DisplayName = "Announcer",
      Description = "Unknowning Matchmaker",
    },
    {
      Id = "StoryExpansion_NPC_Rhea",
      DisplayName = "Rhea",
      Description = "Titaness of Motherhood",
    },
    {
      Id = "StoryExpansionRechargedShieldKeepsake",
      DisplayName = "{#CombatTextHighlightFormat}Repaired Spearpoint Recharged{#Prev}!",
    },
    {
      Id = "StoryExpansionRechargedBonusPowerKeepsake",
      DisplayName = "{#CombatTextHighlightFormat}Shattered Feather Recharged{#Prev}!",
    },
    {
      Id = "StoryExpansionHint_ThanatosSpawnKill",
      DisplayName = "{#CombatTextHighlightFormat}Sudden Death{#Prev}!",
    },
    {
      Id = "StoryExpansionPerfectClearDamageBonus",
      DisplayName = "{#CombatTextHighlightFormat}Familiar End{#Prev}!",
    },
    {
      Id = "StoryExpansionPerfectCritBonusBoon_Expired",
      DisplayName = "{#CombatTextHighlightFormat}Gossamer Blade Lost{#Prev}!",
    },
    {
      Id = "StoryExpansionDecayingDamageProtectionKeepsakeExpired",
      DisplayName = "{#CombatTextHighlightFormat}Bouldy Jr.{#Prev} Expired!"
    },
    {
      Id = "Chthonic",
      DisplayName = "{#HeroicFormat}Chthonic{#Prev}",
      Description = "{$Keywords.Duo} blessings with the power of an Olympian god and Hades, offered to those favored by both.",
    },
    {
      Id = "StoryExpansionFreeNPC",
      DisplayName = "{I} Free"
    },
        {
      Id = "StoryExpansionWorldUpgradeCloseRifts",
      DisplayName = "Sealing of Time",
        },
        {
      Id = "StoryExpansionWorldUpgradeSaveRhea",
      DisplayName = "Freeing of Monstrosity",
        },
        {
      Id = "StoryExpansionSlaveBond",
      DisplayName = "SLAVE BOND SWORE",
        },
        {
      Id = "StoryExpansionElementalSacrificeLoss_CombatTextFire",
      DisplayName = "Lost {#Prev}{#PenaltyFormat}{$TempTextData.Amount}{#Prev} {!Icons.FireNoTooltip}!",
    },
    {
      Id = "StoryExpansionElementalSacrificeLoss_CombatTextWater",
      DisplayName = "Lost {#Prev}{#PenaltyFormat}{$TempTextData.Amount}{#Prev} {!Icons.WaterNoTooltip}!",
    },
    {
      Id = "StoryExpansionElementalSacrificeLoss_CombatTextEarth",
      DisplayName = "Lost {#Prev}{#PenaltyFormat}{$TempTextData.Amount}{#Prev} {!Icons.EarthNoTooltip}!",
    },
    {
      Id = "StoryExpansionElementalSacrificeLoss_CombatTextAir",
      DisplayName = "Lost {#Prev}{#PenaltyFormat}{$TempTextData.Amount}{#Prev} {!Icons.AirNoTooltip}!",
    },
    {
      Id = "StoryExpansionElementalSacrificeGain_CombatTextFire",
      DisplayName = "Gained {#UpgradeFormat}{$TempTextData.Amount}{#Prev} {!Icons.FireNoTooltip}!",
    },
    {
      Id = "StoryExpansionElementalSacrificeGain_CombatTextWater",
      DisplayName = "Gained {#UpgradeFormat}{$TempTextData.Amount}{#Prev} {!Icons.WaterNoTooltip}!",
    },
    {
      Id = "StoryExpansionElementalSacrificeGain_CombatTextEarth",
      DisplayName = "Gained {#UpgradeFormat}{$TempTextData.Amount}{#Prev} {!Icons.EarthNoTooltip}!",
    },
    {
      Id = "StoryExpansionElementalSacrificeGain_CombatTextAir",
      DisplayName = "Gained {#UpgradeFormat}{$TempTextData.Amount}{#Prev} {!Icons.AirNoTooltip}!",
    },
    {
      Id = "AllElementsWithCountNoPlural",
      InheritFrom = "BaseTooltip",
      DisplayName = "{!Icons.EarthNoTooltip} {!Icons.WaterNoTooltip} {!Icons.AirNoTooltip} {!Icons.FireNoTooltip} Element",
      Description = "Essences that enhances certain {$Keywords.GodBoonPlural}. You have {#BoldFormat}{$CurrentRun.Hero.Elements.Earth}{#Prev}{!Icons.CurseEarth}, {#BoldFormat}{$CurrentRun.Hero.Elements.Water}{#Prev}{!Icons.CurseWater}, {#BoldFormat}{$CurrentRun.Hero.Elements.Air}{#Prev}{!Icons.CurseAir}, and {#BoldFormat}{$CurrentRun.Hero.Elements.Fire}{#Prev}{!Icons.CurseFire} now.",
    },
    {
      Id = "PomNoPlural",
      DisplayName = "Pom of Power",
      Description = "Underworld fruit that can enhance the effects of most {$Keywords.GodBoonPlural}.",
    },
    {
      Id = "StoryExpansionDiminishingDodgeExpired",
      DisplayName = "{#CombatTextHighlightFormat}Airy Religieuse {#Prev}Expired!"
    },
    {
      Id = "StoryExpansionEurydiceUseTextSpecial",
      DisplayName = "{SI} View Specials",
    },
    {
      Id = "StoryExpansionEurydiceUseTextTalkGiftAndSpecial",
      DisplayName = "{I} Talk\n {G} Gift\n {SI} View Specials",
    },
    {
      Id = "StoryExpansionEurydiceUseTextTalkAndSpecial",
      DisplayName = "{I} Talk\n {SI} View Specials",
    },
    {
      Id = "StoryExpansionEurydiceUseTextGiftAndSpecial",
      DisplayName = "{G} Gift\n {SI} View Specials",
    },
    {
      Id = "StoryExpansionMeal",
      DisplayName = "Home-Cooked Meal",
      Description = "Food made and offered by the Carefree Muse Eurydice, which offer temporary blessings this night."
    },
    {
      Id = "StoryExpansionMealPlural",
      DisplayName = "Home-Cooked Meals",
      Description = "Food made and offered by the Carefree Muse Eurydice, which offer temporary blessings this night."
    },
    {
      Id = "StoryExpansionTasty",
      DisplayName = "Tasty",
      Description = "Home-Cooked Meals from Eurydice are always appreciated, but this is the garden variety."
    },
    {
      Id = "StoryExpansionAppetizing",
      DisplayName = "{#RareFormat}Appetizing{#Prev}",
      Description = "Home-Cooked Meals imbued with greater-than-usual power."
    },
    {
      Id = "StoryExpansionDelicious",
      DisplayName = "{#EpicFormat}Delicious{#Prev}",
      Description = "Home-Cooked Meals imbued with significantly greater-than-usual power."
    },
    {
      Id = "StoryExpansionDecadent",
      DisplayName = "{#HeroicFormat}Decadent{#Prev}",
      Description = "Home-Cooked Meals imbued with ultimate power."
    },
    {
      Id = "StoryExpansionFoodRarity",
      DisplayName = "Quality",
      Description = "{$Keywords.StoryExpansionMealPlural} sometimes have superior effects due to better and fresher ingredients, noted as {#RareFormat}Appetizing{#Prev}, {#EpicFormat}Delicious{#Prev}, and more."
    },
    {
      Id = "BlockedByStoryExpansionThanatosCaptured_Tooltip",
      Description = "{$Keywords.BlockedByStoryExpansionThanatosCaptured}"
    },
    {
      Id = "BlockedByStoryExpansionThanatosCaptured",
      DisplayName = "{#AltPenaltyFormat}Captured",
      Description = "This comrade is currently captured by Chronos and so cannot offer their aid this night."
    },
    {
      Id = "StoryExpansionButterfly",
      DisplayName = "Butterflies",
      Description = "Ephemeral creatures carrying the essence of death, which fly at foes to deal damage."
    },
    {
      Id = "StoryExpansionGainGodBoonPlural",
      DisplayName = "Gain Boons",
      Description = "Blessings from Olympians which aid in {!Icons.Mana} recovery."
    },
    {
      Id = "StoryExpansionRushGodBoonPlural",
      DisplayName = "Rush Boons",
      Description = "Blessings from Olympians that strongly influence your {RU} {$Keywords.Dash} or {$Keywords.Sprint}."
    },
    {
      Id = "StoryExpansionTeleportCastEffect",
      DisplayName = "Apparition",
      Description = "A brief period where you are {$Keywords.Invulnerable} for {#BoldFormatGraft}{$TooltipData.ExtractData.Duration} Sec.{#Prev}"
    },
    {
      Id = "StoryExpansionAllyEnhancements",
      DisplayName = "Enhancements",
      Description = "Various boons, blessings, and enchantments offered by {$Keywords.StoryExpansionRunAllies} to strengthen you."
    },
    {
      Id = "StoryExpansionRunAllies",
      DisplayName = "Run Allies",
      Description = "Various gods, shades, mortals and others who offer their assistance to you during the night, such as {#BoldFormat} Echo{#Prev}, {#BoldFormat} Icarus{#Prev}, and {#BoldFormat} Athena{#Prev}."
    },
    {
      Id = "StoryExpansionDreamDuo_Lost",
      DisplayName = "{#CombatTextHighlightFormat}{$TempTextData.Name} {#Prev}Lost!"
    },
    {
      Id = "StoryExpansionForetoldEnd",
      DisplayName = "Foretold End",
      Description = "Accrued damage for a foe, dealt after 2 seconds. Reapplying {#BoldFormat} Foretold End {#Prev} will increase the total damage, but reset the countdown.",
    },
    --REGIONS: QUESTS
    {
      Id = "StoryExpansionQuestThanatosUpgrades",
      DisplayName = "Master of Death",
      Description = "The daughter of the god of the dead shall earn a variety of {#Emph}{$Keywords.GodBoonPlural} {#Prev}from {#Emph}Thanatos{#Prev}.",
    },
    {
      Id = "StoryExpansionQuestMegCurses",
      DisplayName = "The Fury's Failings",
      Description = "The daughter of the god of the dead shall swear a variety of {#Emph}Oaths {#Prev}with {#Emph}Megaera{#Prev}.",
    },
    {
      Id = "StoryExpansionQuestMegBlessings",
      DisplayName = "The Fury's Favors",
      Description = "The daughter of the god of the dead shall recieve a variety of {#Emph}Spoils {#Prev}from {#Emph}Megaera{#Prev}.",
    },
    {
      Id = "StoryExpansionQuestPatroclusUpgrades",
      DisplayName = "Filcher of Foes",
      Description = "The daughter of the god of the dead shall take advantage of various pilfered goods offered by the Shade called {#Emph}Patroclus{#Prev}.",
    },
    {
      Id = "StoryExpansionQuestEurydiceUpgrades",
      DisplayName = "A Well-Balanced Meal",
      Description = "The daughter of the god of the dead shall someday taste all the meals prepared by the Shade called {#Emph}Eurydice{#Prev}.",
    },
}



local helpTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/HelpText.en.sjson')

sjson.hook(helpTextFile, function(data)
    for _, newHelpText in ipairs(newHelpTextData) do
        table.insert(data.Texts, sjson.to_object(newHelpText, newHelpTextOrder))
    end
end)

table.insert(game.KeywordList, "Chthonic")
table.insert(game.KeywordList, "AllElementsWithCountNoPlural")
table.insert(game.KeywordList, "PomNoPlural")
table.insert(game.KeywordList, "StoryExpansionMeal")
table.insert(game.KeywordList, "StoryExpansionMealPlural")
table.insert(game.KeywordList, "StoryExpansionTasty")
table.insert(game.KeywordList, "StoryExpansionAppetizing")
table.insert(game.KeywordList, "StoryExpansionDelicious")
table.insert(game.KeywordList, "StoryExpansionDecadent")
table.insert(game.KeywordList, "StoryExpansionFoodRarity")
table.insert(game.KeywordList, "BlockedByStoryExpansionThanatosCaptured")
table.insert(game.KeywordList, "StoryExpansionButterfly")
table.insert(game.KeywordList, "StoryExpansionGainGodBoonPlural")
table.insert(game.KeywordList, "StoryExpansionRushGodBoonPlural")
table.insert(game.KeywordList, "StoryExpansionTeleportCastEffect")
table.insert(game.KeywordList, "StoryExpansionAllyEnhancements")
table.insert(game.KeywordList, "StoryExpansionRunAllies")
table.insert(game.KeywordList, "StoryExpansionForetoldEnd")

ResetKeywords()

sjson.hook(helpTextFile, function(data)
  for _, entry in ipairs(data.Texts) do
    if entry.Id == "Objective_PostCreditsStartNewRun" then
      entry.DisplayName = "Travel into the Past Both Above & Below To Close Rifts"
    end
  end
end)