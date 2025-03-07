local isMenuOpen = false

-- 📌 Open Radial Menu
RegisterKeyMapping('openRadialMenu', 'Open Radial Menu', 'keyboard', Config.MenuKey)
RegisterCommand("openRadialMenu", function()
    if isMenuOpen then return end
    isMenuOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({ type = "openMenu", actions = Config.Actions })
end, false)

-- ❌ Close Radial Menu
RegisterNUICallback("closeMenu", function()
    isMenuOpen = false
    SetNuiFocus(false, false)
end)

-- 🔄 Handle Menu Selections
RegisterNUICallback("menuSelect", function(data)
    local selectedAction = data.action
    TriggerEvent(selectedAction)
    TriggerServerEvent(selectedAction)
end)
