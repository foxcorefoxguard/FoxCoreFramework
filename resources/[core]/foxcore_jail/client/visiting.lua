RegisterNetEvent('foxcore_jail:startVisiting')
AddEventHandler('foxcore_jail:startVisiting', function()
    local visitingLocation = Config.Visiting.VisitingLocation
    SetEntityCoords(PlayerPedId(), visitingLocation.x, visitingLocation.y, visitingLocation.z)
    print("✅ You are now in the visiting area.")
end)
