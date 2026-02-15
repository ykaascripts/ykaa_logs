-- ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
-- ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
-- ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
-- ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
-- ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
--  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 

Config = {}

Config.WebhookName = "Ykaa Scripts"
Config.WebhookURL = "" -- Insert your webhook here
Config.AvatarURL = "https://cdn.discordapp.com/attachments/123456789/987654321/placeholder.png"
-- Webhook colors (Green, Red, Orange, Blue, Grey)
Config.Colors = {
    Green = 65280, -- Join
    Red = 16711680, -- Leave
    Orange = 16744192, -- Explosions
    Blue = 3447003, -- Chat/Resource
}

-- Join/Leave/Kill/Chat/Explosions/Resource logs
Config.LogJoin = true
Config.LogLeave = true
Config.LogChat = true
Config.LogExplosions = true
Config.LogResources = true

-- Admin actions/Admin annouce
Config.LogTxAdminActions = true 
Config.LogTxAdminAnnounce = true 

print("^5[Ykaa Scripts]^0 Config with Resource logs loaded successfully!")