local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 3,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 20,["30"] = 21,["31"] = 22,["32"] = 20,["33"] = 25,["34"] = 26,["35"] = 25,["36"] = 32,["37"] = 33,["38"] = 32,["39"] = 36,["40"] = 37,["41"] = 36,["42"] = 40,["43"] = 41,["44"] = 40,["45"] = 44,["46"] = 45,["47"] = 44,["48"] = 4,["49"] = 4,["50"] = 4,["51"] = 3,["54"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_arcane_blink_custom_730_buff = __TS__Class()
local modifier_item_arcane_blink_custom_730_buff = ____exports.modifier_item_arcane_blink_custom_730_buff
modifier_item_arcane_blink_custom_730_buff.name = "modifier_item_arcane_blink_custom_730_buff"
__TS__ClassExtends(modifier_item_arcane_blink_custom_730_buff, BaseModifier)
function modifier_item_arcane_blink_custom_730_buff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.cooldown = 0
    self.cast_time = 0
end
function modifier_item_arcane_blink_custom_730_buff.prototype.IsHidden(self)
    return false
end
function modifier_item_arcane_blink_custom_730_buff.prototype.IsPurgable(self)
    return false
end
function modifier_item_arcane_blink_custom_730_buff.prototype.IsDebuff(self)
    return false
end
function modifier_item_arcane_blink_custom_730_buff.prototype.OnCreated(self, params)
    self.cooldown = self:GetSpecialValueFor("cooldown_reduction")
    self.cast_time = self:GetSpecialValueFor("cast_time_reduction")
end
function modifier_item_arcane_blink_custom_730_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_CASTTIME_PERCENTAGE, MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE}
end
function modifier_item_arcane_blink_custom_730_buff.prototype.GetModifierPercentageCasttime(self, event)
    return self.cast_time
end
function modifier_item_arcane_blink_custom_730_buff.prototype.GetModifierPercentageCooldown(self, event)
    return self.cooldown
end
function modifier_item_arcane_blink_custom_730_buff.prototype.GetEffectName(self)
    return "particles/generic_gameplay/rune_arcane_owner.vpcf"
end
function modifier_item_arcane_blink_custom_730_buff.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_arcane_blink_custom_730_buff = __TS__Decorate(
    modifier_item_arcane_blink_custom_730_buff,
    modifier_item_arcane_blink_custom_730_buff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_arcane_blink_custom_730_buff"}
)
____exports.modifier_item_arcane_blink_custom_730_buff = modifier_item_arcane_blink_custom_730_buff
return ____exports
