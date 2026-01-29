<h1 align="center">Hi 👋, we are SQRZ DEVS</h1>

<h3 align="center">SQRZ Skydiving Script</h3>

**SQRZ Skydiving Script for FiveM**  
Lightweight standalone resource for realistic skydiving. Teleports to 4500m above Los Santos (customizable), starts SkyDive task, gives parachute and shows notifications. E-key deploys parachute, auto-landing possible.

## Features
- Teleport & SkyDive start via Export `StartSkyDive(position)` or `/skydiving`
- Server command `/skydiving [ID]` with ID check for admins
- Exports: `ServerStartSkyDive(targetId)`, events for ESX integration
- Client loop for parachute deploy (E/Space), native-based, low resmon
- Chat notifications: "Skydiving started! Space for parachute"

## Installation
1. Copy folder to `resources`
2. In `server.cfg`: `ensure sqrz-skydive` (or your folder name)
3. Start server – compatible with Legacy/Cerulean, standalone

## Exports & Commands
| Type | Name | Description |
|------|------|-------------|
| Client | `StartSkyDive(vector3)` | Starts skydiving at position |
| Client | `DeployParachute()` | Opens parachute instantly |
| Server | `ServerStartSkyDive(id)` | For target player |
| Command | `/skydiving` | Start yourself |
| Command | `/skydiving [ID]` | Start for other (admin) |

## Structure
- `fxmanifest.lua`: Version 1.0.0, client/server scripts
- `client.lua`: Player interaction, loops, tasks
- `server.lua`: Commands, events, validation

**Discord Support:** https://discord.gg/yqHsd3rZxA  
**Languages:** ![Lua](https://raw.githubusercontent.com/devicons/devicon/master/icons/lua/lua-original.svg) ![FiveM](https://avatars.githubusercontent.com/u/28798151?s=200&v=4)

---
*First public script by SQRZ DEVS – Updates coming!*

LG @mr.dardy112
