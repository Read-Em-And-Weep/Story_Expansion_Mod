function mod.InsertBeforeInTable(tableArg, insertBefore, value)
    local index = mod.FindTableIndex(tableArg, insertBefore)
    if index then
        return table.insert(tableArg, index, value)
    else
        return table.insert(tableArg, value)
    end
end

function mod.FindTableIndex(tableArg, value)
    for k, v in ipairs(tableArg) do
        if v == value then
            return k
        end
    end
    return nil
end

function mod.AddTableKeysSkipDupes(tableToAddTo, tableToTake, property, order)
	if tableToTake == nil then
		return {}
	end

	local nonDuplicateItems = {}

	if property then
		local propertyLookup = {}

		-- Create a lookup table for the property values in tableToAddTo
		for _, entry in pairs(tableToAddTo) do
			if entry[property] ~= nil then
				propertyLookup[entry[property]] = true
			end
		end

		-- Iterate through tableToTake and add non-duplicate entries to tableToAddTo
		for _, entryToTake in pairs(tableToTake) do
			if entryToTake[property] ~= nil and not propertyLookup[entryToTake[property]] then
				if order ~= nil then
					table.insert(tableToAddTo, sjson.to_object(entryToTake, order))
				else
					table.insert(tableToAddTo, entryToTake)
				end
				table.insert(nonDuplicateItems, entryToTake)
				propertyLookup[entryToTake[property]] = true
			else
			end
		end
	else
		-- Iterate through tableToTake and add non-duplicate keys to tableToAddTo
		for key, value in pairs(tableToTake) do
			if tableToAddTo[key] == nil then
				if value == "nil" then
					tableToAddTo[key] = nil
				else
					tableToAddTo[key] = value
				end
				nonDuplicateItems[key] = value
			else
			end
		end
	end

	return nonDuplicateItems
end
