mod.TheseusNPCData = {
    NPC_Theseus_Field_01_StoryExpansion = {
		Name = "NPC_Theseus_Field_01_StoryExpansion",
		InheritFrom = { "NPC_Neutral"},
	
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		InvincibubbleScale = 1.33,

		OnUsedFunctionName = "UseNPC",
		
		RequireUseToGift=false,
        RequireRoomInteraction=false,
        SpecialInteractFunctionNames = {},
        SpecialInteractFunctionName = nil,
        CanReceiveGift = false,
		SkipAISetupOnActivate = true,

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
			AIWanderDistance = 200,
		},
		OutgoingCritModifiers =
		{
			{
				Chance = 0.15,
			}
		},
		AIOptions = { "AttackerAI" },
		PostCombatAI = _PLUGIN.guid..".TheseusPostCombat",

		WeaponOptions = { --"StoryExpansionTheseusSpearThrow",
			"StoryExpansionTheseusSpearSpin", "StoryExpansionTheseusSummon"
			--"StoryExpansionMinotaurTheseusThrow_Theseus",
             },
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



		Portrait = "StoryExpansion_Theseus",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

        BossIntroTextLineSets = {
          StoryExpansionTheseusMinotaurIntroduction = {
            Name = "StoryExpansionTheseusMinotaurIntroduction",
            UseableOffSource = true,
            {
                Text = "Halt! Identify yourself daemon or face the force of the Champions of Elysium.",
            },
            {
                UsePlayerSource = true,
                Text = "I am Melinoë, daughter of Hades on a quest to slay Chronos. If you are the Champions of Elysium, then you must be... Sir Theseus and Sir Asterius?",
            },
            {
                Text = "How refreshing for a member of the House of Hades to properly show respect! Not at all like that fiend of a Prince, right Asterius?",
            },
            {
                Source = "NPC_Minotaur_Field_01_StoryExpansion",
                Portrait = "StoryExpansion_Minotaur",
                Text = "I sense enemies approaching, king. We should deal with them first, then with the Princess."
            },
            {
                Text = "Right you are as always, dearest Asterius! You — aid us in dealing with these foes and we may reward you for your efforts.",
            },
          }, 
        },
		InteractTextLineSets = {
        	StoryExpansionPostCombatTheseus01 = {
                Name = "StoryExpansionPostCombatTheseus01",
                Partner = "NPC_Minotaur_Field_01_StoryExpansion",
				UseText = "NPCUseTextTalk",
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = false,
				GiftableOffSource = false,

				UseableOffSource = true,

				{ Cue = "/VO/Hecate_0205", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Persephone_Hub_StoryExpansion", PreLineWait = 0.35,
					Text = "You are required at your post, Nemesis. Or shall you take to openly defying me just as your sister does? I shudder to think what your mother would say of you two." },

				{ Cue = "/VO/Nemesis_0055",
					PreLineWait = 0.35,
					Text = "...You have no right to invoke my mother. None of this would be happening had you fulfilled your role as Handmaiden, and warned her an attack was imminent." },

				{ Cue = "/VO/Hecate_0206", Portrait = "Portrait_Hec_Default_01", Speaker = "NPC_Persephone_Hub_StoryExpansion",
					Text = "Best watch your mouth or I shall seal it shut! You may continue dwelling on a past you were not witness to, or you may do what is expected of Nyx's daughters. Or whatever Eris is up to! Your choice." },
					
    },

    },

	Binks = {
			--"DusaIdle_Bink",
			--"DusaIdleInhouse_Bink",
			--"DusaIdleInhouseFidgetHairFlick__Bink",
		},
		
	},
}

for newNPCName, newNPCData in pairs(mod.TheseusNPCData) do
    game.ProcessDataInheritance(newNPCData, game.EnemyData)
    EnemyData[newNPCName] = newNPCData
end

