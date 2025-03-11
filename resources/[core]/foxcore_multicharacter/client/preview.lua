local previewPed = nil
local previewCam = nil

RegisterNetEvent("foxcore_multicharacter:previewCharacter")
AddEventHandler("foxcore_multicharacter:previewCharacter", function(characterData, slot)
    if DoesEntityExist(previewPed) then
        DeleteEntity(previewPed)
    end

    -- Load Model
    local model = GetHashKey(characterData.model or "mp_m_freemode_01")
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    -- Spawn Ped at Selection Location
    local pos = Config.PreviewPositions[slot]
    previewPed = CreatePed(4, model, pos.x, pos.y, pos.z, pos.heading, false, true)
    SetEntityInvincible(previewPed, true)
    FreezeEntityPosition(previewPed, true)
    SetBlockingOfNonTemporaryEvents(previewPed, true)
    SetPedCanBeTargetted(previewPed, false)
    SetPedCanRagdoll(previewPed, false)
    TaskStartScenarioInPlace(previewPed, Config.Animations.Idle, 0, true)

    -- Setup Camera
    if DoesCamExist(previewCam) then
        DestroyCam(previewCam, false)
    end
    previewCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(previewCam, pos.x + 2.0, pos.y, pos.z + 1.0)
    PointCamAtEntity(previewCam, previewPed)
    SetCamActive(previewCam, true)
    RenderScriptCams(true, true, 500, true, true)
end)

RegisterNetEvent("foxcore_multicharacter:rotateCharacter")
AddEventHandler("foxcore_multicharacter:rotateCharacter", function(direction)
    if DoesEntityExist(previewPed) then
        local heading = GetEntityHeading(previewPed)
        SetEntityHeading(previewPed, heading + (direction == "left" and -10 or 10))
    end
end)

RegisterNetEvent("foxcore_multicharacter:zoomCamera")
AddEventHandler("foxcore_multicharacter:zoomCamera", function(direction)
    if DoesCamExist(previewCam) then
        local coords = GetCamCoord(previewCam)
        local newX = coords.x + (direction == "in" and -0.5 or 0.5)
        SetCamCoord(previewCam, newX, coords.y, coords.z)
    end
end)

RegisterNetEvent("foxcore_multicharacter:selectCharacter")
AddEventHandler("foxcore_multicharacter:selectCharacter", function()
    RenderScriptCams(false, false, 500, true, true)
    DestroyCam(previewCam, false)
    DeleteEntity(previewPed)
    previewPed = nil
end)
