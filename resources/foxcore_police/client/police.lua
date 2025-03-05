local onDuty = false

-- 🛡️ Toggle Police Duty
RegisterCommand("duty", function()
    onDuty = not onDuty
    TriggerServerEvent("foxcore_police:setDutyStatus", onDuty)
    TriggerEvent("chat:addMessage", { args = { "[PD]", onDuty and "🚔 On Duty" or "❌ Off Duty" } })
end, false)

-- 🚔 Arrest a Suspect
RegisterCommand("arrest", function(source, args)
    if not onDuty then return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ You must be on duty!" } }) end
    local targetId = tonumber(args[1])
    if targetId then
        TriggerServerEvent("foxcore_police:arrest", targetId)
    else
        TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ Invalid Player ID!" } })
    end
end, false)

-- 📡 Open MDT from Command
RegisterCommand("mdt", function()
    if not onDuty then return TriggerEvent("chat:addMessage", { args = { "[PD]", "❌ You must be on duty!" } }) end
    TriggerEvent("foxcore_mdt:openMDT")
end, false)
