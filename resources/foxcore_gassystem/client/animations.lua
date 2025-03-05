function playFuelAnimation(source, fuelType)
    local ped = PlayerPedId()
    
    if fuelType == "pump" then
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PETROL_PUMP", 0, true)
    elseif fuelType == "jerrycan" then
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)
    elseif fuelType == "siphoning" then
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true) -- Can be changed
    end

    Citizen.Wait(5000)
    ClearPedTasksImmediately(ped)
end
