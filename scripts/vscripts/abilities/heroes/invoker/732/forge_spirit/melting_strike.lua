local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 4,["26"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_forged_spirit_melting_strike_custom_732 = require("abilities.heroes.invoker.732.forge_spirit.modifier_forged_spirit_melting_strike_custom_732")
local modifier_forged_spirit_melting_strike_custom_732 = ____modifier_forged_spirit_melting_strike_custom_732.modifier_forged_spirit_melting_strike_custom_732
____exports.forged_spirit_melting_strike_custom_732 = __TS__Class()
local forged_spirit_melting_strike_custom_732 = ____exports.forged_spirit_melting_strike_custom_732
forged_spirit_melting_strike_custom_732.name = "forged_spirit_melting_strike_custom_732"
__TS__ClassExtends(forged_spirit_melting_strike_custom_732, BaseAbility)
function forged_spirit_melting_strike_custom_732.prototype.GetIntrinsicModifierName(self)
    return modifier_forged_spirit_melting_strike_custom_732.name
end
forged_spirit_melting_strike_custom_732 = __TS__Decorate(
    forged_spirit_melting_strike_custom_732,
    forged_spirit_melting_strike_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "forged_spirit_melting_strike_custom_732"}
)
____exports.forged_spirit_melting_strike_custom_732 = forged_spirit_melting_strike_custom_732
return ____exports
