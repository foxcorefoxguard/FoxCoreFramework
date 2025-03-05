RegisterCommand("911", function(source, args)
    local message = table.concat(args, " ")
    local playerCoords = GetEntityCoords(PlayerPedId())
    local location = string.format("X: %.2f, Y: %.2f", playerCoords.x, playerCoords.y)

    -- Default department is police unless specified
    local department = "police"
    if message:match("fire") then department = "fire" end
    if message:match("ems") then department = "ems" end
    if message:match("tow") then department = "tow" end

    TriggerServerEvent("foxcore_radio:emergencyCall", department, playerCoords, message)
end, false)
