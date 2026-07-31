local newAnimations = {
	{
		Name = "StoryExpansionOathScreenBackground",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\MegOathScreenBackground",
		Material = "Unlit",
	},
    {
		Name = "StoryExpansionBoonSymbolThanatos",
		InheritFrom = "BoonSymbolBase",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\ThanatosIcon",
		Scale = 1,
		OffsetY = -3,
	},
	{
		Name = "StoryExpansionFateManipulationSpool",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\FateManipulationSpool",
		Scale = 1,
		OffsetY = -3,
	},
	{
		Name = "StoryExpansionFateManipulationThread",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\FateManipulationThread",
		Scale = 1,
		OffsetY = -3,
	},
	{
		Name = "StoryExpansionFateManipulationWrap",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\FateManipulationWrap",
		Scale = 1,
		OffsetY = -75,
		RotationSpeed = 2,
		RandomRotation = true,
		Loop = true,
		PingPongScale = true,
		StartScale = 0.95,
		Alpha = 0.75,
		Duration = 6,
		OnlyWhenVisible = true,
	},
	{
		Name = "StoryExpansionBoonSymbolGlow",
		
		FilePath = "Particles\\particle_glow",
		Material = "Unlit",
		GroupName = "Combat_Menu_TraitTray_Additive",
		StartScale = 1.1,
		EndScale = 1.2,
		StartAlpha = 0.8,
		EndAlpha = 1.0,
		PingPongScale = true,
		PingPongColor = true,
		Duration = 8,
		Loop = true,
		DieWithOwner = true,
		Scale = 2,
		OffsetY = -75,
		Alpha = 0.5,
	},
	--[[{
		Name = "StoryExpansionHouseRenovation",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\House_Renovation_01",
		Material = "Unlit",
		Duration = 1,
		Loop = true,
		VisualFx = "HouseRenovationGlows",
		VisualFxIntervalMin = 0.15,
		VisualFxIntervalMax = 0.2,
	},]]
}

local AnimationFile = rom.path.combine(rom.paths.Content(), 'Game\\Animations\\GUI_Screens_VFX.sjson')


for k, newData in pairs(newAnimations) do
    sjson.hook(AnimationFile, function(data)
        table.insert(data.Animations, newData)
    end)
end