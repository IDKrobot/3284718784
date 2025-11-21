local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 26,["18"] = 27,["19"] = 3,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 13,["27"] = 14,["28"] = 13,["29"] = 17,["30"] = 18,["31"] = 17,["32"] = 29,["33"] = 30,["34"] = 31,["35"] = 33,["38"] = 35,["41"] = 36,["44"] = 37,["47"] = 38,["50"] = 39,["53"] = 40,["56"] = 41,["59"] = 43,["60"] = 47,["61"] = 49,["62"] = 49,["63"] = 49,["64"] = 49,["65"] = 49,["66"] = 49,["67"] = 49,["68"] = 49,["69"] = 51,["70"] = 56,["71"] = 29,["72"] = 4,["73"] = 4,["74"] = 4,["75"] = 3,["78"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_eternal_shroud_custom_732 = __TS__Class()
local modifier_item_eternal_shroud_custom_732 = ____exports.modifier_item_eternal_shroud_custom_732
modifier_item_eternal_shroud_custom_732.name = "modifier_item_eternal_shroud_custom_732"
__TS__ClassExtends(modifier_item_eternal_shroud_custom_732, BaseModifier)
function modifier_item_eternal_shroud_custom_732.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierMagicalResistanceBonus = function() return self:GetSpecialValueFor("bonus_spell_resist") end
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("bonus_health_regen") end
end
function modifier_item_eternal_shroud_custom_732.prototype.IsHidden(self)
    return true
end
function modifier_item_eternal_shroud_custom_732.prototype.IsPurgable(self)
    return false
end
function modifier_item_eternal_shroud_custom_732.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_eternal_shroud_custom_732.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS, MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT, MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function modifier_item_eternal_shroud_custom_732.prototype.OnTakeDamage(self, event)
    local parent = self:GetParent()
    local target = event.unit
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if parent == target then
        return
    end
    if parent:IsIllusion() then
        return
    end
    if target:IsBuilding() then
        return
    end
    if event.damage <= 0 then
        return
    end
    if event.inflictor == nil then
        return
    end
    if bit.band(event.damage_flags, DOTA_DAMAGE_FLAG_REFLECTION) == DOTA_DAMAGE_FLAG_REFLECTION then
        return
    end
    local lifesteal = target:IsHero() and self:GetSpecialValueFor("hero_lifesteal") or self:GetSpecialValueFor("creep_lifesteal")
    local heal = event.damage * lifesteal / 100
    parent:HealWithParams(
        heal,
        event.inflictor,
        true,
        true,
        parent,
        true
    )
    local particle = ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:ReleaseParticleIndex(particle)
end
modifier_item_eternal_shroud_custom_732 = __TS__Decorate(
    modifier_item_eternal_shroud_custom_732,
    modifier_item_eternal_shroud_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_eternal_shroud_custom_732"}
)
____exports.modifier_item_eternal_shroud_custom_732 = modifier_item_eternal_shroud_custom_732
return ____exports
