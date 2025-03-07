RegisterNetEvent("foxcore_criminal:robstore")
AddEventHandler("foxcore_criminal:robstore", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    -- Check if near a store
    for _, store in pairs(Config.Robbery.Locations) do
        local distance = #(playerCoords - vector3(store.x, store.y, store.z))
        if distance < 2.0 then
            if exports["foxcore_police"]:GetOnlineCops() >= Config.Robbery.RequiredCops then
                -- Start Robbery
                exports["foxcore_ui"]:ShowProgress("Robbing Store...", 15)
                Wait(15000) -- 15 seconds robbery time
                
                -- Chance of Alerting Police
                if math.random(1, 100) <= Config.Robbery.PoliceAlertChance then
                    TriggerServerEvent("foxcore_police:alert", "Robbery in Progress", playerCoords)
                end
                
                -- Give Cash
                TriggerServerEvent("foxcore_inventory:addItem", "cash", math.random(500, 2000))
            else
                exports["foxcore_ui"]:ShowNotification("Not enough cops online!")
            end
            break
        end
    end
end)
