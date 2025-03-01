Utils = {}

-- Function to draw text on screen
function Utils.DrawText3D(coords, text, scale)
    local x, y, z = table.unpack(coords)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

-- Function to check if the player is near a given location
function Utils.IsNearCoords(coords, range)
    local playerCoords = GetEntityCoords(PlayerPedId())
    return #(playerCoords - coords) < range
end

-- Function to display notifications
function Utils.ShowNotification(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, true)
end
