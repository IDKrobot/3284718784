local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["22"] = 7,["23"] = 8,["24"] = 10,["25"] = 14,["26"] = 15,["27"] = 16,["28"] = 14,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 26,["35"] = 23,["36"] = 29,["37"] = 30,["38"] = 31,["39"] = 33,["40"] = 35,["41"] = 36,["42"] = 36,["43"] = 36,["44"] = 36,["45"] = 37,["46"] = 39,["47"] = 41,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 43,["52"] = 42,["53"] = 42,["55"] = 29,["56"] = 48,["57"] = 49,["58"] = 50,["59"] = 52,["62"] = 54,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 65,["70"] = 65,["71"] = 65,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 72,["77"] = 74,["78"] = 74,["79"] = 74,["80"] = 74,["81"] = 74,["82"] = 74,["83"] = 74,["84"] = 76,["85"] = 78,["86"] = 79,["88"] = 81,["89"] = 48,["90"] = 84,["91"] = 84,["92"] = 84,["94"] = 85,["95"] = 87,["96"] = 89,["97"] = 91,["98"] = 91,["99"] = 91,["100"] = 91,["101"] = 95,["102"] = 95,["103"] = 95,["104"] = 91,["105"] = 91,["106"] = 91,["107"] = 91,["108"] = 91,["109"] = 104,["110"] = 105,["111"] = 110,["112"] = 110,["113"] = 110,["114"] = 110,["115"] = 110,["116"] = 110,["117"] = 110,["118"] = 110,["119"] = 110,["120"] = 111,["121"] = 112,["122"] = 114,["123"] = 84,["124"] = 7,["125"] = 7,["126"] = 7,["127"] = 6,["130"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_arc_warden_spark_wraith_custom_731_thinker = require("abilities.heroes.arc_warden.731.spark_wraith.modifier_arc_warden_spark_wraith_custom_731_thinker")
local modifier_arc_warden_spark_wraith_custom_731_thinker = ____modifier_arc_warden_spark_wraith_custom_731_thinker.modifier_arc_warden_spark_wraith_custom_731_thinker
local ____modifier_arc_warden_spark_wraith_custom_731_slow = require("abilities.heroes.arc_warden.731.spark_wraith.modifier_arc_warden_spark_wraith_custom_731_slow")
local modifier_arc_warden_spark_wraith_custom_731_slow = ____modifier_arc_warden_spark_wraith_custom_731_slow.modifier_arc_warden_spark_wraith_custom_731_slow
____exports.arc_warden_spark_wraith_custom_731 = __TS__Class()
local arc_warden_spark_wraith_custom_731 = ____exports.arc_warden_spark_wraith_custom_731
arc_warden_spark_wraith_custom_731.name = "arc_warden_spark_wraith_custom_731"
__TS__ClassExtends(arc_warden_spark_wraith_custom_731, CustomAbility)
function arc_warden_spark_wraith_custom_731.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "arc_warden_spark_wraith")
    self.phraseCooldown = false
end
function arc_warden_spark_wraith_custom_731.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_warden.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_warden.vsndevts")
end
function arc_warden_spark_wraith_custom_731.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function arc_warden_spark_wraith_custom_731.prototype.OnAbilityPhaseStart(self)
    self:GetCaster():EmitSound("Hero_ArcWarden.SparkWraith.Cast")
    return true
end
function arc_warden_spark_wraith_custom_731.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    self:CreateSpark(point)
    if not self.phraseCooldown and RollPercentage(25) and caster:GetUnitName() == "npc_dota_hero_tinker" then
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 11))
        )
        local response = "arc_warden_arcwar_spark_wraith_" .. random
        caster:EmitSoundOnClient(response)
        self.phraseCooldown = true
        Timers:CreateTimer(
            60,
            function()
                self.phraseCooldown = false
            end
        )
    end
end
function arc_warden_spark_wraith_custom_731.prototype.OnProjectileHit_ExtraData(self, target, location, extraData)
    local caster = self:GetCaster()
    local is_scepter = extraData.is_scepter == 1
    if not target then
        return
    end
    local duration = self:GetSpecialValueFor("ministun_duration")
    modifier_arc_warden_spark_wraith_custom_731_slow:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, duration)}
    )
    local damageTable = {
        attacker = caster,
        damage = extraData.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    AddFOWViewer(
        caster:GetTeamNumber(),
        location,
        self:GetSpecialValueFor("wraith_vision_radius"),
        self:GetSpecialValueFor("wraith_vision_duration"),
        true
    )
    target:EmitSound("Hero_ArcWarden.SparkWraith.Damage")
    if caster:HasScepter() and not is_scepter then
        self:CreateSpark(location, true)
    end
    return true
end
function arc_warden_spark_wraith_custom_731.prototype.CreateSpark(self, point, is_scepter)
    if is_scepter == nil then
        is_scepter = false
    end
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("duration")
    local cast_point = GetGroundPosition(point, nil)
    CreateModifierThinker(
        caster,
        self,
        modifier_arc_warden_spark_wraith_custom_731_thinker.name,
        {
            duration = duration,
            is_scepter = BoolToNum(nil, is_scepter)
        },
        cast_point,
        caster:GetTeamNumber(),
        false
    )
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_arc_warden/arc_warden_wraith_cast.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack1",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:DestroyParticle(particle, false)
    ParticleManager:ReleaseParticleIndex(particle)
    EmitSoundOnLocationWithCaster(cast_point, "Hero_ArcWarden.SparkWraith.Appear", caster)
end
arc_warden_spark_wraith_custom_731 = __TS__Decorate(
    arc_warden_spark_wraith_custom_731,
    arc_warden_spark_wraith_custom_731,
    {registerAbility(nil)},
    {kind = "class", name = "arc_warden_spark_wraith_custom_731"}
)
____exports.arc_warden_spark_wraith_custom_731 = arc_warden_spark_wraith_custom_731
return ____exports
