mod.MinotaurNPCData = {
    NPC_Minotaur_Field_01_StoryExpansion = {
		Name = "NPC_Minotaur_Field_01_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		InvincibubbleScale = 1.33,

		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = true,

        PreEventFunctionName = "AngleNPCToHero",

		EffectBlocks = { "RavenFamiliarMark", "ChillStatueEffect" },
		ExcludeFromDamageDealtRecord = true,
        StoryExpansionTrackDamage = true,
  
		    ActivateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "ZeusFirstPickUp" },
			}
		},

        		DefaultAIData =
		{
			TargetRequiredKillEnemy = true,
			IgnoreInvulnerable = true,
            
AIWanderDistance = 0,
			AIWanderDistanceDuration = 0,		},
		OutgoingCritModifiers =
		{
			{
				Chance = 0.15,
			}
		},
		AIOptions = { "AttackerAI" },
		PostCombatAI = _PLUGIN.guid .. ".AsteriusPostCombat",
        		NoTargetWanderDuration = 1.0,

		
        WeaponOptions = { "StoryExpansionMinotaurHeraclesAttack" },

		OutgoingDamageModifiers =
		{
			{
				PlayerMultiplier = 0.0,
			}
		},
		IncomingDamageModifiers =
		{
			{
				--Name = "Innate",
				PlayerMultiplier = 0.05,
			}
		},



		Portrait = "StoryExpansion_Minotaur",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },


		InteractTextLineSets = {
        StoryExpansionPostCombatTheseus01 =
			{
                Name = "StoryExpansionPostCombatTheseus01",
                Partner = "NPC_Theseus_Field_01_StoryExpansion",
				PlayOnce = true,
				UseableOffSource = true,
				UseText = "NPCUseTextTalk",
				BlockDistanceTriggers = true,
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = false,
				GiftableOffSource = false,
			},
    },

	Binks = {
			--"DusaIdle_Bink",
			--"DusaIdleInhouse_Bink",
			--"DusaIdleInhouseFidgetHairFlick__Bink",
		},
		
	},
}

for newNPCName, newNPCData in pairs(mod.MinotaurNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end

function mod.AsteriusPostCombat(enemy)
wait(1.5)
    if not enemy then return end
    local theseusId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Theseus_Field_01_StoryExpansion" })
    local theseus = ActiveEnemies[theseusId]
    enemy.PostCombatTravel = true
	AddTimerBlock( CurrentRun, "HeraclesPostCombat" )
    	local moveToId = SelectLootSpawnPoint(CurrentRun.CurrentRoom) or CurrentRun.Hero.ObjectId
    if theseus and theseus.StoryExpansionChosenTheseusLocation then 
        moveToId = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = theseus.StoryExpansionChosenTheseusLocation, OffsetX = -50, OffsetY = -50 })
    end
	local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = moveToId })

        SetAnimation({DestinationId = enemy.ObjectId, Name = "StoryExpansionMinotaur_Walk"})
	Move({ Id = enemy.ObjectId, DestinationId = moveToId, SuccessDistance = 40 })
	enemy.AINotifyName = "WithinDistance_"..enemy.Name.."_"..enemy.ObjectId
	NotifyWithinDistance({ Id = enemy.ObjectId, DestinationId = moveToId, Distance = 100, Notify = enemy.AINotifyName, Timeout = 10.0 })
	waitUntil( enemy.AINotifyName, enemy.AIThreadName )
    SetAnimation({DestinationId = enemy.ObjectId, Name = "StoryExpansionMinotaur_Idle"})


	Stop({ Id = enemy.ObjectId })
	AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	enemy.PostCombatTravel = false
	enemy.TextLinesUseWeaponIdle = nil
	RemoveTimerBlock( CurrentRun, "HeraclesPostCombat" )
	UseableOn({ Id = enemy.ObjectId })
	
    ProcessTextLines( enemy, enemy.InteractTextLineSets )
    wait(0.5)

    CheckAvailableTextLines( enemy )
	SetAvailableUseText( enemy )
	RemoveInteractBlock( enemy, "HeraclesPostCombat" )
end

NarrativeData.NPC_Minotaur_Field_01_StoryExpansion = {
    InteractTextLinePriorities = {
        "StoryExpansionPostCombatMinotaur01",
    }
}