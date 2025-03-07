Config = {}

-- 💰 Banking System
Config.Banking = {
    startingBalance = 5000, -- How much new players start with
    atmFee = 5, -- % Fee for using ATMs
    maxCash = 5000 -- Max cash players can carry
}

-- 🎒 Inventory Settings
Config.Inventory = {
    maxWeight = 30.0, -- Maximum inventory weight in kg
    slots = 40, -- Max inventory slots
    allowDragDrop = true, -- Enables drag/drop UI
    enableWeapons = true -- Allows storing weapons in inventory
}

-- 🔫 Weapon Settings
Config.Weapons = {
    allowAmmoStacking = true, -- Should ammo be stackable?
    allowWeaponDropping = true, -- Can weapons be dropped on the ground?
    autoEquipWeapons = true -- Auto-equip weapons when picked up
}
