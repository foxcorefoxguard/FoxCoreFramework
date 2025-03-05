RegisterCommand("usemed", function(source, args)
    local item = args[1]
    
    if not item then
        TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ Specify an item: defibrillator, iv_bag, blood_bag, morphine, medkit" } })
        return
    end

    for _, medicalItem in pairs(Config.EMSItems) do
        if medicalItem.name == item then
            if medicalItem.revive then
                TriggerEvent("foxcore_ambulance:useDefibrillator")
            elseif medicalItem.healthRestore then
                local playerPed = PlayerPedId()
                local health = GetEntityHealth(playerPed)
                SetEntityHealth(playerPed, math.min(health + medicalItem.healthRestore, 200))
            elseif medicalItem.painReduction then
                -- Reduce injury effects
            end
            return
        end
    end

    TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ Invalid medical item!" } })
end, false)

RegisterNetEvent("foxcore_ambulance:useMedicalItem")
AddEventHandler("foxcore_ambulance:useMedicalItem", function(item)
    local playerPed = PlayerPedId()
    local health = GetEntityHealth(playerPed)

    if item == "defibrillator" then
        if health == 0 then
            TriggerServerEvent("foxcore_ambulance:revivePlayer")
        end
    elseif item == "iv_bag" or item == "blood_bag" then
        SetEntityHealth(playerPed, math.min(health + 50, 200))
    elseif item == "morphine" then
        -- Reduce pain effects, add addiction chance
    elseif item == "medkit" then
        SetEntityHealth(playerPed, 200)
    end
end)
