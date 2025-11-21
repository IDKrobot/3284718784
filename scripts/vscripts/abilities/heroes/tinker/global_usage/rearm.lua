local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 8,["17"] = 9,["18"] = 8,["19"] = 12,["20"] = 13,["21"] = 12,["22"] = 16,["23"] = 17,["24"] = 16});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
____exports.TinkerRearmModifierClass = __TS__Class()
local TinkerRearmModifierClass = ____exports.TinkerRearmModifierClass
TinkerRearmModifierClass.name = "TinkerRearmModifierClass"
__TS__ClassExtends(TinkerRearmModifierClass, BaseModifier)
function TinkerRearmModifierClass.prototype.IsHidden(self)
    return false
end
function TinkerRearmModifierClass.prototype.IsPurgable(self)
    return false
end
function TinkerRearmModifierClass.prototype.IsPurgeException(self)
    return false
end
function TinkerRearmModifierClass.prototype.IsDebuff(self)
    return false
end
return ____exports
