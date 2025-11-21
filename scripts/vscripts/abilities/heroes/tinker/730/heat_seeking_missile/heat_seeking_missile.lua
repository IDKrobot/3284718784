local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 4,["22"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____heat_seeking_missile = require("abilities.heroes.tinker.global_usage.heat_seeking_missile")
local TinkerHeatSeekingMissileAbilityClass = ____heat_seeking_missile.TinkerHeatSeekingMissileAbilityClass
____exports.tinker_heat_seeking_missile_custom_730 = __TS__Class()
local tinker_heat_seeking_missile_custom_730 = ____exports.tinker_heat_seeking_missile_custom_730
tinker_heat_seeking_missile_custom_730.name = "tinker_heat_seeking_missile_custom_730"
__TS__ClassExtends(tinker_heat_seeking_missile_custom_730, TinkerHeatSeekingMissileAbilityClass)
tinker_heat_seeking_missile_custom_730 = __TS__Decorate(
    tinker_heat_seeking_missile_custom_730,
    tinker_heat_seeking_missile_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_heat_seeking_missile_custom_730"}
)
____exports.tinker_heat_seeking_missile_custom_730 = tinker_heat_seeking_missile_custom_730
return ____exports
