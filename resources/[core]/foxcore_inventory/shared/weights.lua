Weights = {}

-- Max carry weight
Weights.Limit = 30.0 

-- Define weight per item
Weights.Items = {
    -- 💰 Money
    ["cash"] = 0.0, 
    ["markedbills"] = 0.1, 

    -- 🍔 Food & Drinks
    ["water"] = 0.5, 
    ["bread"] = 0.3, 
    ["burger"] = 0.6, 
    ["sandwich"] = 0.4, 
    ["cola"] = 0.5, 
    ["coffee"] = 0.3, 

    -- 🔫 Weapons & Ammo
    ["weapon_pistol"] = 2.0, 
    ["weapon_knife"] = 0.5, 
    ["ammo_pistol"] = 0.1, 
    ["ammo_rifle"] = 0.2, 

    -- 🏠 Tools & Utility
    ["phone"] = 1.0, 
    ["radio"] = 1.0, 
    ["repairkit"] = 2.0, 
    ["bandage"] = 0.2, 
    ["firstaid"] = 1.5, 

    -- 🚔 Illegal Items
    ["cocaine"] = 0.3, 
    ["meth"] = 0.5, 
    ["lockpick"] = 0.2, 
    ["usb"] = 0.2
}

function Weights.GetWeight(item, quantity)
    return (Weights.Items[item] or 0) * quantity
end
