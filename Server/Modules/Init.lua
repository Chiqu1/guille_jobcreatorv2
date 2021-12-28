JOB.Thread(function ()

    local Players = GetPlayers()
    for k, v in pairs(Players) do 
        JOB.Players[tonumber(v)] = JOB.CreatePlayer(tonumber(v), { })
    end

    JOB.Execute("SELECT * FROM `guille_jobcreator`", {}, function (data)
        for k, v in pairs(data) do
            JOB.Jobs[v.name] = JOB.CreateJob(v.name, v.label, json.decode(v.ranks), json.decode(v.points), json.decode(v.data), json.decode(v.blips))
            GlobalState[v.name.."-guille"] = JOB.Jobs[v.name]
            JOB.Print("INFO", ("Job loaded '%s'"):format(v.name))
        end
    end)

end)