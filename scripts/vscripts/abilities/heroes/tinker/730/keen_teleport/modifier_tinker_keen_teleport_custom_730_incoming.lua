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
____exports.modifier_tinker_keen_teleport_custom_730_incoming = __TS__Class()
local modifier_tinker_keen_teleport_custom_730_incoming = ____exports.modifier_tinker_keen_teleport_custom_730_incoming
modifier_tinker_keen_teleport_custom_730_incoming.name = "modifier_tinker_keen_teleport_custom_730_incoming"
__TS__ClassExtends(modifier_tinker_keen_teleport_custom_730_incoming, BaseModifier)
function modifier_tinker_keen_teleport_custom_730_incoming.prototype.IsHidden(self)
    return false
end
function modifier_tinker_keen_teleport_custom_730_incoming.prototype.IsPurgable(self)
    return false
end
modifier_tinker_keen_teleport_custom_730_incoming = __TS__Decorate(
    modifier_tinker_keen_teleport_custom_730_incoming,
    modifier_tinker_keen_teleport_custom_730_incoming,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_keen_teleport_custom_730_incoming"}
)
____exports.modifier_tinker_keen_teleport_custom_730_incoming = modifier_tinker_keen_teleport_custom_730_incoming
return ____exports
