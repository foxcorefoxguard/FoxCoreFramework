local MySQL = exports['oxmysql']

-- 📌 Register Server Events for Target Interactions
RegisterNetEvent("foxcore_target:logInteraction")
AddEventHandler("foxcore_target:logInteraction", function(playerId, targetType, entityName)
    local identifier = GetPlayerIdentifier(playerId, 0)
    print("^2[FoxCore Target]^7 Player ^5" .. identifier .. "^7 interacted with ^3" .. entityName .. " (" .. targetType .. ")")
end)

-- 🏦 Open Banking from ATM
RegisterNetEvent("foxcore_target:useATM")
AddEventHandler("foxcore_target:useATM", function()
    local src = source
    TriggerClientEvent("foxcore_banking:openBankUI", src)
end)

-- 🛒 Open Cash Register (For Businesses)
RegisterNetEvent("foxcore_target:useCashRegister")
AddEventHandler("foxcore_target:useCashRegister", function()
    local src = source
    TriggerClientEvent("foxcore_banking:openCashRegisterUI", src)
end)

-- 🗣️ Talk to NPC
RegisterNetEvent("foxcore_target:talkToNPC")
AddEventHandler("foxcore_target:talkToNPC", function(npcType)
    local src = source
    local npcDialogues = {
        ["shopkeeper"] = "Welcome to the store! How can I help you?",
        ["security"] = "Stay safe out there. Keep your belongings secure."
    }
    
    local response = npcDialogues[npcType] or "Hello there!"
    TriggerClientEvent("chat:addMessage", src, { args = { "[NPC]", response } })
end)

-- 🌐 Sync Targeting Data with Clients
RegisterNetEvent("foxcore_target:syncTargets")
AddEventHandler("foxcore_target:syncTargets", function()
    local src = source
    TriggerClientEvent("foxcore_target:setupInteractions", src)
end)
