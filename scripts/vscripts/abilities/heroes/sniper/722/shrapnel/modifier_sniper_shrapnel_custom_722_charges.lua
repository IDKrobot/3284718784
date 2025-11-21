local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 10,["20"] = 11,["21"] = 10,["22"] = 5,["23"] = 5,["24"] = 5,["25"] = 4,["28"] = 5});
local ____exports = {}
local ____ability_utils = require("lib.ability_utils")
local BaseModifierCharges = ____ability_utils.BaseModifierCharges
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_sniper_shrapnel_custom_722_charges = __TS__Class()
local modifier_sniper_shrapnel_custom_722_charges = ____exports.modifier_sniper_shrapnel_custom_722_charges
modifier_sniper_shrapnel_custom_722_charges.name = "modifier_sniper_shrapnel_custom_722_charges"
__TS__ClassExtends(modifier_sniper_shrapnel_custom_722_charges, BaseModifierCharges)
function modifier_sniper_shrapnel_custom_722_charges.prototype.GetReplenishTime(self)
    return self:GetSpecialValueFor("charge_restore_time")
end
function modifier_sniper_shrapnel_custom_722_charges.prototype.GetMaxCharges(self)
    return self:GetSpecialValueFor("max_charges")
end
modifier_sniper_shrapnel_custom_722_charges = __TS__Decorate(
    modifier_sniper_shrapnel_custom_722_charges,
    modifier_sniper_shrapnel_custom_722_charges,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_shrapnel_custom_722_charges"}
)
____exports.modifier_sniper_shrapnel_custom_722_charges = modifier_sniper_shrapnel_custom_722_charges
return ____exports
