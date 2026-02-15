local newAnimations  = {
	 {
    Name = "StoryExpansionMinotaurSwordSwipeOverhead",
      FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\ShadeSwordSwipeOverhead\\ShadeSwordSwipeOverhead",
      Type = "Book",
      Angle = 90.00,
      EndFrame = 23,
      NumFrames = 23,
      PlaySpeed = 60.0,
      StartFrame = 1,
      OriginX = 200.0,
      OriginY = 200.0,
      LocationFromOwner = "Take",
      SortMode = "FromParent",
      IsometricSkew = "Y",
      Scale = 2,
      ScaleFromOwner = "Ignore",
      Ambient = 0.0,
      OverlayVfx = true,
      TimeModifierFraction = 0.75,
      UseAttachedAddColor = false,
      ColorFromOwner = "Ignore",
      CreateAnimations = {
        { Name = "QuickFlashEnemy" }
      }

    },
    {
      Name = "StoryExpansionSpearThrowProjectile",
      CreateAnimation = "SpearThrowProjectileGlow",
      FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\WeaponSwipePointed\\WeaponSwipePointed",
      Type = "Book",
      --VisualFx = "SpearThrowParticles",
      AddColor = true,
      Alpha = 0.0,
      EndGreen = 0.3,
      EndRed = 1.0,
      StartBlue = 0.001,
      StartGreen = 0.2,
      StartRed = 1.0,
      EndFrame = 8,
      HoldLastFrame = true,
      NumFrames = 8,
      PlaySpeed = 30.0,
      StartFrame = 1,
      OriginX = 580.0,
      OriginY = 58.0,
      StartScale = 0.35,
      Ambient = 0.0,
      ActiveVisualFxCap = 35,
      VisualFxDistanceMax = 30.0,
      VisualFxDistanceMin = 20.0,
    },
    {
      Name = "StoryExpansionSpearThrowProjectile_Theseus",
      InheritFrom = "SpearThrowProjectile",
      --CreateAnimation = "SpearThrowProjectileGlow_Theseus"
      --VisualFx = "SpearThrowParticles_Theseus",
      EndBlue = 0.2,
      EndGreen = 0.0,
      EndRed = 0.999,
      StartBlue = 0.6,
      StartGreen = 0.1,
      StartScale = 0.65,
      ActiveVisualFxCap = 50,
    },
    {
      Name = "StoryExpansionTheseusSpearSwipe",
      FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\SpearSwipe\\SpearSwipe",
      Type = "Book",
      AngleChangeAcceleration = -150.00,
      EndFrame = 28,
      NumFrames = 28,
      PlaySpeed = 90.0,
      StartFrame = 1,
      FlipHorizontal = true,
      RotationSpeed = 90.00,
      PostRotateScaleY = 0.6,
      Scale = 2.1,
      ScaleFromOwner = "Ignore",
      Ambient = 0.0,
      CreateAnimations = {
        { Name = "QuickFlashEnemy" }
      },
      Color = { Red = 1.0, Green = 0.0, Blue = 0.4 }
    },

}

local AnimationFile = rom.path.combine(rom.paths.Content(), 'Game\\Animations\\1_General_VFX.sjson')


for k, newData in pairs(newAnimations) do
    sjson.hook(AnimationFile, function(data)
        table.insert(data.Animations, newData)
    end)
end