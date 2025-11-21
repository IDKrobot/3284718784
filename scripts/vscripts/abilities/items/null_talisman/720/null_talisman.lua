local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 4,["26"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_null_talisman_custom_720 = require("abilities.items.null_talisman.720.modifier_item_null_talisman_custom_720")
local modifier_item_null_talisman_custom_720 = ____modifier_item_null_talisman_custom_720.modifier_item_null_talisman_custom_720
____exports.item_null_talisman_custom_720 = __TS__Class()
local item_null_talisman_custom_720 = ____exports.item_null_talisman_custom_720
item_null_talisman_custom_720.name = "item_null_talisman_custom_720"
__TS__ClassExtends(item_null_talisman_custom_720, BaseItem)
function item_null_talisman_custom_720.prototype.GetIntrinsicModifierName(self)
    return modifier_item_null_talisman_custom_720.name
end
item_null_talisman_custom_720 = __TS__Decorate(
    item_null_talisman_custom_720,
    item_null_talisman_custom_720,
    {registerAbility(nil)},
    {kind = "class", name = "item_null_talisman_custom_720"}
)
____exports.item_null_talisman_custom_720 = item_null_talisman_custom_720
return ____exports
