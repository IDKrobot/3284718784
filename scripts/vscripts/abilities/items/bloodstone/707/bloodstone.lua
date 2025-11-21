local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 13,["23"] = 10,["24"] = 5,["25"] = 5,["26"] = 5,["27"] = 4,["30"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_bloodstone_custom_707 = require("abilities.items.bloodstone.707.modifier_item_bloodstone_custom_707")
local modifier_item_bloodstone_custom_707 = ____modifier_item_bloodstone_custom_707.modifier_item_bloodstone_custom_707
____exports.item_bloodstone_custom_707 = __TS__Class()
local item_bloodstone_custom_707 = ____exports.item_bloodstone_custom_707
item_bloodstone_custom_707.name = "item_bloodstone_custom_707"
__TS__ClassExtends(item_bloodstone_custom_707, BaseItem)
function item_bloodstone_custom_707.prototype.GetIntrinsicModifierName(self)
    return modifier_item_bloodstone_custom_707.name
end
function item_bloodstone_custom_707.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:KillWithExceptions(self, caster)
end
item_bloodstone_custom_707 = __TS__Decorate(
    item_bloodstone_custom_707,
    item_bloodstone_custom_707,
    {registerAbility(nil)},
    {kind = "class", name = "item_bloodstone_custom_707"}
)
____exports.item_bloodstone_custom_707 = item_bloodstone_custom_707
return ____exports
