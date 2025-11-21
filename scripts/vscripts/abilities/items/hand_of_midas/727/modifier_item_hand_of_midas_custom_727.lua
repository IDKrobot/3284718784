local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 24,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 17,["31"] = 26,["32"] = 27,["33"] = 29,["36"] = 30,["39"] = 31,["42"] = 32,["45"] = 34,["46"] = 26,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 3,["53"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_hand_of_midas_custom_727 = __TS__Class()
local modifier_item_hand_of_midas_custom_727 = ____exports.modifier_item_hand_of_midas_custom_727
modifier_item_hand_of_midas_custom_727.name = "modifier_item_hand_of_midas_custom_727"
__TS__ClassExtends(modifier_item_hand_of_midas_custom_727, BaseModifier)
function modifier_item_hand_of_midas_custom_727.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("bonus_attack_speed") end
end
function modifier_item_hand_of_midas_custom_727.prototype.IsHidden(self)
    return true
end
function modifier_item_hand_of_midas_custom_727.prototype.IsPurgable(self)
    return false
end
function modifier_item_hand_of_midas_custom_727.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_hand_of_midas_custom_727.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_EVENT_ON_ABILITY_EXECUTED}
end
function modifier_item_hand_of_midas_custom_727.prototype.OnAbilityExecuted(self, event)
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    if not ability then
        return
    end
    if event.unit ~= self:GetParent() then
        return
    end
    if event.ability:GetName() ~= "item_hand_of_midas" then
        return
    end
    ability:UseResources(false, false, false, true)
end
modifier_item_hand_of_midas_custom_727 = __TS__Decorate(
    modifier_item_hand_of_midas_custom_727,
    modifier_item_hand_of_midas_custom_727,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_hand_of_midas_custom_727"}
)
____exports.modifier_item_hand_of_midas_custom_727 = modifier_item_hand_of_midas_custom_727
return ____exports
