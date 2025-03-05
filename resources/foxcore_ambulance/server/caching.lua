local EMSCache = {} -- Store EMS player data in memory

-- 📌 Load EMS Data from Database Once (Instead of Querying on Every Action)
function loadEMSData(identifier)
    MySQL.query("SELECT * FROM ems_data WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            EMSCache[identifier] = result[1]
        else
            EMSCache[identifier] = { rank = "emt", certifications = {} }
        end
    end)
end

-- 📌 Get Cached EMS Data (Avoid Unnecessary Queries)
function getEMSData(identifier)
    if not EMSCache[identifier] then
        loadEMSData(identifier) -- Load if not cached
    end
    return EMSCache[identifier]
end

-- 📌 Update EMS Data (Only When Necessary)
function updateEMSData(identifier, key, value)
    if EMSCache[identifier] then
        EMSCache[identifier][key] = value
        MySQL.execute("UPDATE ems_data SET " .. key .. " = ? WHERE identifier = ?", {value, identifier})
    end
end
