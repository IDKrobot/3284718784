local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 8,["16"] = 9,["17"] = 8,["18"] = 12,["19"] = 13,["20"] = 12,["21"] = 16,["22"] = 17,["23"] = 16,["24"] = 20,["25"] = 21,["26"] = 22,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 20,["33"] = 27,["34"] = 28,["35"] = 27,["36"] = 34,["37"] = 35,["38"] = 34,["39"] = 38,["40"] = 39,["41"] = 38,["42"] = 42,["43"] = 43,["44"] = 42,["45"] = 46,["46"] = 47,["47"] = 46,["48"] = 4,["49"] = 4,["50"] = 4,["51"] = 3,["54"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_sange_and_yasha_custom_714_debuff = __TS__Class()
local modifier_item_sange_and_yasha_custom_714_debuff = ____exports.modifier_item_sange_and_yasha_custom_714_debuff
modifier_item_sange_and_yasha_custom_714_debuff.name = "modifier_item_sange_and_yasha_custom_714_debuff"
__TS__ClassExtends(modifier_item_sange_and_yasha_custom_714_debuff, BaseModifier)
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.IsHidden(self)
    return false
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    if not caster then
        return
    end
    local ____temp_0 = caster:IsRangedAttacker() and -13 or -26
    self.attack_speed = ____temp_0
    self.movespeed = ____temp_0
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.movespeed
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return self.attack_speed
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.GetEffectName(self)
    return "particles/items2_fx/sange_maim.vpcf"
end
function modifier_item_sange_and_yasha_custom_714_debuff.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_sange_and_yasha_custom_714_debuff = __TS__Decorate(
    modifier_item_sange_and_yasha_custom_714_debuff,
    modifier_item_sange_and_yasha_custom_714_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_sange_and_yasha_custom_714_debuff"}
)
____exports.modifier_item_sange_and_yasha_custom_714_debuff = modifier_item_sange_and_yasha_custom_714_debuff
return ____exports
