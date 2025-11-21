local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 2,["16"] = 2,["17"] = 3,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 6,["23"] = 7,["24"] = 8,["25"] = 9,["26"] = 7,["27"] = 12,["28"] = 13,["29"] = 14,["30"] = 15,["33"] = 17,["36"] = 19,["37"] = 21,["38"] = 21,["39"] = 21,["40"] = 21,["41"] = 23,["42"] = 31,["43"] = 40,["44"] = 45,["45"] = 45,["46"] = 45,["47"] = 45,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 45,["53"] = 46,["54"] = 46,["55"] = 46,["56"] = 46,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 46,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 47,["66"] = 47,["67"] = 47,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 48,["72"] = 50,["73"] = 52,["74"] = 53,["77"] = 53,["81"] = 53,["82"] = 53,["84"] = 53,["85"] = 54,["86"] = 56,["88"] = 12,["89"] = 6,["90"] = 6,["91"] = 6,["92"] = 5,["95"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_arc_warden_flux_custom_731 = require("abilities.heroes.arc_warden.731.flux.modifier_arc_warden_flux_custom_731")
local modifier_arc_warden_flux_custom_731 = ____modifier_arc_warden_flux_custom_731.modifier_arc_warden_flux_custom_731
local ____modifier_arc_warden_flux_custom_731_tracker = require("abilities.heroes.arc_warden.731.flux.modifier_arc_warden_flux_custom_731_tracker")
local modifier_arc_warden_flux_custom_731_tracker = ____modifier_arc_warden_flux_custom_731_tracker.modifier_arc_warden_flux_custom_731_tracker
____exports.arc_warden_flux_custom_731 = __TS__Class()
local arc_warden_flux_custom_731 = ____exports.arc_warden_flux_custom_731
arc_warden_flux_custom_731.name = "arc_warden_flux_custom_731"
__TS__ClassExtends(arc_warden_flux_custom_731, BaseAbility)
function arc_warden_flux_custom_731.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_warden.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_warden.vsndevts")
end
function arc_warden_flux_custom_731.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    caster:EmitSound("Hero_ArcWarden.Flux.Cast")
    local duration = target:CalculateDuration(
        caster,
        self:GetSpecialValueFor("duration")
    )
    modifier_arc_warden_flux_custom_731_tracker:apply(target, caster, self, {duration = duration})
    modifier_arc_warden_flux_custom_731:apply(target, caster, self, {duration = duration})
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_arc_warden/arc_warden_flux_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack1",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        target,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        target:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        2,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack2",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    target:EmitSound("Hero_ArcWarden.Flux.Target")
    if RollPercentage(50) and caster:GetUnitName() == "npc_dota_hero_arc_warden" then
        local ____RollVoiceLines_1 = RollVoiceLines
        local ____array_0 = __TS__SparseArrayNew(
            nil,
            __TS__Spread(range(nil, 1, 5))
        )
        __TS__SparseArrayPush(
            ____array_0,
            7,
            __TS__Spread(range(nil, 9, 12))
        )
        local random = ____RollVoiceLines_1(__TS__SparseArraySpread(____array_0))
        local response = "arc_warden_arcwar_flux_" .. random
        caster:EmitSoundOnClient(response)
    end
end
arc_warden_flux_custom_731 = __TS__Decorate(
    arc_warden_flux_custom_731,
    arc_warden_flux_custom_731,
    {registerAbility(nil)},
    {kind = "class", name = "arc_warden_flux_custom_731"}
)
____exports.arc_warden_flux_custom_731 = arc_warden_flux_custom_731
return ____exports
