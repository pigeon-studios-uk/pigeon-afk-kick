--[[
    Pigeon AFK Kick: Simplified Chinese (简体中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-cn'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales['zh-cn'] = {
    title = '挂机',
    warn = '你将在 {minutes} 分钟后因挂机被踢出。移动一下即可留下。',
    warn_one = '你将在 1 分钟后因挂机被踢出。移动一下即可留下。',
    kicked = '你因挂机 {minutes} 分钟被踢出。',
}
