Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) -- ✅ Reduce Tick Rate (Less CPU Usage)

        local playerPed = PlayerPedId()
        if IsPedInjured(playerPed) then
            TriggerEvent("foxcore_ambulance:updateInjuryStatus")
        end
    end
end)
