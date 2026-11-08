# Changelog

All notable changes to Pigeon AFK Kick are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

First release.

### Highlights

- Kicks players who stand still too long, checked on the server
- Warnings at 5 minutes and 1 minute left
- Staff exempt by ACE permission
- Optional minimum player count
- 23 languages

### Added

- Server-side AFK checks every 10 seconds from each player's position and heading, with `Config.KickMinutes`, `Config.MinDistance` and `Config.MinTurn`.
- Warnings on screen with a sound at `Config.Warnings` minutes left, and a kick message saying why.
- Staff exempt through `Config.ExemptPermissions` (`pigeon.afkkick.exempt`, `command` and `admin` by default).
- `Config.MinPlayers` to only kick on a busy server.
- `GetIdleSeconds` and `SetExempt` server exports, and a `pigeon-afk-kick:kicked` server event.
- Warnings and the kick message in 23 languages, following ox_lib's language with `Config.Locale = 'auto'`.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-afk-kick/commits/main
