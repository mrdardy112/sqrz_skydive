local playerPed = PlayerPedId()

-- Export: Starte Skydiving (aufrufbar von anderen Resources)
exports('StartSkyDive', function(position)
    position = position or vector4(500.0, 5000.0, 1000.0, 0.0)  -- Default über Los Santos
    SetEntityCoords(playerPed, position.x, position.y, position.z, false, false, false, true)
    
    Citizen.Wait(1000)
    
    TaskSkyDive(playerPed)  -- Native für Skydiving [web:16][web:11]
    GiveWeaponToPed(playerPed, GetHashKey('GADGET_PARACHUTE'), 1, false, true)  -- Fallschirm geben
    
    TriggerEvent('skydive:notify', 'Skydiving gestartet! Space für Fallschirm.')
end)

-- Export: Deploy Fallschirm sofort
exports('DeployParachute', function()
    TaskParachuteToTarget(playerPed, 0.0, 0.0, 0.0)  -- Automatisch landen [web:7]
end)

-- Chat-Command für Tests (/skydiving)
RegisterCommand('skydiving', function()
    exports['skydive-legacy']:StartSkyDive()
end, false)

-- Loop für Fallschirm-Deploy mit E-Taste
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then  -- E-Taste [web:23]
            local parachuteState = GetPedParachuteState(playerPed)
            if parachuteState == 0 then
                exports['skydive-legacy']:DeployParachute()
            end
        end
    end
end)

-- Event für Notify (intern)
RegisterNetEvent('skydive:notify')
AddEventHandler('skydive:notify', function(msg)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(true, false)
end)
