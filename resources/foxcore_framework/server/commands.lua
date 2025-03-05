RegisterCommand("revive", function(source, args, rawCommand)
    if not Permissions.HasPermission(source, 2) then
        print("^1[FoxCore]^7 You do not have permission to use this command!")
        return
    end

    local target = tonumber(args[1]) or source
    if GetPlayerName(target) then
        TriggerClientEvent("foxcore:revivePlayer", target)
        Framework.Debug("Revived player: " .. target)
    else
        print("^1[FoxCore]^7 Invalid player ID!")
    end
end, false)

RegisterCommand("tp", function(source, args, rawCommand)
    if not Permissions.HasPermission(source, 2) then
        print("^1[FoxCore]^7 You do not have permission to use this command!")
        return
    end

    local target = tonumber(args[1])
    if target and GetPlayerName(target) then
        local playerPed = GetPlayerPed(source)
        local targetPed = GetPlayerPed(target)
        local targetCoords = GetEntityCoords(targetPed)
        SetEntityCoords(playerPed, targetCoords)
        Framework.Debug("Teleported to player: " .. target)
    else
        print("^1[FoxCore]^7 Invalid player ID!")
    end
end, false)


RegisterCommand("announce", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message and message ~= "" then
        TriggerClientEvent("foxcore:sendAnnouncement", -1, message)
        Framework.Debug("Announcement sent: " .. message)
    else
        print("^1[FoxCore]^7 Usage: /announce <message>")
    end
end, false)
