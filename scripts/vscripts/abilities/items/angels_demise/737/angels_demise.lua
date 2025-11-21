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
local ____modifier_item_angels_demise_custom_737 = require("abilities.items.angels_demise.737.modifier_item_angels_demise_custom_737")
local modifier_item_angels_demise_custom_737 = ____modifier_item_angels_demise_custom_737.modifier_item_angels_demise_custom_737
____exports.item_angels_demise_custom_737 = __TS__Class()
local item_angels_demise_custom_737 = ____exports.item_angels_demise_custom_737
item_angels_demise_custom_737.name = "item_angels_demise_custom_737"
__TS__ClassExtends(item_angels_demise_custom_737, BaseItem)
function item_angels_demise_custom_737.prototype.GetIntrinsicModifierName(self)
    return modifier_item_angels_demise_custom_737.name
end
item_angels_demise_custom_737 = __TS__Decorate(
    item_angels_demise_custom_737,
    item_angels_demise_custom_737,
    {registerAbility(nil)},
    {kind = "class", name = "item_angels_demise_custom_737"}
)
____exports.item_angels_demise_custom_737 = item_angels_demise_custom_737
return ____exports
