JOB.Callbacks = { }
JOB.Variables = {
    IsOpen = false,
    PlayerId = GetPlayerServerId(PlayerId()),
    IsChanging = false,
    OwnJob = nil,
}

---comment
---@param name any
---@param cb any
---@param ... any
JOB.ExecuteCallback = function(name, cb, ...)
    JOB.Callbacks[name] = cb
    TriggerServerEvent("jobcreatorv2:server:handleCallback", name, ...)
end

---comment
---@param name any
---@param ... any
JOB.HandleCallback = function(name, ...)
    if JOB.Callbacks[name] then
        JOB.Callbacks[name](...)
    end
end

RegisterNetEvent("jobcreatorv2:client:handleCallback", JOB.HandleCallback)

JOB.OpenUi = function()
    SendNUIMessage({ type = "open" })
    SetNuiFocus(true, true)
    JOB.Variables['IsOpen'] = true
end

---comment
---@param text any
JOB.Notify = function (text)
    SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, true)
end

RegisterNetEvent("jobcreatorv2:client:openUi", JOB.OpenUi)

---comment
---@param coords any
---@param msg any
JOB.FloatingNotify = function (coords, msg)
    SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z + 0.9)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandDisplayHelp(2, false, true, -1)
end

---comment
---@param string any
JOB.GetLocale = function(string)
    return Cfg.Locales[Cfg.Locale][string] 
end

RegisterNUICallback("createJob", function(data, cb)

    TriggerServerEvent("jobcreatorv2:server:sendNewJobData", data.data)

    cb(json.encode("Cherryoz was here"))
end)

RegisterNetEvent("jobcreatorv2:client:initData", JOB.HandleAll)

JOB.Markers = {
    ---comment
    ---@param coords any
    ['armory'] = function (coords)
        JOB.FloatingNotify(coords, JOB.GetLocale("openArmory"))
        if IsControlJustPressed(1, 38) then
            
        end
    end,
    ---comment
    ---@param coords any
    ['getvehs'] = function (coords)
        JOB.FloatingNotify(coords, JOB.GetLocale("getVehs"))
        if IsControlJustPressed(1, 38) then

        end
    end,
    ---comment
    ---@param coords any
    ['savevehs'] = function (coords)
        JOB.FloatingNotify(coords, JOB.GetLocale("saveVehs"))
        if IsControlJustPressed(1, 38) then

        end
    end,
    ---comment
    ---@param coords any
    ['boss'] = function (coords)
        JOB.FloatingNotify(coords, JOB.GetLocale("boss"))
        if IsControlJustPressed(1, 38) then

        end
    end,
    ---comment
    ---@param coords any
    ['shop'] = function (coords)
        JOB.FloatingNotify(coords, JOB.GetLocale("openShop"))
        if IsControlJustPressed(1, 38) then

        end
    end,
}