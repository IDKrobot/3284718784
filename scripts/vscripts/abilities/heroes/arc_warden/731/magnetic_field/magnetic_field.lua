local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 8,["21"] = 10,["22"] = 11,["23"] = 10,["24"] = 11,["26"] = 11,["27"] = 12,["28"] = 16,["29"] = 17,["30"] = 18,["31"] = 16,["32"] = 21,["33"] = 22,["34"] = 21,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 29,["39"] = 30,["40"] = 32,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 33,["53"] = 43,["54"] = 44,["55"] = 45,["56"] = 46,["57"] = 48,["58"] = 52,["59"] = 52,["60"] = 52,["61"] = 52,["62"] = 52,["63"] = 48,["64"] = 33,["65"] = 33,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 62,["73"] = 62,["74"] = 62,["76"] = 75,["77"] = 75,["78"] = 75,["79"] = 75,["80"] = 75,["81"] = 75,["82"] = 75,["83"] = 75,["84"] = 75,["85"] = 87,["86"] = 87,["87"] = 87,["88"] = 87,["89"] = 87,["90"] = 87,["91"] = 87,["92"] = 87,["93"] = 87,["94"] = 99,["95"] = 104,["96"] = 106,["97"] = 108,["98"] = 109,["99"] = 109,["100"] = 109,["101"] = 109,["102"] = 110,["103"] = 112,["105"] = 25,["106"] = 11,["107"] = 11,["108"] = 11,["109"] = 10,["112"] = 11});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_arc_warden_magnetic_field_custom_731_evasion_thinker = require("abilities.heroes.arc_warden.731.magnetic_field.modifier_arc_warden_magnetic_field_custom_731_evasion_thinker")
local modifier_arc_warden_magnetic_field_custom_731_evasion_thinker = ____modifier_arc_warden_magnetic_field_custom_731_evasion_thinker.modifier_arc_warden_magnetic_field_custom_731_evasion_thinker
local ____modifier_arc_warden_magnetic_field_custom_731_speed_thinker = require("abilities.heroes.arc_warden.731.magnetic_field.modifier_arc_warden_magnetic_field_custom_731_speed_thinker")
local modifier_arc_warden_magnetic_field_custom_731_speed_thinker = ____modifier_arc_warden_magnetic_field_custom_731_speed_thinker.modifier_arc_warden_magnetic_field_custom_731_speed_thinker
local ____modifier_arc_warden_magnetic_field_custom_731_slow_thinker = require("abilities.heroes.arc_warden.731.magnetic_field.modifier_arc_warden_magnetic_field_custom_731_slow_thinker")
local modifier_arc_warden_magnetic_field_custom_731_slow_thinker = ____modifier_arc_warden_magnetic_field_custom_731_slow_thinker.modifier_arc_warden_magnetic_field_custom_731_slow_thinker
LinkLuaModifier("modifier_generic_knockback", "abilities/generic/modifier_generic_knockback.lua", LUA_MODIFIER_MOTION_BOTH)
____exports.arc_warden_magnetic_field_custom_731 = __TS__Class()
local arc_warden_magnetic_field_custom_731 = ____exports.arc_warden_magnetic_field_custom_731
arc_warden_magnetic_field_custom_731.name = "arc_warden_magnetic_field_custom_731"
__TS__ClassExtends(arc_warden_magnetic_field_custom_731, CustomAbility)
function arc_warden_magnetic_field_custom_731.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "arc_warden_magnetic_field")
end
function arc_warden_magnetic_field_custom_731.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_warden.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_warden.vsndevts")
end
function arc_warden_magnetic_field_custom_731.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function arc_warden_magnetic_field_custom_731.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")
    local duration = self:GetSpecialValueFor("duration")
    if caster:HasShard() then
        __TS__ArrayForEach(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                point,
                nil,
                radius,
                2,
                bit.bor(1, 18),
                0,
                0,
                false
            ),
            function(____, enemy)
                local direction = enemy:GetAbsOrigin():__sub(point):Normalized()
                local enemyPoint = point:__add(direction:__mul(radius + 25))
                local distance = enemyPoint:__sub(enemy:GetAbsOrigin()):Length2D()
                enemy:AddNewModifier(caster, self, "modifier_generic_knockback", {
                    duration = 0.2,
                    distance = distance,
                    height = 0,
                    direction_x = direction.x,
                    direction_y = direction.y
                })
            end
        )
        CreateModifierThinker(
            caster,
            self,
            modifier_arc_warden_magnetic_field_custom_731_slow_thinker.name,
            {duration = duration},
            point,
            caster:GetTeamNumber(),
            false
        )
    end
    CreateModifierThinker(
        caster,
        self,
        modifier_arc_warden_magnetic_field_custom_731_evasion_thinker.name,
        {duration = duration},
        point,
        caster:GetTeamNumber(),
        false
    )
    CreateModifierThinker(
        caster,
        self,
        modifier_arc_warden_magnetic_field_custom_731_speed_thinker.name,
        {duration = duration},
        point,
        caster:GetTeamNumber(),
        false
    )
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_arc_warden/arc_warden_magnetic_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("Hero_ArcWarden.MagneticField.Cast")
    if RollPercentage(75) and caster:GetUnitName() == "npc_dota_hero_arc_warden" then
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 8))
        )
        local response = "arc_warden_arcwar_magnetic_field_" .. random
        caster:EmitSoundOnClient(response)
    end
end
arc_warden_magnetic_field_custom_731 = __TS__Decorate(
    arc_warden_magnetic_field_custom_731,
    arc_warden_magnetic_field_custom_731,
    {registerAbility(nil)},
    {kind = "class", name = "arc_warden_magnetic_field_custom_731"}
)
____exports.arc_warden_magnetic_field_custom_731 = arc_warden_magnetic_field_custom_731
return ____exports
