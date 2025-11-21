local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 24,["18"] = 25,["19"] = 3,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 13,["27"] = 14,["28"] = 13,["29"] = 17,["30"] = 18,["31"] = 17,["32"] = 4,["33"] = 4,["34"] = 4,["35"] = 3,["38"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_black_king_bar_custom_728 = __TS__Class()
local modifier_item_black_king_bar_custom_728 = ____exports.modifier_item_black_king_bar_custom_728
modifier_item_black_king_bar_custom_728.name = "modifier_item_black_king_bar_custom_728"
__TS__ClassExtends(modifier_item_black_king_bar_custom_728, BaseModifier)
function modifier_item_black_king_bar_custom_728.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
end
function modifier_item_black_king_bar_custom_728.prototype.IsHidden(self)
    return true
end
function modifier_item_black_king_bar_custom_728.prototype.IsPurgable(self)
    return false
end
function modifier_item_black_king_bar_custom_728.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_black_king_bar_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS}
end
modifier_item_black_king_bar_custom_728 = __TS__Decorate(
    modifier_item_black_king_bar_custom_728,
    modifier_item_black_king_bar_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_black_king_bar_custom_728"}
)
____exports.modifier_item_black_king_bar_custom_728 = modifier_item_black_king_bar_custom_728
return ____exports
