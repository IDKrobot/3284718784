local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 25,["18"] = 26,["19"] = 27,["20"] = 3,["21"] = 5,["22"] = 6,["23"] = 5,["24"] = 9,["25"] = 10,["26"] = 9,["27"] = 13,["28"] = 14,["29"] = 13,["30"] = 17,["31"] = 18,["32"] = 17,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 3,["39"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_ethereal_blade_custom_724 = __TS__Class()
local modifier_item_ethereal_blade_custom_724 = ____exports.modifier_item_ethereal_blade_custom_724
modifier_item_ethereal_blade_custom_724.name = "modifier_item_ethereal_blade_custom_724"
__TS__ClassExtends(modifier_item_ethereal_blade_custom_724, BaseModifier)
function modifier_item_ethereal_blade_custom_724.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_agility") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
end
function modifier_item_ethereal_blade_custom_724.prototype.IsHidden(self)
    return true
end
function modifier_item_ethereal_blade_custom_724.prototype.IsPurgable(self)
    return false
end
function modifier_item_ethereal_blade_custom_724.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_ethereal_blade_custom_724.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_STATS_INTELLECT_BONUS}
end
modifier_item_ethereal_blade_custom_724 = __TS__Decorate(
    modifier_item_ethereal_blade_custom_724,
    modifier_item_ethereal_blade_custom_724,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_ethereal_blade_custom_724"}
)
____exports.modifier_item_ethereal_blade_custom_724 = modifier_item_ethereal_blade_custom_724
return ____exports
