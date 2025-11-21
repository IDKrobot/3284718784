local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 5,["22"] = 6,["23"] = 6,["24"] = 6,["25"] = 5,["28"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____march_of_the_machines = require("abilities.heroes.tinker.global_usage.march_of_the_machines")
local TinkerMarchOfTheMachinesAbilityClass = ____march_of_the_machines.TinkerMarchOfTheMachinesAbilityClass
local ____modifier_tinker_march_of_the_machines_custom_707_thinker = require("abilities.heroes.tinker.707.march_of_the_machines.modifier_tinker_march_of_the_machines_custom_707_thinker")
local modifier_tinker_march_of_the_machines_custom_707_thinker = ____modifier_tinker_march_of_the_machines_custom_707_thinker.modifier_tinker_march_of_the_machines_custom_707_thinker
____exports.tinker_march_of_the_machines_custom_707 = __TS__Class()
local tinker_march_of_the_machines_custom_707 = ____exports.tinker_march_of_the_machines_custom_707
tinker_march_of_the_machines_custom_707.name = "tinker_march_of_the_machines_custom_707"
__TS__ClassExtends(tinker_march_of_the_machines_custom_707, TinkerMarchOfTheMachinesAbilityClass)
function tinker_march_of_the_machines_custom_707.prototype.____constructor(self, ...)
    TinkerMarchOfTheMachinesAbilityClass.prototype.____constructor(self, ...)
    self.modifierThinker = modifier_tinker_march_of_the_machines_custom_707_thinker
end
tinker_march_of_the_machines_custom_707 = __TS__Decorate(
    tinker_march_of_the_machines_custom_707,
    tinker_march_of_the_machines_custom_707,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_march_of_the_machines_custom_707"}
)
____exports.tinker_march_of_the_machines_custom_707 = tinker_march_of_the_machines_custom_707
return ____exports
