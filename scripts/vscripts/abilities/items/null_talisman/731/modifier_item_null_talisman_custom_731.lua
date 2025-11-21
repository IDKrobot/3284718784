local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 52,["18"] = 53,["19"] = 54,["20"] = 55,["21"] = 3,["22"] = 5,["23"] = 6,["24"] = 5,["25"] = 9,["26"] = 10,["27"] = 9,["28"] = 13,["29"] = 14,["30"] = 13,["31"] = 17,["32"] = 18,["33"] = 19,["35"] = 17,["36"] = 22,["37"] = 23,["38"] = 25,["39"] = 26,["42"] = 30,["43"] = 32,["44"] = 36,["45"] = 37,["46"] = 39,["48"] = 22,["49"] = 43,["50"] = 44,["51"] = 43,["52"] = 4,["53"] = 4,["54"] = 4,["55"] = 3,["58"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_null_talisman_custom_731 = __TS__Class()
local modifier_item_null_talisman_custom_731 = ____exports.modifier_item_null_talisman_custom_731
modifier_item_null_talisman_custom_731.name = "modifier_item_null_talisman_custom_731"
__TS__ClassExtends(modifier_item_null_talisman_custom_731, BaseModifier)
function modifier_item_null_talisman_custom_731.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_agility") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
    self.GetModifierPercentageManacostStacking = function() return self:GetSpecialValueFor("bonus_manacost_reduction") end
end
function modifier_item_null_talisman_custom_731.prototype.IsHidden(self)
    return true
end
function modifier_item_null_talisman_custom_731.prototype.IsPurgable(self)
    return false
end
function modifier_item_null_talisman_custom_731.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_null_talisman_custom_731.prototype.OnCreated(self, params)
    if IsServer() then
        self:StartIntervalThink(0.1)
    end
end
function modifier_item_null_talisman_custom_731.prototype.OnIntervalThink(self)
    local ability = self:GetAbility()
    if ability == nil then
        self:StopIntervalThink()
        return
    end
    local minute = math.floor(GameRules:GetDOTATime(false, false) / 60)
    local time = GameRules:IsTurboMode() and ability:GetSpecialValueFor("upgrade_time_turbo") or ability:GetSpecialValueFor("upgrade_time")
    if minute >= time then
        ability:SetLevel(2)
        self:StopIntervalThink()
    end
end
function modifier_item_null_talisman_custom_731.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_AGILITY_BONUS, MODIFIER_PROPERTY_STATS_INTELLECT_BONUS, MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_MANACOST_PERCENTAGE_STACKING}
end
modifier_item_null_talisman_custom_731 = __TS__Decorate(
    modifier_item_null_talisman_custom_731,
    modifier_item_null_talisman_custom_731,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_null_talisman_custom_731"}
)
____exports.modifier_item_null_talisman_custom_731 = modifier_item_null_talisman_custom_731
return ____exports
