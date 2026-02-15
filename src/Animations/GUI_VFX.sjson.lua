local newAnimations  = {
	{
		Name = "StoryExpansionDeathBackgroundIn",
        FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\DeathBG\\DeathBG",
        StartFrame = 1,
		EndFrame = 26,
		HoldLastFrame = true,
		OffsetY = 50,
		Sound = "/SFX/Menu Sounds/DeathPanelIn",
	},
    {
		Name = "StoryExpansionEurydiceOfferFoodIn",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\Portraits_Eurydice_01",
		Material = "Unlit",
		OffsetX = -640,
		Duration = 0.5,
		EndAlpha = 1.0,
		EndBlue = 1.0,
		EndGreen = 1.0,
		EndRed = 1.0,
		StartAlpha = 0.0,
		StartBlue = 0.0,
		StartGreen = 0.0,
		StartRed = 0.0,
		EndFrame = 1,
		HoldLastFrame = false,
		StartFrame = 1,
		ChainTo = "StoryExpansionEurydiceOfferFoodStatic"
	},
	{
		Name = "StoryExpansionEurydiceOfferFoodStatic",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\Portraits_Eurydice_01",
		Material = "Unlit",
		OffsetX = -640,
		Loop = true,
		EndFrame = 1,
		HoldLastFrame = false,
		StartFrame = 1,
	},
	{
		Name = "StoryExpansionEurydiceOfferFoodOut",
		FilePath = "ReadEmAndWeep-Story_ExpansionGUI\\Portraits_Eurydice_01",
		Material = "Unlit",
		OffsetX = -640,
		Duration = 0.5,
		Loop = true,
		EndAlpha = 0.0,
		EndBlue = 0.0,
		EndGreen = 0.0,
		EndRed = 0.0,
		StartAlpha = 1.0,
		StartBlue = 1.0,
		StartGreen = 1.0,
		StartRed = 1.0,
		EndFrame = 1,
		HoldLastFrame = false,
		StartFrame = 1,
	},
}

local AnimationFile = rom.path.combine(rom.paths.Content(), 'Game\\Animations\\GUI_VFX.sjson')


for k, newData in pairs(newAnimations) do
    sjson.hook(AnimationFile, function(data)
        table.insert(data.Animations, newData)
    end)
end