local newWeapons = {
{
      Name = "StoryExpansionMinotaur5AxeCombo1",
      InheritFrom = "1_BasePlayerSlowWeapon",
      Type = "GUN",
      Projectile = "StoryExpansionMinotaur5AxeCombo1",
      ClipSize = 1,
      RootOwnerWhileFiring = false,
      BlockMoveInput = false,
      CancelMovement = false,
      ChargeCancelMovement = false,
      FullyAutomatic = true,
      FireGraphic = "null",
      NumProjectiles = 1,
      ChargeFx = "null",
      FireFx = "HeraclesMeleeArc",
      FireSound = "null",
      SelfVelocity = 1450,
      BarrelLength = 0,
    },
    {
      Name = "StoryExpansionMinotaur5AxeCombo2",
      InheritFrom = "StoryExpansionMinotaur5AxeCombo1",
      Projectile = "StoryExpansionMinotaur5AxeCombo2",
      FireFx = "HeraclesMeleeArc",
    },
    {
      Name = "StoryExpansionMinotaur5AxeCombo3",
      InheritFrom = "StoryExpansionMinotaur5AxeCombo1",
      Projectile = "null",
      SelfVelocity = 2250,
      SelfVelocityCap = 2250,
      SelfUpwardVelocity = 1100,
      FireFx = "null",
    },
    {
      Name = "StoryExpansionMinotaurOverheadTouchdown",
      InheritFrom = "1_BasePlayerSlowWeapon",
      Type = "GUN",
      ClipSize = 1,
      RootOwnerWhileFiring = false,
      BlockMoveInput = false,
      CancelMovement = false,
      ChargeCancelMovement = false,
      FullyAutomatic = true,
      NumProjectiles = 1,
      ChargeFx = "null",
      FireSound = "null",
      BarrelLength = 0,
      Projectile = "StoryExpansionMinotaurOverheadTouchdown",
      FireFx = "EnemyHeavySlash",
      FireGraphic = "StoryExpansionMinotaurAttackSwings_AttackLeap",
    },
    {
      Name = "StoryExpansionMinotaur5AxeCombo4",
      InheritFrom = "StoryExpansionMinotaur5AxeCombo1",
    },
    {
      Name = "StoryExpansionMinotaur5AxeCombo5",
      InheritFrom = "StoryExpansionMinotaur5AxeCombo2",
    },
        {
      Name = "StoryExpansionMinotaurOverheadShockwave",
      InheritFrom = "1_BasePlayerSlowWeapon",
      Type = "GUN",
      Projectile = "StoryExpansionMinotaurOverheadShockwave",
      ClipSize = 1,
      ChargeSound = "null",
      FireSound = "/SFX/HellFireShoot",
      RootOwnerWhileFiring = true,
      BlockMoveInput = true,
      CancelMovement = true,
      ChargeCancelMovement = true,
      FullyAutomatic = false,
      BarrelLength = 400,
      AutoLock = true,
      FireGraphic = "null",
      FireFx = "StoryExpansionMinotaurSwordSwipeOverhead",
      LockTriggerForCharge = false,
      DisableOwnerForDuration = 0.3,
      NumProjectiles = 3,
      ProjectileAngleOffset = 180,
      ProjectileInterval = 0.0,
      ProjectileAngleStartOffset = 90,
      SelfVelocity = 0,
    }

}

local weaponFile = rom.path.combine(rom.paths.Content(), 'Game/Weapons/Weapons.sjson')

sjson.hook(weaponFile, function(data)
    for _, newWeaponText in ipairs(newWeapons) do
        table.insert(data.Weapons, sjson.to_object(newWeaponText))
    end
end)