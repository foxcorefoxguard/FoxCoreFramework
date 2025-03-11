local previewPed = nil

RegisterNetEvent("foxcore_clothing:startPreview")
AddEventHandler("foxcore_clothing:startPreview", function()
    if DoesEntityExist(previewPed) then
        DeleteEntity(previewPed)
    end

    -- Load Player Model
    local model = GetEntityModel(PlayerPedId())
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    -- Spawn Ped for Outfit Preview
    local coords = GetEntityCoords(PlayerPedId())
    previewPed = CreatePed(4, model, coords.x, coords.y, coords.z, 0.0, false, true)
    SetEntityInvincible(previewPed, true)
    FreezeEntityPosition(previewPed, true)
    SetBlockingOfNonTemporaryEvents(previewPed, true)
    SetPedCanBeTargetted(previewPed, false)

    -- Apply Outfit Preview Animations
    local anim = Config.PreviewAnimations[math.random(#Config.PreviewAnimations)]
    TaskStartScenarioInPlace(previewPed, anim, 0, true)
end)

RegisterNetEvent("foxcore_clothing:stopPreview")
AddEventHandler("foxcore_clothing:stopPreview", function()
    if DoesEntityExist(previewPed) then
        DeleteEntity(previewPed)
        previewPed = nil
    end
end)
