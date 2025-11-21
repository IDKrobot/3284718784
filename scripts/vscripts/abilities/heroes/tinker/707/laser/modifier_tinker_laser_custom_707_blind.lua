local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 23,["28"] = 24,["29"] = 23,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 3,["36"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_tinker_laser_custom_707_blind = __TS__Class()
local modifier_tinker_laser_custom_707_blind = ____exports.modifier_tinker_laser_custom_707_blind
modifier_tinker_laser_custom_707_blind.name = "modifier_tinker_laser_custom_707_blind"
__TS__ClassExtends(modifier_tinker_laser_custom_707_blind, BaseModifier)
function modifier_tinker_laser_custom_707_blind.prototype.IsHidden(self)
    return false
end
function modifier_tinker_laser_custom_707_blind.prototype.IsDebuff(self)
    return true
end
function modifier_tinker_laser_custom_707_blind.prototype.IsPurgable(self)
    return true
end
function modifier_tinker_laser_custom_707_blind.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MISS_PERCENTAGE}
end
function modifier_tinker_laser_custom_707_blind.prototype.GetModifierMiss_Percentage(self)
    return self:GetSpecialValueFor("miss_rate") or 100
end
modifier_tinker_laser_custom_707_blind = __TS__Decorate(
    modifier_tinker_laser_custom_707_blind,
    modifier_tinker_laser_custom_707_blind,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_laser_custom_707_blind"}
)
____exports.modifier_tinker_laser_custom_707_blind = modifier_tinker_laser_custom_707_blind
return ____exports
