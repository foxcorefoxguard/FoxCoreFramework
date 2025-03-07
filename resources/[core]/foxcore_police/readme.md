items.lua
Config.Items = {
    -- 🔬 Crime Scene Investigation Tools
    ["dna_kit"] = {
        name = "DNA Kit",
        description = "Used to collect DNA samples from crime scenes.",
        weight = 1.0,
        canUse = true,
        canRemove = true
    },
    ["fingerprint_scanner"] = {
        name = "Fingerprint Scanner",
        description = "Scans and logs fingerprints for suspects.",
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
    }
}
  