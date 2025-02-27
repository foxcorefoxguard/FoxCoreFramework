local playerSettings = {}

RegisterServerEvent('foxcore_phone:saveBackground')
AddEventHandler('foxcore_phone:saveBackground', function(data)
    local src = source
    local background = data.background
    local identifier = GetPlayerIdentifier(src, 0)

    playerSettings[identifier] = playerSettings[identifier] or {}
    playerSettings[identifier].background = background

    MySQL.Async.execute('UPDATE phone_settings SET background = ? WHERE identifier = ?', {background, identifier})
end)

RegisterServerEvent('foxcore_phone:saveFrame')
AddEventHandler('foxcore_phone:saveFrame', function(data)
    local src = source
    local frame = data.frame
    local identifier = GetPlayerIdentifier(src, 0)

    playerSettings[identifier] = playerSettings[identifier] or {}
    playerSettings[identifier].frame = frame

    MySQL.Async.execute('UPDATE phone_settings SET frame = ? WHERE identifier = ?', {frame, identifier})
end)

RegisterServerEvent('foxcore_phone:getSavedSettings')
AddEventHandler('foxcore_phone:getSavedSettings', function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    if playerSettings[identifier] then
        TriggerClientEvent('foxcore_phone:loadSettings', src, playerSettings[identifier])
    else
        MySQL.Async.fetchAll('SELECT * FROM phone_settings WHERE identifier = ?', {identifier}, function(result)
            if result[1] then
                playerSettings[identifier] = {
                    background = result[1].background,
                    frame = result[1].frame
                }
            else
                playerSettings[identifier] = { background = "default.jpg", frame = "default.png" }
                MySQL.Async.execute('INSERT INTO phone_settings (identifier, background, frame) VALUES (?, ?, ?)', 
                {identifier, "default.jpg", "default.png"})
            end
            TriggerClientEvent('foxcore_phone:loadSettings', src, playerSettings[identifier])
        end)
    end
end)
