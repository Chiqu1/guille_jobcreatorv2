-- OXMYSQL Wrapper code, all right deserver to them.
---comment
---@param query any
---@param array any
---@param cb any
---@return any
JOB.Execute = function(query, array, cb)
    local p = promise.new()
    exports['guille_jobcreatorv2']:execute(query, array, function(result)
        p:resolve(result)
    end)
    return cb(Citizen.Await(p))
end