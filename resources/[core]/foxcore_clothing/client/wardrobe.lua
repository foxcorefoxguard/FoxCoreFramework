RegisterNetEvent("foxcore_clothing:openWardrobe")
AddEventHandler("foxcore_clothing:openWardrobe", function()
    local house = exports["foxcore_housing"]:GetPlayerHouse()
    if not house then
        exports["foxcore_ui"]:ShowNotification("❌ You are not inside your home!")
        return
    end

    for _, wardrobe in pairs(Config.Wardrobes) do
        if wardrobe.house == house then
            SetNuiFocus(true, true)
            SendNUIMessage({ type = "openWardrobeUI" })
            return
        end
    end

    exports["foxcore_ui"]:ShowNotification("❌ No wardrobe found in this house!")
end)
