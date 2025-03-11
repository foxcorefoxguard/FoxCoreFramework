local isLoading = true

-- Show loading screen when player is connecting
AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        SetNuiFocus(true, true)
        SendNUIMessage({ action = 'show' })
    end
end)

-- Hide loading screen when multicharacter is ready
RegisterNetEvent('foxcore_multicharacter:show')
AddEventHandler('foxcore_multicharacter:show', function()
    if isLoading then
        SendNUIMessage({ action = 'hide' })
        SetNuiFocus(false, false)
        isLoading = false
    end
end)
