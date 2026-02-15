local horseFile = rom.path.combine(rom.paths.Content(), 'Game\\Animations\\Model\\NPC_Horse_Animation.sjson')

local newAttachments = {
    {
				Name = "Selene_Chariot_Idle",
				ToBone = "Horse_Rig:animRoot_00_M_JNT" ,
			},
			{
				Name = "Melinoe_Chariot_Idle",
				ToBone = "Horse_Rig:animRoot_00_M_JNT" ,
			},
			{
				Name = "Hecate_Chariot_Idle",
				ToBone = "Horse_Rig:animRoot_00_M_JNT" ,
			},

}

sjson.hook(horseFile, function(data)
  for _, entry in ipairs(data.Animations) do
    if entry.Name == "Horse_FlyingIdle_Chronos_Idle" then
        entry.Attachments = sjson.to_object(newAttachments)
    end
  end
end)