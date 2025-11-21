local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 4,["22"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____rearm = require("abilities.heroes.tinker.global_usage.rearm")
local TinkerRearmModifierClass = ____rearm.TinkerRearmModifierClass
____exports.modifier_tinker_rearm_custom_730 = __TS__Class()
local modifier_tinker_rearm_custom_730 = ____exports.modifier_tinker_rearm_custom_730
modifier_tinker_rearm_custom_730.name = "modifier_tinker_rearm_custom_730"
__TS__ClassExtends(modifier_tinker_rearm_custom_730, TinkerRearmModifierClass)
modifier_tinker_rearm_custom_730 = __TS__Decorate(
    modifier_tinker_rearm_custom_730,
    modifier_tinker_rearm_custom_730,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_rearm_custom_730"}
)
____exports.modifier_tinker_rearm_custom_730 = modifier_tinker_rearm_custom_730
return ____exports
