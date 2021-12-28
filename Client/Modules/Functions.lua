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

RegisterNetEvent("jobcreatorv2:client:openUi", JOB.OpenUi)