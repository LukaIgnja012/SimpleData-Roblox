# 🚀 SimpleData Manager for Roblox

An open-source, lightweight, and efficient Luau DataStore module designed for Roblox developers. Save and load player data (Coins, Level, XP) effortlessly with minimal setup!

---

## 📦 Features
- ⚡ **Lightweight & Fast:** Optimized for performance.
- 🛡️ **Safe Loading & Saving:** Handles DataStore requests securely using `pcall`.
- 🔄 **Auto-Save on Leave:** Automatically saves player progress when they exit.
- 🛠️ **Plug-and-Play:** Easy to integrate into any project in under a minute.

---

## 🛠️ Installation & Setup

1. Copy the code from `SimpleData.lua`.
2. Create a `ModuleScript` inside **ServerScriptService** or **ReplicatedStorage** in Roblox Studio.
3. Rename the ModuleScript to `SimpleData` and paste the code.

---

## 💻 Code Example

To use `SimpleData` in your server scripts:

```lua
local SimpleData = require(game.ServerScriptService.SimpleData)

game.Players.PlayerAdded:Connect(function(player)
    -- Load player data
    local data = SimpleData.LoadData(player)
    print(player.Name .. " loaded with " .. data.Coins .. " Coins!")
end)
