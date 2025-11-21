local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 4,["22"] = 4,["23"] = 4,["24"] = 3,["27"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_gyroshell_custom_717_damage_cooldown = __TS__Class()
local modifier_pangolier_gyroshell_custom_717_damage_cooldown = ____exports.modifier_pangolier_gyroshell_custom_717_damage_cooldown
modifier_pangolier_gyroshell_custom_717_damage_cooldown.name = "modifier_pangolier_gyroshell_custom_717_damage_cooldown"
__TS__ClassExtends(modifier_pangolier_gyroshell_custom_717_damage_cooldown, BaseModifier)
function modifier_pangolier_gyroshell_custom_717_damage_cooldown.prototype.IsHidden(self)
    return true
end
function modifier_pangolier_gyroshell_custom_717_damage_cooldown.prototype.IsPurgable(self)
    return false
end
modifier_pangolier_gyroshell_custom_717_damage_cooldown = __TS__Decorate(
    modifier_pangolier_gyroshell_custom_717_damage_cooldown,
    modifier_pangolier_gyroshell_custom_717_damage_cooldown,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_gyroshell_custom_717_damage_cooldown"}
)
____exports.modifier_pangolier_gyroshell_custom_717_damage_cooldown = modifier_pangolier_gyroshell_custom_717_damage_cooldown
return ____exports
