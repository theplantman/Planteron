--<|> Client Anti Kick Or ShutDown <|>--
local MetaTable = getrawmetatable(game)
local OldNameCall = MetaTable["__namecall"]
setreadonly(MetaTable, false)
MetaTable["__namecall"] = function(self, ...)
    if getnamecallmethod():lower() == "kick" or getnamecallmethod():lower() == "shutdown" then
        return nil
    end
    return OldNameCall(self, ...)
end
setreadonly(MetaTable, true)
--<|> Join Discord Server <|>--
local Request = request or syn.request
Request({
    ["Body"] = game.HttpService:JSONEncode({
        ["args"] = {
            ["code"] = "zW5jJcRzK6"
        },
        ["cmd"] = "INVITE_BROWSER",
        ["nonce"] = game.HttpService:GenerateGUID(false)
    }),
    ["Headers"] = {
        ["Content-Type"] = "application/json",
        ["Origin"] = "https://discord.com"
    },
    ["Method"] = "POST",
    ["Url"] = "http://127.0.0.1:6463/rpc?v=1"
})
--<|> Plateron <|>--
local GameList = {
    "10418442236"
}
if table.find(GameList, tostring(game.PlaceId)) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/theplantman/Planteron/main/" .. tostring(game.PlaceId) .. ".lua"))()
end