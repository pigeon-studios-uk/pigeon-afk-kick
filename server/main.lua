--[[
    Pigeon AFK Kick: server.

    Every few seconds, the server looks at where each player's character is and which way it faces. A player
    who hasn't moved Config.MinDistance or turned Config.MinTurn for Config.KickMinutes is kicked, with
    warnings first. Staff with any of Config.ExemptPermissions are left alone.

    It reads positions on the server, so it can't be dodged by a player's game, and needs OneSync (the
    server only knows positions with it).
]]

local CHECK_MS = 10000          -- how often players are checked
local EXEMPT_RECHECK_MS = 60000 -- how often each player's exemption is looked up again

local players = {}              -- [source] = { coords, heading, still (ms), warned = {}, exempt, exemptAt }
local forced = {}               -- [source] = true/false, set by the SetExempt export

-- 'auto' follows ox_lib's language (the ox:locale convar), and English when that isn't set.
local locale = Config.Locale == 'auto' and GetConvar('ox:locale', 'en') or Config.Locale
local strings = Locales[locale] or Locales.en

local function t(key, values)
    local text = strings[key] or Locales.en[key] or key
    return (text:gsub('{(%w+)}', function(name)
        local value = values and values[name]
        return value ~= nil and tostring(value) or '{' .. name .. '}'
    end))
end

local function isExempt(src, entry, now)
    if forced[src] ~= nil then return forced[src] end
    if entry.exemptAt and now - entry.exemptAt < EXEMPT_RECHECK_MS then return entry.exempt end
    local exempt = false
    for _, permission in ipairs(Config.ExemptPermissions or {}) do
        if IsPlayerAceAllowed(src, permission) then
            exempt = true
            break
        end
    end
    entry.exempt, entry.exemptAt = exempt, now
    return exempt
end

local function turned(a, b)
    return math.abs((b - a + 540.0) % 360.0 - 180.0)
end

local function check()
    local now = GetGameTimer()
    local list = GetPlayers()
    local kickMs = (tonumber(Config.KickMinutes) or 15) * 60000
    local kicking = #list >= (tonumber(Config.MinPlayers) or 0)

    for _, id in ipairs(list) do
        local src = tonumber(id)
        local entry = players[src]
        if not entry then
            entry = { still = 0, warned = {} }
            players[src] = entry
        end

        local ped = GetPlayerPed(src)
        if ped ~= 0 and DoesEntityExist(ped) then
            local coords, heading = GetEntityCoords(ped), GetEntityHeading(ped)
            local moved = not entry.coords
                or #(coords - entry.coords) >= (tonumber(Config.MinDistance) or 1.0)
                or turned(entry.heading, heading) >= (tonumber(Config.MinTurn) or 10.0)

            if moved or isExempt(src, entry, now) then
                entry.coords, entry.heading, entry.still, entry.warned = coords, heading, 0, {}
            else
                entry.still = entry.still + CHECK_MS
                local left = kickMs - entry.still
                if left <= 0 then
                    if kicking then
                        local minutes = math.floor(entry.still / 60000)
                        TriggerEvent('pigeon-afk-kick:kicked', src, minutes)
                        DropPlayer(id, t('kicked', { minutes = minutes }))
                        players[src] = nil
                    end
                elseif kicking then
                    for _, minutes in ipairs(Config.Warnings or {}) do
                        if not entry.warned[minutes] and left <= minutes * 60000 then
                            entry.warned[minutes] = true
                            TriggerClientEvent('pigeon-afk-kick:warn', src, math.max(1, math.ceil(left / 60000)))
                        end
                    end
                end
            end
        end
    end
end

CreateThread(function()
    while true do
        Wait(CHECK_MS)
        check()
    end
end)

AddEventHandler('playerDropped', function()
    players[source] = nil
    forced[source] = nil
end)

---------------------------------------------------------------------------
-- Exports

--- How long, in seconds, a player has stood still.
exports('GetIdleSeconds', function(src)
    local entry = players[tonumber(src)]
    return entry and math.floor(entry.still / 1000) or 0
end)

--- Never kick this player (true), kick them as normal again (false), or go back to the ACE check (nil).
--- Useful while a player is in a cutscene, a queue, or a job that keeps them still.
exports('SetExempt', function(src, value)
    src = tonumber(src)
    if not src then return end
    forced[src] = value
    if players[src] then players[src].still, players[src].warned = 0, {} end
end)
