local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 25,["18"] = 26,["19"] = 3,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 13,["27"] = 14,["28"] = 13,["29"] = 17,["30"] = 18,["31"] = 17,["32"] = 28,["33"] = 29,["34"] = 31,["35"] = 31,["37"] = 32,["38"] = 32,["40"] = 34,["41"] = 36,["42"] = 37,["44"] = 39,["45"] = 28,["46"] = 4,["47"] = 4,["48"] = 4,["49"] = 3,["52"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_silver_edge_custom_734 = __TS__Class()
local modifier_item_silver_edge_custom_734 = ____exports.modifier_item_silver_edge_custom_734
modifier_item_silver_edge_custom_734.name = "modifier_item_silver_edge_custom_734"
__TS__ClassExtends(modifier_item_silver_edge_custom_734, BaseModifier)
function modifier_item_silver_edge_custom_734.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("bonus_attack_speed") end
end
function modifier_item_silver_edge_custom_734.prototype.IsHidden(self)
    return true
end
function modifier_item_silver_edge_custom_734.prototype.IsPurgable(self)
    return false
end
function modifier_item_silver_edge_custom_734.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_silver_edge_custom_734.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE}
end
function modifier_item_silver_edge_custom_734.prototype.GetModifierPreAttack_CriticalStrike(self, event)
    local parent = self:GetParent()
    if not IsServer() then
        return 0
    end
    if parent:HasModifier("modifier_item_silver_edge_custom_734_windwalk") then
        return 0
    end
    local chance = self:GetSpecialValueFor("crit_chance")
    if RollPseudoRandomPercentage(chance, DOTA_PSEUDO_RANDOM_ITEM_SILVER_EDGE, parent) then
        return self:GetSpecialValueFor("crit_multiplier")
    end
    return 0
end
modifier_item_silver_edge_custom_734 = __TS__Decorate(
    modifier_item_silver_edge_custom_734,
    modifier_item_silver_edge_custom_734,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_silver_edge_custom_734"}
)
____exports.modifier_item_silver_edge_custom_734 = modifier_item_silver_edge_custom_734
return ____exports
