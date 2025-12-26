local client = client

RegisterNUICallback("appearance_get_locales", function(_, cb)
    Wait(500) -- Wait for convar sync on restart
    local lang = GetConvar("illenium-appearance:locale", "en")
    print("[Illenium] Detected Locale:", lang)
    cb(Locales[lang])
end)

RegisterNUICallback("appearance_get_settings", function(_, cb)
    cb({ appearanceSettings = client.getAppearanceSettings() })
end)

RegisterNUICallback("appearance_get_data", function(_, cb)
    Wait(250)
    local appearanceData = client.getAppearance()

    -- Apply tattoos from the database if they exist
    if appearanceData.tattoos then
        client.setPedTattoos(cache.ped, appearanceData.tattoos)
        -- Update the cached appearance with the loaded tattoos
        -- This ensures tattoos persist in the appearance data
    else
        -- If no tattoos in the saved appearance, ensure we update it with current tattoos from memory
        local currentTattoos = client.getPedTattoos()
        if currentTattoos and next(currentTattoos) then
            appearanceData.tattoos = currentTattoos
        end
    end

    cb({ config = client.getConfig(), appearanceData = appearanceData, playerId = GetPlayerServerId(PlayerId()) })
end)

RegisterNUICallback("appearance_set_camera", function(camera, cb)
    cb(1)
    client.setCamera(camera)
end)

RegisterNUICallback("appearance_turn_around", function(_, cb)
    cb(1)
    client.pedTurn(cache.ped, 180.0)
end)

RegisterNUICallback("appearance_rotate_camera", function(direction, cb)
    cb(1)
    client.rotateCamera(direction)
end)

RegisterNUICallback("appearance_change_model", function(model, cb)
    local playerPed = client.setPlayerModel(model)

    SetEntityHeading(cache.ped, client.getHeading())
    SetEntityInvincible(playerPed, true)
    TaskStandStill(playerPed, -1)

    cb({
        appearanceSettings = client.getAppearanceSettings(),
        appearanceData = client.getPedAppearance(playerPed)
    })
end)

RegisterNUICallback("appearance_change_component", function(component, cb)
    client.setPedComponent(cache.ped, component)
    cb(client.getComponentSettings(cache.ped, component.component_id))
end)

RegisterNUICallback("appearance_change_prop", function(prop, cb)
    client.setPedProp(cache.ped, prop)
    cb(client.getPropSettings(cache.ped, prop.prop_id))
end)

RegisterNUICallback("appearance_change_head_blend", function(headBlend, cb)
    cb(1)
    client.setPedHeadBlend(cache.ped, headBlend)
end)

RegisterNUICallback("appearance_change_face_feature", function(faceFeatures, cb)
    cb(1)
    client.setPedFaceFeatures(cache.ped, faceFeatures)
end)

RegisterNUICallback("appearance_change_head_overlay", function(headOverlays, cb)
    cb(1)
    client.setPedHeadOverlays(cache.ped, headOverlays)
end)

RegisterNUICallback("appearance_change_hair", function(hair, cb)
    client.setPedHair(cache.ped, hair)
    cb(client.getHairSettings(cache.ped))
end)

RegisterNUICallback("appearance_change_eye_color", function(eyeColor, cb)
    cb(1)
    client.setPedEyeColor(cache.ped, eyeColor)
end)

RegisterNUICallback("appearance_apply_tattoo", function(data, cb)
    local paid = not data.tattoo or not Config.ChargePerTattoo or
        lib.callback.await("illenium-appearance:server:payForTattoo", false, data.tattoo)
    if paid then
        -- Convert flat array to zone-based structure
        local zoneBasedTattoos = {}
        if data.updatedTattoos then
            for _, tattoo in ipairs(data.updatedTattoos) do
                local zone = tattoo.zone or "ZONE_TORSO"
                if not zoneBasedTattoos[zone] then
                    zoneBasedTattoos[zone] = {}
                end
                table.insert(zoneBasedTattoos[zone], tattoo)
            end
        end
        client.addPedTattoo(cache.ped, zoneBasedTattoos)
    end
    cb(paid)
end)

RegisterNUICallback("appearance_preview_tattoo", function(previewTattoo, cb)
    cb(1)
    -- Convert flat array to zone-based structure for data
    local zoneBasedData = {}
    if previewTattoo.data then
        for _, tattoo in ipairs(previewTattoo.data) do
            local zone = tattoo.zone or "ZONE_TORSO"
            if not zoneBasedData[zone] then
                zoneBasedData[zone] = {}
            end
            table.insert(zoneBasedData[zone], tattoo)
        end
    end
    client.setPreviewTattoo(cache.ped, zoneBasedData, previewTattoo.tattoo)
end)

RegisterNUICallback("appearance_delete_tattoo", function(data, cb)
    cb(1)
    -- Get current tattoos and remove the specified one
    local currentTattoos = client.getPedTattoos() or {}

    -- Find and remove the tattoo from the zone-based structure
    for zone, tattoos in pairs(currentTattoos) do
        for i = #tattoos, 1, -1 do
            if tattoos[i].collection == data.collection and tattoos[i].name == data.name then
                table.remove(tattoos, i)
            end
        end
    end

    client.removePedTattoo(cache.ped, currentTattoos)
end)

RegisterNUICallback("appearance_get_tattoos", function(data, cb)
    local allTattoos = {}
    -- Flatten Config.Tattoos structure
    for zone, tattoos in pairs(Config.Tattoos or {}) do
        for _, tattoo in ipairs(tattoos) do
            table.insert(allTattoos, tattoo)
        end
    end

    -- Get currently applied tattoos (zone-based) and flatten them
    local appliedZoneBased = client.getPedTattoos() or {}
    local appliedFlat = {}

    for zone, tattoos in pairs(appliedZoneBased) do
        for _, tattoo in ipairs(tattoos) do
            table.insert(appliedFlat, tattoo)
        end
    end

    cb({
        tattoos = allTattoos,
        applied = appliedFlat
    })
end)

RegisterNUICallback("appearance_wear_clothes", function(dataWearClothes, cb)
    cb(1)
    client.wearClothes(dataWearClothes.data, dataWearClothes.key)
end)

RegisterNUICallback("appearance_remove_clothes", function(clothes, cb)
    cb(1)
    client.removeClothes(clothes)
end)

RegisterNUICallback("appearance_save", function(appearance, cb)
    cb(1)
    client.wearClothes(appearance, "head")
    client.wearClothes(appearance, "body")
    client.wearClothes(appearance, "bottom")
    client.exitPlayerCustomization(appearance)
end)

RegisterNUICallback("appearance_exit", function(_, cb)
    cb(1)
    client.exitPlayerCustomization()
end)

RegisterNUICallback("rotate_left", function(_, cb)
    cb(1)
    client.pedTurn(cache.ped, 10.0)
end)

RegisterNUICallback("rotate_right", function(_, cb)
    cb(1)
    client.pedTurn(cache.ped, -10.0)
end)

RegisterNUICallback("get_theme_configuration", function(_, cb)
    cb(Config.Theme)
end)
