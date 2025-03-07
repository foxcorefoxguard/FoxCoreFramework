RegisterNetEvent("foxcore_gassystem:useItem")
AddEventHandler("foxcore_gassystem:useItem", function(itemName)
    local src = source
    local ped = GetPlayerPed(src)

    if itemName == "jerrycan" then
        TriggerClientEvent("foxcore_gassystem:refuelFromJerrycan", src)
    elseif itemName == "syphoningkit" then
        TriggerClientEvent("foxcore_gassystem:syphonFuel", src)
    end
end)
