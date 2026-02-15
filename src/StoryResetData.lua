-- TODO: Implement "always available reset" (e.g. spawing the object into the Crossroads)
table.insert(HubRoomData.Hub_Main.StartUnthreadedEvents, 1, {FunctionName = "Activate", Args = {Ids = {742624}}})

modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
  base(source, args)
  SetupStoryResetObject()
end)

local newStoryResetData = {
    WorldUpgrades = {},
    Quests = {},
    Resources = {},
    TextLines = {
        -- Freeing From Chronos
    "StoryExpansionFreeingPersephoneDialogue",
    "StoryExpansionFreeingZagreusDialogue",
    "StoryExpansionFreeingThanatosDialogue",
    "StoryExpansionFreeingMegaeraDialogue",
    "StoryExpansionFreeingAchillesDialogue",
    "StoryExpansionFreeingOrpheusDialogue",
    "StoryExpansionFreeingDusaDialogue",
    "StoryExpansionFreeingNyxDialogue",


    -- SurfaceFlashbacks
    "StoryExpansionSurfaceFlashback01",
    "StoryExpansionSurfaceFlashback02",
    "StoryExpansionSurfaceFlashback03",
    "StoryExpansionSurfaceFlashback04",
    "StoryExpansionSurfaceFlashback05",
    "StoryExpansionSurfaceFlashback06",
    "StoryExpansionSurfaceFlashback07",
    "StoryExpansionSurfaceFlashback08",
    "StoryExpansionSurfaceFlashback09",
    "StoryExpansionSurfaceFlashback10",

    -- PalaceCoversations
    "ZeusPalaceFirstMeeting",
	"ZeusPalaceMeeting02",
    "ZeusPalaceMeeting03",
    "ZeusPalaceMeeting05",
    "ZeusPalaceMeeting07",
    "ZeusPalaceMeeting08",
    "ZeusPalaceMeeting09",
    "ZeusPalaceAboutTyphonDeath01",
    "ZeusPalaceFirstMeeting",
	"ZeusPalaceMeeting02",
    "ZeusPalaceMeeting04",
    "ZeusPalaceMeeting06",
    "ZeusPalaceMeeting08",
    "ZeusPalaceMeeting09",
    "ZeusPalaceAboutTyphonDeath01",
    "DemeterPalaceFirstMeeting",
"DemeterPalaceMeeting02",
"DemeterPalaceMeeting03",
"DemeterPalaceMeeting04",
"DemeterPalaceAboutTyphonDeath01",
"ApolloPalaceFirstMeeting",
"ApolloPalaceMeeting02",
"ApolloPalaceMeeting03",
"ApolloPalaceMeeting04",
"ApolloPalaceMeeting05",
"ApolloPalaceMeeting06",
"ApolloPalaceMeeting07",
"ApolloPalaceMeeting08",
"ApolloPalaceMeeting09",
"ApolloPalaceAboutTyphonDeath01",
    },
    VoiceLines = {},

}

-- TODO: implement WorldUpgrades to reset into StoryResetData
    -- any world upgrades specific to the plot progression

-- TODO: implement Quests to reset into StoryResetData
    -- Quests linked to story progression i.e. Hypnos stuff

-- TODO: implement Resources (?) to reset into StoryResetData


-- TODO: implement TextLines to reset into StoryResetData
    -- Freeing Textlines
    -- Flashback Textlines
    -- Any added textlines that are relevant/post plot/post epilogue


-- TODO: implement VoiceLines (?) to reset into StoryResetData

modutil.mod.Path.Wrap("DoStoryReset", function(base)
    mod.DoStoryExpansionReset()
    return base()
end)

function mod.DoStoryExpansionReset()
for i, worldUpgrade in ipairs( newStoryResetData.WorldUpgrades ) do
		game.GameState.WorldUpgradesAdded[worldUpgrade] = nil
		game.GameState.WorldUpgrades[worldUpgrade] = nil
		if worldUpgrade ~= "WorldUpgradeWakeHypnosT3" then
			game.GameState.WorldUpgradesViewed[worldUpgrade] = nil
			game.GameState.WorldUpgradesRevealed[worldUpgrade] = nil
		end
	end

	for i, questName in ipairs( newStoryResetData.Quests ) do
		game.GameState.QuestsCompleted[questName] = nil
		if game.GameState.QuestStatus[questName] ~= nil then
			game.GameState.QuestStatus[questName] = "Unlocked"
		end
	end

	for i, resourceName in ipairs( newStoryResetData.Resources ) do
		game.GameState.Resources[resourceName] = nil
		game.GameState.LifetimeResourcesGained[resourceName] = nil
	end

	for i, eventName in ipairs( newStoryResetData.TextLines ) do
		game.GameState.TextLinesRecord[eventName] = nil
		game.CurrentRun.TextLinesRecord[eventName] = nil
	end

	for i, voiceLine in ipairs( newStoryResetData.VoiceLines ) do
		game.GameState.SpeechRecord[voiceLine] = nil
		game.CurrentRun.SpeechRecord[voiceLine] = nil

		game.GameState.SpeechRecordContexts[voiceLine] = nil
		game.CurrentRun.SpeechRecordContexts[voiceLine] = nil

		game.GameState.LastPlayedRandomLines[voiceLine] = nil
	end
    game.CurrentRun.StoryExpansionHandleHubSpawnRun = false

    --TODO: Any Hub, GameState, CurrentRun or other stuff I need to reset
end

modutil.mod.Path.Wrap("ConfirmStoryResetPresentation", function(base, usee)
game.CurrentRun.StoryExpansionHandleHubSpawnRun = false
    base(usee)
     local newNPCList = {
        "NPC_Achilles_Hub_StoryExpansion",
        "NPC_Dusa_Hub_StoryExpansion",
        "NPC_Megaera_Hub_StoryExpansion",
        "NPC_Nyx_Hub_StoryExpansion",
        "NPC_Orpheus_Hub_StoryExpansion",
        "NPC_Persephone_Hub_StoryExpansion",
        "NPC_Thanatos_Hub_StoryExpansion",
        "NPC_Zagreus_Hub_StoryExpansion",
    }
    for k, characterName in pairs(newNPCList) do
        Destroy({ Ids = GetIdsByType({ Name = characterName}) })
    end
end)