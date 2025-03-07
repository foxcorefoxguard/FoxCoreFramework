RegisterNetEvent("foxcore_target:setupInteractions")
AddEventHandler("foxcore_target:setupInteractions", function()
    exports['foxcore_target']:AddTargetModel({
        models = {
            "prop_atm_01", "prop_atm_02", "prop_atm_03", "prop_fleeca_atm"
        },
        options = {
            {
                event = "foxcore_banking:openATM",
                icon = "fas fa-credit-card",
                label = "Use ATM",
            }
        },
        distance = 1.5
    })

    exports['foxcore_target']:AddTargetModel({
        models = {
            "prop_till_01", "prop_till_02"
        },
        options = {
            {
                event = "foxcore_banking:openCashRegister",
                icon = "fas fa-cash-register",
                label = "Access Register",
            }
        },
        distance = 1.5
    })

    exports['foxcore_target']:AddTargetNPC({
        npcModels = {
            "mp_m_shopkeep_01", "s_m_m_highsec_01"
        },
        options = {
            {
                event = "foxcore_npc:talk",
                icon = "fas fa-user",
                label = "Talk to NPC",
            }
        },
        distance = 2.0
    })
end)

RegisterNetEvent("foxcore_npc:talk")
AddEventHandler("foxcore_npc:talk", function()
    TriggerEvent("chat:addMessage", { args = { "[NPC]", "Hello! How can I help you?" } })
end)
