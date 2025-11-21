local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 5,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 13,["27"] = 14,["28"] = 14,["30"] = 15,["31"] = 16,["32"] = 16,["34"] = 18,["35"] = 19,["37"] = 6,["38"] = 13,["39"] = 24,["40"] = 25,["41"] = 27,["42"] = 28,["43"] = 30,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 41,["52"] = 42,["54"] = 45,["55"] = 24,["56"] = 48,["57"] = 49,["58"] = 49,["60"] = 50,["61"] = 51,["62"] = 51,["64"] = 53,["65"] = 54,["67"] = 56,["68"] = 48,["69"] = 6,["70"] = 6,["71"] = 6,["72"] = 5,["75"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_revenants_brooch_custom_734 = require("abilities.items.revenants_brooch.734.modifier_item_revenants_brooch_custom_734")
local modifier_item_revenants_brooch_custom_734 = ____modifier_item_revenants_brooch_custom_734.modifier_item_revenants_brooch_custom_734
local ____modifier_item_revenants_brooch_custom_734_counter = require("abilities.items.revenants_brooch.734.modifier_item_revenants_brooch_custom_734_counter")
local modifier_item_revenants_brooch_custom_734_counter = ____modifier_item_revenants_brooch_custom_734_counter.modifier_item_revenants_brooch_custom_734_counter
____exports.item_revenants_brooch_custom_734 = __TS__Class()
local item_revenants_brooch_custom_734 = ____exports.item_revenants_brooch_custom_734
item_revenants_brooch_custom_734.name = "item_revenants_brooch_custom_734"
__TS__ClassExtends(item_revenants_brooch_custom_734, BaseItem)
function item_revenants_brooch_custom_734.prototype.____constructor(self, ...)
    BaseItem.prototype.____constructor(self, ...)
    self.attack_records = {}
end
function item_revenants_brooch_custom_734.prototype.GetIntrinsicModifierName(self)
    return modifier_item_revenants_brooch_custom_734.name
end
function item_revenants_brooch_custom_734.prototype.GetManaCost(self, level)
    if not self or self:IsNull() then
        return 0
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() then
        return 0
    end
    if caster:HasModifier(modifier_item_revenants_brooch_custom_734_counter.name) then
        return 0
    end
    return BaseItem.prototype.GetManaCost(self, level)
end
function item_revenants_brooch_custom_734.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    if caster:HasModifier(modifier_item_revenants_brooch_custom_734_counter.name) then
        caster:RemoveModifierByName(modifier_item_revenants_brooch_custom_734_counter.name)
        self:UseResources(false, false, false, true)
    else
        modifier_item_revenants_brooch_custom_734_counter:apply(
            caster,
            caster,
            self,
            {duration = self:GetSpecialValueFor("active_duration")}
        )
        self:EndCooldown()
        self:StartCooldown(0.25)
    end
    caster:EmitSound("Item.Brooch.Cast")
end
function item_revenants_brooch_custom_734.prototype.GetAbilityTextureName(self)
    if not self or self:IsNull() then
        return "item_revenants_brooch_734"
    end
    local caster = self:GetCaster()
    if not caster or caster:IsNull() then
        return "item_revenants_brooch_734"
    end
    if caster:HasModifier(modifier_item_revenants_brooch_custom_734_counter.name) then
        return "item_revenants_brooch_734_active"
    end
    return "item_revenants_brooch_734"
end
item_revenants_brooch_custom_734 = __TS__Decorate(
    item_revenants_brooch_custom_734,
    item_revenants_brooch_custom_734,
    {registerAbility(nil)},
    {kind = "class", name = "item_revenants_brooch_custom_734"}
)
____exports.item_revenants_brooch_custom_734 = item_revenants_brooch_custom_734
return ____exports
