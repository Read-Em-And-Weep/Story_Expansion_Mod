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
		Name = "StoryExpansionHouseRenovation",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\House_Renovation_01",
		Material = "Unlit",
		Duration = 1,
		Loop = true,
		VisualFx = "HouseRenovationGlows",
		VisualFxIntervalMin = 0.15,
		VisualFxIntervalMax = 0.2,
	}

}

local AnimationFile = rom.path.combine(rom.paths.Content(), 'Game\\Animations\\GUI_Screens_VFX.sjson')


for k, newData in pairs(newAnimations) do
    sjson.hook(AnimationFile, function(data)
        table.insert(data.Animations, newData)
    end)
end