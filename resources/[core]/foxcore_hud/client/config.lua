Config = {}

-- 🎨 Default HUD Colors
Config.Colors = {
    health = "#ff3838",
    armor = "#4287f5",
    hunger = "#ffa502",
    thirst = "#00d2ff",
    stress = "#ff4d94",      -- New Stress Bar (Pinkish Red)
    fuel = "#ffffff",
    speed = "#ffffff",
    background = "rgba(0, 0, 0, 0.6)",
    text = "#ffffff"
}

-- 🔄 HUD Layout & Position
Config.Layout = {
    position = "left",  -- Options: "left", "center", "right"
    width = "300px",    -- Adjust HUD width
    height = "auto"     -- Auto-size based on content
}

-- 🏎️ HUD Modules
Config.Modules = {
    showHealth = true,
    showArmor = true,
    showHunger = true,
    showThirst = true,
    showStress = true,      -- New Stress Bar
    showFuel = true,
    showSpeedometer = true, -- New Speedometer
    showMinimap = true      -- New Mini-Map Toggle
}

-- 📐 HUD Shapes
Config.Shapes = {
    roundedHUD = true
}

-- 🎨 Command to Change HUD in Game (/hud)
RegisterCommand("hud", function(source, args, rawCommand)
    if args[1] == "color" then
        local element = args[2]
        local color = args[3]
        if Config.Colors[element] then
            Config.Colors[element] = color
            TriggerEvent("chat:addMessage", { args = { "[HUD]", "✅ Changed " .. element .. " color to " .. color } })
        else
            TriggerEvent("chat:addMessage", { args = { "[HUD]", "❌ Invalid HUD element!" } })
        end
    elseif args[1] == "toggle" then
        local module = args[2]
        if Config.Modules[module] ~= nil then
            Config.Modules[module] = not Config.Modules[module]
            local status = Config.Modules[module] and "Enabled" or "Disabled"
            TriggerEvent("chat:addMessage", { args = { "[HUD]", "✅ " .. module .. " " .. status } })
        else
            TriggerEvent("chat:addMessage", { args = { "[HUD]", "❌ Invalid module!" } })
        end
    elseif args[1] == "shape" then
        Config.Shapes.roundedHUD = not Config.Shapes.roundedHUD
        local shape = Config.Shapes.roundedHUD and "Rounded" or "Square"
        TriggerEvent("chat:addMessage", { args = { "[HUD]", "✅ HUD Shape set to " .. shape } })
    elseif args[1] == "position" then
        local newPosition = args[2]
        if newPosition == "left" or newPosition == "center" or newPosition == "right" then
            Config.Layout.position = newPosition
            TriggerEvent("chat:addMessage", { args = { "[HUD]", "✅ HUD moved to " .. newPosition } })
        else
            TriggerEvent("chat:addMessage", { args = { "[HUD]", "❌ Invalid position!" } })
        end
    else
        TriggerEvent("chat:addMessage", { args = { "[HUD]", "❌ Invalid command! Use /hud [color/toggle/shape/position]" } })
    end
end, false)
