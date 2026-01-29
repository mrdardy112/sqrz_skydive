local playerPed = PlayerPedId()  


RegisterNetEvent('skydive:start')
AddEventHandler('skydive:start', function(targetId)
    local src = source
    targetId = targetId or src  

    if not GetPlayerPing(targetId) then
        print('^1[SKYDIVE] Ungültiger Spieler-ID: ' .. targetId .. '^7')
        TriggerClientEvent('skydive:notify', src, 'Ungültige ID!')
        return
    end

    TriggerClientEvent('skydive:startClient', targetId)  
    print('^2[SKYDIVE] Skydiving gestartet für Spieler: ' .. GetPlayerName(targetId) .. ' (ID: ' .. targetId .. ')^7')
end)


RegisterCommand('skydiving', function(source, args)
    local targetId = tonumber(args[1])
    TriggerEvent('skydive:start', targetId)  
end, false)


exports('ServerStartSkyDive', function(targetId)
    TriggerEvent('skydive:start', targetId)
end)
