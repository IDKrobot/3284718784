local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["21"] = 7,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 12,["27"] = 17,["28"] = 18,["29"] = 17,["30"] = 21,["31"] = 7,["32"] = 23,["33"] = 21,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 29,["38"] = 31,["39"] = 32,["40"] = 33,["41"] = 34,["43"] = 37,["44"] = 39,["45"] = 41,["46"] = 42,["47"] = 43,["48"] = 44,["49"] = 46,["50"] = 47,["51"] = 47,["52"] = 47,["53"] = 47,["54"] = 47,["55"] = 47,["56"] = 47,["57"] = 47,["58"] = 47,["59"] = 47,["60"] = 47,["61"] = 47,["62"] = 59,["63"] = 59,["64"] = 59,["65"] = 47,["66"] = 47,["67"] = 64,["68"] = 66,["69"] = 68,["70"] = 69,["71"] = 73,["72"] = 73,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 69,["77"] = 26,["78"] = 83,["79"] = 83,["80"] = 83,["82"] = 84,["83"] = 86,["84"] = 87,["85"] = 88,["86"] = 88,["87"] = 88,["88"] = 88,["89"] = 88,["90"] = 88,["91"] = 88,["92"] = 95,["93"] = 97,["94"] = 98,["95"] = 98,["96"] = 98,["97"] = 98,["98"] = 98,["99"] = 98,["100"] = 98,["101"] = 98,["102"] = 98,["103"] = 98,["106"] = 102,["107"] = 103,["108"] = 103,["109"] = 103,["110"] = 104,["111"] = 105,["113"] = 103,["114"] = 103,["116"] = 83,["117"] = 7,["118"] = 7,["119"] = 7,["120"] = 6,["123"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_morphling_waveform_custom_729 = require("abilities.heroes.morphling.729.waveform.modifier_morphling_waveform_custom_729")
local modifier_morphling_waveform_custom_729 = ____modifier_morphling_waveform_custom_729.modifier_morphling_waveform_custom_729
local ____modifier_morphling_waveform_custom_729_tracker = require("abilities.heroes.morphling.729.waveform.modifier_morphling_waveform_custom_729_tracker")
local modifier_morphling_waveform_custom_729_tracker = ____modifier_morphling_waveform_custom_729_tracker.modifier_morphling_waveform_custom_729_tracker
____exports.morphling_waveform_custom_729 = __TS__Class()
local morphling_waveform_custom_729 = ____exports.morphling_waveform_custom_729
morphling_waveform_custom_729.name = "morphling_waveform_custom_729"
__TS__ClassExtends(morphling_waveform_custom_729, CustomAbility)
function morphling_waveform_custom_729.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "morphling_waveform")
end
function morphling_waveform_custom_729.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_morphling.vsndevts")
end
function morphling_waveform_custom_729.prototype.GetIntrinsicModifierName(self)
    return modifier_morphling_waveform_custom_729_tracker.name
end
function morphling_waveform_custom_729.prototype.OnAbilityUpgrade(self, ability)
    CustomAbility.prototype.OnAbilityUpgrade(self, ability)
    self:EnableAbilityChargesOnTalentUpgrade(ability, "special_bonus_unique_morphling_729_custom_4")
end
function morphling_waveform_custom_729.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local origin = caster:GetAbsOrigin()
    local cast_ability = self
    local replicate = caster:FindAbilityByName("morphling_replicate_custom_729")
    if replicate ~= nil then
        cast_ability = replicate
    end
    local width = self:GetSpecialValueFor("width")
    ProjectileManager:ProjectileDodge(caster)
    local direction = point:__sub(origin)
    direction.z = 0
    local distance = direction:Length2D()
    direction = direction:Normalized()
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_morphling/morphling_waveform.vpcf", caster)
    local info = {
        Ability = cast_ability,
        Source = caster,
        vSpawnOrigin = origin,
        EffectName = particle_name,
        fStartRadius = width,
        fEndRadius = width,
        fDistance = distance,
        vVelocity = direction:__mul(1250),
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
        ExtraData = {
            abilityType = "waveform",
            abilityLevel = self:GetLevel()
        }
    }
    local projectile = ProjectileManager:CreateLinearProjectile(info)
    caster:EmitSound("Hero_Morphling.Waveform")
    caster:RemoveModifierByName(modifier_morphling_waveform_custom_729.name)
    modifier_morphling_waveform_custom_729:apply(caster, caster, self, {
        duration = distance / 1250,
        x = point.x,
        y = point.y,
        z = point.z,
        projectile = projectile
    })
end
function morphling_waveform_custom_729.prototype.OnProjectileHit(self, target, location, simulate)
    if simulate == nil then
        simulate = false
    end
    local caster = self:GetCaster()
    if target then
        local damage = self:GetSpecialValueFor("damage")
        local damageTable = {
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            victim = target,
            ability = self
        }
        ApplyDamage(damageTable)
        if caster:HasTalent("special_bonus_unique_morphling_729_custom_3") then
            caster:PerformAttack(
                target,
                true,
                true,
                true,
                false,
                true,
                false,
                false
            )
        end
    end
    if simulate then
        Timers:CreateTimer(
            FrameTime() ^ 2,
            function()
                if self and not self:IsNull() then
                    caster:RemoveAbilityByHandle(self)
                end
            end
        )
    end
end
morphling_waveform_custom_729 = __TS__Decorate(
    morphling_waveform_custom_729,
    morphling_waveform_custom_729,
    {registerAbility(nil)},
    {kind = "class", name = "morphling_waveform_custom_729"}
)
____exports.morphling_waveform_custom_729 = morphling_waveform_custom_729
return ____exports
