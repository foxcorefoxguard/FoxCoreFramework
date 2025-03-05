local isRadioVisible = false
local radioColor = Config.UI.DefaultColor
local radioMode = "handheld"

-- 📡 Toggle Radio UI
RegisterCommand("toggleradio", function()
    isRadioVisible = not isRadioVisible
    SendNUIMessage({ type = "toggleRadio", active = isRadioVisible })
end, false)

-- 🎨 Change Radio Color from UI
RegisterNUICallback("changeColor", function(data)
    if Config.UI.AvailableColors[data.color] then
        radioColor = data.color
        SendNUIMessage({ type = "updateColor", color = radioColor })
    end
end)

-- 🎭 Change Radio Animation from UI
RegisterNUICallback("changeAnimation", function(data)
    if Config.RadioAnimations[data.animation] then
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "🎭 Animation set to: " .. data.animation } })
        ExecuteCommand("setradioanim " .. data.animation)
    end
end)

-- 🚗 Detect If Player is in Vehicle & Use Dashboard Radio
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)  -- Optimized loop
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            if radioMode ~= "car" then
                radioMode = "car"
                SendNUIMessage({ type = "setRadioMode", mode = "car" })
            end
        else
            if radioMode ~= "handheld" then
                radioMode = "handheld"
                SendNUIMessage({ type = "setRadioMode", mode = "handheld" })
            end
        end
    end
end)
