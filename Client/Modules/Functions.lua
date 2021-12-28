JOB.Callbacks = { }
JOB.Variables = {
    IsOpen = false
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

RegisterNUICallback("createJob", function(data, cb)

    TriggerServerEvent("jobcreatorv2:server:sendNewJobData", data.data)

    cb(json.encode("Cherryoz was here"))
end)