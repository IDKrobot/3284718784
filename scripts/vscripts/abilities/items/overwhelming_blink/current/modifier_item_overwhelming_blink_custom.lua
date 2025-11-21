local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 4,["16"] = 5,["17"] = 4,["18"] = 5,["19"] = 6,["20"] = 5,["22"] = 7,["23"] = 6,["24"] = 13,["25"] = 14,["26"] = 13,["27"] = 5,["28"] = 5,["29"] = 5,["30"] = 4,["33"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerModifier = ____blink.BlinkDaggerModifier
____exports.modifier_item_overwhelming_blink_custom = __TS__Class()
local modifier_item_overwhelming_blink_custom = ____exports.modifier_item_overwhelming_blink_custom
modifier_item_overwhelming_blink_custom.name = "modifier_item_overwhelming_blink_custom"
__TS__ClassExtends(modifier_item_overwhelming_blink_custom, BlinkDaggerModifier)
function modifier_item_overwhelming_blink_custom.prototype.DeclareFunctions(self)
    local ____array_0 = __TS__SparseArrayNew(unpack(BlinkDaggerModifier.prototype.DeclareFunctions(self)))
    __TS__SparseArrayPush(____array_0, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS)
    return {__TS__SparseArraySpread(____array_0)}
end
function modifier_item_overwhelming_blink_custom.prototype.GetModifierBonusStats_Strength(self)
    return self:GetSpecialValueFor("bonus_strength")
end
modifier_item_overwhelming_blink_custom = __TS__Decorate(
    modifier_item_overwhelming_blink_custom,
    modifier_item_overwhelming_blink_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_overwhelming_blink_custom"}
)
____exports.modifier_item_overwhelming_blink_custom = modifier_item_overwhelming_blink_custom
return ____exports
