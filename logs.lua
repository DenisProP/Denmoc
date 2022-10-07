local module = {}

local function postHook(webhook , args)
(syn and syn.request or http_request or request)({
    Url = webhook,
    Method = "POST", 
    Headers = {["Content-Type"] = "application/json"},
    Body = game:GetService("HttpService"):JSONEncode(args)
})
end

function module.logInject()
postHook(
    "https://discord.com/api/webhooks/1028029960612499507/Zl2FjYvdlDwjw-JgVS6i1UTw-SMYLQKsxjHYWX2ByheoDIu5A2lsYCxfdq3GVmmcvLBw",
    {
        ["username"] = game.Players:GetNameFromUserIdAsync(game.Players.LocalPlayer.UserId),
        ["avatar_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=".. 
game.Players.LocalPlayer.UserId .."&width=60&height=60&format=png",
        ["content"] = "@everyone",
        ["embeds"] = {{
            ["title"] = "**New inject!**",
      ["description"] = "\nhttps://www.roblox.com/users/".. game.Players.LocalPlayer.UserId .."/profile".."\n\nInjector: ".. identifyexecutor() .."\n",
            ["type"] = "rich",
            ["color"] = tonumber(0xbe03fc),
            ["footer"] = {
                ["text"] = os.date("%x")
            }
        }}
    }
)
end

return module
