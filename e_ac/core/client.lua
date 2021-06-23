cacheData = {}
qbcore = nil

local cfgTimeout = 0
local cfgWarning = 0

CreateThread(function()
    local startTime = GetGameTimer()
    while qbcore == nil do 
        Wait(0)
        TriggerEvent('qbcore:GetObject', function(obj) qbcore = obj end)
    end
    while not cfg.overtimeTriggers do 
        Wait(0) 
        cfgTimeout = cfgTimeout + 10
        if cfgTimeout > 10000 then
            cfgTimeout = 0
            if cfgWarning < 6 then
                cfgWarning = cfgWarning + 1
                print('CFG tietoja ei vastaanotettu. Taso: '.. cfgWarning)
            else
                TriggerServerEvent('e_ac:kickpls', 'CFG TIMEOUT 60SEC')
            end
        end
    end
    local data = getPlayerData({
        'loadout',
        'money',
        'accounts',
    })
    cfgTimeout = 0
    cfgWarning = 0
    local endTime = GetGameTimer()
    cacheData[endTime] = {}
    cacheData[endTime] = {
        loadout = data.loadout,
        accounts = data.accounts
    }
    print('Anticheat toimintakuntoinen. Lataus kesti ' .. endTime - startTime ..' ms')
    print('cache datat:', dump(cacheData))
    runAC()
end)

function runAC()
    CreateThread(function()
        while true do
            Wait(100)
            local data = getPlayerData({
                'loadout',
                'money',
                'accounts',
            })
            handleData(data)
        end
    end)
end

RegisterNetEvent('e_ac:initData', function(data)
    cfg = data
end)

function getPlayerData(data)
    local playerData = qbcore.Functions.GetPlayerData(data)
    playerData = alterPlayerData(playerData)
    return playerData
end


function handleData(data)
    local time = GetGameTimer()
    for k,v in pairs(data) do
        if k == 'accounts' or v == 'money' then
        elseif k == 'loadout' then
            handleWeaponData(v, time)
        end
    end
end

function handleWeaponData(data, time)
    local ped = PlayerPedId()
    local weaponsToRemove = {}
    local weaponsReturned = {}
    for _,cfgWeaponName in pairs(cfg.weaponsInGame) do
        local allGood = false
        local hash = GetHashKey(cfgWeaponName)
        if HasPedGotWeapon(ped, hash, false) then
            for k,v in pairs(data) do
                if cfgWeaponName == v.name then
                    allGood = true
                    break
                end
            end
            if not allGood then
                print('oli ase jota ei saisi olla: '.. cfgWeaponName)
                table.insert(weaponsToRemove, cfgWeaponName)
            end
        end
    end
    if weaponsToRemove[1] then
        local d = {
            category = 'moddedWeapon',
            currentData = weaponsToRemove,
            trigger = 'activeDetection',
        }
        TriggerServerEvent('e_ac:triggers', d)
        for k,v in pairs(weaponsToRemove) do
            hash = GetHashKey(v)
            RemoveWeaponFromPed(ped, hash)
        end
    end
    for k,v in pairs(data) do
        local hash = GetHashKey(v.name)
        if not HasPedGotWeapon(ped, hash) then
            table.insert(weaponsReturned, v.name)
            GiveWeaponToPed(ped, hash, v.ammo)
            print('Anticheat oli poistanut sinulta aseen', v.name, ' jota ei pitänyt poistaa. Sait sen nyt takaisin')
            for kk,vv in pairs(v.components) do
                GiveWeaponComponentToPed(ped, hash, GetHashKey(vv))
            end
        end
    end
    if weaponsReturned[1] then
        local d = {
            category = 'moddedWeapon',
            currentData = weaponsReturned,
            trigger = 'weaponReturned',
        }
        TriggerServerEvent('e_ac:triggers', d)
    end
end

function handleMoneyData(_k, _v, time)
    print('_k', _k, '_v', dump(_v), time)
    if not cacheData[time] then
        cacheData[time] = {}
    end
    if not cacheData[time][_k] then
        cacheData[time][_k] = {}
    end
    if _k == 'accounts' then 
        print('cacheData', dump(cacheData))
        for k,v in pairs(_v) do
            local bTrigger = cfg.bigTriggers[v.name]
            for kk,vv in pairs(cacheData) do
                print('kk ', kk, dump(vv))
                local cache = cacheData[kk][_k]
                for kkk,vvv in pairs(cache) do
                    if vvv.name == v.name then
                        if v.money >= bTrigger + vvv.money then
                            print('cache', dump(cache))
                            local d = {
                                category = 'moneyBig',
                                currentData = v.money,
                                cacheData = vvv.money,
                                trigger = bTrigger
                            }
                            TriggerServerEvent('e_ac:triggers', d)
                        end
                        cacheData[time][_k][k] = v
                        local cfgData = cfg.overtimeTriggers[v.name]   
                        for ck, cv in pairs(cfgData) do
                            if ((time - kk) < (cv.timeframe + 1000)) and ((time - kk) > (cv.timeframe - 1000)) then
                                print(cv.timeframe, time - kk, ((time - kk) < (cv.timeframe + 1000)))
                                print(cv.timeframe, time - kk, ((time - kk) > (cv.timeframe - 1000)))
                                print('erotus löyty')
                                Wait(100)
                                if cv.value + vvv.money > v.money then
                                end
                            end
                        end
                        break
                    end
                end
            end
        end
    end
end
