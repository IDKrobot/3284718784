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
____exports.modifier_forged_spirit_melting_strike_custom_732_armor = __TS__Class()
local modifier_forged_spirit_melting_strike_custom_732_armor = ____exports.modifier_forged_spirit_melting_strike_custom_732_armor
modifier_forged_spirit_melting_strike_custom_732_armor.name = "modifier_forged_spirit_melting_strike_custom_732_armor"
__TS__ClassExtends(modifier_forged_spirit_melting_strike_custom_732_armor, BaseModifier)
function modifier_forged_spirit_melting_strike_custom_732_armor.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.armor = 0
    self.GetModifierPhysicalArmorBonus = function() return self.armor * self:GetStackCount() end
end
function modifier_forged_spirit_melting_strike_custom_732_armor.prototype.IsHidden(self)
    return false
end
function modifier_forged_spirit_melting_strike_custom_732_armor.prototype.IsPurgable(self)
    return false
end
function modifier_forged_spirit_melting_strike_custom_732_armor.prototype.IsDebuff(self)
    return true
end
function modifier_forged_spirit_melting_strike_custom_732_armor.prototype.OnCreated(self, params)
    self.armor = -self:GetSpecialValueFor("armor_removed")
end
function modifier_forged_spirit_melting_strike_custom_732_armor.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS}
end
modifier_forged_spirit_melting_strike_custom_732_armor = __TS__Decorate(
    modifier_forged_spirit_melting_strike_custom_732_armor,
    modifier_forged_spirit_melting_strike_custom_732_armor,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_forged_spirit_melting_strike_custom_732_armor"}
)
____exports.modifier_forged_spirit_melting_strike_custom_732_armor = modifier_forged_spirit_melting_strike_custom_732_armor
return ____exports
