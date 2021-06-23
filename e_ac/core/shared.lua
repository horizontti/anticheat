function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = ' .. k .. '
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function trim(s)
    return (s:gsub('^%s*(.-)%s*$', '%1'))
end

function alterPlayerData(data)
    local d = data
    for k, v in pairs(d) do
        if k == 'accounts' then
            for kk, vv in pairs(v) do
                d[k][kk].timestamp = time
            end
        elseif k == 'money' then
            local moneyFound = false
            local moneyFoundKey = 0
            for kk, vv in pairs(d['accounts']) do
                if vv.name == 'money' then
                    moneyFound = true
                    moneyFoundKey = kk
                    break
                end
            end
            if not moneyFound then
                table.insert(
                    d['accounts'],
                    {
                        money = v,
                        name = k,
                        label = 'käteinen',
                        timestamp = time
                    }
                )
            end
            d[k] = nil
        elseif k == 'loadout' then
            for kk, vv in pairs(v) do
                d[k][kk].timestamp = time
            end
        end
    end
    return d
end

function dateConvo(sec)
    D = os.date('%d.%m.-%y %H:%M:%S', sec)
    D = D:gsub(' 0',' ')
    return(D)
end
