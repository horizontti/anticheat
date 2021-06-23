CreateThread(function()
    while qbcore == nil do
        Wait(0)
        TriggerEvent('qbcore:GetObject', function(obj) qbcore = obj end)
    end
    local xPlayers = qbcore.Functions.GetPlayers()
    if #xPlayers > 0 then
        print('script uudelleen käynnistys. Lähetetään pelaajille cfg datat')
        for k,v in pairs(xPlayers) do
            Wait(10)
            print('pelaajalle ', v, ' Lähetetty CFG datat')
            TriggerClientEvent('e_ac:initData', v, cfg)
        end
    end
    runDiscordLoop()
end) 

RegisterServerEvent('e_ac:triggers', function(data)
    print('triggered shit', dump(data))
    local s = source
    if data.category == 'moddedWeapon' then
        if data.trigger == 'activeDetection' then
            for k,v in pairs(data.currentData) do
                logToDiscord(s .. ' '.. GetPlayerName(s) .. ' omisti modatun aseen '.. v, data.category)
            end
        elseif data.trigger == 'weaponReturned' then
            for k,v in pairs(data.currentData) do
                logToDiscord(s .. ' '.. GetPlayerName(s) .. ' palautettiin ase '.. v, data.category)
            end
        end
    end
end)

function runDiscordLoop()
    CreateThread(function()
        while true do
            for k,v in pairs(sCfg.webHooks) do
                if v.queue[1] then
                    local d = v.queue[1]
                    PerformHttpRequest(v.webhook, function(Error, Content, Head) end, 'POST', json.encode({username = d.username, content = d.msg, avatar_url = 'https://i.imgur.com/N3MAlYn.png' , tts = false}), {['Content-Type'] = 'application/json'})
                    table.remove(sCfg.webHooks[k].queue, 1)
                end
            end
            Wait(1000)
        end
    end)
end

local function kickPlayer(target, reason)
    DropPlayer(target, reason)
end

AddEventHandler('qbcore:Client:OnPlayerLoaded', function(playerId, xPlayer)
    TriggerClientEvent('e_ac:initData', playerId, cfg)
end)

RegisterServerEvent('e_ac:kickpls', function(reason)
    local s = source
    local r = reason or ' Tuntematon syy'
    kickPlayer(s, 'Sinut potkittiin Anticheatin toimesta! Syy: '.. reason)
end)

function logToDiscord(msg, place)
    table.insert(sCfg.webHooks[place].queue, {
        username = 'EAC ' .. dateConvo(os.time(os.date('*t'))),
        msg = msg,
    })
end
