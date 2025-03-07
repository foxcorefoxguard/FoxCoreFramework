RegisterNetEvent("foxcore_multicharacter:startCutscene")
AddEventHandler("foxcore_multicharacter:startCutscene", function(characterData)
    DoScreenFadeOut(500)
    Wait(500)

    local ped = PlayerPedId()
    SetEntityCoords(ped, Config.Cutscene.Start.x, Config.Cutscene.Start.y, Config.Cutscene.Start.z)
    SetEntityHeading(ped, Config.Cutscene.Start.heading)
    FreezeEntityPosition(ped, true)

    -- 🎥 Camera Setup
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, Config.Cutscene.Start.x, Config.Cutscene.Start.y, Config.Cutscene.Start.z + 2.0)
    PointCamAtCoord(cam, Config.Cutscene.End.x, Config.Cutscene.End.y, Config.Cutscene.End.z)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)

    Wait(3000)

    -- 🎥 Move Camera
    DoScreenFadeIn(500)
    local timer = 0
    while timer < 4000 do
        local newX = Config.Cutscene.Start.x + (Config.Cutscene.End.x - Config.Cutscene.Start.x) * (timer / 4000)
        local newY = Config.Cutscene.Start.y + (Config.Cutscene.End.y - Config.Cutscene.Start.y) * (timer / 4000)
        local newZ = Config.Cutscene.Start.z + (Config.Cutscene.End.z - Config.Cutscene.Start.z) * (timer / 4000)

        SetCamCoord(cam, newX, newY, newZ)
        timer = timer + 10
        Wait(10)
    end

    -- 🎥 End Cutscene
    RenderScriptCams(false, false, 500, true, true)
    DestroyCam(cam, false)
    FreezeEntityPosition(ped, false)

    -- 🚀 Spawn Player in the World
    SetEntityCoords(ped, characterData.spawn.x, characterData.spawn.y, characterData.spawn.z)
    SetEntityHeading(ped, characterData.spawn.heading)
end)
