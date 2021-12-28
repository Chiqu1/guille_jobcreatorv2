JOB.Callbacks = { }

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