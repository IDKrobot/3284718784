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
____exports.modifier_item_nullifier_custom_721 = __TS__Class()
local modifier_item_nullifier_custom_721 = ____exports.modifier_item_nullifier_custom_721
modifier_item_nullifier_custom_721.name = "modifier_item_nullifier_custom_721"
__TS__ClassExtends(modifier_item_nullifier_custom_721, BaseModifier)
function modifier_item_nullifier_custom_721.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
    self.GetModifierPhysicalArmorBonus = function() return self:GetSpecialValueFor("bonus_armor") end
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("bonus_regen") end
end
function modifier_item_nullifier_custom_721.prototype.IsHidden(self)
    return true
end
function modifier_item_nullifier_custom_721.prototype.IsPurgable(self)
    return false
end
function modifier_item_nullifier_custom_721.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_nullifier_custom_721.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT}
end
modifier_item_nullifier_custom_721 = __TS__Decorate(
    modifier_item_nullifier_custom_721,
    modifier_item_nullifier_custom_721,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_nullifier_custom_721"}
)
____exports.modifier_item_nullifier_custom_721 = modifier_item_nullifier_custom_721
return ____exports
