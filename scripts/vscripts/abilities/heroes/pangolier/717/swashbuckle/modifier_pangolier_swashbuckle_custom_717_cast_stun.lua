local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 4,["25"] = 4,["26"] = 4,["27"] = 3,["30"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_swashbuckle_custom_717_cast_stun = __TS__Class()
local modifier_pangolier_swashbuckle_custom_717_cast_stun = ____exports.modifier_pangolier_swashbuckle_custom_717_cast_stun
modifier_pangolier_swashbuckle_custom_717_cast_stun.name = "modifier_pangolier_swashbuckle_custom_717_cast_stun"
__TS__ClassExtends(modifier_pangolier_swashbuckle_custom_717_cast_stun, BaseModifier)
function modifier_pangolier_swashbuckle_custom_717_cast_stun.prototype.IsHidden(self)
    return true
end
function modifier_pangolier_swashbuckle_custom_717_cast_stun.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_swashbuckle_custom_717_cast_stun.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
modifier_pangolier_swashbuckle_custom_717_cast_stun = __TS__Decorate(
    modifier_pangolier_swashbuckle_custom_717_cast_stun,
    modifier_pangolier_swashbuckle_custom_717_cast_stun,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_swashbuckle_custom_717_cast_stun"}
)
____exports.modifier_pangolier_swashbuckle_custom_717_cast_stun = modifier_pangolier_swashbuckle_custom_717_cast_stun
return ____exports
