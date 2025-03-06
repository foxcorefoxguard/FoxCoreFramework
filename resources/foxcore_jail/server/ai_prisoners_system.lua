RegisterNetEvent('foxcore_jail:assignPrisonerTask')
AddEventHandler('foxcore_jail:assignPrisonerTask', function(target, taskType)
    local src = source
    local targetPed = GetPlayerPed(target)

    if taskType == "fight" then
        TaskCombatPed(targetPed, src, 0, 16)
        TriggerClientEvent('chat:addMessage', src, { args = { "🚨 AI prisoner has started a fight!" } })
    elseif taskType == "sit" then
        TaskStartScenarioInPlace(targetPed, "WORLD_HUMAN_SEAT_WALL", 0, true)
    elseif taskType == "workout" then
        TaskStartScenarioInPlace(targetPed, "WORLD_HUMAN_MUSCLE_FLEX", 0, true)
    end
end)