function mod.TheseusPostCombat(enemy)
    wait(1)
    if not enemy then return end
    enemy.PostCombatTravel = true
	AddTimerBlock( CurrentRun, "HeraclesPostCombat" )
	local moveToId = SelectLootSpawnPoint(CurrentRun.CurrentRoom) or CurrentRun.Hero.ObjectId
    enemy.StoryExpansionChosenTheseusLocation = moveToId
	local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = moveToId })

	Move({ Id = enemy.ObjectId, DestinationId = moveToId, SuccessDistance = 40 })
	enemy.AINotifyName = "WithinDistance_"..enemy.Name.."_"..enemy.ObjectId
	NotifyWithinDistance({ Id = enemy.ObjectId, DestinationId = moveToId, Distance = 100, Notify = enemy.AINotifyName, Timeout = 10.0 })
	waitUntil( enemy.AINotifyName, enemy.AIThreadName )
    SetAnimation({DestinationId = enemy.ObjectId, Name = "StoryExpansionTheseus_Idle"})

	Stop({ Id = enemy.ObjectId })
	AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
	enemy.PostCombatTravel = false
	enemy.TextLinesUseWeaponIdle = nil
	RemoveTimerBlock( CurrentRun, "HeraclesPostCombat" )
	UseableOn({ Id = enemy.ObjectId })

	wait(1.3)

	if not enemy.SummonedByKeepsake then
        local consumables = {"MaxHealthDrop", "MaxManaDrop","StackUpgrade", "RoomMoneyDrop"}
        local consumableChosen = RemoveRandomValue(consumables)
        while consumableChosen == "StackUpgrade" and not IsGameStateEligible({},{NamedRequirements = { "StackUpgradeLegal" }}) do
        consumableChosen = RemoveRandomValue(consumables)
        end
		local consumableId = SpawnObstacle({ Name = consumableChosen, DestinationId = enemy.ObjectId, Group = "Standing" })
		local reward = CreateConsumableItem( consumableId, consumableChosen, 0 )
		MapState.RoomRequiredObjects[reward.ObjectId] = reward
		ApplyUpwardForce({ Id = consumableId, Speed = 425 })
		ApplyForce({ Id = consumableId, Speed = 350, Angle = GetAngle({ Id = enemy.ObjectId }), SelfApplied = true })
	end
	RemoveInteractBlock( enemy, "HeraclesPostCombat" )
UseableOn({ Id = enemy.ObjectId })
UseableOn({ Id = enemy.ObjectId })
UseableOn({ Id = enemy.ObjectId })
    ProcessTextLines( enemy, enemy.InteractTextLineSets )
    wait(0.5)
	CheckAvailableTextLines( enemy )
	SetAvailableUseText( enemy )

	if enemy.NextInteractLines == nil then
		if CanReceiveGift( enemy ) then
			MapState.RoomRequiredObjects[enemy.ObjectId] = nil
			wait( 0.2 )
			if CheckRoomExitsReady( CurrentRun.CurrentRoom ) then
				UnlockRoomExits( CurrentRun, CurrentRun.CurrentRoom )
			end
		else
			mod.TheseusAndMinotaurExit()
		end
	end	

end

function mod.TheseusAndMinotaurExit()
    local theseusId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Theseus_Field_01_StoryExpansion" })
    local minotaurId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Minotaur_Field_01_StoryExpansion" })


	if not CurrentRun.Hero.IsDead and theseusId == nil and minotaurId == nil then
		return
	end

    local theseus = ActiveEnemies[theseusId]
	local minotaur = ActiveEnemies[minotaurId]

    if theseus == nil or minotaur == nil then
        return
    end

    if theseus.Exiting and minotaur.Exiting then
        return
    end

    	UseableOff({ Id = theseus.ObjectId })
	theseus.SpecialInteractFunctionName = nil
	theseus.CanReceiveGift = false
	theseus.Exiting = true
    	RefreshUseButton( theseus.ObjectId, theseus )


    	UseableOff({ Id = minotaur.ObjectId })
	minotaur.SpecialInteractFunctionName = nil
	minotaur.CanReceiveGift = false
	minotaur.Exiting = true
    	RefreshUseButton( minotaur.ObjectId, minotaur )

        	CreateAnimation({ Name = "TeleportDisappear", DestinationId = theseus.ObjectId })
	SetAlpha({ Id = theseus.ObjectId, Fraction = 0.0, Duration = 0.1 })
    Destroy({Ids = {theseus.ObjectId}})

    	CreateAnimation({ Name = "TeleportDisappear", DestinationId = minotaur.ObjectId })
	SetAlpha({ Id = minotaur.ObjectId, Fraction = 0.0, Duration = 0.1 })
    Destroy({Ids = {minotaur.ObjectId}})


    if CheckRoomExitsReady( CurrentRun.CurrentRoom ) then
		UnlockRoomExits( CurrentRun, CurrentRun.CurrentRoom )
	end
end

NarrativeData.NPC_Theseus_Field_01_StoryExpansion = {
    InteractTextLinePriorities = {
        "StoryExpansionPostCombatMinotaur01",
    }
}