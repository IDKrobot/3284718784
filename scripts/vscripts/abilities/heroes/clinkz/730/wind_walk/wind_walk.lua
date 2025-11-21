local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 6,["21"] = 11,["22"] = 12,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 23,["30"] = 25,["31"] = 30,["32"] = 11,["33"] = 5,["34"] = 5,["35"] = 5,["36"] = 4,["39"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_clinkz_wind_walk_custom_730 = require("abilities.heroes.clinkz.730.wind_walk.modifier_clinkz_wind_walk_custom_730")
local modifier_clinkz_wind_walk_custom_730 = ____modifier_clinkz_wind_walk_custom_730.modifier_clinkz_wind_walk_custom_730
____exports.clinkz_wind_walk_custom_730 = __TS__Class()
local clinkz_wind_walk_custom_730 = ____exports.clinkz_wind_walk_custom_730
clinkz_wind_walk_custom_730.name = "clinkz_wind_walk_custom_730"
__TS__ClassExtends(clinkz_wind_walk_custom_730, BaseAbility)
function clinkz_wind_walk_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_clinkz.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_clinkz.vsndevts")
end
function clinkz_wind_walk_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    modifier_clinkz_wind_walk_custom_730:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("duration")}
    )
    caster:EmitSound("Hero_Clinkz.WindWalk")
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_clinkz/clinkz_windwalk.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:ReleaseParticleIndex(particle)
end
clinkz_wind_walk_custom_730 = __TS__Decorate(
    clinkz_wind_walk_custom_730,
    clinkz_wind_walk_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "clinkz_wind_walk_custom_730"}
)
____exports.clinkz_wind_walk_custom_730 = clinkz_wind_walk_custom_730
return ____exports
