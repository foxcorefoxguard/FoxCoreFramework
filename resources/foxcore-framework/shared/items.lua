Items = {}

Items.List = {
    ["water"] = { name = "Water Bottle", type = "consumable", effect = "thirst" },
    ["bread"] = { name = "Bread", type = "consumable", effect = "hunger" }
}

function Items.GetItem(itemName)
    return Items.List[itemName] or nil
end
