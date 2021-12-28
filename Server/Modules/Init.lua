JOB.Thread(function ()
    local Players = GetPlayers()
    for k, v in pairs(Players) do 
        JOB.Players[tonumber(v)] = JOB.CreatePlayer(tonumber(v), { })
    end
end)