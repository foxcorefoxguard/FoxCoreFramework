Items = {}

Items.List = {
    ["cash"] = { name = "Cash", type = "currency", stackable = false },
    ["water"] = { name = "Water Bottle", type = "consumable", stackable = true },
    ["bread"] = { name = "Bread", type = "consumable", stackable = true },
    ["phone"] = { name = "Phone", type = "usable", stackable = false }
}

function Items.GetItem(itemName)
    return Items.List[itemName] or nil
end
