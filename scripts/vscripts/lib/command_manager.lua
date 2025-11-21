local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 10,["15"] = 3,["16"] = 7,["17"] = 7,["19"] = 8,["20"] = 8,["21"] = 8,["22"] = 8,["23"] = 8,["24"] = 8,["25"] = 8,["26"] = 3,["27"] = 10,["28"] = 10,["29"] = 12,["30"] = 15,["31"] = 15,["33"] = 12,["34"] = 13,["35"] = 14,["36"] = 15,["37"] = 17,["38"] = 11,["39"] = 20,["40"] = 21,["41"] = 20,["42"] = 24,["43"] = 25,["44"] = 24,["45"] = 28,["47"] = 29,["48"] = 30,["50"] = 31,["52"] = 33,["54"] = 34,["56"] = 36,["58"] = 37,["61"] = 40,["64"] = 28,["65"] = 44,["66"] = 45,["67"] = 46,["69"] = 44,["70"] = 51,["71"] = 53,["72"] = 53,["73"] = 53,["75"] = 53,["76"] = 60,["77"] = 61,["78"] = 60,["79"] = 64,["80"] = 65,["81"] = 65,["82"] = 65,["83"] = 65,["84"] = 66,["85"] = 67,["87"] = 70,["88"] = 72,["89"] = 74,["90"] = 64,["91"] = 77,["92"] = 78,["93"] = 79,["94"] = 81,["97"] = 82,["100"] = 83,["103"] = 85,["104"] = 86,["105"] = 87,["108"] = 89,["111"] = 91,["112"] = 77,["113"] = 94,["114"] = 95,["115"] = 95,["116"] = 95,["117"] = 95,["118"] = 94,["119"] = 99,["120"] = 100,["121"] = 101,["122"] = 102,["123"] = 103,["124"] = 103,["125"] = 103,["126"] = 103,["127"] = 99,["129"] = 57,["130"] = 53});
local ____exports = {}
local ChatCommandObject
____exports.ChatCommand = function(____, name, description, callback, ____type)
    if ____type == nil then
        ____type = 0
    end
    return __TS__New(
        ChatCommandObject,
        name,
        description,
        callback,
        ____type
    )
end
ChatCommandObject = __TS__Class()
ChatCommandObject.name = "ChatCommandObject"
function ChatCommandObject.prototype.____constructor(self, name, description, callback, ____type)
    if ____type == nil then
        ____type = 0
    end
    self.name = name
    self.description = description
    self.callback = callback
    self.type = ____type
    ____exports.CommandManager:RegisterCommand(self)
end
function ChatCommandObject.prototype.getName(self)
    return self.name
end
function ChatCommandObject.prototype.getDescription(self)
    return self.description
end
function ChatCommandObject.prototype.CanBeRun(self)
    repeat
        local ____switch7 = self.type
        local ____cond7 = ____switch7 == 0
        if ____cond7 then
            return true
        end
        ____cond7 = ____cond7 or ____switch7 == 1
        if ____cond7 then
            return GameRules:IsCheatMode()
        end
        ____cond7 = ____cond7 or ____switch7 == 2
        if ____cond7 then
            return IsInToolsMode()
        end
        do
            return false
        end
    until true
end
function ChatCommandObject.prototype.run(self, playerId, args)
    if self:CanBeRun() then
        self:callback(playerId, args)
    end
end
local COMMAND_PREFIX = "-"
____exports.CommandManager = __TS__Class()
local CommandManager = ____exports.CommandManager
CommandManager.name = "CommandManager"
function CommandManager.prototype.____constructor(self)
end
function CommandManager.GetCommands(self)
    return __TS__ObjectValues(self.commandMap)
end
function CommandManager.RegisterCommand(self, command)
    if __TS__ArrayIncludes(
        __TS__ObjectKeys(self.commandMap),
        command:getName()
    ) then
        Warning(("Command " .. command:getName()) .. " already registered!")
        return false
    end
    self.commandMap[command:getName()] = command
    print(("Command '" .. command:getName()) .. "' has been registered!")
    return true
end
function CommandManager.ProcessChatEvent(self, event)
    local playerId = event.playerid
    local message = event.text
    if not PlayerResource:IsValidPlayerID(playerId) then
        return
    end
    if #message == 0 then
        return
    end
    if not self:containCommand(message) then
        return
    end
    local command, args = unpack(self:splitMessage(message))
    local chatCommand = self.commandMap[__TS__StringSubstring(command, 1)]
    if chatCommand == nil then
        return
    end
    if not chatCommand:CanBeRun() then
        return
    end
    chatCommand:run(playerId, args)
end
function CommandManager.containCommand(self, message)
    return __TS__ArraySome(
        __TS__ObjectKeys(self.commandMap),
        function(____, command) return __TS__StringStartsWith(message, COMMAND_PREFIX .. command) end
    )
end
function CommandManager.splitMessage(self, message)
    local parts = __TS__StringSplit(message, " ")
    local command = table.remove(parts, 1) or ""
    local args = parts
    return {
        string.lower(command),
        args
    }
end;
(function(self)
    self.commandMap = {}
end)(CommandManager)
return ____exports
