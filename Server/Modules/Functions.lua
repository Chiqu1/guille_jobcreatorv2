JOB.Callbacks = { }

---comment
---@param cb any
JOB.Thread = function (cb)
    CreateThread(cb)
end

---@param name any
---@param cb any
JOB.CreateCallback = function(name, cb)
    JOB.Callbacks[name] = cb
    JOB.Print("INFO", "Callback '" ..name.. "' registered")
end

---comment
---@param name any
---@param ... any
JOB.HandleCallback = function(name, ...)
    local src <const> = source
    if JOB.Callbacks[name] then
        JOB.Callbacks[name](src, function(...)
            JOB.Players[src].triggerEvent("jobcreatorv2:client:handleCallback", name, ...)
        end, ...)
    end
end

RegisterNetEvent("jobcreatorv2:server:handleCallback", JOB.HandleCallback)