local policeGarages = {
    { x = 450.1, y = -973.5, z = 25.7 },
    { x = 1850.2, y = 3680.5, z = 33.3 }
}

-- 🚔 Open Police Garage
RegisterCommand("policegarage", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    for _, garage in pairs(policeGarages) do
        if #(coords - vector3(garage.x, garage.y, garage.z)) < 5.0 then
            SendNUIMessage({ type = "openGarage" })
            return
        end
    end

    TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ No nearby police garage!" } })
end, false)
