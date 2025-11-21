local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 6,["15"] = 7,["16"] = 6,["17"] = 7,["19"] = 7,["20"] = 8,["21"] = 12,["22"] = 13,["23"] = 14,["24"] = 12,["25"] = 17,["26"] = 18,["27"] = 17,["28"] = 21,["29"] = 22,["30"] = 24,["31"] = 26,["34"] = 28,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 28,["47"] = 28,["48"] = 40,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 42,["61"] = 53,["62"] = 21,["63"] = 56,["64"] = 57,["65"] = 59,["68"] = 61,["69"] = 61,["70"] = 61,["71"] = 61,["72"] = 61,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["78"] = 63,["79"] = 64,["80"] = 64,["81"] = 64,["82"] = 64,["83"] = 64,["84"] = 64,["85"] = 64,["86"] = 71,["87"] = 73,["88"] = 56,["89"] = 76,["90"] = 77,["91"] = 79,["92"] = 80,["93"] = 80,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 80,["99"] = 87,["100"] = 89,["101"] = 76,["102"] = 92,["103"] = 93,["104"] = 93,["105"] = 93,["106"] = 93,["107"] = 92,["108"] = 7,["109"] = 7,["110"] = 7,["111"] = 6,["114"] = 7});
local ____exports = {}
local ____ability_utils = require("lib.ability_utils")
local BaseOrbAbility = ____ability_utils.BaseOrbAbility
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
LinkLuaModifier("modifier_generic_orb_effect_lua", "abilities/generic/modifier_generic_orb_effect_lua.lua", LUA_MODIFIER_MOTION_NONE)
____exports.clinkz_searing_arrows_custom_730 = __TS__Class()
local clinkz_searing_arrows_custom_730 = ____exports.clinkz_searing_arrows_custom_730
clinkz_searing_arrows_custom_730.name = "clinkz_searing_arrows_custom_730"
__TS__ClassExtends(clinkz_searing_arrows_custom_730, BaseOrbAbility)
function clinkz_searing_arrows_custom_730.prototype.____constructor(self)
    BaseOrbAbility.prototype.____constructor(self, "clinkz_searing_arrows")
end
function clinkz_searing_arrows_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_clinkz.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_clinkz.vsndevts")
end
function clinkz_searing_arrows_custom_730.prototype.GetIntrinsicModifierName(self)
    return "modifier_generic_orb_effect_lua"
end
function clinkz_searing_arrows_custom_730.prototype.OnOrbFire(self, event)
    local caster = self:GetCaster()
    caster:EmitSound("Hero_Clinkz.SearingArrows")
    if not caster:HasTalent("special_bonus_unique_clinkz_730_custom_5") then
        return
    end
    local enemy = __TS__ArrayFilter(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            caster:GetAbsOrigin(),
            nil,
            caster:Script_GetAttackRange(),
            2,
            bit.bor(1, 18),
            bit.bor(128, 256),
            0,
            false
        ),
        function(____, enemy) return enemy ~= event.target end
    )[1]
    if enemy == nil then
        return
    end
    local info = {
        Source = caster,
        Target = enemy,
        Ability = self,
        EffectName = self:GetProjectileName(),
        iMoveSpeed = caster:GetProjectileSpeed(),
        vSourceLoc = caster:GetAbsOrigin(),
        bDodgeable = true,
        bIsAttack = true
    }
    ProjectileManager:CreateTrackingProjectile(info)
end
function clinkz_searing_arrows_custom_730.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    caster:PerformAttack(
        target,
        true,
        false,
        true,
        false,
        false,
        false,
        false
    )
    local damage = self:GetSpecialValueFor("bonus_damage")
    local damageTable = {
        attacker = self:GetCaster(),
        damage = damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    target:EmitSound("Hero_Clinkz.SearingArrows.Impact")
end
function clinkz_searing_arrows_custom_730.prototype.OnOrbImpact(self, event)
    local target = event.target
    local damage = self:GetSpecialValueFor("bonus_damage")
    local damageTable = {
        attacker = self:GetCaster(),
        damage = damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    target:EmitSound("Hero_Clinkz.SearingArrows.Impact")
end
function clinkz_searing_arrows_custom_730.prototype.GetProjectileName(self)
    return ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_clinkz/clinkz_searing_arrow.vpcf",
        self:GetCaster()
    )
end
clinkz_searing_arrows_custom_730 = __TS__Decorate(
    clinkz_searing_arrows_custom_730,
    clinkz_searing_arrows_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "clinkz_searing_arrows_custom_730"}
)
____exports.clinkz_searing_arrows_custom_730 = clinkz_searing_arrows_custom_730
return ____exports
