Framework = {}

-- Function to log debug messages
function Framework.Debug(msg)
    if Config.Framework.debug then
        print("^3[FoxCore Debug]:^7 " .. msg)
    end
end

-- Function to get player data (Placeholder for real DB calls)
function Framework.GetPlayer(source)
    local player = GetPlayerIdentifier(source, 0)
    return { id = source, identifier = player }
end
