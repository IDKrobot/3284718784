local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 3,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 20,["30"] = 21,["31"] = 22,["32"] = 20,["33"] = 25,["34"] = 26,["35"] = 25,["36"] = 32,["37"] = 33,["38"] = 33,["40"] = 35,["41"] = 32,["42"] = 38,["43"] = 39,["44"] = 41,["45"] = 42,["47"] = 44,["48"] = 38,["49"] = 4,["50"] = 4,["51"] = 4,["52"] = 3,["55"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_octarine_core_custom_728_cooldown = __TS__Class()
local modifier_item_octarine_core_custom_728_cooldown = ____exports.modifier_item_octarine_core_custom_728_cooldown
modifier_item_octarine_core_custom_728_cooldown.name = "modifier_item_octarine_core_custom_728_cooldown"
__TS__ClassExtends(modifier_item_octarine_core_custom_728_cooldown, BaseModifier)
function modifier_item_octarine_core_custom_728_cooldown.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.cooldown_reduction = 0
    self.cast_range = 0
end
function modifier_item_octarine_core_custom_728_cooldown.prototype.IsHidden(self)
    return true
end
function modifier_item_octarine_core_custom_728_cooldown.prototype.IsPurgable(self)
    return false
end
function modifier_item_octarine_core_custom_728_cooldown.prototype.RemoveOnDeath(self)
    return false
end
function modifier_item_octarine_core_custom_728_cooldown.prototype.OnCreated(self, params)
    self.cooldown_reduction = self:GetSpecialValueFor("bonus_cooldown")
    self.cast_range = self:GetSpecialValueFor("cast_range_bonus")
end
function modifier_item_octarine_core_custom_728_cooldown.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE, MODIFIER_PROPERTY_CAST_RANGE_BONUS}
end
function modifier_item_octarine_core_custom_728_cooldown.prototype.GetModifierPercentageCooldown(self, event)
    if self:GetParent():HasItemInInventory("item_octarine_core") then
        return 0
    end
    return self.cooldown_reduction
end
function modifier_item_octarine_core_custom_728_cooldown.prototype.GetModifierCastRangeBonus(self, event)
    local parent = self:GetParent()
    if parent:HasItemInInventory("item_aether_lens") or parent:HasItemInInventory("item_ethereal_blade") then
        return 0
    end
    return self.cast_range
end
modifier_item_octarine_core_custom_728_cooldown = __TS__Decorate(
    modifier_item_octarine_core_custom_728_cooldown,
    modifier_item_octarine_core_custom_728_cooldown,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_octarine_core_custom_728_cooldown"}
)
____exports.modifier_item_octarine_core_custom_728_cooldown = modifier_item_octarine_core_custom_728_cooldown
return ____exports
