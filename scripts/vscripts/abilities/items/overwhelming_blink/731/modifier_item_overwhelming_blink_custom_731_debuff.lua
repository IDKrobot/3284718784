local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 3,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 20,["30"] = 21,["31"] = 22,["32"] = 20,["33"] = 25,["34"] = 26,["35"] = 25,["36"] = 32,["37"] = 33,["38"] = 32,["39"] = 36,["40"] = 37,["41"] = 36,["42"] = 40,["43"] = 41,["44"] = 40,["45"] = 44,["46"] = 45,["47"] = 44,["48"] = 48,["49"] = 49,["50"] = 48,["51"] = 4,["52"] = 4,["53"] = 4,["54"] = 3,["57"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_overwhelming_blink_custom_731_debuff = __TS__Class()
local modifier_item_overwhelming_blink_custom_731_debuff = ____exports.modifier_item_overwhelming_blink_custom_731_debuff
modifier_item_overwhelming_blink_custom_731_debuff.name = "modifier_item_overwhelming_blink_custom_731_debuff"
__TS__ClassExtends(modifier_item_overwhelming_blink_custom_731_debuff, BaseModifier)
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.movespeed = 0
    self.attackSpeed = 0
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.IsHidden(self)
    return false
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.OnCreated(self, params)
    self.movespeed = -self:GetSpecialValueFor("movement_slow")
    self.attackSpeed = -self:GetSpecialValueFor("attack_slow")
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.movespeed
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.attackSpeed
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_brewmaster_thunder_clap.vpcf"
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_brewmaster/brewmaster_thunder_clap_debuff.vpcf"
end
function modifier_item_overwhelming_blink_custom_731_debuff.prototype.StatusEffectPriority(self)
    return MODIFIER_PRIORITY_HIGH
end
modifier_item_overwhelming_blink_custom_731_debuff = __TS__Decorate(
    modifier_item_overwhelming_blink_custom_731_debuff,
    modifier_item_overwhelming_blink_custom_731_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_overwhelming_blink_custom_731_debuff"}
)
____exports.modifier_item_overwhelming_blink_custom_731_debuff = modifier_item_overwhelming_blink_custom_731_debuff
return ____exports
