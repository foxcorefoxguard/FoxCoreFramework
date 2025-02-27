RegisterNetEvent("foxcore:requestCharacters", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchAll("SELECT id, name FROM characters WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(result)
        TriggerClientEvent("foxcore:openCharacterSelection", src, result)
    end)
end)

RegisterNetEvent("foxcore:loadCharacter", function(charId)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchScalar("SELECT spawn_location FROM characters WHERE id = @charId AND identifier = @identifier", {
        ["@charId"] = charId,
        ["@identifier"] = identifier
    }, function(spawn)
        if spawn then
            TriggerClientEvent("foxcore:spawnCharacter", src, json.decode(spawn))
        else
            TriggerClientEvent("foxcore:spawnCharacter", src, Config.Framework.defaultSpawn)
        end
    end)
end)
