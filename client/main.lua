--[[
    Pigeon AFK Kick: client.

    Only shows the warnings the server sends. All the checking is on the server.
]]

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

RegisterNetEvent('pigeon-afk-kick:warn', function(minutes)
    minutes = tonumber(minutes) or 1
    local text = t(minutes == 1 and 'warn_one' or 'warn', { minutes = minutes })
    local mode = Config.Notifications
    if mode == 'ox_lib' or (mode == 'auto' and GetResourceState('ox_lib') == 'started') then
        TriggerEvent('ox_lib:notify', { title = strings.title, description = text, type = 'warning', duration = 10000 })
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(true, false)
    end
    PlaySoundFrontend(-1, 'TIMER_STOP', 'HUD_MINI_GAME_SOUNDSET', true)
end)
