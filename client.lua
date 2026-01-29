local playerPed = PlayerPedId()


exports('StartSkyDive', function(position)
    position = position or vector4(500.0, 5000.0, 1000.0, 0.0)  -- Default über Los Santos
    SetEntityCoords(playerPed, position.x, position.y, position.z, false, false, false, true)
    
    Citizen.Wait(1000)
    
    TaskSkyDive(playerPed)  
    GiveWeaponToPed(playerPed, GetHashKey('GADGET_PARACHUTE'), 1, false, true)  
    
    TriggerEvent('skydive:notify', 'Skydiving gestartet! Space für Fallschirm.')
end)


exports('DeployParachute', function()
    TaskParachuteToTarget(playerPed, 0.0, 0.0, 0.0)  
end)


RegisterCommand('skydiving', function()
    exports['skydive-legacy']:StartSkyDive()
end, false)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then  
            local parachuteState = GetPedParachuteState(playerPed)
            if parachuteState == 0 then
                exports['skydive-legacy']:DeployParachute()
            end
        end
    end
end)


RegisterNetEvent('skydive:notify')
AddEventHandler('skydive:notify', function(msg)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(true, false)
end)
