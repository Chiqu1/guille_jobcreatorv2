JOB.Callbacks = { }

---@param name any
---@param cb any
JOB.CreateCallback = function(name, cb)
    JOB.Callbacks[name] = cb
end

JOB.HandleCallback = function(name, ...)
    local src <const> = source
    if JOB.Callbacks[name] then
        JOB.Callbacks[name](src, function(...)
            JOB.Players[src].triggerEvent("jobcreatorv2:client:handleCallback", name, ...)
        end, ...)
    end
end


RegisterNetEvent("jobcreatorv2:server:handleCallback")