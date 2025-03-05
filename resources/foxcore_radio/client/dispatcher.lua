RegisterNetEvent("foxcore_radio:playTTS")
AddEventHandler("foxcore_radio:playTTS", function(voice, message)
    SendNUIMessage({ type = "playTTS", voice = voice, text = message })
end)

RegisterNetEvent("foxcore_radio:setGPSMarker")
AddEventHandler("foxcore_radio:setGPSMarker", function(department, location)
    local playerJob = exports["foxcore_framework"]:GetPlayerJob()
    if Config.Dispatcher.Departments[department] and playerJob == department then
        local blip = AddBlipForCoord(location.x, location.y, location.z)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 1)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Emergency Call")
        EndTextCommandSetBlipName(blip)
    end
end)
