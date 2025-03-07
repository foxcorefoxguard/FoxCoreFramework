RegisterNetEvent('foxcore_mechanic:salvagePart')
AddEventHandler('foxcore_mechanic:salvagePart', function(partType)
    local partData = Config.Salvaging.SalvageParts[partType]
    
    if partData then
        local chance = math.random(100)
        if chance <= partData.chance then
            for _, material in pairs(partData.materials) do
                exports['foxcore_inventory']:AddItem(material, math.random(1, 3))
            end
            TriggerEvent("chat:addMessage", { args = { "You salvaged parts successfully!" } })
        else
            TriggerEvent("chat:addMessage", { args = { "The part was too damaged to salvage." } })
        end
    end
end)
