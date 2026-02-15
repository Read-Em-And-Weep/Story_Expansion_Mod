local newAnimations  = {
	 {
      Name = "StoryExpansionBoonSelectEurydice",
      InheritFrom = "1_BaseGUIObstacle",
      DisplayInEditor = false,
      Thing =
      {
        EditorOutlineDrawBounds = false,
        Graphic = "StoryExpansionEurydiceOfferFoodIn",
      }
    }
}

local AnimationFile = rom.path.combine(rom.paths.Content(), 'Game\\Obstacles\\GUI.sjson')


for k, newData in pairs(newAnimations) do
    sjson.hook(AnimationFile, function(data)
        table.insert(data.Obstacles, newData)
    end)
end