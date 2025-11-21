local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 20,["25"] = 21,["26"] = 20,["27"] = 27,["28"] = 28,["29"] = 27,["30"] = 31,["31"] = 32,["32"] = 31,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 3,["39"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_huskar_life_break_custom_717_buff = __TS__Class()
local modifier_huskar_life_break_custom_717_buff = ____exports.modifier_huskar_life_break_custom_717_buff
modifier_huskar_life_break_custom_717_buff.name = "modifier_huskar_life_break_custom_717_buff"
__TS__ClassExtends(modifier_huskar_life_break_custom_717_buff, BaseModifier)
function modifier_huskar_life_break_custom_717_buff.prototype.IsHidden(self)
    return true
end
function modifier_huskar_life_break_custom_717_buff.prototype.IsPurgable(self)
    return false
end
function modifier_huskar_life_break_custom_717_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION, MODIFIER_PROPERTY_DISABLE_TURNING}
end
function modifier_huskar_life_break_custom_717_buff.prototype.CheckState(self)
    return {[MODIFIER_STATE_MAGIC_IMMUNE] = true, [MODIFIER_STATE_DISARMED] = true}
end
function modifier_huskar_life_break_custom_717_buff.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_CAST_LIFE_BREAK_START
end
function modifier_huskar_life_break_custom_717_buff.prototype.GetModifierDisableTurning(self)
    return 1
end
modifier_huskar_life_break_custom_717_buff = __TS__Decorate(
    modifier_huskar_life_break_custom_717_buff,
    modifier_huskar_life_break_custom_717_buff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_huskar_life_break_custom_717_buff"}
)
____exports.modifier_huskar_life_break_custom_717_buff = modifier_huskar_life_break_custom_717_buff
return ____exports
