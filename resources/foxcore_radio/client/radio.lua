local isRadioActive = false
local currentChannel = Config.Radio.DefaultChannel
local radioColor = Config.UI.DefaultColor
local radioAnimation = "default"
local radioSignal = 100  -- Full signal by default

-- 🎧 Toggle Radio On/Off
RegisterCommand("radio", function()
    isRadioActive = not isRadioActive
    SendNUIMessage({ type = "toggleRadio", active = isRadioActive })
end, false)

-- 📡 Change Radio Channel
RegisterCommand("setchannel", function(source, args)
    local channel = tonumber(args[1])
    if not channel or channel < 1 or channel > Config.Radio.MaxChannels then
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "❌ Invalid Channel!" } })
        return
    end

    currentChannel = channel
    SendNUIMessage({ type = "updateChannel", channel = channel })
end, false)

-- 🎨 Change Radio UI Color
RegisterCommand("setradiocolor", function(source, args)
    local color = args[1]
    if not color or not Config.UI.AvailableColors[color] then
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "❌ Invalid Color!" } })
        return
    end

    radioColor = color
    SendNUIMessage({ type = "updateColor", color = color })
end, false)

-- 🎭 Change Radio Animation
RegisterCommand("setradioanim", function(source, args)
    local anim = args[1]
    if not anim or not Config.RadioAnimations[anim] then
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "❌ Invalid Animation!" } })
        return
    end

    radioAnimation = Config.RadioAnimations[anim]
end, false)

-- 📡 Enable Radio Animation While Transmitting
RegisterNetEvent("foxcore_radio:startTransmission")
AddEventHandler("foxcore_radio:startTransmission", function()
    if isRadioActive then
        local playerPed = PlayerPedId()
        RequestAnimDict("random@arrests")
        while not HasAnimDictLoaded("random@arrests") do
            Wait(100)
        end
        TaskPlayAnim(playerPed, "random@arrests", radioAnimation, 3.0, -1, -1, 49, 0, false, false, false)
    end
end)

-- 🚗 Detect If Player is in Vehicle & Use Dashboard Radio
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            SendNUIMessage({ type = "setRadioMode", mode = "car" })
        else
            SendNUIMessage({ type = "setRadioMode", mode = "handheld" })
        end
    end
end)

-- 📡 Calculate Signal Strength Based on Distance
Citizen.CreateThread(function()
    while Config.Radio.SignalStrength do
        Citizen.Wait(3000)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        -- Calculate distance from nearest radio tower (mocked location)
        local towerLocation = vector3(100.0, 100.0, 100.0)
        local distance = #(coords - towerLocation)

        if distance < 500 then
            radioSignal = 100
        elseif distance < 1000 then
            radioSignal = 80
        elseif distance < 2000 then
            radioSignal = 50
        else
            radioSignal = 20 -- Weakest signal
        end

        SendNUIMessage({ type = "updateSignal", signal = radioSignal })
    end
end)
