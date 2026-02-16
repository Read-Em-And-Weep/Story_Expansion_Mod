local newParentSJSONEnemyData = {
    {
        Name = "BaseReadEmAndWeepNPC",
        AutoLockable = false,
        DisplayInEditor = false,
        CosmeticRotationSpeed = 280.0,
        RotationSpeed = 1200.0,
        Speed = 400.0,
        Life =
        {
            HitFx = "HitSparkB",
            HomingEligible = false,
            Invulnerable = true,
            JumpTargetEligible = false,
            TriggerOnHit = true,
        },
        Thing =
        {
            CanBeOccluded = true,
            EditorOutlineDrawBounds = false,
            Graphic = "NPCFemaleThinking",
            Grip = 99999.0,
            SelectionHeight = 240.0,
            SelectionShiftY = -30.0,
            SelectionWidth = 180.0,
            SpeechCapable = true,
            UseBoundsForSortDrawArea = true,
            HighPrioritySfx = true,
            StopsProjectiles = true,
            StopsUnits = true,
            Interact =
            {
                Distance = 250.0,
                OffsetY = -50.0,
            },
            Points =
            {
                { X = 0,   Y = 32 },
                { X = 64,  Y = 0 },
                { X = 0,   Y = -32 },
                { X = -64, Y = 0 },
            },
        },
    },
}

