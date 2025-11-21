local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 91,["21"] = 92,["22"] = 4,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 13,["27"] = 14,["28"] = 13,["29"] = 17,["30"] = 18,["31"] = 17,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 25,["36"] = 26,["37"] = 28,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 33,["44"] = 34,["45"] = 36,["46"] = 41,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 41,["54"] = 41,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 42,["64"] = 43,["66"] = 46,["67"] = 51,["68"] = 51,["69"] = 51,["70"] = 51,["71"] = 51,["72"] = 51,["73"] = 51,["74"] = 51,["75"] = 53,["76"] = 58,["77"] = 58,["78"] = 58,["79"] = 58,["80"] = 58,["81"] = 58,["82"] = 58,["83"] = 58,["84"] = 21,["85"] = 61,["86"] = 62,["87"] = 63,["88"] = 65,["89"] = 66,["90"] = 67,["92"] = 70,["95"] = 72,["96"] = 76,["97"] = 81,["98"] = 81,["99"] = 81,["100"] = 81,["101"] = 81,["102"] = 81,["103"] = 81,["104"] = 81,["105"] = 61,["106"] = 84,["107"] = 85,["108"] = 84,["109"] = 94,["110"] = 95,["111"] = 94,["112"] = 98,["113"] = 99,["114"] = 98,["115"] = 5,["116"] = 5,["117"] = 5,["118"] = 4,["121"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
____exports.modifier_invoker_alacrity_custom_732 = __TS__Class()
local modifier_invoker_alacrity_custom_732 = ____exports.modifier_invoker_alacrity_custom_732
modifier_invoker_alacrity_custom_732.name = "modifier_invoker_alacrity_custom_732"
__TS__ClassExtends(modifier_invoker_alacrity_custom_732, BaseInvokerModifier)
function modifier_invoker_alacrity_custom_732.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.damage = 0
    self.attack_speed = 0
    self.GetModifierPreAttack_BonusDamage = function() return self.damage end
    self.GetModifierAttackSpeedBonus_Constant = function() return self.attack_speed end
end
function modifier_invoker_alacrity_custom_732.prototype.IsHidden(self)
    return false
end
function modifier_invoker_alacrity_custom_732.prototype.IsPurgable(self)
    return true
end
function modifier_invoker_alacrity_custom_732.prototype.IsDebuff(self)
    return false
end
function modifier_invoker_alacrity_custom_732.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    self.damage = self:GetOrbSpecialValueFor("bonus_damage", "exort")
    self.attack_speed = self:GetOrbSpecialValueFor("bonus_damage", "wex")
    if not IsServer() then
        return
    end
    local particle_name = "particles/units/heroes/hero_invoker/invoker_alacrity.vpcf"
    local buff_name = "particles/units/heroes/hero_invoker/invoker_alacrity_buff.vpcf"
    if caster:HasWearable("models/items/invoker/immortal_arms_ti7/immortal_arms_ti7.vmdl") then
        particle_name = "particles/econ/items/invoker/invoker_ti7/invoker_ti7_alacrity.vpcf"
        buff_name = "particles/econ/items/invoker/invoker_ti7/invoker_ti7_alacrity_buff.vpcf"
        local particle_hands = ParticleManager:CreateParticle("particles/econ/items/invoker/invoker_ti7/invoker_ti7_alacrity_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
        ParticleManager:SetParticleControlEnt(
            particle_hands,
            1,
            parent,
            PATTACH_POINT_FOLLOW,
            "attach_attack1",
            Vector(0, 0, 0),
            true
        )
        ParticleManager:SetParticleControlEnt(
            particle_hands,
            2,
            parent,
            PATTACH_POINT_FOLLOW,
            "attach_attack2",
            Vector(0, 0, 0),
            true
        )
        ParticleManager:ReleaseParticleIndex(particle_hands)
    end
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, parent)
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    local overhead = ParticleManager:CreateParticle(buff_name, PATTACH_OVERHEAD_FOLLOW, parent)
    self:AddParticle(
        overhead,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_invoker_alacrity_custom_732.prototype.OnRefresh(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_morphling" then
        self.damage = self:GetOrbSpecialValueFor("bonus_damage", "exort")
        self.attack_speed = self:GetOrbSpecialValueFor("bonus_damage", "wex")
    end
    if not IsServer() then
        return
    end
    local particle_name = caster:HasWearable("models/items/invoker/immortal_arms_ti7/immortal_arms_ti7.vmdl") and "particles/econ/items/invoker/invoker_ti7/invoker_ti7_alacrity.vpcf" or "particles/units/heroes/hero_invoker/invoker_alacrity.vpcf"
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, parent)
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_invoker_alacrity_custom_732.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end
function modifier_invoker_alacrity_custom_732.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_alacrity.vpcf"
end
function modifier_invoker_alacrity_custom_732.prototype.StatusEffectPriority(self)
    return 999999
end
modifier_invoker_alacrity_custom_732 = __TS__Decorate(
    modifier_invoker_alacrity_custom_732,
    modifier_invoker_alacrity_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_alacrity_custom_732"}
)
____exports.modifier_invoker_alacrity_custom_732 = modifier_invoker_alacrity_custom_732
return ____exports
