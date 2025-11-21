local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 6,["21"] = 11,["22"] = 12,["23"] = 14,["24"] = 14,["26"] = 15,["27"] = 15,["29"] = 17,["30"] = 17,["31"] = 17,["32"] = 17,["33"] = 17,["34"] = 17,["35"] = 17,["36"] = 11,["37"] = 26,["38"] = 27,["39"] = 26,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 33,["46"] = 35,["47"] = 37,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 42,["57"] = 43,["58"] = 45,["59"] = 47,["60"] = 49,["61"] = 49,["62"] = 49,["63"] = 49,["64"] = 49,["65"] = 49,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 67,["73"] = 30,["74"] = 5,["75"] = 5,["76"] = 5,["77"] = 4,["80"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_clinkz_death_pact_custom_730 = require("abilities.heroes.clinkz.730.death_pact.modifier_clinkz_death_pact_custom_730")
local modifier_clinkz_death_pact_custom_730 = ____modifier_clinkz_death_pact_custom_730.modifier_clinkz_death_pact_custom_730
____exports.clinkz_death_pact_custom_730 = __TS__Class()
local clinkz_death_pact_custom_730 = ____exports.clinkz_death_pact_custom_730
clinkz_death_pact_custom_730.name = "clinkz_death_pact_custom_730"
__TS__ClassExtends(clinkz_death_pact_custom_730, BaseAbility)
function clinkz_death_pact_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_clinkz.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_clinkz.vsndevts")
end
function clinkz_death_pact_custom_730.prototype.CastFilterResultTarget(self, target)
    local caster = self:GetCaster()
    if caster == target then
        return UF_FAIL_CUSTOM
    end
    if target:GetUnitName() == "npc_dota_clinkz_730_skeleton_archer_custom" then
        return UF_SUCCESS
    end
    return UnitFilter(
        target,
        DOTA_UNIT_TARGET_TEAM_BOTH,
        DOTA_UNIT_TARGET_BASIC,
        bit.bor(DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES),
        caster:GetTeamNumber()
    )
end
function clinkz_death_pact_custom_730.prototype.GetCustomCastErrorTarget(self, target)
    return "dota_hud_error_cant_cast_on_self"
end
function clinkz_death_pact_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    caster:EmitSound("Hero_Clinkz.DeathPact.Cast")
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_clinkz/clinkz_death_pact.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        caster,
        PATTACH_ABSORIGIN,
        "",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local current_health = target:GetHealth()
    target:Kill(self, caster)
    modifier_clinkz_death_pact_custom_730:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("duration")}
    ):SetStackCount(current_health)
    modifier_clinkz_death_pact_custom_730:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("duration")}
    ):SetStackCount(current_health)
    caster:EmitSound("Hero_Clinkz.DeathPact")
end
clinkz_death_pact_custom_730 = __TS__Decorate(
    clinkz_death_pact_custom_730,
    clinkz_death_pact_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "clinkz_death_pact_custom_730"}
)
____exports.clinkz_death_pact_custom_730 = clinkz_death_pact_custom_730
return ____exports