local newSJSONEnemyData = {
    {
        Name = "NPC_Zagreus_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        MoveGraphic = "Enemy_Zagreus_Spear_Run",
        StopGraphic = "Enemy_Zagreus_Spear_RunStop",
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Zagreus_Idle",
            GrannyModel = "ZagreusPresent_Mesh",
            Gravity = 0.0,
            Grip = 2500.0,
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 201,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 21,  Y = 14 },
                { X = 34,  Y = 8 },
                { X = -11, Y = -15 },
                { X = -25, Y = -8 },
            }
        }
    },
    {
        Name = "NPC_Zagreus_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        MoveGraphic = "Enemy_Zagreus_Spear_Run",
        StopGraphic = "Enemy_Zagreus_Spear_RunStop",
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Zagreus_Idle",
            GrannyModel = "ZagreusPresent_Mesh",
            Gravity = 0.0,
            Grip = 2500.0,
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 201,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 21,  Y = 14 },
                { X = 34,  Y = 8 },
                { X = -11, Y = -15 },
                { X = -25, Y = -8 },
            }
        }
    },
    {
        Name = "NPC_Thanatos_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 300.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionThanatosIdleInhouse",
            Tallness = 201.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 9,   Y = 20 },
                { X = 41,  Y = 3 },
                { X = 10,  Y = -12 },
                { X = -22, Y = 4 },
            },
            SubtitleColor = { Red = 0.77, Green = 0.64, Blue = 1.0 }
        }
    },
    {
        Name = "NPC_Thanatos_Field_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 300.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionThanatosIdleInhouse",
            Tallness = 201.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 9,   Y = 20 },
                { X = 41,  Y = 3 },
                { X = 10,  Y = -12 },
                { X = -22, Y = 4 },
            },
            SubtitleColor = { Red = 0.77, Green = 0.64, Blue = 1.0 }
        }
    },
    {
        Name = "NPC_Thanatos_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 300.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionThanatosIdleInhouse",
            Tallness = 201.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 9,   Y = 20 },
                { X = 41,  Y = 3 },
                { X = 10,  Y = -12 },
                { X = -22, Y = 4 },
            },
            SubtitleColor = { Red = 0.77, Green = 0.64, Blue = 1.0 }
        }
    },
    {
        Name = "NPC_Persephone_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Persephone_Idle",
            GrannyModel = "PersephoneEnding_Mesh",
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 165.0,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 4, Y = 26 },
				{ X = 68, Y = -6 },
				{ X = -8, Y = -44 },
				{ X = -72, Y = -12 },
            }
        }
    },
    {
        Name = "NPC_Persephone_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Persephone_Idle",
            GrannyModel = "PersephoneEnding_Mesh",
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 165.0,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 4, Y = 26 },
				{ X = 68, Y = -6 },
				{ X = -8, Y = -44 },
				{ X = -72, Y = -12 },
            }
        }
    },
    {
        Name = "NPC_Nyx_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Nyx_Idle",
            GrannyModel = "Nyx_Mesh",
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 225.0,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 0, Y = 40 },
				{ X = 80, Y = 0 },
				{ X = 0, Y = -40 },
				{ X = -80, Y = 0 },
            }
        }
    },
    {
        Name = "NPC_Nyx_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Nyx_Idle",
            GrannyModel = "Nyx_Mesh",
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 225.0,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 0, Y = 40 },
				{ X = 80, Y = 0 },
				{ X = 0, Y = -40 },
				{ X = -80, Y = 0 },
            }
        }
    },
      {
        Name = "NPC_Achilles_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Achilles_Idle",
            GrannyModel = "Achilles_Mesh",
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 165.0,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 4, Y = 26 },
				{ X = 68, Y = -6 },
				{ X = -8, Y = -44 },
				{ X = -72, Y = -12 },
            }
        }
    },
    {
        Name = "NPC_Achilles_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        DisplayInEditor = true,
        Speed = 640.0,
        RotationSpeed = 720,
        CosmeticRotationSpeed = 470,
        StartGraphic = null,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "Achilles_Idle",
            GrannyModel = "Achilles_Mesh",
            Interact =
            {
                Distance = 150,
                OffsetX = 50,
                OffsetY = -20,
            },
            RotateGeometry = true,
            Tallness = 165.0,
            Offset = { X = 0, Y = 0 },
            Points = {
                { X = 4, Y = 26 },
				{ X = 68, Y = -6 },
				{ X = -8, Y = -44 },
				{ X = -72, Y = -12 },
            }
        }
    },
    {
        Name = "NPC_Megaera_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
                CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionFuryIdleInHouse",
            Tallness = 175.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 9,   Y = 20 },
                { X = 41,  Y = 3 },
                { X = 10,  Y = -12 },
                { X = -22, Y = 4 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Megaera_Field_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionFuryIdleInHouse",
            Tallness = 175.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 9,   Y = 20 },
                { X = 41,  Y = 3 },
                { X = 10,  Y = -12 },
                { X = -22, Y = 4 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Megaera_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionFuryIdleInHouse",
            Tallness = 175.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 9,   Y = 20 },
                { X = 41,  Y = 3 },
                { X = 10,  Y = -12 },
                { X = -22, Y = 4 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Orpheus_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionOrpheusIdle",
            Tallness = 180.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Orpheus_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionOrpheusIdle",
            Tallness = 180.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Dusa_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 800.0,
        RotationSpeed = 800,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionNPCDusaIdle",
            Tallness = 180.0,
            OffsetZ = 80.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Dusa_Frozen_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 800.0,
        RotationSpeed = 800,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionNPCDusaIdle",
            Tallness = 180.0,
            OffsetZ = 80.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Patroclus_Field_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 300.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "NPCShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionPatroclusIdleStanding",
            Tallness = 201.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 9,   Y = 20 },
                { X = 41,  Y = 3 },
                { X = 10,  Y = -12 },
                { X = -22, Y = 4 },
            },
            SubtitleColor = { Red = 0.77, Green = 0.64, Blue = 1.0 }
        }
    },
    {
        Name = "NPC_Eurydice_Hub_Traits_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionEurydiceIdle",
            Tallness = 180.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Hypnos_Hub_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionHypnosAwakeLoop",
            Tallness = 180.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Hypnos_Field_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionHypnosAwakeLoop",
            Tallness = 180.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    {
        Name = "NPC_Sisyphus_Field_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
        CosmeticRotationSpeed = 280.0,
        DisplayInEditor = true,
        NoAllegiance = true,
        Thing =
        {
            AttachedAnim = "MedusaShadow",
            EditorOutlineDrawBounds = false,
            Graphic = "StoryExpansionSisyphusIdle",
            Tallness = 180.0,
            Interact =
            {
                Distance = 200.0
            },
            Points = {
                { X = 4, Y = 12 },
          { X = 43, Y = -7 },
          { X = -13, Y = -35 },
          { X = -52, Y = -16 },
            },
        SubtitleColor = { Red=0.145, Green=0.486, Blue=1.000, Alpha=1.0 }
        }
    },
    --[[{
        Name = "NPC_Minotaur_Field_01_StoryExpansion",
        InheritFrom = "BaseReadEmAndWeepNPC",
    CollisionWeaponRequiredVelocity = 500.0,
      CosmeticRotationSpeed = 360.0,
      DefaultAngle = 210.0,
      DisplayInEditor = true,
      HaltOnSlowMovement = false,
		ImmuneToStun = true,
      --InitiatedCollisionWeapon = "MinotaurBullRushRam",
      StartGraphic = "StoryExpansionMinotaur_Walk",
      MoveGraphic = "StoryExpansionMinotaur_Walk",
      OnTouchdownWeapon = "StoryExpansionMinotaurOverheadTouchdown",
      RotationSpeed = 450.0,
      Speed = 475.0,
      StopGraphic = "StoryExpansionMinotaur_WalkStop",
        MoveAI = 
		{
			LookAheadDistance = 1024.0,
			MoveWithoutPath = true,
			SuccessDistance = 100.0,
            NodeDistance = 16,
			NodeSuccessDistance = 8,
		},
        Thing =
        {
        ActivateGraphic = "EnemyActivate",
        AttachedAnim = "MedusaShadow",
        EditorOutlineDrawBounds = false,
        ExternalForceMultiplier = 0.2,
        Graphic = "StoryExpansionMinotaur_Idle",
        SelectionHeight = 350.0,
        SelectionShiftY = 40.0,
        SpeechCapable = true,
        Tallness = 300.0,
        Points = {
          { X = 0, Y = 30 },
          { X = 60, Y = 0 },
          { X = 0, Y = -30 },
          { X = -60, Y = 0 },
        },
        SubtitleColor = { Red = 0.62, Green = 0.50, Blue = 0.42 },

        }
    },]]
    {
		Name = "NPC_Minotaur_Field_01_StoryExpansion",
		InheritFrom = "BaseReadEmAndWeepNPC",
		DisplayInEditor = true,
		CosmeticRotationSpeed = 470.0,
		RotationSpeed = 1200.0,
		Speed = 500.0,
		ImmuneToStun = true,
		MoveGraphic = "StoryExpansionMinotaur_Walk",
		MoveAI = 
		{
			LookAheadDistance = 512.0,
			MoveWithoutPath = true,
			SuccessDistance = 100.0,
		},
		Thing = 
		{
			AttachedAnim = "NPCShadow",
			HighPrioritySfx = false,
			EditorOutlineDrawBounds = false,
			Graphic = "StoryExpansionMinotaur_Idle",
			Tallness = 165.0,
			Grip = 5000,
			ExternalForceMultiplier = 0.0,
			Scale = 1.2,
			Points =
			{
				{ X = 4, Y = 26 },
				{ X = 68, Y = -6 },
				{ X = -8, Y = -44 },
				{ X = -72, Y = -12 },
            },
		}
	},
    {
		Name = "NPC_Theseus_Field_01_StoryExpansion",
		InheritFrom = "BaseReadEmAndWeepNPC",
		DisplayInEditor = true,
		CosmeticRotationSpeed = 470.0,
		RotationSpeed = 1200.0,
		Speed = 500.0,
		ImmuneToStun = true,
		MoveGraphic = "StoryExpansionTheseus_Walk",
		MoveAI = 
		{
			LookAheadDistance = 512.0,
			MoveWithoutPath = true,
			SuccessDistance = 100.0,
		},
		Thing = 
		{
			AttachedAnim = "NPCShadow",
			HighPrioritySfx = false,
			EditorOutlineDrawBounds = false,
			Graphic = "StoryExpansionTheseus_Idle",
			Tallness = 165.0,
			Grip = 5000,
			ExternalForceMultiplier = 0.0,
			Scale = 1.2,
			Points =
			{
				{ X = 4, Y = 26 },
				{ X = 68, Y = -6 },
				{ X = -8, Y = -44 },
				{ X = -72, Y = -12 },
            },
		}
	}
}


local NPCFile = rom.path.combine(rom.paths.Content(), 'Game\\Units\\Enemies.sjson')

for k, newData in pairs(newParentSJSONEnemyData) do
    sjson.hook(NPCFile, function(data)
        table.insert(data.Units, newData)
    end)
end


for k, newData in pairs(newSJSONEnemyData) do
    sjson.hook(NPCFile, function(data)
        table.insert(data.Units, newData)
    end)
end
