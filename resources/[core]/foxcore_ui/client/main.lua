RegisterCommand("foxui", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "openUI" })
end, false)

RegisterNUICallback("closeUI", function(_, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("buttonClicked", function(data, cb)
    print("Button clicked: " .. data.button)
    cb("ok")
end)

local isMenuOpen = false

RegisterCommand("radialmenu", function()
    isMenuOpen = not isMenuOpen
    SetNuiFocus(isMenuOpen, isMenuOpen)
    SendNUIMessage({ action = isMenuOpen and "openMenu" or "closeMenu" })
end, false)

RegisterNUICallback("closeMenu", function(_, cb)
    isMenuOpen = false
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("menuOption", function(data, cb)
    print("Selected Option: " .. data.option)

    -- Handle different menu options
    if data.option == "inventory" then
        ExecuteCommand("inventory")
    elseif data.option == "animations" then
        ExecuteCommand("emotes")
    elseif data.option == "vehicle" then
        ExecuteCommand("vehmenu")
    end

    cb("ok")
end)

-- Bind it to a key (F1)
RegisterKeyMapping("radialmenu", "Open Radial Menu", "keyboard", "F1")
