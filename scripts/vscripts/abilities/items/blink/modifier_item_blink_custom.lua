local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 4,["22"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerModifier = ____blink.BlinkDaggerModifier
____exports.modifier_item_blink_custom = __TS__Class()
local modifier_item_blink_custom = ____exports.modifier_item_blink_custom
modifier_item_blink_custom.name = "modifier_item_blink_custom"
__TS__ClassExtends(modifier_item_blink_custom, BlinkDaggerModifier)
modifier_item_blink_custom = __TS__Decorate(
    modifier_item_blink_custom,
    modifier_item_blink_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_blink_custom"}
)
____exports.modifier_item_blink_custom = modifier_item_blink_custom
return ____exports
