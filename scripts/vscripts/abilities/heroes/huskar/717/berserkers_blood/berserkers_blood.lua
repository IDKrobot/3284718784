local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 6,["21"] = 11,["22"] = 12,["23"] = 11,["24"] = 5,["25"] = 5,["26"] = 5,["27"] = 4,["30"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_huskar_berserkers_blood_custom_717 = require("abilities.heroes.huskar.717.berserkers_blood.modifier_huskar_berserkers_blood_custom_717")
local modifier_huskar_berserkers_blood_custom_717 = ____modifier_huskar_berserkers_blood_custom_717.modifier_huskar_berserkers_blood_custom_717
____exports.huskar_berserkers_blood_custom_717 = __TS__Class()
local huskar_berserkers_blood_custom_717 = ____exports.huskar_berserkers_blood_custom_717
huskar_berserkers_blood_custom_717.name = "huskar_berserkers_blood_custom_717"
__TS__ClassExtends(huskar_berserkers_blood_custom_717, BaseAbility)
function huskar_berserkers_blood_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_huskar.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_huskar.vsndevts")
end
function huskar_berserkers_blood_custom_717.prototype.GetIntrinsicModifierName(self)
    return modifier_huskar_berserkers_blood_custom_717.name
end
huskar_berserkers_blood_custom_717 = __TS__Decorate(
    huskar_berserkers_blood_custom_717,
    huskar_berserkers_blood_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "huskar_berserkers_blood_custom_717"}
)
____exports.huskar_berserkers_blood_custom_717 = huskar_berserkers_blood_custom_717
return ____exports
