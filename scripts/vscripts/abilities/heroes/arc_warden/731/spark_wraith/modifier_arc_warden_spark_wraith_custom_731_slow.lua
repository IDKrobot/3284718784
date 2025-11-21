local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 29,["19"] = 3,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 4,["36"] = 4,["37"] = 4,["38"] = 3,["41"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_spark_wraith_custom_731_slow = __TS__Class()
local modifier_arc_warden_spark_wraith_custom_731_slow = ____exports.modifier_arc_warden_spark_wraith_custom_731_slow
modifier_arc_warden_spark_wraith_custom_731_slow.name = "modifier_arc_warden_spark_wraith_custom_731_slow"
__TS__ClassExtends(modifier_arc_warden_spark_wraith_custom_731_slow, BaseModifier)
function modifier_arc_warden_spark_wraith_custom_731_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slow = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.slow end
end
function modifier_arc_warden_spark_wraith_custom_731_slow.prototype.IsHidden(self)
    return false
end
function modifier_arc_warden_spark_wraith_custom_731_slow.prototype.IsPurgable(self)
    return true
end
function modifier_arc_warden_spark_wraith_custom_731_slow.prototype.IsDebuff(self)
    return true
end
function modifier_arc_warden_spark_wraith_custom_731_slow.prototype.OnCreated(self, params)
    self.slow = -self:GetSpecialValueFor("move_speed_slow_pct")
end
function modifier_arc_warden_spark_wraith_custom_731_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
modifier_arc_warden_spark_wraith_custom_731_slow = __TS__Decorate(
    modifier_arc_warden_spark_wraith_custom_731_slow,
    modifier_arc_warden_spark_wraith_custom_731_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_spark_wraith_custom_731_slow"}
)
____exports.modifier_arc_warden_spark_wraith_custom_731_slow = modifier_arc_warden_spark_wraith_custom_731_slow
return ____exports
