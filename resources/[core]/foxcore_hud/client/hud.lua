local hudVisible = true
local stressLevel = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Update every second

        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed) - 100
        local armor = GetPedArmour(playerPed)
        local hunger, thirst = exports["foxcore_framework"]:GetPlayerNeeds()
        local fuel = exports["foxcore_gassystem"]:GetFuelLevel(GetVehiclePedIsIn(playerPed, false))
        local cash, bank = exports["foxcore_banking"]:GetPlayerMoney()
        local speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(playerPed, false)) * 3.6) -- Convert m/s to km/h
        local inVehicle = IsPedInAnyVehicle(playerPed, false)

        -- Increase stress when driving fast or near police
        if speed > 100 then stressLevel = stressLevel + 2 end
        if IsPedBeingStunned(playerPed) then stressLevel = stressLevel + 5 end

        SendNUIMessage({
            type = "updateHUD",
            health = health,
            armor = armor,
            hunger = hunger,
            thirst = thirst,
            stress = stressLevel,
            fuel = fuel,
            cash = cash,
            bank = bank,
            speed = speed,
            inVehicle = inVehicle
        })
    end
end)


-- Command to Toggle HUD
RegisterCommand("hud", function()
    hudVisible = not hudVisible
    SendNUIMessage({ type = "toggleHUD", visible = hudVisible })
end, false)
