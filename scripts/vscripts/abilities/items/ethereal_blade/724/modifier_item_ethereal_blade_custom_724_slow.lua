local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 19,["31"] = 25,["32"] = 26,["33"] = 25,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 3,["40"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_ethereal_blade_custom_724_slow = __TS__Class()
local modifier_item_ethereal_blade_custom_724_slow = ____exports.modifier_item_ethereal_blade_custom_724_slow
modifier_item_ethereal_blade_custom_724_slow.name = "modifier_item_ethereal_blade_custom_724_slow"
__TS__ClassExtends(modifier_item_ethereal_blade_custom_724_slow, BaseModifier)
function modifier_item_ethereal_blade_custom_724_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slow = 0
end
function modifier_item_ethereal_blade_custom_724_slow.prototype.IsHidden(self)
    return false
end
function modifier_item_ethereal_blade_custom_724_slow.prototype.IsPurgable(self)
    return true
end
function modifier_item_ethereal_blade_custom_724_slow.prototype.OnCreated(self, params)
    self.slow = self:GetSpecialValueFor("blast_movement_slow")
end
function modifier_item_ethereal_blade_custom_724_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_item_ethereal_blade_custom_724_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self.slow
end
modifier_item_ethereal_blade_custom_724_slow = __TS__Decorate(
    modifier_item_ethereal_blade_custom_724_slow,
    modifier_item_ethereal_blade_custom_724_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_ethereal_blade_custom_724_slow"}
)
____exports.modifier_item_ethereal_blade_custom_724_slow = modifier_item_ethereal_blade_custom_724_slow
return ____exports
