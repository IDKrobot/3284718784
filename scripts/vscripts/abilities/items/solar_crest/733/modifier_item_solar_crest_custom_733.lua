local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 51,["18"] = 53,["19"] = 54,["20"] = 55,["21"] = 3,["22"] = 5,["23"] = 6,["24"] = 5,["25"] = 9,["26"] = 10,["27"] = 9,["28"] = 13,["29"] = 14,["30"] = 13,["31"] = 17,["32"] = 18,["33"] = 19,["35"] = 17,["36"] = 22,["37"] = 23,["38"] = 24,["39"] = 25,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 29,["46"] = 22,["47"] = 32,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 33,["53"] = 33,["54"] = 33,["55"] = 32,["56"] = 43,["57"] = 44,["58"] = 46,["59"] = 43,["60"] = 4,["61"] = 4,["62"] = 4,["63"] = 3,["66"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_solar_crest_custom_733 = __TS__Class()
local modifier_item_solar_crest_custom_733 = ____exports.modifier_item_solar_crest_custom_733
modifier_item_solar_crest_custom_733.name = "modifier_item_solar_crest_custom_733"
__TS__ClassExtends(modifier_item_solar_crest_custom_733, BaseModifier)
function modifier_item_solar_crest_custom_733.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierMoveSpeedBonus_Constant = function() return self:GetSpecialValueFor("self_movement_speed") end
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_all_stats") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_all_stats") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_all_stats") end
end
function modifier_item_solar_crest_custom_733.prototype.IsHidden(self)
    return true
end
function modifier_item_solar_crest_custom_733.prototype.IsPurgable(self)
    return false
end
function modifier_item_solar_crest_custom_733.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_solar_crest_custom_733.prototype.OnCreated(self, params)
    if IsServer() then
        self:StartIntervalThink(FrameTime())
    end
end
function modifier_item_solar_crest_custom_733.prototype.OnIntervalThink(self)
    local ability = self:GetAbility()
    if not ability then
        self:StopIntervalThink()
        return
    end
    self:SetStackCount(BoolToNum(
        nil,
        ability:IsCooldownReady()
    ))
end
function modifier_item_solar_crest_custom_733.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS
    }
end
function modifier_item_solar_crest_custom_733.prototype.GetModifierPhysicalArmorBonus(self, event)
    local ability = self:GetAbility()
    return self:GetStackCount() == 1 and ability:GetSpecialValueFor("bonus_armor") or 0
end
modifier_item_solar_crest_custom_733 = __TS__Decorate(
    modifier_item_solar_crest_custom_733,
    modifier_item_solar_crest_custom_733,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_solar_crest_custom_733"}
)
____exports.modifier_item_solar_crest_custom_733 = modifier_item_solar_crest_custom_733
return ____exports
