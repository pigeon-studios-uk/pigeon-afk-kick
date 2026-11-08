Config = {}

-- Language for the warnings and the kick message. 'auto' follows ox_lib's language (setr ox:locale "de" in
-- server.cfg) and is English when that isn't set. Or name a file from locales/, such as 'de' or 'pt-br'.
Config.Locale = 'auto'

-- How long, in minutes, a player can stand still before they're kicked.
Config.KickMinutes = 15

-- Warnings before the kick, in minutes left. { 5, 1 } warns 5 minutes and 1 minute before.
Config.Warnings = { 5, 1 }

-- Only kick while at least this many players are on the server. 0 always kicks. For example 32 keeps
-- AFK players on a quiet server and only frees their slot when it's busy.
Config.MinPlayers = 0

-- How far, in metres, a player has to move (or how far they have to turn, in degrees) to count as active.
Config.MinDistance = 1.0
Config.MinTurn = 10.0

-- Players with any of these ACE permissions are never kicked.
--   'pigeon.afkkick.exempt'  give it to anyone:  add_ace group.moderator pigeon.afkkick.exempt allow
--   'command'                staff on most servers (txAdmin and the default server.cfg give it to admins)
--   'admin'                  admins on Qbox and QBCore
Config.ExemptPermissions = { 'pigeon.afkkick.exempt', 'command', 'admin' }

-- How warnings are shown.
-- 'auto' uses ox_lib notifications if ox_lib is running, otherwise GTA's notification feed.
-- 'ox_lib' or 'gta' to force one.
Config.Notifications = 'auto'

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
