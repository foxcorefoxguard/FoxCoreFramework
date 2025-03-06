FoxCore = exports["foxcore_framework"]
QBCore = exports["qb-core"]

-- 🔄 Auto-Detect Framework
Config = {}
Config.Framework = "auto"  -- Options: "qbcore", "foxcore", "auto"

local isQBCore = GetResourceState("qb-core") == "started"
local isFoxCore = GetResourceState("foxcore_framework") == "started"

if Config.Framework == "auto" then
    Config.Framework = isQBCore and "qbcore" or "foxcore"
end

print("[🔥 FoxCore Bridge] Detected framework: " .. Config.Framework)
