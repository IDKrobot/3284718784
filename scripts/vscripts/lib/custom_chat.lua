local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 8,["14"] = 8,["15"] = 8,["17"] = 8,["18"] = 14,["19"] = 15,["20"] = 16,["23"] = 18,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 14,["32"] = 33,["33"] = 34,["34"] = 34,["35"] = 34,["36"] = 34,["37"] = 34,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 33,["42"] = 49,["43"] = 50,["44"] = 50,["45"] = 50,["46"] = 50,["47"] = 50,["48"] = 50,["49"] = 50,["50"] = 50,["51"] = 49,["52"] = 60,["53"] = 61,["54"] = 61,["55"] = 61,["56"] = 61,["57"] = 60,["58"] = 67,["59"] = 68,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 67});
local ____exports = {}
local ChatActions = ChatActions or ({})
ChatActions.PLAYER_NAME = 0
ChatActions[ChatActions.PLAYER_NAME] = "PLAYER_NAME"
ChatActions.PLAYER_COLOR = 1
ChatActions[ChatActions.PLAYER_COLOR] = "PLAYER_COLOR"
ChatActions.HERO_NAME = 2
ChatActions[ChatActions.HERO_NAME] = "HERO_NAME"
____exports.CustomChat = __TS__Class()
local CustomChat = ____exports.CustomChat
CustomChat.name = "CustomChat"
function CustomChat.prototype.____constructor(self)
end
function CustomChat.MessageToPlayer(self, sender_id, add_tag, target_id, main_token, tokens, is_team, is_all)
    local target = PlayerResource:GetPlayer(target_id)
    if not target then
        return
    end
    CustomGameEventManager:Send_ServerToPlayer(target, "custom_chat_message", {
        sender_id = sender_id,
        main_token = main_token,
        is_team = is_team,
        is_all = is_all,
        tokens = tokens,
        add_tag = add_tag
    })
end
function CustomChat.MessageToTeam(self, sender_id, add_tag, team, main_token, tokens, is_team, is_all)
    CustomGameEventManager:Send_ServerToTeam(team, "custom_chat_message", {
        sender_id = sender_id,
        main_token = main_token,
        is_team = is_team,
        is_all = is_all,
        tokens = tokens,
        add_tag = add_tag
    })
end
function CustomChat.MessageToAll(self, sender_id, add_tag, main_token, tokens, is_team, is_all)
    CustomGameEventManager:Send_ServerToAllClients("custom_chat_message", {
        sender_id = sender_id,
        main_token = main_token,
        is_team = is_team,
        is_all = is_all,
        tokens = tokens,
        add_tag = add_tag
    })
end
function CustomChat.Player(self, suffix)
    return {
        ["player_name_" .. tostring(suffix)] = ChatActions.PLAYER_NAME,
        ["player_color_" .. tostring(suffix)] = ChatActions.PLAYER_COLOR
    }
end
function CustomChat.Hero(self, suffix)
    return {
        ["player_hero_" .. tostring(suffix)] = ChatActions.HERO_NAME,
        ["player_color_" .. tostring(suffix)] = ChatActions.PLAYER_COLOR
    }
end
return ____exports
