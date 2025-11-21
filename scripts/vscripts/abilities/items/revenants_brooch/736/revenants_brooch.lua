local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 5,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 13,["27"] = 14,["28"] = 16,["29"] = 17,["31"] = 24,["32"] = 25,["35"] = 13,["36"] = 29,["37"] = 30,["38"] = 30,["40"] = 32,["41"] = 33,["43"] = 35,["44"] = 29,["45"] = 6,["46"] = 6,["47"] = 6,["48"] = 5,["51"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_revenants_brooch_custom_736 = require("abilities.items.revenants_brooch.736.modifier_item_revenants_brooch_custom_736")
local modifier_item_revenants_brooch_custom_736 = ____modifier_item_revenants_brooch_custom_736.modifier_item_revenants_brooch_custom_736
local ____modifier_item_revenants_brooch_custom_736_active = require("abilities.items.revenants_brooch.736.modifier_item_revenants_brooch_custom_736_active")
local modifier_item_revenants_brooch_custom_736_active = ____modifier_item_revenants_brooch_custom_736_active.modifier_item_revenants_brooch_custom_736_active
____exports.item_revenants_brooch_custom_736 = __TS__Class()
local item_revenants_brooch_custom_736 = ____exports.item_revenants_brooch_custom_736
item_revenants_brooch_custom_736.name = "item_revenants_brooch_custom_736"
__TS__ClassExtends(item_revenants_brooch_custom_736, BaseItem)
function item_revenants_brooch_custom_736.prototype.____constructor(self, ...)
    BaseItem.prototype.____constructor(self, ...)
    self.attack_records = {}
end
function item_revenants_brooch_custom_736.prototype.GetIntrinsicModifierName(self)
    return modifier_item_revenants_brooch_custom_736.name
end
function item_revenants_brooch_custom_736.prototype.OnToggle(self)
    local caster = self:GetCaster()
    if self:GetToggleState() then
        modifier_item_revenants_brooch_custom_736_active:apply(caster, caster, self, {})
    else
        if caster:HasModifier(modifier_item_revenants_brooch_custom_736_active.name) then
            caster:RemoveModifierByName(modifier_item_revenants_brooch_custom_736_active.name)
        end
    end
end
function item_revenants_brooch_custom_736.prototype.GetAbilityTextureName(self)
    if not self or self:IsNull() then
        return "item_revenants_brooch_736"
    end
    if self:GetToggleState() then
        return "item_revenants_brooch_736_active"
    end
    return "item_revenants_brooch_736"
end
item_revenants_brooch_custom_736 = __TS__Decorate(
    item_revenants_brooch_custom_736,
    item_revenants_brooch_custom_736,
    {registerAbility(nil)},
    {kind = "class", name = "item_revenants_brooch_custom_736"}
)
____exports.item_revenants_brooch_custom_736 = item_revenants_brooch_custom_736
return ____exports
