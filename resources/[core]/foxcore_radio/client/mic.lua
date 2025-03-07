local isTalking = false

-- 🎙️ Play Mic Click Sound
function playMicClick(sound)
    SendNUIMessage({ type = "playSound", sound = sound })
end

-- 📡 Start Transmission
RegisterNetEvent("foxcore_radio:startTransmission")
AddEventHandler("foxcore_radio:startTransmission", function()
    if Config.Radio.OverTalkPrevention and isTalking then
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "❌ Someone else is already talking!" } })
        return
    end

    isTalking = true
    if Config.MicClicks.Enable then playMicClick(Config.MicClicks.ClickOn) end
end)

-- 🎙️ Stop Transmission
RegisterNetEvent("foxcore_radio:stopTransmission")
AddEventHandler("foxcore_radio:stopTransmission", function()
    isTalking = false
    if Config.MicClicks.Enable then playMicClick(Config.MicClicks.ClickOff) end
end)
