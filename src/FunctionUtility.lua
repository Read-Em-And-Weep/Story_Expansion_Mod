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