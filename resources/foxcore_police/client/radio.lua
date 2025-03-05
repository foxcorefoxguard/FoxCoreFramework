local isRadioOpen = false

-- 📻 Toggle Police Radio
RegisterCommand("radio", function()
    if not exports["foxcore_framework"]:IsPlayerOnDuty() then
        return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ You must be on duty to use the radio!" } })
    end

    isRadioOpen = not isRadioOpen
    SendNUIMessage({ type = isRadioOpen and "openRadio" or "closeRadio" })
end, false)

-- 📡 Send Dispatch Message
RegisterCommand("dispatch", function(source, args)
    if #args < 1 then
        return TriggerEvent("chat:addMessage", { args = { "[Dispatch]", "❌ Invalid Message!" } })
    end

    local message = table.concat(args, " ")
    TriggerServerEvent("foxcore_police:sendDispatch", message)
end, false)

-- 📡 Receive Dispatch Alerts
RegisterNetEvent("foxcore_police:receiveDispatch")
AddEventHandler("foxcore_police:receiveDispatch", function(message)
    SendNUIMessage({ type = "receiveDispatch", message = message })
end)
