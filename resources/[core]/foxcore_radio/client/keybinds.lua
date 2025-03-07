local Keybinds = Config.Keybinds

-- 📡 Register FiveM Keybinds
RegisterKeyMapping("toggleradio", "Toggle Radio", "keyboard", Keybinds.OpenRadio)
RegisterKeyMapping("startradio", "Talk on Radio", "keyboard", Keybinds.TalkOnRadio)
RegisterKeyMapping("setchannel", "Change Radio Channel", "keyboard", Keybinds.ChangeChannel)

-- 📡 Commands Triggered by FiveM Keybinds
RegisterCommand("toggleradio", function() ExecuteCommand("radio") end, false)
RegisterCommand("startradio", function() ExecuteCommand("startradio") end, false)
RegisterCommand("setchannel", function() ExecuteCommand("setchannel") end, false)

-- 🔧 Allow Players to Change Keybinds via Command
RegisterCommand("setradiokey", function(source, args)
    local action = args[1]
    local newKey = args[2]

    if not action or not newKey then
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "❌ Usage: /setradiokey [action] [new key]" } })
        return
    end

    -- Check if the action exists
    if Config.Keybinds[action] then
        Config.Keybinds[action] = newKey
        RegisterKeyMapping(action, "Custom Radio Keybind", "keyboard", newKey)
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "✅ Keybind for " .. action .. " changed to " .. newKey } })
    else
        TriggerEvent("chat:addMessage", { args = { "[Radio]", "❌ Invalid action!" } })
    end
end, false)
