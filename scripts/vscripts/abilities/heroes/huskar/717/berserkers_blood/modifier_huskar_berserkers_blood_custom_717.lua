local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 3,["21"] = 11,["22"] = 12,["23"] = 11,["24"] = 15,["25"] = 16,["26"] = 18,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 15,["36"] = 26,["37"] = 27,["38"] = 26,["39"] = 34,["40"] = 35,["41"] = 35,["43"] = 37,["44"] = 37,["45"] = 37,["46"] = 37,["47"] = 38,["48"] = 34,["49"] = 41,["50"] = 42,["51"] = 42,["53"] = 44,["54"] = 44,["55"] = 44,["56"] = 44,["57"] = 45,["58"] = 41,["59"] = 48,["60"] = 49,["61"] = 49,["62"] = 49,["63"] = 49,["64"] = 51,["65"] = 51,["66"] = 51,["67"] = 51,["68"] = 51,["69"] = 53,["70"] = 48,["71"] = 4,["72"] = 4,["73"] = 4,["74"] = 3,["77"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_huskar_berserkers_blood_custom_717 = __TS__Class()
local modifier_huskar_berserkers_blood_custom_717 = ____exports.modifier_huskar_berserkers_blood_custom_717
modifier_huskar_berserkers_blood_custom_717.name = "modifier_huskar_berserkers_blood_custom_717"
__TS__ClassExtends(modifier_huskar_berserkers_blood_custom_717, BaseModifier)
function modifier_huskar_berserkers_blood_custom_717.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.health_threshold = 10
    self.health_range = 100 - self.health_threshold
    self.max_scale = 35
end
function modifier_huskar_berserkers_blood_custom_717.prototype.IsHidden(self)
    return true
end
function modifier_huskar_berserkers_blood_custom_717.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_huskar/huskar_berserkers_blood_glow.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    self:AddParticle(
        self.particle,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_huskar_berserkers_blood_custom_717.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_MODEL_SCALE}
end
function modifier_huskar_berserkers_blood_custom_717.prototype.GetModifierMagicalResistanceBonus(self, event)
    if self:GetParent():PassivesDisabled() then
        return 0
    end
    local percent = math.max(
        (self:GetParent():GetHealthPercent() - self.health_threshold) / self.health_range,
        0
    )
    return (1 - percent) * self:GetSpecialValueFor("maximum_resistance")
end
function modifier_huskar_berserkers_blood_custom_717.prototype.GetModifierAttackSpeedBonus_Constant(self)
    if self:GetParent():PassivesDisabled() then
        return 0
    end
    local percent = math.max(
        (self:GetParent():GetHealthPercent() - self.health_threshold) / self.health_range,
        0
    )
    return (1 - percent) * self:GetSpecialValueFor("maximum_attack_speed")
end
function modifier_huskar_berserkers_blood_custom_717.prototype.GetModifierModelScale(self)
    local percent = math.max(
        (self:GetParent():GetHealthPercent() - self.health_threshold) / self.health_range,
        0
    )
    ParticleManager:SetParticleControl(
        self.particle,
        1,
        Vector((1 - percent) * 100, 0, 0)
    )
    return (1 - percent) * self.max_scale
end
modifier_huskar_berserkers_blood_custom_717 = __TS__Decorate(
    modifier_huskar_berserkers_blood_custom_717,
    modifier_huskar_berserkers_blood_custom_717,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_huskar_berserkers_blood_custom_717"}
)
____exports.modifier_huskar_berserkers_blood_custom_717 = modifier_huskar_berserkers_blood_custom_717
return ____exports
