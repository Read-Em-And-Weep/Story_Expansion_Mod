local WeaponSetData = {
    StoryExpansionMinotaurHeraclesAttack = 
    {
        Name = "StoryExpansionMinotaurHeraclesAttack",
        Requirements =
		{
			MaxConsecutiveUses = 2,
		},

		AIData =
		{

            DeepInheritance = true,

			ProjectileName = "StoryExpansionHeraclesArcRight01Minotaur",

			FireSelfVelocity = 1300,
			FireProjectileStartDelay = 0.09,

			PreAttackDuration = 0.62,
			FireDuration = 0.22,

			AttackDistance = 350,
			MoveWithinRange = true,
			PreAttackStop = true,

			PreAttackSound = "/SFX/Enemy Sounds/Heracles/EmoteCharging",
			PreAttackAnimation = "StoryExpansionMinotaurAttackSwings_PreAttack",
			FireAnimation = "StoryExpansionMinotaurAttackSwings_Attack1", 

			TrackTargetDuringCharge = true,
			StopBeforeFire = true,
			ExpireProjectilesOnHitStun = true,
			TargetRequiredKillEnemy = true,
			TrackKillSteal = true,
            ChainedWeapon = "StoryExpansionMinotaurHeraclesAttack2",
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Heracles/EmoteAttacking" },
			},
		},
    },
        StoryExpansionMinotaurHeraclesAttack2 = 
    {
        Name = "StoryExpansionMinotaurHeraclesAttack2",
        Requirements =
		{
			MaxConsecutiveUses = 2,
		},

		AIData =
		{

            DeepInheritance = true,

			ProjectileName = "StoryExpansionHeraclesArcRight01Minotaur",

			FireSelfVelocity = 1300,
			FireProjectileStartDelay = 0.09,

		
			FireDuration = 0.22,
			PostAttackDuration = 1.5,

			AttackDistance = 350,

			PreAttackSound = "/SFX/Enemy Sounds/Heracles/EmoteCharging",
			FireAnimation = "StoryExpansionMinotaurAttackSwings_Attack2", 
			PostAttackAnimation = "StoryExpansionMinotaurAttackSwings_ReturnToIdle",

			ExpireProjectilesOnHitStun = true,
			TargetRequiredKillEnemy = true,
			TrackKillSteal = true,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Heracles/EmoteAttacking" },
			},
		},
    },
    StoryExpansionMinotaurLeap = {
        Name = "StoryExpansionMinotaurLeap",
        AIData =
		{
			DeepInheritance = true,

			ProjectileName = "StoryExpansionMinotaurLeap",

			TargetRequiredKillEnemy = true,
			TargetMinDistance = 500,
			TrackKillSteal = true,

			MoveWithinRange = true,
			StopMoveWithinRange = true,
			AttackDistance = 800,
			LoSBuffer = 120,
			RequireUnitLoS = true,

			PreAttackAngleTowardTarget = true,
			WaitForAngleTowardTarget = true,
			PreAttackStop = true,
			StopBeforeFire = true,

			PreAttackDuration = 0.0,
			FireDuration = 0.1,
			PostAttackDuration = 0.5,

			PreAttackLeap = true,
			LeapToTarget = true,
			LeapSound = "/Leftovers/SFX/PlayerJump",
			LeapSpeed = 3000,
			LeapPrepareTime = 0.2,
			LeapRecoveryTime = 0.5,
			LeapChargeAnimation = "StoryExpansionMinotaurAttackSwings_PreAttackLeap",
			LeapAnimation = "StoryExpansionMinotaurAttackSwings_AirLoop",
			LeapLandingAnimation = "StoryExpansionMinotaurAttackSwings_AttackLeap",
			PostAttackAnimation = "StoryExpansionMinotaurAttackSwings_AttackLeapReturnToIdle",
        },
    },
    --[[StoryExpansionTheseusSpearThrow = {
        Name = "StoryExpansionTheseusSpearThrow",
        		HitScreenshake = { Distance = 4, Speed = 1200, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0 },
			{ ScreenPreWait = 0.18, Fraction = 1.0, LerpTime = 0 },
		},

		BlockInterrupt = true,
		GenusName = "TheseusSpearThrow",
		AIData =
		{
			DeepInheritance = true,
			--PreAttackDuration = 1.0,
			PreAttackDurationMin = 1.35,
			PreAttackDurationMax = 1.8,
			PreAttackEndShake = true,
			WaitUntilProjectileDeath = "StoryExpansionTheseusSpearThrow",
			PostAttackDuration = 0.0,
			PreAttackSound = "/SFX/Enemy Sounds/Theseus/EmoteCharging",
            ProjectileName = "StoryExpansionTheseusSpearThrow",


			PreAttackAnimation = "StoryExpansionTheseusSpearThrow_Charge",
			FireAnimation = "StoryExpansionTheseusSpearThrow_Fire",
			AITrackTargetDuringCharge = true,
			SkipStopBeforePreAttackEnd = true,
			AIAngleTowardsPlayerWhileFiring = false,

			AIAttackDistance = 950,
			AIBufferDistance = 850,
			AIRequireProjectileLineOfSight = true,
			AILineOfSightBuffer = 80,

			MinPlayerDistance = 200,
        },
    },]]
    StoryExpansionTheseusSpearSpin =
	{
        Name = "StoryExpansionTheseusSpearSpin",
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.12, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.25, LerpTime = 0 },
			{ ScreenPreWait = 0.10, Fraction = 1.0, LerpTime = 0 },
		},

		AIData =
		{
			--[[DeepInheritance = true,

			PreAttackAnimation = "StoryExpansionTheseusSpearSpin_PreAttack",
			FireAnimation = "StoryExpansionTheseusSpearSpin_Attack", 
			PostAttackAnimation = "StoryExpansionTheseusSpearSpin_ReturnToIdle",
            ProjectileName = "StoryExpansionTheseusSpearSpin",
			PreAttackDuration = 0.6,
			FireDuration = 0.5,
			PostAttackDuration = 0.5,
			PostAttackCooldownMin = 1.5,
			PostAttackCooldownMax = 2.0,
			PreAttackSound = "/SFX/Enemy Sounds/Theseus/EmoteCharging",

			AIAttackDistance = 275,
			AIBufferDistance = 250,

			AIMoveWithinRangeTimeout = 3.0,

			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIRequireUnitLineOfSight = true,
			AILineOfSightBuffer = 150,

			MaxPlayerDistance = 600,]]
            DeepInheritance = true,

			ProjectileName = "StoryExpansionHeraclesArcRight01",

			FireSelfVelocity = 1300,
			FireProjectileStartDelay = 0.09,

			PreAttackDuration = 0.62,
			FireDuration = 0.22,
			PostAttackDuration = 1.7,

			AttackDistance = 350,
			MoveWithinRange = true,
			PreAttackStop = true,

			PreAttackSound = "/SFX/Enemy Sounds/Heracles/EmoteCharging",
			PreAttackAnimation = "StoryExpansionTheseusSpearSpin_PreAttack",
			FireAnimation = "StoryExpansionTheseusSpearSpin_Attack", 
			PostAttackAnimation = "StoryExpansionTheseusSpearSpin_ReturnToIdle",

			TrackTargetDuringCharge = true,
			StopBeforeFire = true,
			ExpireProjectilesOnHitStun = true,
			TargetRequiredKillEnemy = true,
			TrackKillSteal = true,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Enemy Sounds/Theseus/EmotePowerAttacking" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
				{ Name = "/Leftovers/SFX/AuraThrow" }
			},
		},
	},
    StoryExpansionTheseusSummon =
	{
        Name = "StoryExpansionTheseusSummon",
		AIData =
		{
			DeepInheritance = true,

			ProjectileName = "StoryExpansionTheseusSummon",

            FireProjectileAtTarget = true,
			FireFromTarget = true,
            

			PreAttackDuration = 0.4,
			FireDuration = 0.0,
			PostAttackDurationMin = 3.0,

			AttackDistance = 9999,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ZagreusBowRapidFire" },
			},
		},
        GodUpgradeWeaponSwap = 
		{
			AphroditeUpgrade = "StoryExpansionTheseusSummonAphrodite",
			AresUpgrade = "StoryExpansionTheseusSummonAres",
			DemeterUpgrade = "StoryExpansionTheseusSummonDemeter",
			PoseidonUpgrade = "StoryExpansionTheseusSummonPoseidon",
			ZeusUpgrade = "StoryExpansionTheseusSummonZeus",
            HestiaUpgrade = "StoryExpansionTheseusSummonHestia",
            HeraUpgrade = "StoryExpansionTheseusSummonHera",
            HephaestusUpgrade = "StoryExpansionTheseusSummonHephaestus",
            ApolloUpgrade = "StoryExpansionTheseusSummonApollo",
		},
	},
    StoryExpansionTheseusSummonAphrodite = 
    {
       Name = "StoryExpansionTheseusSummonAphrodite",
		AIData =
		{
			DeepInheritance = true,

			ProjectileName = "StoryExpansionTheseusSummonAphrodite",

            FireProjectileAtTarget = true,
			FireFromTarget = true,
            

			PreAttackDuration = 0.4,
			FireDuration = 0.0,
			PostAttackDurationMin = 3.0,

			AttackDistance = 9999,
		},
    }
}

OverwriteTableKeys( WeaponData, WeaponSetData )
OverwriteTableKeys( WeaponDataEnemies, WeaponSetData )
