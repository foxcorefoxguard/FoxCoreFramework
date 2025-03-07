RegisterCommand("bill", function(source, args)
    local targetPlayer = tonumber(args[1])
    local amount = tonumber(args[2])

    if not targetPlayer or not amount then
        TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ Usage: /bill [ID] [Amount]" } })
        return
    end

    TriggerServerEvent("foxcore_ambulance:sendBill", targetPlayer, amount)
end, false)
