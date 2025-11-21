local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 62,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 18,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 20,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 27,["47"] = 27,["48"] = 27,["49"] = 27,["50"] = 27,["51"] = 15,["52"] = 30,["53"] = 31,["54"] = 32,["55"] = 34,["58"] = 36,["59"] = 37,["60"] = 38,["62"] = 41,["63"] = 42,["66"] = 44,["67"] = 44,["68"] = 44,["69"] = 44,["70"] = 44,["71"] = 44,["72"] = 44,["73"] = 44,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 46,["79"] = 46,["80"] = 46,["81"] = 30,["82"] = 55,["83"] = 56,["84"] = 55,["85"] = 64,["86"] = 65,["87"] = 64,["88"] = 4,["89"] = 4,["90"] = 4,["91"] = 3,["94"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_dazzle_shallow_grave_custom_734 = __TS__Class()
local modifier_dazzle_shallow_grave_custom_734 = ____exports.modifier_dazzle_shallow_grave_custom_734
modifier_dazzle_shallow_grave_custom_734.name = "modifier_dazzle_shallow_grave_custom_734"
__TS__ClassExtends(modifier_dazzle_shallow_grave_custom_734, BaseModifier)
function modifier_dazzle_shallow_grave_custom_734.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetMinHealth = function() return 1 end
end
function modifier_dazzle_shallow_grave_custom_734.prototype.IsHidden(self)
    return false
end
function modifier_dazzle_shallow_grave_custom_734.prototype.IsPurgable(self)
    return false
end
function modifier_dazzle_shallow_grave_custom_734.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local height = self:GetSpecialValueFor("fx_halo_height")
    local particle_name = ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_dazzle/dazzle_shallow_grave.vpcf",
        self:GetCaster()
    )
    self.particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        self.particle,
        7,
        Vector(6, 0, 0)
    )
    ParticleManager:SetParticleControl(
        self.particle,
        8,
        Vector(0, 0, height)
    )
    self:AddParticle(
        self.particle,
        false,
        false,
        2,
        false,
        false
    )
end
function modifier_dazzle_shallow_grave_custom_734.prototype.OnDestroy(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not IsServer() or not ability then
        return
    end
    if self.particle then
        ParticleManager:DestroyParticle(self.particle, true)
        ParticleManager:ReleaseParticleIndex(self.particle)
    end
    local heal = self:GetSpecialValueFor("heal_on_end")
    if heal == 0 then
        return
    end
    parent:HealWithParams(
        heal,
        ability,
        false,
        true,
        self:GetCaster(),
        false
    )
    SendOverheadEventMessage(
        nil,
        OVERHEAD_ALERT_HEAL,
        parent,
        heal,
        nil
    )
end
function modifier_dazzle_shallow_grave_custom_734.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MIN_HEALTH, MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_SOURCE}
end
function modifier_dazzle_shallow_grave_custom_734.prototype.GetModifierHealAmplify_PercentageSource(self)
    return self:GetSpecialValueFor("heal_amplify") * ((100 - self:GetParent():GetHealthPercent()) / 10)
end
modifier_dazzle_shallow_grave_custom_734 = __TS__Decorate(
    modifier_dazzle_shallow_grave_custom_734,
    modifier_dazzle_shallow_grave_custom_734,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_dazzle_shallow_grave_custom_734"}
)
____exports.modifier_dazzle_shallow_grave_custom_734 = modifier_dazzle_shallow_grave_custom_734
return ____exports
