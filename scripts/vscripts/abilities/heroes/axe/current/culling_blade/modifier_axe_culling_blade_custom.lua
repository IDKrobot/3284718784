local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 62,["20"] = 63,["21"] = 3,["22"] = 8,["23"] = 9,["24"] = 8,["25"] = 12,["26"] = 13,["27"] = 12,["28"] = 16,["29"] = 17,["30"] = 18,["31"] = 20,["32"] = 21,["33"] = 23,["36"] = 25,["37"] = 27,["38"] = 28,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 34,["49"] = 34,["50"] = 34,["51"] = 34,["52"] = 34,["53"] = 34,["54"] = 34,["55"] = 34,["56"] = 34,["57"] = 35,["58"] = 35,["59"] = 35,["60"] = 35,["61"] = 35,["62"] = 35,["63"] = 35,["64"] = 35,["66"] = 38,["67"] = 42,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 47,["72"] = 47,["73"] = 47,["74"] = 47,["75"] = 47,["76"] = 16,["77"] = 50,["78"] = 51,["79"] = 52,["80"] = 50,["81"] = 55,["82"] = 56,["83"] = 55,["84"] = 4,["85"] = 4,["86"] = 4,["87"] = 3,["90"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_axe_culling_blade_custom = __TS__Class()
local modifier_axe_culling_blade_custom = ____exports.modifier_axe_culling_blade_custom
modifier_axe_culling_blade_custom.name = "modifier_axe_culling_blade_custom"
__TS__ClassExtends(modifier_axe_culling_blade_custom, BaseModifier)
function modifier_axe_culling_blade_custom.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonus_armor = 0
    self.bonus_move_speed = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.bonus_move_speed end
    self.GetModifierPhysicalArmorBonus = function() return self.bonus_armor end
end
function modifier_axe_culling_blade_custom.prototype.IsHidden(self)
    return false
end
function modifier_axe_culling_blade_custom.prototype.IsPurgable(self)
    return false
end
function modifier_axe_culling_blade_custom.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    self.bonus_armor = self:GetSpecialValueFor("armor_bonus")
    self.bonus_move_speed = self:GetSpecialValueFor("speed_bonus")
    if not IsServer() then
        return
    end
    local isJungle = caster:HasWearable("models/items/axe/ti9_jungle_axe/axe_bare.vmdl")
    if caster == parent and isJungle then
        local particle = ParticleManager:CreateParticle("particles/econ/items/axe/ti9_jungle_axe/ti9_jungle_axe_cullingblade_sprint_axe.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
        ParticleManager:SetParticleControlEnt(
            particle,
            2,
            parent,
            PATTACH_ABSORIGIN_FOLLOW,
            "attach_eye_l",
            parent:GetAbsOrigin(),
            true
        )
        ParticleManager:SetParticleControlEnt(
            particle,
            3,
            parent,
            PATTACH_ABSORIGIN_FOLLOW,
            "attach_eye_r",
            parent:GetAbsOrigin(),
            true
        )
        self:AddParticle(
            particle,
            false,
            false,
            -1,
            false,
            false
        )
    end
    local particle_name = isJungle and "particles/econ/items/axe/ti9_jungle_axe/ti9_jungle_axe_culling_blade_sprint.vpcf" or "particles/units/heroes/hero_axe/axe_cullingblade_sprint.vpcf"
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
function modifier_axe_culling_blade_custom.prototype.OnRefresh(self, params)
    self.bonus_armor = self:GetSpecialValueFor("armor_bonus")
    self.bonus_move_speed = self:GetSpecialValueFor("speed_bonus")
end
function modifier_axe_culling_blade_custom.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS}
end
modifier_axe_culling_blade_custom = __TS__Decorate(
    modifier_axe_culling_blade_custom,
    modifier_axe_culling_blade_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_axe_culling_blade_custom"}
)
____exports.modifier_axe_culling_blade_custom = modifier_axe_culling_blade_custom
return ____exports
