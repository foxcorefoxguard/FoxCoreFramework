RegisterServerEvent("foxcore_multicharacter:loadCharacter")
AddEventHandler("foxcore_multicharacter:loadCharacter", function(characterId)
    local src = source

    MySQL.Async.fetchAll("SELECT * FROM characters WHERE id = @id", {
        ["@id"] = characterId
    }, function(result)
        if result[1] then
            local characterData = {
                spawn = { x = result[1].x, y = result[1].y, z = result[1].z, heading = result[1].heading }
            }

            TriggerClientEvent("foxcore_multicharacter:spawnCharacter", src, characterData)
        end
    end)
end)
