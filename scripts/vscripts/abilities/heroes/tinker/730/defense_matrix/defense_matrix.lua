local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 6,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["27"] = 16,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 27,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 33,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 34,["50"] = 34,["51"] = 34,["52"] = 34,["53"] = 34,["54"] = 35,["55"] = 37,["56"] = 11,["57"] = 5,["58"] = 5,["59"] = 5,["60"] = 4,["63"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_tinker_defense_matrix_custom_730 = require("abilities.heroes.tinker.730.defense_matrix.modifier_tinker_defense_matrix_custom_730")
local modifier_tinker_defense_matrix_custom_730 = ____modifier_tinker_defense_matrix_custom_730.modifier_tinker_defense_matrix_custom_730
____exports.tinker_defense_matrix_custom_730 = __TS__Class()
local tinker_defense_matrix_custom_730 = ____exports.tinker_defense_matrix_custom_730
tinker_defense_matrix_custom_730.name = "tinker_defense_matrix_custom_730"
__TS__ClassExtends(tinker_defense_matrix_custom_730, BaseAbility)
function tinker_defense_matrix_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function tinker_defense_matrix_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local targetOrigin = target:GetAbsOrigin()
    modifier_tinker_defense_matrix_custom_730:apply(
        target,
        caster,
        self,
        {duration = self:GetSpecialValueFor("barrier_duration")}
    )
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_defense_matrix_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack1",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControl(particle, 1, targetOrigin)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        target,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        targetOrigin,
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("Hero_Tinker.DefensiveMatrix.Cast")
end
tinker_defense_matrix_custom_730 = __TS__Decorate(
    tinker_defense_matrix_custom_730,
    tinker_defense_matrix_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_defense_matrix_custom_730"}
)
____exports.tinker_defense_matrix_custom_730 = tinker_defense_matrix_custom_730
return ____exports
