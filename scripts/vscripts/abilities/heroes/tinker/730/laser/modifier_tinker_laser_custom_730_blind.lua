local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 18,["27"] = 18,["32"] = 18,["33"] = 17,["34"] = 23,["35"] = 24,["36"] = 25,["37"] = 27,["40"] = 28,["43"] = 30,["44"] = 32,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 38,["54"] = 38,["55"] = 34,["56"] = 34,["57"] = 23,["58"] = 45,["59"] = 46,["60"] = 45,["61"] = 53,["62"] = 54,["63"] = 53,["64"] = 57,["65"] = 58,["66"] = 57,["67"] = 61,["68"] = 62,["69"] = 61,["70"] = 65,["71"] = 66,["72"] = 66,["74"] = 68,["75"] = 68,["76"] = 65,["77"] = 4,["78"] = 4,["79"] = 4,["80"] = 3,["83"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_tinker_laser_custom_730_blind = __TS__Class()
local modifier_tinker_laser_custom_730_blind = ____exports.modifier_tinker_laser_custom_730_blind
modifier_tinker_laser_custom_730_blind.name = "modifier_tinker_laser_custom_730_blind"
__TS__ClassExtends(modifier_tinker_laser_custom_730_blind, BaseModifier)
function modifier_tinker_laser_custom_730_blind.prototype.IsHidden(self)
    return false
end
function modifier_tinker_laser_custom_730_blind.prototype.IsDebuff(self)
    return true
end
function modifier_tinker_laser_custom_730_blind.prototype.IsPurgable(self)
    return true
end
function modifier_tinker_laser_custom_730_blind.prototype.GetAttributes(self)
    local ____temp_2
    local ____opt_0 = self:GetCaster()
    if not not (____opt_0 and ____opt_0:HasScepter()) then
        ____temp_2 = MODIFIER_ATTRIBUTE_MULTIPLE
    else
        ____temp_2 = MODIFIER_ATTRIBUTE_NONE
    end
    return ____temp_2
end
function modifier_tinker_laser_custom_730_blind.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    if not caster or not caster:HasScepter() or not parent:IsHero() then
        return
    end
    local health_reduction = self:GetSpecialValueFor("health_reduction")
    local health = parent:GetHealth()
    parent:ModifyHealth(
        health - health * health_reduction / 100,
        self:GetAbility(),
        false,
        bit.bor(
            bit.bor(
                bit.bor(DOTA_DAMAGE_FLAG_NON_LETHAL, DOTA_DAMAGE_FLAG_HPLOSS),
                DOTA_DAMAGE_FLAG_NO_DAMAGE_MULTIPLIERS
            ),
            DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION
        )
    )
end
function modifier_tinker_laser_custom_730_blind.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MISS_PERCENTAGE, MODIFIER_PROPERTY_EXTRA_HEALTH_PERCENTAGE, MODIFIER_PROPERTY_MODEL_SCALE}
end
function modifier_tinker_laser_custom_730_blind.prototype.GetModifierMiss_Percentage(self)
    return self:GetSpecialValueFor("miss_rate")
end
function modifier_tinker_laser_custom_730_blind.prototype.GetModifierExtraHealthPercentage(self)
    return -self:GetHealthReduction()
end
function modifier_tinker_laser_custom_730_blind.prototype.GetModifierModelScale(self)
    return -self:GetHealthReduction()
end
function modifier_tinker_laser_custom_730_blind.prototype.GetHealthReduction(self)
    if not self:GetParent():IsHero() then
        return 0
    end
    local ____opt_3 = self:GetCaster()
    return ____opt_3 and ____opt_3:HasScepter() and self:GetSpecialValueFor("health_reduction") or 0
end
modifier_tinker_laser_custom_730_blind = __TS__Decorate(
    modifier_tinker_laser_custom_730_blind,
    modifier_tinker_laser_custom_730_blind,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_laser_custom_730_blind"}
)
____exports.modifier_tinker_laser_custom_730_blind = modifier_tinker_laser_custom_730_blind
return ____exports
