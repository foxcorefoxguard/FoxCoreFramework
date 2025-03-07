Config = {}

-- 🖱️ Radial Menu Keybind (Default: F1)
Config.MenuKey = 'F1'

-- 🔄 Utility Function for Safe Export Handling
local function SafeExport(resource, func, default)
    if GetResourceState(resource) == "started" and exports[resource] then
        return exports[resource][func] or default
    else
        return default
    end
end

-- 🚀 Base Radial Menu Actions
Config.Actions = {
    { label = "Vehicle", icon = "🚗", event = "foxcore:radial:vehicle" },
    { label = "Inventory", icon = "🎒", event = "foxcore:radial:inventory" },
    { label = "Phone", icon = "📱", event = "foxcore:radial:phone" },
    { label = "Emotes", icon = "💃", event = "foxcore:radial:emotes" },
    { label = "Job Actions", icon = "👮", event = "foxcore:radial:jobs" },
    { label = "Settings", icon = "⚙️", event = "foxcore:radial:settings" }
}

-- 🎭 Dynamically Add Actions Based on Installed FoxCore Scripts
if GetResourceState("foxcore_inventory") == "started" then
    table.insert(Config.Actions, { label = "Open Inventory", icon = "📦", event = "foxcore_inventory:open" })
end

if GetResourceState("foxcore_phone") == "started" then
    table.insert(Config.Actions, { label = "Open Phone", icon = "📲", event = "foxcore_phone:open" })
end

if GetResourceState("foxcore_mechanic") == "started" then
    table.insert(Config.Actions, { label = "Mechanic Tools", icon = "🔧", event = "foxcore_mechanic:openTools" })
end

if GetResourceState("foxcore_jobs") == "started" then
    table.insert(Config.Actions, { label = "Job Actions", icon = "👔", event = "foxcore_jobs:open" })
end

if GetResourceState("foxcore_ambulance") == "started" then
    table.insert(Config.Actions, { label = "Medical Actions", icon = "🚑", event = "foxcore_ambulance:menu" })
end

if GetResourceState("foxcore_banking") == "started" then
    table.insert(Config.Actions, { label = "Banking", icon = "🏦", event = "foxcore_banking:open" })
end

if GetResourceState("foxcore_gassystem") == "started" then
    table.insert(Config.Actions, { label = "Refuel Vehicle", icon = "⛽", event = "foxcore_gassystem:refuel" })
end

if GetResourceState("foxcore_blackmarket") == "started" then
    table.insert(Config.Actions, { label = "Black Market", icon = "🕵️", event = "foxcore_blackmarket:access" })
end

if GetResourceState("foxcore_hud") == "started" then
    table.insert(Config.Actions, { label = "HUD Settings", icon = "🖥️", event = "foxcore_hud:settings" })
end

if GetResourceState("foxcore_mdt") == "started" then
    table.insert(Config.Actions, { label = "Police MDT", icon = "📜", event = "foxcore_mdt:open" })
end

if GetResourceState("foxcore_radio") == "started" then
    table.insert(Config.Actions, { label = "Radio", icon = "📡", event = "foxcore_radio:open" })
end

if GetResourceState("foxcore_jail") == "started" then
    table.insert(Config.Actions, { label = "Prison Menu", icon = "🏛️", event = "foxcore_jail:access" })
end

-- 🛠️ Job-Specific Actions
Config.JobActions = {
    police = {
        { label = "Cuff / Uncuff", icon = "🔗", event = "foxcore_police:cuff" },
        { label = "Search Person", icon = "🧐", event = "foxcore_police:search" },
        { label = "Escort", icon = "🚶", event = "foxcore_police:escort" },
        { label = "Check MDT", icon = "📜", event = "foxcore_mdt:open" }
    },
    ems = {
        { label = "Revive", icon = "❤️", event = "foxcore_ambulance:revive" },
        { label = "Heal", icon = "💊", event = "foxcore_ambulance:heal" },
        { label = "Open Medical Records", icon = "📝", event = "foxcore_ambulance:records" }
    },
    mechanic = {
        { label = "Repair Vehicle", icon = "🔧", event = "foxcore_mechanic:repair" },
        { label = "Towing", icon = "🚛", event = "foxcore_mechanic:tow" },
        { label = "Upgrade Vehicle", icon = "⚙️", event = "foxcore_mechanic:upgrade" }
    },
    criminal = {
        { label = "Black Market", icon = "🕵️", event = "foxcore_blackmarket:access" },
        { label = "Sell Stolen Goods", icon = "💰", event = "foxcore_blackmarket:sell" },
        { label = "Kidnap / Hostage", icon = "🤐", event = "foxcore_criminal:kidnap" },
        { label = "Search Person", icon = "🔍", event = "foxcore_criminal:search" },
        { label = "Lockpick Vehicle", icon = "🔑", event = "foxcore_criminal:lockpick" },
        { label = "Steal Vehicle", icon = "🚗", event = "foxcore_criminal:stealcar" },
        { label = "Rob Store", icon = "🏪", event = "foxcore_criminal:robstore" },
        { label = "Rob ATM", icon = "🏧", event = "foxcore_criminal:robatm" },
        { label = "Hack Security System", icon = "💻", event = "foxcore_criminal:hacksecurity" },
        { label = "Craft Illegal Items", icon = "🛠️", event = "foxcore_criminal:craft" },
        { label = "Deal Drugs", icon = "🌿", event = "foxcore_criminal:dealdrugs" },
        { label = "Gang Menu", icon = "🔥", event = "foxcore_criminal:gangmenu" },
        { label = "Drop / Pickup Cash", icon = "💵", event = "foxcore_criminal:dropcash" },
        { label = "Use Fake ID", icon = "🆔", event = "foxcore_criminal:fakeid" },
        { label = "Breakout Prison", icon = "🚔", event = "foxcore_criminal:prisonbreak" }
    }    
}

-- 🔄 Function to Get Job-Specific Actions
function Config.GetJobActions(job)
    return Config.JobActions[job] or {}
end
