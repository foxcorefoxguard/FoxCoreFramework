RegisterNetEvent("foxcore_radio:emergencyCall")
AddEventHandler("foxcore_radio:emergencyCall", function(department, location, message)
    local src = source
    local job = exports["foxcore_framework"]:GetPlayerJob(src)

    if not Config.Dispatcher.EnableAI then return end

    -- Ensure department exists in the config
    local dispatchConfig = Config.Dispatcher.Departments[department]
    if not dispatchConfig then return end

    -- Generate AI dispatcher message
    local dispatchMessage = string.format(
        "%s: Emergency reported at %s. Details: %s",
        dispatchConfig.keyword, location, message
    )

    -- Send TTS to all on-duty personnel
    TriggerClientEvent("foxcore_radio:playTTS", -1, dispatchConfig.voice, dispatchMessage)

    -- Send GPS ping to all units in that department
    TriggerClientEvent("foxcore_radio:setGPSMarker", -1, department, location)
end)

RegisterNetEvent("foxcore_radio:emergencyCall")
AddEventHandler("foxcore_radio:emergencyCall", function(department, location, message)
    local src = source

    -- Ensure department exists
    local dispatchConfig = Config.Dispatcher.Departments[department]
    if not dispatchConfig then return end

    -- Log Call to MDT
    TriggerEvent("foxcore_mdt:addCall", {
        department = department,
        location = location,
        description = message,
        reportedBy = GetPlayerName(src)
    })

    -- AI Dispatcher Broadcast
    local dispatchMessage = string.format(
        "%s: Emergency at %s. Details: %s",
        dispatchConfig.keyword, location, message
    )

    TriggerClientEvent("foxcore_radio:playTTS", -1, dispatchConfig.voice, dispatchMessage)
    TriggerClientEvent("foxcore_radio:setGPSMarker", -1, department, location)
end)
