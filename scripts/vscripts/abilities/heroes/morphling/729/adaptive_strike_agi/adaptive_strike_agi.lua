local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 10,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 24,["37"] = 27,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 39,["50"] = 39,["51"] = 39,["52"] = 28,["53"] = 28,["54"] = 44,["55"] = 46,["56"] = 48,["57"] = 49,["58"] = 50,["60"] = 53,["63"] = 55,["64"] = 57,["65"] = 57,["66"] = 57,["67"] = 57,["68"] = 57,["69"] = 57,["70"] = 57,["71"] = 57,["72"] = 57,["73"] = 57,["74"] = 57,["75"] = 57,["76"] = 57,["77"] = 57,["78"] = 57,["79"] = 67,["80"] = 68,["81"] = 68,["83"] = 70,["84"] = 57,["85"] = 57,["86"] = 75,["87"] = 76,["88"] = 77,["90"] = 15,["91"] = 81,["92"] = 81,["93"] = 81,["95"] = 82,["96"] = 83,["99"] = 84,["102"] = 86,["103"] = 87,["104"] = 88,["105"] = 89,["106"] = 91,["107"] = 92,["108"] = 97,["109"] = 98,["110"] = 100,["111"] = 102,["112"] = 102,["113"] = 102,["114"] = 102,["115"] = 104,["116"] = 105,["117"] = 107,["118"] = 110,["119"] = 110,["120"] = 110,["121"] = 110,["122"] = 110,["123"] = 110,["124"] = 110,["125"] = 117,["127"] = 120,["128"] = 121,["129"] = 126,["130"] = 126,["131"] = 126,["132"] = 126,["133"] = 126,["134"] = 127,["135"] = 127,["136"] = 127,["137"] = 127,["138"] = 127,["139"] = 128,["140"] = 130,["141"] = 132,["142"] = 133,["143"] = 133,["144"] = 133,["145"] = 134,["146"] = 135,["148"] = 133,["149"] = 133,["151"] = 81,["152"] = 5,["153"] = 5,["154"] = 5,["155"] = 4,["158"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
____exports.morphling_adaptive_strike_agi_custom_729 = __TS__Class()
local morphling_adaptive_strike_agi_custom_729 = ____exports.morphling_adaptive_strike_agi_custom_729
morphling_adaptive_strike_agi_custom_729.name = "morphling_adaptive_strike_agi_custom_729"
__TS__ClassExtends(morphling_adaptive_strike_agi_custom_729, CustomAbility)
function morphling_adaptive_strike_agi_custom_729.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "morphling_adaptive_strike_agi")
end
function morphling_adaptive_strike_agi_custom_729.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_morphling.vsndevts")
end
function morphling_adaptive_strike_agi_custom_729.prototype.OnSpellStart(self)
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
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_morphling/morphling_adaptive_strike_agi_proj.vpcf", caster)
    local info = {
        Target = target,
        Source = caster,
        Ability = cast_ability,
        EffectName = particle_name,
        iMoveSpeed = 1150,
        bDodgeable = true,
        bVisibleToEnemies = true,
        bReplaceExisting = false,
        bProvidesVision = false,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_2,
        ExtraData = {
            abilityType = "agi",
            abilityLevel = self:GetLevel()
        }
    }
    ProjectileManager:CreateTrackingProjectile(info)
    caster:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Cast")
    local adaptive_strike_str = caster:FindAbilityByName("morphling_adaptive_strike_str_custom_729")
    if adaptive_strike_str then
        adaptive_strike_str:StartCooldown(3)
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
function morphling_adaptive_strike_agi_custom_729.prototype.OnProjectileHit(self, target, location, simulate)
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
        local base_damage = self:GetSpecialValueFor("damage_base")
        local min_damage = self:GetSpecialValueFor("damage_min")
        local max_damage = self:GetSpecialValueFor("damage_max")
        local agility = caster:GetAgility()
        local strength = caster:GetStrength()
        local min_ratio = 0.5
        local max_ratio = 1.5
        local ratio = agility / strength
        local clamped = math.min(
            math.max(ratio, min_ratio),
            max_ratio
        )
        local t = (clamped - min_ratio) / (max_ratio - min_ratio)
        local multiplier = min_damage + (max_damage - min_damage) * t
        local damage = base_damage + agility * multiplier
        local damageTable = {
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            victim = target,
            ability = self
        }
        ApplyDamage(damageTable)
    end
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_morphling/morphling_adaptive_strike.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControl(
        particle,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        target:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    target:EmitSound("Hero_Morphling.AdaptiveStrikeAgi.Target")
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
morphling_adaptive_strike_agi_custom_729 = __TS__Decorate(
    morphling_adaptive_strike_agi_custom_729,
    morphling_adaptive_strike_agi_custom_729,
    {registerAbility(nil)},
    {kind = "class", name = "morphling_adaptive_strike_agi_custom_729"}
)
____exports.morphling_adaptive_strike_agi_custom_729 = morphling_adaptive_strike_agi_custom_729
return ____exports
