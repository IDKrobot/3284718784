local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 8,["20"] = 9,["21"] = 8,["22"] = 12,["23"] = 13,["24"] = 12,["25"] = 16,["26"] = 17,["27"] = 16,["28"] = 20,["29"] = 21,["30"] = 23,["31"] = 25,["34"] = 27,["35"] = 27,["40"] = 27,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 31,["48"] = 39,["49"] = 20,["50"] = 42,["51"] = 43,["52"] = 44,["54"] = 42,["55"] = 47,["56"] = 48,["57"] = 49,["58"] = 47,["59"] = 52,["60"] = 53,["61"] = 52,["62"] = 56,["63"] = 57,["64"] = 56,["65"] = 4,["66"] = 4,["67"] = 4,["68"] = 3,["71"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_huskar_burning_spear_custom_717 = __TS__Class()
local modifier_huskar_burning_spear_custom_717 = ____exports.modifier_huskar_burning_spear_custom_717
modifier_huskar_burning_spear_custom_717.name = "modifier_huskar_burning_spear_custom_717"
__TS__ClassExtends(modifier_huskar_burning_spear_custom_717, BaseModifier)
function modifier_huskar_burning_spear_custom_717.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.damage = 0
end
function modifier_huskar_burning_spear_custom_717.prototype.IsHidden(self)
    return false
end
function modifier_huskar_burning_spear_custom_717.prototype.IsPurgable(self)
    return false
end
function modifier_huskar_burning_spear_custom_717.prototype.IsDebuff(self)
    return true
end
function modifier_huskar_burning_spear_custom_717.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    self.damage = self:GetSpecialValueFor("burn_damage")
    if not IsServer() then
        return
    end
    local ____caster_HasTalent_result_0
    if caster:HasTalent("special_bonus_unique_huskar_717_custom_3") then
        ____caster_HasTalent_result_0 = DAMAGE_TYPE_PURE
    else
        ____caster_HasTalent_result_0 = DAMAGE_TYPE_MAGICAL
    end
    local damageType = ____caster_HasTalent_result_0
    self.damageTable = {
        attacker = self:GetCaster(),
        damage = 0,
        damage_type = damageType,
        victim = self:GetParent(),
        ability = self:GetAbility()
    }
    self:StartIntervalThink(1)
end
function modifier_huskar_burning_spear_custom_717.prototype.OnRemoved(self, death)
    if IsServer() then
        self:GetParent():StopSound("Hero_Huskar.Burning_Spear")
    end
end
function modifier_huskar_burning_spear_custom_717.prototype.OnIntervalThink(self)
    self.damageTable.damage = self.damage * self:GetStackCount()
    ApplyDamage(self.damageTable)
end
function modifier_huskar_burning_spear_custom_717.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_huskar/huskar_burning_spear_debuff.vpcf"
end
function modifier_huskar_burning_spear_custom_717.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_huskar_burning_spear_custom_717 = __TS__Decorate(
    modifier_huskar_burning_spear_custom_717,
    modifier_huskar_burning_spear_custom_717,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_huskar_burning_spear_custom_717"}
)
____exports.modifier_huskar_burning_spear_custom_717 = modifier_huskar_burning_spear_custom_717
return ____exports
