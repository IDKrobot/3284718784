local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 35,["21"] = 36,["22"] = 37,["23"] = 3,["24"] = 9,["25"] = 10,["26"] = 9,["27"] = 13,["28"] = 14,["29"] = 13,["30"] = 17,["31"] = 18,["32"] = 17,["33"] = 21,["34"] = 22,["35"] = 23,["36"] = 24,["37"] = 21,["38"] = 27,["39"] = 28,["40"] = 27,["41"] = 39,["42"] = 40,["43"] = 39,["44"] = 43,["45"] = 44,["46"] = 43,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 3,["53"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_arcane_blink_custom_731_buff = __TS__Class()
local modifier_item_arcane_blink_custom_731_buff = ____exports.modifier_item_arcane_blink_custom_731_buff
modifier_item_arcane_blink_custom_731_buff.name = "modifier_item_arcane_blink_custom_731_buff"
__TS__ClassExtends(modifier_item_arcane_blink_custom_731_buff, BaseModifier)
function modifier_item_arcane_blink_custom_731_buff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.cast_time = 0
    self.mana_cost = 0
    self.debuff_amp = 0
    self.GetModifierPercentageCasttime = function() return self.cast_time end
    self.GetModifierPercentageManacostStacking = function() return self.mana_cost end
    self.GetModifierStatusResistanceCaster = function() return self.debuff_amp end
end
function modifier_item_arcane_blink_custom_731_buff.prototype.IsHidden(self)
    return false
end
function modifier_item_arcane_blink_custom_731_buff.prototype.IsPurgable(self)
    return false
end
function modifier_item_arcane_blink_custom_731_buff.prototype.IsDebuff(self)
    return false
end
function modifier_item_arcane_blink_custom_731_buff.prototype.OnCreated(self, params)
    self.cast_time = self:GetSpecialValueFor("cast_time_reduction")
    self.mana_cost = self:GetSpecialValueFor("mana_cost_reduction")
    self.debuff_amp = -self:GetSpecialValueFor("debuff_amplification")
end
function modifier_item_arcane_blink_custom_731_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_CASTTIME_PERCENTAGE, MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING, MODIFIER_PROPERTY_STATUS_RESISTANCE_CASTER}
end
function modifier_item_arcane_blink_custom_731_buff.prototype.GetEffectName(self)
    return "particles/generic_gameplay/rune_arcane_owner.vpcf"
end
function modifier_item_arcane_blink_custom_731_buff.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_arcane_blink_custom_731_buff = __TS__Decorate(
    modifier_item_arcane_blink_custom_731_buff,
    modifier_item_arcane_blink_custom_731_buff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_arcane_blink_custom_731_buff"}
)
____exports.modifier_item_arcane_blink_custom_731_buff = modifier_item_arcane_blink_custom_731_buff
return ____exports
