local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 2,["8"] = 4,["9"] = 5,["10"] = 7,["11"] = 8,["12"] = 10,["13"] = 10,["14"] = 13,["15"] = 13,["16"] = 13,["17"] = 13,["18"] = 18,["19"] = 20});
local ____exports = {}
require("lib.settings")
require("lib.timers")
require("lib.utils")
require("lib.dota_utils")
require("lib.vector_targeting")
require("lib.selection")
local ____GameMode = require("GameMode")
local GameMode = ____GameMode.GameMode
__TS__ObjectAssign(
    getfenv(),
    {Activate = GameMode.Activate, Precache = GameMode.Precache}
)
if GameRules.Addon ~= nil then
    GameRules.Addon:Reload()
end
return ____exports
