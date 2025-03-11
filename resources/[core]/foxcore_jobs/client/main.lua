local interacted = false

-- 🧩 Function to spawn job ped and blip
local function spawnJobPedAndBlip(job)
    -- Spawn Ped
    local pedModel = GetHashKey(job.ped)
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(10)
    end

    local ped = CreatePed(0, pedModel, job.location.x, job.location.y, job.location.z - 1, 0.0, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

    -- Create Blip
    local blip = AddBlipForCoord(job.location.x, job.location.y, job.location.z)
    SetBlipSprite(blip, job.blip.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, job.blip.scale)
    SetBlipColour(blip, job.blip.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(job.blip.name)
    EndTextCommandSetBlipName(blip)
end

-- 🧩 Job Interaction
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for _, job in pairs(FoxCoreJobs.List) do
            local dist = #(playerCoords - job.location)
            if dist < 2.0 then
                DrawText3D(job.location.x, job.location.y, job.location.z, "~g~[E]~s~ to start " .. job.label)

                if IsControlJustReleased(0, 38) and not interacted then -- E key
                    interacted = true
                    if job.requireHiring then
                        TriggerEvent('ox_lib:notify', { title = "Job", description = "You need to be hired for this job!", type = 'error' })
                    else
                        startJob(job)
                    end
                    Wait(2000)
                    interacted = false
                end
            end
        end
    end
end)

-- 🧩 Job Processing
local function startJob(job)
    local playerPed = PlayerPedId()
    
    -- Simple animation to simulate task
    TaskStartScenarioInPlace(playerPed, "world_human_gardener_plant", 0, true)
    Wait(5000)
    ClearPedTasks(playerPed)

    -- Reward payout
    TriggerServerEvent("foxcore_jobs:givePayout", job.id)
end

-- 🧩 3D Text Display
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- 🧩 Initial Setup
Citizen.CreateThread(function()
    for _, job in pairs(FoxCoreJobs.List) do
        spawnJobPedAndBlip(job)
    end
end)
