RegisterNetEvent("foxcore:initializePlayer", function(playerData)
    Framework.Debug("Initializing player: " .. playerData.identifier)
    SetEntityCoords(PlayerPedId(), Config.Framework.defaultSpawn)
end)
