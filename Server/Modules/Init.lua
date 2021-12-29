JOB.Thread(function ()

    local Players = GetPlayers()
    
    for k, v in pairs(Players) do 
        Wait(50)
        GlobalState[v.."-jobplayer"] = nil
        JOB.Players[tonumber(v)] = JOB.CreatePlayer(tonumber(v), { })
        JOB.Execute("SELECT * FROM `guille_jobcreator_members` WHERE license = ?", {
            JOB.GetIdentifier(v)
        }, function (data)
            if data[1] then
                JOB.Players[tonumber(v)] = JOB.CreatePlayer(tonumber(v), json.decode(data[1]['job1']))
                GlobalState[v.."-jobplayer"] = JOB.Players[tonumber(v)] 
                JOB.Players[tonumber(v)].triggerEvent("jobcreatorv2:client:initData")
            end
        end)
    end

    JOB.Execute("SELECT * FROM `guille_jobcreator`", {}, function (data)
        for k, v in pairs(data) do
            JOB.Jobs[v.name] = JOB.CreateJob(v.name, v.label, json.decode(v.ranks), json.decode(v.points), json.decode(v.data), json.decode(v.blips))
            GlobalState[v.name.."-guille"] = JOB.Jobs[v.name]
            JOB.Print("INFO", ("Job loaded '%s'"):format(v.name))
        end
    end)

end)