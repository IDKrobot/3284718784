local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["21"] = 7,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 12,["27"] = 17,["28"] = 18,["29"] = 17,["30"] = 21,["31"] = 22,["32"] = 21,["33"] = 25,["34"] = 26,["35"] = 27,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 29,["40"] = 29,["41"] = 29,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 39,["46"] = 40,["47"] = 45,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 45,["53"] = 45,["54"] = 45,["55"] = 45,["56"] = 46,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 47,["62"] = 49,["63"] = 53,["64"] = 55,["65"] = 55,["66"] = 55,["67"] = 55,["68"] = 25,["69"] = 58,["70"] = 59,["71"] = 60,["74"] = 62,["75"] = 62,["76"] = 62,["77"] = 62,["78"] = 62,["79"] = 62,["80"] = 62,["81"] = 62,["82"] = 62,["83"] = 62,["84"] = 62,["85"] = 74,["86"] = 76,["87"] = 77,["88"] = 78,["89"] = 79,["90"] = 80,["93"] = 83,["94"] = 84,["97"] = 88,["98"] = 89,["99"] = 93,["101"] = 58,["102"] = 7,["103"] = 7,["104"] = 7,["105"] = 6,["108"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_sniper_shrapnel_custom_722_charges = require("abilities.heroes.sniper.722.shrapnel.modifier_sniper_shrapnel_custom_722_charges")
local modifier_sniper_shrapnel_custom_722_charges = ____modifier_sniper_shrapnel_custom_722_charges.modifier_sniper_shrapnel_custom_722_charges
local ____modifier_sniper_shrapnel_custom_722_thinker = require("abilities.heroes.sniper.722.shrapnel.modifier_sniper_shrapnel_custom_722_thinker")
local modifier_sniper_shrapnel_custom_722_thinker = ____modifier_sniper_shrapnel_custom_722_thinker.modifier_sniper_shrapnel_custom_722_thinker
____exports.sniper_shrapnel_custom_722 = __TS__Class()
local sniper_shrapnel_custom_722 = ____exports.sniper_shrapnel_custom_722
sniper_shrapnel_custom_722.name = "sniper_shrapnel_custom_722"
__TS__ClassExtends(sniper_shrapnel_custom_722, CustomAbility)
function sniper_shrapnel_custom_722.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "sniper_shrapnel")
end
function sniper_shrapnel_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_sniper.vsndevts")
end
function sniper_shrapnel_custom_722.prototype.GetIntrinsicModifierName(self)
    return modifier_sniper_shrapnel_custom_722_charges.name
end
function sniper_shrapnel_custom_722.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function sniper_shrapnel_custom_722.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    CreateModifierThinker(
        caster,
        self,
        modifier_sniper_shrapnel_custom_722_thinker.name,
        {},
        point,
        caster:GetTeamNumber(),
        false
    )
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_sniper/sniper_shrapnel_launch.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack1",
        caster:GetAbsOrigin(),
        false
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        point:__add(Vector(0, 0, 2000))
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local sound = caster:HasWearable("models/items/sniper/machine_gun_charlie/machine_gun_charlie.vmdl") and "Hero_Sniper.MKG_ShrapnelShoot" or "Hero_Sniper.ShrapnelShoot"
    caster:EmitSound(sound)
    Timers:CreateTimer(
        RandomFloat(0.03, 0.12),
        function() return self:EmitCastResponse(point) end
    )
end
function sniper_shrapnel_custom_722.prototype.EmitCastResponse(self, point)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_sniper" then
        return
    end
    local heroes = #FindUnitsInRadius(
        caster:GetTeamNumber(),
        point,
        nil,
        self:GetSpecialValueFor("radius"),
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO,
        bit.bor(DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, DOTA_UNIT_TARGET_FLAG_NO_INVIS),
        FIND_ANY_ORDER,
        false
    )
    local partial_response
    if heroes >= 4 then
        if RollPercentage(75) then
            partial_response = "snip_ability_shrapnel_" .. RollVoiceLines(nil, 2, 4, 6)
        elseif RollPercentage(5) then
            partial_response = "snip_ability_shrapnel_07"
        end
    else
        if RollPercentage(75) then
            partial_response = "snip_ability_shrapnel_" .. RollVoiceLines(nil, 1, 3)
        end
    end
    if partial_response then
        local part = caster:HasWearable("models/items/sniper/scifi_sniper_test_gun/scifi_sniper_test_gun.vmdl") and "sniper_helmet_" or "sniper_"
        caster:EmitSoundOnClient(part .. partial_response)
    end
end
sniper_shrapnel_custom_722 = __TS__Decorate(
    sniper_shrapnel_custom_722,
    sniper_shrapnel_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "sniper_shrapnel_custom_722"}
)
____exports.sniper_shrapnel_custom_722 = sniper_shrapnel_custom_722
return ____exports
