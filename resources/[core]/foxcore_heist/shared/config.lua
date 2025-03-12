Config = {}

-- Tablet Animation
Config.TabletAnim = {
    dict = "amb@world_human_seat_wall_tablet@female@base",
    anim = "base",
    prop = "prop_cs_tablet",
}

-- Heist Configurations
Config.Heists = {
    boosting = {
        requiredItem = "boosting_laptop",
        cooldown = 3600 -- 1 hour
    },
    bank = {
        requiredItem = "hacking_device",
        cooldown = 7200 -- 2 hours
    },
    house = {
        requiredItem = "lockpick",
        cooldown = 1800 -- 30 mins
    },
    package = {
        requiredItem = "delivery_bag",
        cooldown = 1800 -- 30 mins
    },
    mailbox = {
        requiredItem = "screwdriver",
        cooldown = 900 -- 15 mins
    }
}
