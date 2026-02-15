local newProjectiles = {
    {
      Name = "StoryExpansionMinotaur5AxeCombo1",
      InheritFrom = "1_BaseNPCProjectile",
      DetonateGraphic = "null",
      Type = "ARC",
      AttachToOwner = true,
      ArcStart = 80,
      ArcEnd = -130,
      Speed = -1000,
      AffectsEnemies = true,
      AffectsFriends = true,
      AffectsSelf = false,
      CheckUnitImpact = true,
      CheckObstacleImpact = true,
      UnlimitedUnitPenetration = true,
      DamageLow = 50,
      DamageHigh = 120,
      NumPenetrations = 99999,
      CriticalFx = "CriticalHit",
      HitVulnerabilityFx = "Backstab",
      UseArmor = true,
      UseVulnerability = true,
      InvulnerableImpactOwnerVelocity = 300,
      StartFx = "null",
      UseRadialImpact = false,
      ImpactLineOfSightFromOwner = true,
      Thing = {
        Graphic = "null",
        OffsetZ = 70,
        RotateGeometry = true,
        Grip = 999999,
        Points = {
          {
            X = 0,
            Y = 0,
          },
          {
            X = 350,
            Y = 150
          },
          {
            X = 350,
            Y = -150,
          },
        },
      },
      Effects = {
        {
				Name = "MeleeAttackVictimGrip",
				Type = "GRIP",
				Duration = 0.3,
				Modifier = 0.05,
				HaltOnEnd = true,
				Active = true,
			}
    },
    },
    {
      Name = "StoryExpansionMinotaur5AxeCombo2",
      InheritFrom = "StoryExpansionMinotaur5AxeCombo1",
      ArcStart = -80,
      ArcEnd = 130,
      Speed = 1000,
    },
    {
      Name = "StoryExpansionMinotaurOverheadShockwave",
      DetonateGraphic = "EnemyConeAttackLoopEnd",
      Type = "STRAIGHT",
      DetonateSound = "/SFX/Enemy Sounds/EnemyProjectileDetonateExplode",
      AttachToOwner = false,
      StartDelay = 0.0,
      Fuse = 2.25,
      Speed = 1400,
      Range = 900,
      Acceleration = 650,
      AffectsEnemies = true,
      AffectsFriends = false,
      ImpactVelocity = 0,
      NumPenetrations = 9999,
      AffectsSelf = false,
      CheckUnitImpact = true,
      CheckObstacleImpact = true,
      UnlimitedUnitPenetration = true,
      CanBeProjectileDefenseDestroyed = false,
      DamageLow = 40,
      DamageHigh = 80,
      GroupName = "FX_Add_Top",
      DangerDistance = 200,
      Thing = {
        Graphic = "WaveFistFx",
        RotateGeometry = true,
        AttachedAnim = "null",
        Grip = 999999,
        Points = {
          {
            X = 150,
            Y = 120,
          },
          {
            X = 150,
            Y = -120,
          },
          {
            X = -50,
            Y = -40
          },
          {
            X = -50,
            Y = 40
          },
        }
      },
      Effects = {
        {
				Name = "MeleeAttackVictimGrip",
				Type = "GRIP",
				Duration = 0.3,
				Modifier = 0.05,
				HaltOnEnd = true,
				Active = true,
			}
    },
    },
    {
      Name = "StoryExpansionTheseusSpearThrow",
      InheritFrom = "1_BasePlayerSmallProjectile",
      Type = "STRAIGHT",
      AffectsEnemies = true,
      AffectsFriends = false,
      ImpactFx = "EnemyProjectileImpact",
      ImpactSound = "null",
      CheckUnitImpact = true,
      CheckObstacleImpact = true,
      UnlimitedUnitPenetration = true,
      Range = 1200,
      Speed = 4000,
      Acceleration = 0,
      DamageLow = 40,
      DamageHigh = 80,
      ObstacleCollisionCheck = "PolygonContainsPoint",
      DangerDistance = 200,
      ImmunityDuration = 0.1,
      Thing = {
        Graphic = "StoryExpansionSpearThrowProjectile_Theseus",
        OffsetZ = 70,
        AttachedAnim = "SlingShotShadow",
        Grip = 999999,
        Points = {
          {
            X = 0,
            Y = 16
          },
          {
            X = 32,
            Y = 0
          },
          {
            X = 0,
            Y = -16
          },
          {
            X = -32,
            Y = 0
          },
        }
      },
      Effects = {
        {
				Name = "MeleeAttackVictimGrip",
				Type = "GRIP",
				Duration = 0.3,
				Modifier = 0.05,
				HaltOnEnd = true,
				Active = true,
			}
    },
    },
        {
      Name = "StoryExpansionTheseusSpearSpin",
      InheritFrom = "1_BaseProjectile",
      DetonateGraphic = "StoryExpansionTheseusSpearSwipe",
      Type = "STRAIGHT",
      DetonateSound = "null",
      AffectsEnemies = true,
      AffectsFriends = false,
      UnlimitedUnitPenetration = true,
      Range = 5000,
      Speed = 300,
      DamageRadius = 400,
      DamageRadiusScaleY = 0.7,
      DamageRadiusScaleX = 1.1,
      DamageLow = 50,
      DamageHigh = 180,
      ImpactVelocity = 250,
      MultiDetonate = true,
      TotalFuse = 0.4,
      Fuse = 0.2,
      ImpactFx = "HitSparkSwordOrb",
      UseVulnerability = false,
      SilentImpactOnInvulnerable = true,
      NumBounces = 999,
      ReflectOnUnitImpact = false,
      CanBeReflected = false,
      AttachToOwner = true,
      Thing = {
        Graphic = "null",
        OffsetZ = 70,
        Grip = 999999,
      },
    },
    {
		Name = "StoryExpansionHeraclesArcRight01",
		StartFx = "HeraclesMeleeArc",
        DetonateFx = "null",
		Type = "ARC",
		AttachToOwner = true,
		ImpactVelocity = 2200,
		ArcStart = -60,
		ArcEnd = 77,
		Speed = 1100,
		StartDelay = 0.0,
        Damage = 50,
		AffectsEnemies = false,
		AffectsFriends = true,
		AffectsSelf = false,
		CheckUnitImpact = true,
		CheckObstacleImpact = true,
		UnlimitedUnitPenetration = true,
		CanHitWithoutDamage = true,
		NumPenetrations = 99999,
		UseArmor = true,
		UseVulnerability = false,
		InvulnerableImpactOwnerVelocity = 0,
        UseRadialImpact = false,
		ImpactLineOfSightFromOwner = true,
		Thing =
		{
			Graphic = "null",
			OffsetZ = 70,
			RotateGeometry = true,
			GeometryScaleY = 0.5,
			Grip = 999999,
			Points =
			{
				{
					X = 0,
					Y = 0,
				},
				{
					X = 500,
					Y = 125
				},
				{
					X = 550,
					Y = 0
				},
				{
					X = 500,
					Y = -125
				},
            }
		},
Effects =
		{
			
			{
				Name = "KnockbackGrip",
				Type = "GRIP",
				Duration = 0,
				Modifier = 0.01,
				HaltOnEnd = true,
				Active = true,
				CanAffectInvulnerable = true,
			}
        }
	},
    {
		Name = "StoryExpansionHeraclesArcRight01Minotaur",
		StartFx = "HeraclesMeleeArc",
        DetonateFx = "null",
		Type = "ARC",
		AttachToOwner = true,
		ImpactVelocity = 2200,
		ArcStart = -60,
		ArcEnd = 77,
		Speed = 1100,
		StartDelay = 0.0,
        Damage = 60,
		AffectsEnemies = false,
		AffectsFriends = true,
		AffectsSelf = false,
		CheckUnitImpact = true,
		CheckObstacleImpact = true,
		UnlimitedUnitPenetration = true,
		CanHitWithoutDamage = true,
		NumPenetrations = 99999,
		UseArmor = true,
		UseVulnerability = false,
		InvulnerableImpactOwnerVelocity = 0,
        UseRadialImpact = false,
		ImpactLineOfSightFromOwner = true,
		Thing =
		{
			Graphic = "null",
			OffsetZ = 70,
			RotateGeometry = true,
			GeometryScaleY = 0.5,
			Grip = 999999,
			Points =
			{
				{
					X = 0,
					Y = 0,
				},
				{
					X = 500,
					Y = 125
				},
				{
					X = 550,
					Y = 0
				},
				{
					X = 500,
					Y = -125
				},
            }
		},
Effects =
		{
			
			{
				Name = "KnockbackGrip",
				Type = "GRIP",
				Duration = 0,
				Modifier = 0.01,
				HaltOnEnd = true,
				Active = true,
				CanAffectInvulnerable = true,
			}
        }
	},
    	{
		Name = "StoryExpansionTheseusSummon",
		InheritFrom = "1_BaseProjectile",
		DetonateSound = "/Leftovers/Menu Sounds/TextReveal2LOUD",
		DetonateFx = "TheseusWrathSpike",
		Type = "INSTANT",
		Damage = 15,
		DamageRadius = 440.0,
		DamageRadiusScaleY = 0.55,
		BlastSpeed = 800,
		ImpactVelocity = 0.0,
		AutoAdjustForTarget = false,
		UseVulnerability = false,
		NumPenetrations = 999,
		SilentImpactOnInvulnerable = true,
		BlastDuration = 0.3,
		AttachToOwner = false,
		AffectsEnemies = false,
		AffectsFriends = true,
		AffectsSelf = false,
		CheckObstacleImpact = true,
		UnlimitedUnitPenetration = false,
		ClearOnAttackEffects = false,
		UseStartLocation = true,
		Thing =
		{
			Graphic = "TheseusWrathSpike",
			RotateGeometry = false,
			Scale = 1.0,
			Color = 
			{
				Opacity = 1.0
			},
			Points =
			{
				{
					X = 48,
					Y = 48
				},
				{
					X = 48,
					Y = -48
				},
				{
					X = -48,
					Y = -48
				},
				{
					X = -48,
					Y = 48
				},
            }
		}
	},
    {
		Name = "StoryExpansionMinotaurLeap",
		InheritFrom = "1_BaseNPCProjectile",
		Type = "STRAIGHT",
		DetonateSound = "/Leftovers/SFX/BeaconTeleportSFX",
		Fuse = 0,
		AttachToOwner = true,
		AffectsEnemies = false,
		AffectsFriends = true,
		AffectsSelf = false,
		ImpactVelocity = 2500,
		NumPenetrations = 9999,
		CheckUnitImpact = true,
		CheckObstacleImpact = true,
		UnlimitedUnitPenetration = true,
		CanHitWithoutDamage = true,
		Damage = 150,
		ImpactLineOfSight = true,
		StartFx = "HeraclesEMLeapFx",
		Thing =
		{
			Graphic = null,
			OffsetZ = 70,
			RotateGeometry = true,
			Grip = 999999,
			Points =
			{
				{
					X = 400,
					Y = 100
				},
				{
					X = 400,
					Y = -100
				},
				{
					X = -10,
					Y = -40
				},
				{
					X = -10,
					Y = 40
				},
            }
		},
		Effects =
		{
			{
				Name = "KnockbackGrip",
				Type = "GRIP",
				Duration = 0.1,
				Modifier = 0.01,
				HaltOnEnd = true,
				Active = true,
				CanAffectInvulnerable = true,
			},
        },
	}
}

local projectileFile = rom.path.combine(rom.paths.Content(), 'Game/Projectiles/NPC_Projectiles.sjson')

sjson.hook(projectileFile, function(data)
    for _, newProjectileText in ipairs(newProjectiles) do
        table.insert(data.Projectiles, sjson.to_object(newProjectileText))
    end
end)