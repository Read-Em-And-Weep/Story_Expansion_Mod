import 'Animations/NPC_Animations.sjson.lua'
import 'Enemies.sjson.lua'
import 'TraitLogic.lua'
import 'RoomData.lua'
import 'KeepsakeLogic.lua'
import 'NarrativeLogic.lua'
import 'EncounterLogic.lua'
import 'EventLogic.lua'
import 'NPCLogic.lua'
import 'MegOathLogic.lua'
import 'TextLogic.lua'
import 'Animations/GUI_Screens_VFX.sjson.lua'
import 'Animations/GUI_Portraits_VFX.sjson.lua'
import 'Animations/GUI.sjson.lua'
import 'Animations/GUI_VFX.sjson.lua'
import 'Animations/NPC_Horse_Animation.sjson.lua'
import 'Animations/1_General_VFX.sjson.lua'
import 'Animations/NPC_General_VFX.sjson.lua'
import 'StoryResetData.lua'
import 'WeaponLogic.lua'
import 'WorldUpgradeData.lua'

modutil.mod.Path.Wrap("SetupMap", function(base)
	game.LoadPackages({ Name ="ReadEmAndWeep-Story_ExpansionGUI" })
	return base()
end)

