RegisterNetEvent('foxcore_jail:startEscape', function(method)
    local player = PlayerPedId()

    if method == "sewer" then
        SetEntityCoords(player, Config.EscapeMethods["sewer"].x, Config.EscapeMethods["sewer"].y, Config.EscapeMethods["sewer"].z)
        TriggerEvent("chat:addMessage", { args = { "You have escaped through the sewer!" } })
    elseif method == "bribe_guard" then
        if exports['foxcore_banking']:RemoveMoney("cash", 500) then
            TriggerEvent("chat:addMessage", { args = { "You bribed a guard and escaped!" } })
        else
            TriggerEvent("chat:addMessage", { args = { "Not enough money to bribe a guard!" } })
        end
    end
end)
