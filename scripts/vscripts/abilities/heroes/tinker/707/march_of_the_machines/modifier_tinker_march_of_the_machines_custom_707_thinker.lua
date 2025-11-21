local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 4,["22"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____march_of_the_machines = require("abilities.heroes.tinker.global_usage.march_of_the_machines")
local TinkerMarchOfTheMachinesModifierThinkerClass = ____march_of_the_machines.TinkerMarchOfTheMachinesModifierThinkerClass
____exports.modifier_tinker_march_of_the_machines_custom_707_thinker = __TS__Class()
local modifier_tinker_march_of_the_machines_custom_707_thinker = ____exports.modifier_tinker_march_of_the_machines_custom_707_thinker
modifier_tinker_march_of_the_machines_custom_707_thinker.name = "modifier_tinker_march_of_the_machines_custom_707_thinker"
__TS__ClassExtends(modifier_tinker_march_of_the_machines_custom_707_thinker, TinkerMarchOfTheMachinesModifierThinkerClass)
modifier_tinker_march_of_the_machines_custom_707_thinker = __TS__Decorate(
    modifier_tinker_march_of_the_machines_custom_707_thinker,
    modifier_tinker_march_of_the_machines_custom_707_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_march_of_the_machines_custom_707_thinker"}
)
____exports.modifier_tinker_march_of_the_machines_custom_707_thinker = modifier_tinker_march_of_the_machines_custom_707_thinker
return ____exports
