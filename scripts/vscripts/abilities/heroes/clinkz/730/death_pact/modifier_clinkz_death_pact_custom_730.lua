local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 53,["20"] = 54,["21"] = 3,["22"] = 8,["23"] = 9,["24"] = 8,["25"] = 12,["26"] = 13,["27"] = 12,["28"] = 16,["29"] = 17,["30"] = 19,["31"] = 20,["32"] = 22,["33"] = 23,["34"] = 25,["35"] = 27,["38"] = 29,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 33,["44"] = 16,["45"] = 36,["46"] = 37,["47"] = 36,["48"] = 40,["49"] = 41,["50"] = 43,["51"] = 40,["52"] = 46,["53"] = 47,["54"] = 46,["55"] = 56,["56"] = 57,["57"] = 56,["58"] = 60,["59"] = 61,["60"] = 60,["61"] = 4,["62"] = 4,["63"] = 4,["64"] = 3,["67"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_clinkz_death_pact_custom_730 = __TS__Class()
local modifier_clinkz_death_pact_custom_730 = ____exports.modifier_clinkz_death_pact_custom_730
modifier_clinkz_death_pact_custom_730.name = "modifier_clinkz_death_pact_custom_730"
__TS__ClassExtends(modifier_clinkz_death_pact_custom_730, BaseModifier)
function modifier_clinkz_death_pact_custom_730.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonus_health = 0
    self.bonus_damage = 0
    self.GetModifierPreAttack_BonusDamage = function() return self.bonus_damage end
    self.GetModifierExtraHealthBonus = function() return self.bonus_health end
end
function modifier_clinkz_death_pact_custom_730.prototype.IsHidden(self)
    return false
end
function modifier_clinkz_death_pact_custom_730.prototype.IsPurgable(self)
    return false
end
function modifier_clinkz_death_pact_custom_730.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local health_gain = self:GetSpecialValueFor("health_gain_pct")
    local damage_gain = self:GetSpecialValueFor("damage_gain_pct")
    self.bonus_health = self:GetStackCount() * health_gain / 100
    self.bonus_damage = self:GetStackCount() * damage_gain / 100
    self:SetStackCount(0)
    if not IsServer() then
        return
    end
    parent:CalculateStatBonus(true)
    parent:Heal(
        self.bonus_health,
        self:GetAbility()
    )
    self:StartIntervalThink(0.1)
end
function modifier_clinkz_death_pact_custom_730.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_clinkz_death_pact_custom_730.prototype.OnIntervalThink(self)
    self:GetParent():CalculateStatBonus(true)
    self:StopIntervalThink()
end
function modifier_clinkz_death_pact_custom_730.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_EXTRA_HEALTH_BONUS}
end
function modifier_clinkz_death_pact_custom_730.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_clinkz/clinkz_death_pact_buff.vpcf"
end
function modifier_clinkz_death_pact_custom_730.prototype.GetEffectAttachType(self)
    return PATTACH_POINT_FOLLOW
end
modifier_clinkz_death_pact_custom_730 = __TS__Decorate(
    modifier_clinkz_death_pact_custom_730,
    modifier_clinkz_death_pact_custom_730,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_clinkz_death_pact_custom_730"}
)
____exports.modifier_clinkz_death_pact_custom_730 = modifier_clinkz_death_pact_custom_730
return ____exports
