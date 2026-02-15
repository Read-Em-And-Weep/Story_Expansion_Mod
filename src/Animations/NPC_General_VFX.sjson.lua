local newAnimations  = {
{
    Name = "StoryExpansionTheseusWrathSpikeAphrodite",
    InheritFrom = "TheseusWrathSpike",
    Color = { Red = 0.90, Green = 0.2, Blue = 1.0 }
}
}

local AnimationFile = rom.path.combine(rom.paths.Content(), 'Game\\Animations\\NPC_General_VFX.sjson')


for k, newData in pairs(newAnimations) do
    sjson.hook(AnimationFile, function(data)
        table.insert(data.Animations, newData)
    end)
end