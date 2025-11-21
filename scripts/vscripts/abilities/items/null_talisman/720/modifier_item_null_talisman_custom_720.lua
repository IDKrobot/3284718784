local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 26,["18"] = 27,["19"] = 28,["20"] = 29,["21"] = 3,["22"] = 5,["23"] = 6,["24"] = 5,["25"] = 9,["26"] = 10,["27"] = 9,["28"] = 13,["29"] = 14,["30"] = 13,["31"] = 17,["32"] = 18,["33"] = 17,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 3,["40"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_null_talisman_custom_720 = __TS__Class()
local modifier_item_null_talisman_custom_720 = ____exports.modifier_item_null_talisman_custom_720
modifier_item_null_talisman_custom_720.name = "modifier_item_null_talisman_custom_720"
__TS__ClassExtends(modifier_item_null_talisman_custom_720, BaseModifier)
function modifier_item_null_talisman_custom_720.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_agility") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
    self.GetModifierSpellAmplify_Percentage = function() return self:GetSpecialValueFor("bonus_spell_amp") end
end
function modifier_item_null_talisman_custom_720.prototype.IsHidden(self)
    return true
end
function modifier_item_null_talisman_custom_720.prototype.IsPurgable(self)
    return false
end
function modifier_item_null_talisman_custom_720.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_null_talisman_custom_720.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_PROPERTY_STATS_INTELLECT_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE}
end
modifier_item_null_talisman_custom_720 = __TS__Decorate(
    modifier_item_null_talisman_custom_720,
    modifier_item_null_talisman_custom_720,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_null_talisman_custom_720"}
)
____exports.modifier_item_null_talisman_custom_720 = modifier_item_null_talisman_custom_720
return ____exports
