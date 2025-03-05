RegisterCommand("hospitalize", function(source, args)
    local targetPlayer = tonumber(args[1])
    if not targetPlayer then
        TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ Specify player ID!" } })
        return
    end

    TriggerServerEvent("foxcore_ambulance:admitPatient", targetPlayer)
end, false)
