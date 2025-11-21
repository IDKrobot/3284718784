local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 25,["19"] = 3,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 4,["33"] = 4,["34"] = 4,["35"] = 3,["38"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bloodthorn_custom_733_mage_slayer = __TS__Class()
local modifier_item_bloodthorn_custom_733_mage_slayer = ____exports.modifier_item_bloodthorn_custom_733_mage_slayer
modifier_item_bloodthorn_custom_733_mage_slayer.name = "modifier_item_bloodthorn_custom_733_mage_slayer"
__TS__ClassExtends(modifier_item_bloodthorn_custom_733_mage_slayer, BaseModifier)
function modifier_item_bloodthorn_custom_733_mage_slayer.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.spell_damage = 0
    self.GetModifierSpellAmplify_Percentage = function() return self.spell_damage end
end
function modifier_item_bloodthorn_custom_733_mage_slayer.prototype.IsHidden(self)
    return false
end
function modifier_item_bloodthorn_custom_733_mage_slayer.prototype.IsPurgable(self)
    return true
end
function modifier_item_bloodthorn_custom_733_mage_slayer.prototype.OnCreated(self, params)
    self.spell_damage = self:GetSpecialValueFor("spell_amp_debuff")
end
function modifier_item_bloodthorn_custom_733_mage_slayer.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE}
end
modifier_item_bloodthorn_custom_733_mage_slayer = __TS__Decorate(
    modifier_item_bloodthorn_custom_733_mage_slayer,
    modifier_item_bloodthorn_custom_733_mage_slayer,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodthorn_custom_733_mage_slayer"}
)
____exports.modifier_item_bloodthorn_custom_733_mage_slayer = modifier_item_bloodthorn_custom_733_mage_slayer
return ____exports
