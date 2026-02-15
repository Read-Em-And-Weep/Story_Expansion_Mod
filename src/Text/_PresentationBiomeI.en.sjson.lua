local textFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/_PresentationBiomeI.en.sjson')

sjson.hook(textFile, function(data)
  for _, entry in ipairs(data.Texts) do
    if entry.Id == "Storyteller_0523" then
      entry.DisplayName = "{#Emph}And so, the Princess of the Dead remained in the House of Hades with her rescued family members, to aid in the recovery of however much was not forever lost."
    elseif entry.Id == "Storyteller_0517" then
        entry.DisplayName = "{#Emph}The rightful Underworld King and Queen were swift to organize this relatively painless task, and Shades of the Dead still loyal to their cause answered the call."
    elseif entry.Id == "Storyteller_0524" then
        entry.DisplayName = "{#Emph}They all picked up many pieces of the past..."
    elseif entry.Id == "Storyteller_0525" then
        entry.DisplayName = "{#Emph}...and soon, the House grew more like how it used to be. But then, a summons from Olympus arrived, and the Princess knew her stay had reached its end..."
    end
  end
end)


