decor = nil

local function GetVehicles(cb,...)
    for _,vehicle in pairs(GetGamePool("CVehicle")) do
        cb(vehicle,...)
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function()
    while decor == nil do
        Wait(0)
    end
    DecorRegister(decor, 3)
    while true do
        Wait(250)
        GetVehicles(function(vehicle)
            if DecorGetInt(vehicle,decor) ~= 1337 then
                DeleteEntity(vehicle)
            end
        end)
    end
end)

RegisterNetEvent("setDecor",function(decorname)
    TriggerServerEvent("verifyDecor",decorname)
    decor = decorname
end)

exports("SetDecor",function(vehicle)
    DecorSetInt(vehicle,decor,1337)
end)

TriggerServerEvent("requestDecor") -- Request decor name from server.