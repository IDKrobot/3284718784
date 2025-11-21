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
____exports.modifier_item_bloodthorn_custom_730 = __TS__Class()
local modifier_item_bloodthorn_custom_730 = ____exports.modifier_item_bloodthorn_custom_730
modifier_item_bloodthorn_custom_730.name = "modifier_item_bloodthorn_custom_730"
__TS__ClassExtends(modifier_item_bloodthorn_custom_730, BaseModifier)
function modifier_item_bloodthorn_custom_730.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierConstantManaRegen = function() return self:GetSpecialValueFor("bonus_mana_regen") end
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("bonus_attack_speed") end
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
end
function modifier_item_bloodthorn_custom_730.prototype.IsHidden(self)
    return true
end
function modifier_item_bloodthorn_custom_730.prototype.IsPurgable(self)
    return false
end
function modifier_item_bloodthorn_custom_730.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_bloodthorn_custom_730.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_INTELLECT_BONUS, MODIFIER_PROPERTY_MANA_REGEN_CONSTANT, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE}
end
modifier_item_bloodthorn_custom_730 = __TS__Decorate(
    modifier_item_bloodthorn_custom_730,
    modifier_item_bloodthorn_custom_730,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodthorn_custom_730"}
)
____exports.modifier_item_bloodthorn_custom_730 = modifier_item_bloodthorn_custom_730
return ____exports
