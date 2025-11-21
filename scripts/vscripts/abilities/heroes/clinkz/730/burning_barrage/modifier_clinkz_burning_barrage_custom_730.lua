local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 9,["16"] = 10,["17"] = 9,["18"] = 13,["19"] = 14,["20"] = 13,["21"] = 17,["22"] = 18,["23"] = 17,["24"] = 21,["25"] = 22,["26"] = 24,["27"] = 25,["28"] = 26,["29"] = 28,["32"] = 30,["33"] = 32,["34"] = 34,["35"] = 35,["36"] = 37,["37"] = 38,["38"] = 40,["39"] = 41,["40"] = 43,["41"] = 43,["42"] = 43,["43"] = 43,["44"] = 43,["45"] = 43,["46"] = 43,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 59,["56"] = 60,["57"] = 21,["58"] = 63,["59"] = 64,["62"] = 66,["63"] = 68,["64"] = 70,["65"] = 72,["66"] = 73,["67"] = 63,["68"] = 4,["69"] = 4,["70"] = 4,["71"] = 3,["74"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_clinkz_burning_barrage_custom_730 = __TS__Class()
local modifier_clinkz_burning_barrage_custom_730 = ____exports.modifier_clinkz_burning_barrage_custom_730
modifier_clinkz_burning_barrage_custom_730.name = "modifier_clinkz_burning_barrage_custom_730"
__TS__ClassExtends(modifier_clinkz_burning_barrage_custom_730, BaseModifier)
function modifier_clinkz_burning_barrage_custom_730.prototype.IsHidden(self)
    return false
end
function modifier_clinkz_burning_barrage_custom_730.prototype.IsPurgable(self)
    return false
end
function modifier_clinkz_burning_barrage_custom_730.prototype.RemoveOnDeath(self)
    return false
end
function modifier_clinkz_burning_barrage_custom_730.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local wave_count = self:GetSpecialValueFor("wave_count")
    local projectile_width = self:GetSpecialValueFor("projectile_width")
    local interval = math.floor(self:GetDuration() / wave_count * 100) / 100
    if not IsServer() then
        return
    end
    self.count = wave_count
    local projectile_speed = parent:GetProjectileSpeed()
    local attack_range_bonus = parent:Script_GetAttackRange() - parent:GetBaseAttackRange()
    local distance = self:GetSpecialValueFor("range") + attack_range_bonus
    local point = Vector(params.x, params.y, params.z)
    local projectile_direction = point:__sub(parent:GetAbsOrigin()):Normalized()
    local velocity = projectile_direction:__mul(projectile_speed)
    velocity.z = 0
    self.info = {
        vSpawnOrigin = parent:GetAbsOrigin():__add(Vector(0, 0, 100)),
        vVelocity = velocity,
        fDistance = distance,
        fStartRadius = projectile_width,
        fEndRadius = projectile_width,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        EffectName = "particles/units/heroes/hero_clinkz/clinkz_searing_arrow_linear_proj.vpcf",
        Ability = self:GetAbility(),
        Source = parent,
        bProvidesVision = true,
        iVisionRadius = projectile_width,
        iVisionTeamNumber = parent:GetTeamNumber()
    }
    self:OnIntervalThink()
    self:StartIntervalThink(interval)
end
function modifier_clinkz_burning_barrage_custom_730.prototype.OnIntervalThink(self)
    if self.count <= 0 then
        return
    end
    local parent = self:GetParent()
    parent:StartGesture(ACT_DOTA_CAST_ABILITY_1)
    parent:EmitSound("Hero_Clinkz.Barrage.Attack")
    ProjectileManager:CreateLinearProjectile(self.info)
    self.count = self.count - 1
end
modifier_clinkz_burning_barrage_custom_730 = __TS__Decorate(
    modifier_clinkz_burning_barrage_custom_730,
    modifier_clinkz_burning_barrage_custom_730,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_clinkz_burning_barrage_custom_730"}
)
____exports.modifier_clinkz_burning_barrage_custom_730 = modifier_clinkz_burning_barrage_custom_730
return ____exports
