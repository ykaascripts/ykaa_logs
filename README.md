# 📂 Ykaa Scripts - Discord Logging System

A lightweight and efficient logging system for **FiveM** servers that sends real-time game events to your Discord server via Webhooks. Designed with a clean look and detailed player information.

---

## ✨ Features

* **📥 Player Connection:** Logs when a player joins (includes ID, IP, Discord, and License).
* **📤 Player Disconnect:** Logs when a player leaves including the reason.
* **💬 Chat Logs:** Sends all chat messages (excluding commands) to Discord.
* **💥 Explosion Protection:** Monitors and logs explosions (useful for anti-cheat).
* **▶️ Resource Management:** Logs when scripts are started or stopped.
* **🛡️ txAdmin Integration:** Tracks Bans, Kicks, and Announcements directly from txAdmin.

---

## 🚀 Installation

1.  Create a folder named `ykaa_logs` in your server resources.
2.  Place `fxmanifest.lua`, `config.lua`, and `server.lua` inside the folder.
3.  Open `config.lua` and paste your **Discord Webhook URL**.
4.  Add `ensure ykaa_logs` to your `server.cfg`.
5.  Restart your server.

---

## ⚙️ Configuration

You can easily toggle features in the `config.lua` file:

```lua
Config.LogJoin = true           -- Log player connections
Config.LogLeave = true          -- Log player disconnections
Config.LogChat = true           -- Log chat messages
Config.LogExplosions = true     -- Log explosions
Config.LogResources = true       -- Log resource start/stop
Config.LogTxAdminActions = true -- Log Bans and Kicks from txAdmin
