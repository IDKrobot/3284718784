local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 24,["28"] = 25,["29"] = 24,["30"] = 28,["31"] = 29,["32"] = 28,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 3,["39"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_invoker_cold_snap_custom_732_freeze = __TS__Class()
local modifier_invoker_cold_snap_custom_732_freeze = ____exports.modifier_invoker_cold_snap_custom_732_freeze
modifier_invoker_cold_snap_custom_732_freeze.name = "modifier_invoker_cold_snap_custom_732_freeze"
__TS__ClassExtends(modifier_invoker_cold_snap_custom_732_freeze, BaseModifier)
function modifier_invoker_cold_snap_custom_732_freeze.prototype.IsHidden(self)
    return true
end
function modifier_invoker_cold_snap_custom_732_freeze.prototype.IsDebuff(self)
    return true
end
function modifier_invoker_cold_snap_custom_732_freeze.prototype.IsStunDebuff(self)
    return true
end
function modifier_invoker_cold_snap_custom_732_freeze.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true, [MODIFIER_STATE_FROZEN] = true}
end
function modifier_invoker_cold_snap_custom_732_freeze.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_frost.vpcf"
end
function modifier_invoker_cold_snap_custom_732_freeze.prototype.GetPriority(self)
    return 9999
end
modifier_invoker_cold_snap_custom_732_freeze = __TS__Decorate(
    modifier_invoker_cold_snap_custom_732_freeze,
    modifier_invoker_cold_snap_custom_732_freeze,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_cold_snap_custom_732_freeze"}
)
____exports.modifier_invoker_cold_snap_custom_732_freeze = modifier_invoker_cold_snap_custom_732_freeze
return ____exports
