local prisoners = {}

-- Function to spawn an AI prisoner
function SpawnPrisoner(coords, heading)
    local pedModel = "s_m_y_prisoner_01"
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(500)
    end

    local prisoner = CreatePed(4, GetHashKey(pedModel), coords.x, coords.y, coords.z, heading, false, true)
    SetEntityInvincible(prisoner, true)
    SetBlockingOfNonTemporaryEvents(prisoner, true)
    TaskWanderStandard(prisoner, 10.0, 10)
    
    table.insert(prisoners, prisoner)
end

-- Spawn AI prisoners when player enters jail
RegisterNetEvent('foxcore_jail:spawnAIPrisoners')
AddEventHandler('foxcore_jail:spawnAIPrisoners', function()
    if Config.AIPrisoners.Enabled then
        for i, loc in ipairs(Config.AIPrisoners.SpawnLocations) do
            if #prisoners < Config.AIPrisoners.MaxPrisoners then
                SpawnPrisoner(loc, loc.heading)
            end
        end
    end
end)

-- Cleanup AI prisoners when player leaves jail
RegisterNetEvent('foxcore_jail:removeAIPrisoners')
AddEventHandler('foxcore_jail:removeAIPrisoners', function()
    for _, ped in pairs(prisoners) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end
    prisoners = {}
end)

-- Trigger AI spawn when entering jail
RegisterNetEvent('foxcore_jail:enteredJail')
AddEventHandler('foxcore_jail:enteredJail', function()
    TriggerEvent('foxcore_jail:spawnAIPrisoners')
end)

-- Trigger AI cleanup when leaving jail
RegisterNetEvent('foxcore_jail:leftJail')
AddEventHandler('foxcore_jail:leftJail', function()
    TriggerEvent('foxcore_jail:removeAIPrisoners')
end)
