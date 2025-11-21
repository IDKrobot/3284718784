local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 27,["18"] = 28,["19"] = 29,["20"] = 30,["21"] = 31,["22"] = 3,["23"] = 5,["24"] = 6,["25"] = 5,["26"] = 9,["27"] = 10,["28"] = 9,["29"] = 13,["30"] = 14,["31"] = 13,["32"] = 17,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 18,["38"] = 18,["39"] = 18,["40"] = 17,["41"] = 4,["42"] = 4,["43"] = 4,["44"] = 3,["47"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bracer_custom_727 = __TS__Class()
local modifier_item_bracer_custom_727 = ____exports.modifier_item_bracer_custom_727
modifier_item_bracer_custom_727.name = "modifier_item_bracer_custom_727"
__TS__ClassExtends(modifier_item_bracer_custom_727, BaseModifier)
function modifier_item_bracer_custom_727.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_agility") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("bonus_health_regen") end
end
function modifier_item_bracer_custom_727.prototype.IsHidden(self)
    return true
end
function modifier_item_bracer_custom_727.prototype.IsPurgable(self)
    return false
end
function modifier_item_bracer_custom_727.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_bracer_custom_727.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    }
end
modifier_item_bracer_custom_727 = __TS__Decorate(
    modifier_item_bracer_custom_727,
    modifier_item_bracer_custom_727,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bracer_custom_727"}
)
____exports.modifier_item_bracer_custom_727 = modifier_item_bracer_custom_727
return ____exports
