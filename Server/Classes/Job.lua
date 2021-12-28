-- @param Name of the job
-- @param Label of the job
-- @param Ranks array
-- @param Points array
-- @param Options array
-- @return Job object
JOB.CreateJob = function(name, label, ranks, points, options)
    local self = { }

    self.name = name or "None"
    self.label = label or "None"
    self.ranks = ranks or { }
    self.points = points or { }
    self.options = options or { }


    -- @param Name of the job
    -- @param Callback
    -- @return Bool
    self.modifyName = function(name, cb)
        self.name = name
        if cb then
            return cb(true)
        else
            return true
        end        
    end

    return self
    
end

