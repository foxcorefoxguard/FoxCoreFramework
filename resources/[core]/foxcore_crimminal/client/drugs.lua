RegisterNetEvent("foxcore_criminal:dealdrugs")
AddEventHandler("foxcore_criminal:dealdrugs", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, loc in pairs(Config.Drugs.SellLocations) do
        if #(playerCoords - vector3(loc.x, loc.y, loc.z)) < 2.0 then
            exports["foxcore_ui"]:ShowProgress("Selling Drugs...", 10)
            Wait(10000)

            -- Chance of Alerting Police
            if math.random(1, 100) <= 50 then
                TriggerServerEvent("foxcore_police:alert", "Drug Dealing in Progress", playerCoords)
            end

            -- Give Cash
            TriggerServerEvent("foxcore_inventory:addItem", "cash", math.random(500, 1500))
            exports["foxcore_ui"]:ShowNotification("Drugs Sold Successfully!")
            return
        end
    end

    exports["foxcore_ui"]:ShowNotification("No customers here.")
end)
