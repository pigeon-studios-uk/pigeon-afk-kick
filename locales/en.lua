--[[
    Pigeon AFK Kick: English.

    To translate, copy this file to a new one named with the language's code (such as de.lua or pt-br.lua),
    change `Locales.en` to match (Locales.de), translate the text in quotes, and set Config.Locale.
    Keep words in {curly brackets} and ~GTA codes~ exactly as they are; they're filled in automatically.
]]

Locales = Locales or {}

Locales.en = {
    -- Title of the warnings.
    title = 'AFK',
    -- {minutes} is a number, 2 or more.
    warn = 'You\'ll be kicked for being AFK in {minutes} minutes. Move to stay.',
    -- The last warning, one minute left.
    warn_one = 'You\'ll be kicked for being AFK in 1 minute. Move to stay.',
    -- The reason shown when the player is kicked. {minutes} is a number.
    kicked = 'You were kicked for being AFK for {minutes} minutes.',
}
