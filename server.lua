function sendToDiscord(name, message, color)
    local embed = {
        {
            ["color"] = color,
            ["title"] = name,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Ykaa Scripts © " .. os.date("%d.%m.%Y %H:%M:%S"),
            },
        }
    }
    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({
        username = Config.WebhookName, 
        avatar_url = Config.AvatarURL, 
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end

function getPlayerIdentifiers(id)
    local identifiers = { discord = "Not found", steam = "Not found", license = "Not found", ip = "Not found" }
    if id and id > 0 then
        for i = 0, GetNumPlayerIdentifiers(id) - 1 do
            local playerID = GetPlayerIdentifier(id, i)
            if string.find(playerID, "steam") then identifiers.steam = playerID
            elseif string.find(playerID, "discord") then identifiers.discord = "<@" .. string.sub(playerID, 9) .. ">"
            elseif string.find(playerID, "license") then identifiers.license = playerID
            elseif string.find(playerID, "ip") then identifiers.ip = string.sub(playerID, 4) end
        end
    end
    return identifiers
end

function getFormattedData(id)
    local ids = getPlayerIdentifiers(id)
    return "\n**ID:** `" .. id .. "`\n**IP:** `" .. ids.ip .. "`\n**Discord:** " .. ids.discord .. "\n**License:** `" .. ids.license .. "`"
end

-- [JOIN/LEAVE/CHAT/EXPLOSION LOGS]
AddEventHandler('playerConnecting', function(name)
    sendToDiscord("🟢 Joining", "**" .. name .. "** is connecting." .. getFormattedData(source), Config.Colors.Green)
end)

AddEventHandler('playerDropped', function(reason)
    sendToDiscord("🔴 Leaving", "**" .. GetPlayerName(source) .. "** left the server.\nReason: " .. reason .. getFormattedData(source), Config.Colors.Red)
end)

AddEventHandler('chatMessage', function(source, name, message)
    if Config.LogChat and message:sub(1, 1) ~= "/" then
        sendToDiscord("💬 Chat", "**" .. name .. "**: " .. message .. getFormattedData(source), Config.Colors.Blue)
    end
end)

AddEventHandler('explosionEvent', function(source, ev)
    if Config.LogExplosions and source ~= 0 then
        sendToDiscord("💥 Explosion", "**" .. GetPlayerName(source) .. "** caused an explosion (Type: " .. ev.explosionType .. ")" .. getFormattedData(source), Config.Colors.Orange)
    end
end)

-- [RESOURCE LOGS]
AddEventHandler('onResourceStart', function(resourceName)
    if Config.LogResources then
        sendToDiscord("🚀 Resource Start", "Resource: `" .. resourceName .. "` was launched.", Config.Colors.Green)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if Config.LogResources then
        sendToDiscord("🚀 Resource Stop", "Resource: `" .. resourceName .. "` was stopped.", Config.Colors.Red)
    end
end)

-- [TXADMIN LOGS]
AddEventHandler('txAdmin:events:actionPerformed', function(data)
    if Config.LogTxAdminActions and data.action ~= 'warn' then
        local message = "**Admin:** `" .. data.author .. "`\n**Action:** `" .. data.action:upper() .. "`\n**Target:** `" .. data.targetName .. "`\n**Reason:** " .. (data.reason or "Not specified")
        sendToDiscord("🛡️ txAdmin Action", message, Config.Colors.Red)
    end
end)

AddEventHandler('txAdmin:events:announcement', function(data)
    if Config.LogTxAdminAnnounce then
        sendToDiscord("📣 txAdmin Announcement", "**Admin:** `" .. data.author .. "`\n**Message:** " .. data.message, Config.Colors.Blue)
    end
end)