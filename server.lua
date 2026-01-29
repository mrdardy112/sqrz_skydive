local playerPed = PlayerPedId()  -- Nicht verwendet, nur für Komplettheit

-- Server-Event: Starte Skydiving für spezifischen Spieler (z.B. von Admin-Script)
RegisterNetEvent('skydive:start')
AddEventHandler('skydive:start', function(targetId)
    local src = source
    targetId = targetId or src  -- Default: selbst

    if not GetPlayerPing(targetId) then
        print('^1[SKYDIVE] Ungültiger Spieler-ID: ' .. targetId .. '^7')
        TriggerClientEvent('skydive:notify', src, 'Ungültige ID!')
        return
    end

    TriggerClientEvent('skydive:startClient', targetId)  -- Client-Event triggern [web:40]
    print('^2[SKYDIVE] Skydiving gestartet für Spieler: ' .. GetPlayerName(targetId) .. ' (ID: ' .. targetId .. ')^7')
end)

-- Server-Command: /skydiving [ID] (Admin-only, anpassbar)
RegisterCommand('skydiving', function(source, args)
    local targetId = tonumber(args[1])
    TriggerEvent('skydive:start', targetId)  -- Event triggern [web:41]
end, false)

-- Export: Server-seitig aufrufbar (z.B. aus SQRZ-Framework)
exports('ServerStartSkyDive', function(targetId)
    TriggerEvent('skydive:start', targetId)
end)
