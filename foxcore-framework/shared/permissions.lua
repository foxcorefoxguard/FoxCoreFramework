Permissions = {}

Permissions.Ranks = {
    ["admin"] = 3,
    ["mod"] = 2,
    ["user"] = 1
}

-- Function to get a player's permission level
function Permissions.GetLevel(source)
    local identifier = GetPlayerIdentifier(source, 0)
    local result = MySQL.Sync.fetchScalar("SELECT rank FROM players WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    })

    return Permissions.Ranks[result] or 1 -- Default to "user"
end

-- Function to check if a player has a required permission
function Permissions.HasPermission(source, requiredLevel)
    local playerLevel = Permissions.GetLevel(source)
    return playerLevel >= requiredLevel
end
