local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 27,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 17,["31"] = 21,["32"] = 22,["33"] = 21,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 3,["40"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_tempest_double_custom_731_penalty = __TS__Class()
local modifier_arc_warden_tempest_double_custom_731_penalty = ____exports.modifier_arc_warden_tempest_double_custom_731_penalty
modifier_arc_warden_tempest_double_custom_731_penalty.name = "modifier_arc_warden_tempest_double_custom_731_penalty"
__TS__ClassExtends(modifier_arc_warden_tempest_double_custom_731_penalty, BaseModifier)
function modifier_arc_warden_tempest_double_custom_731_penalty.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierDamageOutgoing_Percentage = function() return -50 end
end
function modifier_arc_warden_tempest_double_custom_731_penalty.prototype.IsHidden(self)
    return false
end
function modifier_arc_warden_tempest_double_custom_731_penalty.prototype.IsPurgable(self)
    return false
end
function modifier_arc_warden_tempest_double_custom_731_penalty.prototype.IsDebuff(self)
    return true
end
function modifier_arc_warden_tempest_double_custom_731_penalty.prototype.RemoveOnDeath(self)
    return false
end
function modifier_arc_warden_tempest_double_custom_731_penalty.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE}
end
modifier_arc_warden_tempest_double_custom_731_penalty = __TS__Decorate(
    modifier_arc_warden_tempest_double_custom_731_penalty,
    modifier_arc_warden_tempest_double_custom_731_penalty,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_tempest_double_custom_731_penalty"}
)
____exports.modifier_arc_warden_tempest_double_custom_731_penalty = modifier_arc_warden_tempest_double_custom_731_penalty
return ____exports
