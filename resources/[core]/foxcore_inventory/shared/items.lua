Config.Items = {
    -- 📦 General Storage Items
    ["backpack"] = {
        name = "Backpack",
        description = "Provides additional inventory space.",
        weight = 5.0,
        canUse = false,
        canRemove = true
    },
    ["wallet"] = {
        name = "Wallet",
        description = "Stores cash and identification.",
        weight = 0.3,
        canUse = false,
        canRemove = true
    },

    -- 💰 Money & Banking Items
    ["cash"] = {
        name = "Cash",
        description = "Physical money used for transactions.",
        weight = 0.0,
        canUse = false,
        canRemove = true
    },
    ["debit_card"] = {
        name = "Debit Card",
        description = "Linked to your bank account for payments.",
        weight = 0.1,
        canUse = false,
        canRemove = true
    },

    -- 🍔 Food & Drinks
    ["water_bottle"] = {
        name = "Water Bottle",
        description = "Stay hydrated!",
        weight = 0.5,
        canUse = true,
        canRemove = true
    },
    ["sandwich"] = {
        name = "Sandwich",
        description = "A simple sandwich to reduce hunger.",
        weight = 0.7,
        canUse = true,
        canRemove = true
    },

    -- 🔧 Tools & Miscellaneous
    ["repair_kit"] = {
        name = "Repair Kit",
        description = "Used to repair damaged vehicles.",
        weight = 2.5,
        canUse = true,
        canRemove = true
    },
    ["lockpick"] = {
        name = "Lockpick",
        description = "Used to break into locked doors and vehicles.",
        weight = 0.8,
        canUse = true,
        canRemove = true
    },

    -- 🔬 Forensic & Investigation Items
    ["dna_kit"] = {
        name = "DNA Kit",
        description = "Used to collect DNA samples.",
        weight = 1.0,
        canUse = true,
        canRemove = true
    },
    ["fingerprint_scanner"] = {
        name = "Fingerprint Scanner",
        description = "Used to scan and log fingerprints.",
        weight = 1.5,
        canUse = true,
        canRemove = true
    },
    ["evidence_bag"] = {
        name = "Evidence Bag",
        description = "Used to store collected evidence.",
        weight = 0.5,
        canUse = true,
        canRemove = true
    },
    ["bullet_casing"] = {
        name = "Bullet Casing",
        description = "Collected from crime scenes, used for ballistics analysis.",
        weight = 0.3,
        canUse = false,
        canRemove = true
    },
    ["crime_photo"] = {
        name = "Crime Scene Photo",
        description = "Photographic evidence from a crime scene.",
        weight = 0.2,
        canUse = false,
        canRemove = true
    },

    -- 🚔 Police Equipment
    ["handcuffs"] = {
        name = "Handcuffs",
        description = "Used to restrain a suspect.",
        weight = 1.0,
        canUse = true,
        canRemove = false
    },
    ["police_radio"] = {
        name = "Police Radio",
        description = "Used for secure police communication.",
        weight = 0.5,
        canUse = true,
        canRemove = false
    },
    ["body_cam"] = {
        name = "Body Camera",
        description = "Records officer interactions in real-time.",
        weight = 1.2,
        canUse = true,
        canRemove = false
    },
    ["taser"] = {
        name = "Taser",
        description = "Non-lethal weapon used to subdue suspects.",
        weight = 1.8,
        canUse = true,
        canRemove = false
    },

    -- 🚑 EMS Equipment
    ["defibrillator"] = {
        name = "Defibrillator",
        description = "Used to revive unconscious patients.",
        weight = 5.0,
        canUse = true,
        canRemove = true
    },

    ["iv_bag"] = {
        name = "IV Bag",
        description = "Restores hydration and stabilizes health.",
        weight = 1.0,
        canUse = true,
        canRemove = true
    },

    ["blood_bag"] = {
        name = "Blood Bag",
        description = "Restores blood loss and increases stamina.",
        weight = 1.5,
        canUse = true,
        canRemove = true
    },

    ["morphine"] = {
        name = "Morphine",
        description = "Pain relief injection. Risk of addiction.",
        weight = 0.5,
        canUse = true,
        canRemove = true
    },

    ["medkit"] = {
        name = "Medkit",
        description = "Full medical kit for treating wounds.",
        weight = 2.0,
        canUse = true,
        canRemove = true
    },

    -- 🦽 Mobility Aids
    ["wheelchair"] = {
        name = "Wheelchair",
        description = "Assists mobility for injured players.",
        weight = 10.0,
        canUse = true,
        canRemove = true
    },

    ["stretcher"] = {
        name = "Stretcher",
        description = "For moving critically injured patients.",
        weight = 15.0,
        canUse = true,
        canRemove = true
    },

    -- 🚨 Illegal Drugs
    ["weed"] = {
        name = "Weed",
        description = "An illegal substance. Police might seize this!",
        weight = 0.5,
        canUse = true,
        canRemove = true,
        illegal = true
    },
    ["cocaine"] = {
        name = "Cocaine",
        description = "Highly illegal and valuable on the black market.",
        weight = 0.5,
        canUse = true,
        canRemove = true,
        illegal = true
    },
    ["meth"] = {
        name = "Meth",
        description = "Dangerous and illegal. Might attract police attention.",
        weight = 0.6,
        canUse = true,
        canRemove = true,
        illegal = true
    },

    -- 🔫 Illegal Weapons
    ["stolen_gun"] = {
        name = "Stolen Gun",
        description = "An unregistered weapon. Police will seize this!",
        weight = 3.0,
        canUse = true,
        canRemove = true,
        illegal = true
    },
    ["silencer"] = {
        name = "Silencer",
        description = "Attachment for firearms. Illegal without a permit.",
        weight = 1.0,
        canUse = true,
        canRemove = true,
        illegal = true
    },

    -- 💰 Stolen Goods
    ["stolen_watch"] = {
        name = "Stolen Watch",
        description = "A high-value stolen item. Sell it on the black market.",
        weight = 0.2,
        canUse = false,
        canRemove = true,
        illegal = true
    },
    ["stolen_jewelry"] = {
        name = "Stolen Jewelry",
        description = "Expensive but risky to carry.",
        weight = 0.3,
        canUse = false,
        canRemove = true,
        illegal = true
    }
}

function Items.GetItem(itemName)
    return Items.List[itemName] or nil
end
