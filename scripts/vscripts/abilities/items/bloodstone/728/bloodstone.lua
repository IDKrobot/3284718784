local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 12,["26"] = 13,["27"] = 14,["28"] = 14,["30"] = 16,["31"] = 11,["32"] = 19,["33"] = 20,["34"] = 22,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 19,["42"] = 6,["43"] = 6,["44"] = 6,["45"] = 5,["48"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_bloodstone_custom_728 = require("abilities.items.bloodstone.728.modifier_item_bloodstone_custom_728")
local modifier_item_bloodstone_custom_728 = ____modifier_item_bloodstone_custom_728.modifier_item_bloodstone_custom_728
local ____modifier_item_bloodstone_custom_728_active = require("abilities.items.bloodstone.728.modifier_item_bloodstone_custom_728_active")
local modifier_item_bloodstone_custom_728_active = ____modifier_item_bloodstone_custom_728_active.modifier_item_bloodstone_custom_728_active
____exports.item_bloodstone_custom_728 = __TS__Class()
local item_bloodstone_custom_728 = ____exports.item_bloodstone_custom_728
item_bloodstone_custom_728.name = "item_bloodstone_custom_728"
__TS__ClassExtends(item_bloodstone_custom_728, BaseItem)
function item_bloodstone_custom_728.prototype.GetIntrinsicModifierName(self)
    return modifier_item_bloodstone_custom_728.name
end
function item_bloodstone_custom_728.prototype.GetManaCost(self, level)
    if not self then
        return 0
    end
    local caster = self:GetCaster()
    if not caster then
        return 0
    end
    return caster:GetMaxMana() * self:GetSpecialValueFor("mana_cost_percentage") / 100
end
function item_bloodstone_custom_728.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:EmitSound("DOTA_Item.Bloodstone.Cast")
    modifier_item_bloodstone_custom_728_active:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("restore_duration")}
    )
end
item_bloodstone_custom_728 = __TS__Decorate(
    item_bloodstone_custom_728,
    item_bloodstone_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "item_bloodstone_custom_728"}
)
____exports.item_bloodstone_custom_728 = item_bloodstone_custom_728
return ____exports
