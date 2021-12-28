RegisterNUICallback("getCoords", function (data, cb)
    local Ped = PlayerPedId()
    local Coords = GetEntityCoords(Ped)
    cb(json.encode(Coords))
end)

RegisterNUICallback("exit", function (data, cb)
    SetNuiFocus(false, false)
    JOB.Variables['IsOpen'] = true
    cb(json.encode("ok"))
end)