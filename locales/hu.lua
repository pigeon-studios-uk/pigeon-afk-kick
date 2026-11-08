--[[
    Pigeon AFK Kick: Hungarian (Magyar).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hu'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.hu = {
    title = 'AFK',
    warn = '{minutes} perc múlva ki leszel rúgva AFK miatt. Mozdulj meg, hogy maradj.',
    warn_one = '1 perc múlva ki leszel rúgva AFK miatt. Mozdulj meg, hogy maradj.',
    kicked = 'Ki lettél rúgva, mert {minutes} percig AFK voltál.',
}
