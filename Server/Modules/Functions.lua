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
---@param src any
---@param cb any
JOB.GetPlayer = function(src, cb)
    if cb then
        return cb(JOB.Players[tonumber(src)])
    else
        return JOB.Players[tonumber(src)]
    end
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

---comment
---@param source any
---@param cb any
---@return any
JOB.IsAllowed = function(source, cb)
    local license = nil
    for k,v in ipairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        end
    end
    for k, v in pairs(Cfg.Admins) do
        if v == license then
            if cb then
                return cb(true)
            else
                return true
            end
        end
    end
    if cb then
        return cb(false)
    else
        return false
    end
end
---comment
---@param src any
---@return any
JOB.GetIdentifier = function (src)
    local license = nil
    for k,v in ipairs(GetPlayerIdentifiers(src))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return  v
        end
    end
end

---comment
---@param name any
---@param cb any
JOB.RegisterCommand = function(name, cb)
    RegisterCommand(name, function(source, args)
        local src <const> = source
        JOB.IsAllowed(src, function (isAllowed)
            if isAllowed then
                cb(source, args)
            end
        end)
    end)
end

---comment
---@param data any
JOB.HandleNewJob = function(data)
    local src <const> = source
    JOB.IsAllowed(src, function (isAllowed)
        if isAllowed then
            local _, count = data.name:gsub("%S+", "")
            if count > 1 then return JOB.Print("ERROR", "The name only can have one word!") end
            JOB.Execute("INSERT INTO `guille_jobcreator` (name, label, points, ranks, data, blips) VALUES (?, ?, ?, ?, ?, ?)", {
                data.name,
                data.label,
                json.encode(data.markers),
                json.encode(data.ranks),
                json.encode({ }),
                json.encode(data.blips)
            })
            JOB.Jobs[data.name] = JOB.CreateJob(data.name, data.label, data.ranks, data.markers, { }, data.blips)
            GlobalState[data.name.."-guille"] = JOB.Jobs[data.name]
            JOB.Print("INFO", ("Job loaded '%s'"):format(data.name))
        end
    end)
end

RegisterNetEvent("jobcreatorv2:server:sendNewJobData", JOB.HandleNewJob)

---comment
---@param src any
---@param job any
---@param rank any
JOB.AddJob = function (src, job, rank)
    local license
    if JOB.Jobs[job] then
        if not JOB.Jobs[job].ranks[tonumber(rank)] then
            return JOB.Print("INFO", "The rank does not exist")
        end
    else
        return JOB.Print("INFO", "The job does not exist")
    end
    for k,v in ipairs(GetPlayerIdentifiers(src))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        end
    end
    local jobData = {
        name = job,
        rank = rank
    }
    if license then
        if #JOB.Players[tonumber(src)].jobdata > 0 then

        else
            JOB.Execute("INSERT INTO `guille_jobcreator_members` (license, job1, job2) VALUES (?, ?, ?)", {
                license,
                json.encode(jobData),
                json.encode({ })
            })
            JOB.Players[tonumber(src)] = JOB.CreatePlayer(src, jobData)
            GlobalState[src..'-jobplayer'] = JOB.Players[tonumber(src)]
            JOB.Players[tonumber(src)].triggerEvent("jobcreatorv2:client:initData")
        end
    end
end