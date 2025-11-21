local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 4,["16"] = 5,["17"] = 4,["18"] = 5,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 6,["23"] = 11,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["30"] = 17,["31"] = 18,["32"] = 19,["33"] = 20,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 23,["43"] = 23,["44"] = 23,["45"] = 23,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 23,["50"] = 23,["51"] = 39,["52"] = 41,["53"] = 43,["54"] = 44,["55"] = 45,["57"] = 48,["60"] = 50,["61"] = 52,["62"] = 52,["63"] = 52,["64"] = 52,["65"] = 52,["66"] = 52,["67"] = 52,["68"] = 52,["69"] = 52,["70"] = 52,["71"] = 52,["72"] = 52,["73"] = 52,["74"] = 52,["75"] = 52,["76"] = 62,["77"] = 63,["78"] = 63,["80"] = 65,["81"] = 52,["82"] = 52,["83"] = 70,["84"] = 71,["85"] = 72,["87"] = 11,["88"] = 76,["89"] = 76,["90"] = 76,["92"] = 77,["93"] = 78,["96"] = 79,["99"] = 81,["100"] = 82,["101"] = 83,["102"] = 84,["103"] = 85,["104"] = 87,["105"] = 88,["106"] = 90,["107"] = 90,["108"] = 90,["109"] = 90,["110"] = 90,["111"] = 90,["112"] = 98,["113"] = 99,["114"] = 101,["115"] = 101,["116"] = 101,["117"] = 101,["118"] = 105,["119"] = 105,["120"] = 105,["121"] = 101,["122"] = 101,["124"] = 112,["125"] = 114,["126"] = 119,["127"] = 120,["128"] = 120,["129"] = 120,["130"] = 120,["131"] = 120,["132"] = 121,["133"] = 121,["134"] = 121,["135"] = 121,["136"] = 121,["137"] = 121,["138"] = 121,["139"] = 121,["140"] = 121,["141"] = 122,["142"] = 124,["143"] = 126,["144"] = 127,["145"] = 127,["146"] = 127,["147"] = 128,["148"] = 129,["150"] = 127,["151"] = 127,["153"] = 76,["154"] = 5,["155"] = 5,["156"] = 5,["157"] = 4,["160"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_morphling_adaptive_strike_str_custom_729 = require("abilities.heroes.morphling.729.adaptive_strike_str.modifier_morphling_adaptive_strike_str_custom_729")
local modifier_morphling_adaptive_strike_str_custom_729 = ____modifier_morphling_adaptive_strike_str_custom_729.modifier_morphling_adaptive_strike_str_custom_729
____exports.morphling_adaptive_strike_str_custom_729 = __TS__Class()
local morphling_adaptive_strike_str_custom_729 = ____exports.morphling_adaptive_strike_str_custom_729
morphling_adaptive_strike_str_custom_729.name = "morphling_adaptive_strike_str_custom_729"
__TS__ClassExtends(morphling_adaptive_strike_str_custom_729, BaseAbility)
function morphling_adaptive_strike_str_custom_729.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_morphling.vsndevts")
end
function morphling_adaptive_strike_str_custom_729.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local cast_ability = self
    local replicate = caster:FindAbilityByName("morphling_replicate_custom_729")
    if replicate ~= nil then
        cast_ability = replicate
    end
    local info = {
        Target = target,
        Source = caster,
        Ability = cast_ability,
        EffectName = "particles/units/heroes/hero_morphling/morphling_adaptive_strike_str_proj.vpcf",
        iMoveSpeed = 1150,
        bDodgeable = true,
        bVisibleToEnemies = true,
        bReplaceExisting = false,
        bProvidesVision = false,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_2,
        ExtraData = {
            abilityType = "str",
            abilityLevel = self:GetLevel()
        }
    }
    ProjectileManager:CreateTrackingProjectile(info)
    caster:EmitSound("Hero_Morphling.AdaptiveStrikeStr.Cast")
    local adaptive_strike_agi = caster:FindAbilityByName("morphling_adaptive_strike_agi_custom_729")
    if adaptive_strike_agi then
        adaptive_strike_agi:StartCooldown(3)
    end
    if not caster:HasShard() then
        return
    end
    local radius = self:GetCastRange(origin, target) + 300
    local units = __TS__ArraySort(
        __TS__ArrayFilter(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                origin,
                nil,
                radius,
                2,
                bit.bor(1, 18),
                bit.bor(256, 128),
                1,
                false
            ),
            function(____, unit) return unit ~= target end
        ),
        function(____, a, b)
            if a:IsCreep() == b:IsCreep() then
                return 0
            end
            return a:IsCreep() and 1 or -1
        end
    )
    if #units > 0 then
        info.Target = units[1]
        ProjectileManager:CreateTrackingProjectile(info)
    end
end
function morphling_adaptive_strike_str_custom_729.prototype.OnProjectileHit(self, target, location, simulate)
    if simulate == nil then
        simulate = false
    end
    local caster = self:GetCaster()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    if not target:IsMagicImmune() then
        local min_stun = self:GetSpecialValueFor("stun_min")
        local max_stun = self:GetSpecialValueFor("stun_max")
        local min_knockback = self:GetSpecialValueFor("knockback_min")
        local max_knockback = self:GetSpecialValueFor("knockback_max")
        local agility = caster:GetAgility()
        local strength = caster:GetStrength()
        local function calculateLinear(____, min, max)
            return math.max(
                min,
                math.min(max, min + (strength - agility * 1.5) / strength * (max - min))
            )
        end
        local stun_duration = calculateLinear(nil, min_stun, max_stun)
        local knockback_distance = calculateLinear(nil, min_knockback, max_knockback)
        modifier_morphling_adaptive_strike_str_custom_729:apply(
            target,
            caster,
            self,
            {
                duration = target:CalculateDuration(caster, stun_duration),
                distance = knockback_distance
            }
        )
    end
    local origin = caster:GetAbsOrigin()
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_morphling/morphling_adaptive_strike_str.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControl(particle, 0, origin)
    ParticleManager:SetParticleControl(
        particle,
        1,
        target:GetAbsOrigin()
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        2,
        caster,
        PATTACH_ABSORIGIN_FOLLOW,
        nil,
        origin,
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    target:EmitSound("Hero_Morphling.AdaptiveStrikeStr.Target")
    if simulate then
        Timers:CreateTimer(
            FrameTime(),
            function()
                if self and not self:IsNull() then
                    caster:RemoveAbilityByHandle(self)
                end
            end
        )
    end
end
morphling_adaptive_strike_str_custom_729 = __TS__Decorate(
    morphling_adaptive_strike_str_custom_729,
    morphling_adaptive_strike_str_custom_729,
    {registerAbility(nil)},
    {kind = "class", name = "morphling_adaptive_strike_str_custom_729"}
)
____exports.morphling_adaptive_strike_str_custom_729 = morphling_adaptive_strike_str_custom_729
return ____exports
