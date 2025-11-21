local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 37,["21"] = 38,["22"] = 39,["23"] = 3,["24"] = 9,["25"] = 10,["26"] = 9,["27"] = 13,["28"] = 14,["29"] = 13,["30"] = 17,["31"] = 18,["34"] = 20,["35"] = 21,["36"] = 22,["37"] = 17,["38"] = 25,["39"] = 26,["40"] = 25,["41"] = 29,["42"] = 30,["43"] = 29,["44"] = 41,["45"] = 42,["46"] = 41,["47"] = 45,["48"] = 46,["49"] = 45,["50"] = 4,["51"] = 4,["52"] = 4,["53"] = 3,["56"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_solar_crest_custom_733_reduction = __TS__Class()
local modifier_item_solar_crest_custom_733_reduction = ____exports.modifier_item_solar_crest_custom_733_reduction
modifier_item_solar_crest_custom_733_reduction.name = "modifier_item_solar_crest_custom_733_reduction"
__TS__ClassExtends(modifier_item_solar_crest_custom_733_reduction, BaseModifier)
function modifier_item_solar_crest_custom_733_reduction.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.armor = 0
    self.attack_speed = 0
    self.movespeed = 0
    self.GetModifierPhysicalArmorBonus = function() return self.armor end
    self.GetModifierAttackSpeedBonus_Constant = function() return self.attack_speed end
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.movespeed end
end
function modifier_item_solar_crest_custom_733_reduction.prototype.IsHidden(self)
    return self:GetCaster() == self:GetParent()
end
function modifier_item_solar_crest_custom_733_reduction.prototype.IsPurgable(self)
    return true
end
function modifier_item_solar_crest_custom_733_reduction.prototype.OnCreated(self, params)
    if self:GetCaster() == self:GetParent() then
        return
    end
    self.armor = -self:GetSpecialValueFor("bonus_armor")
    self.attack_speed = -self:GetSpecialValueFor("target_attack_speed")
    self.movespeed = -self:GetSpecialValueFor("target_movement_speed")
end
function modifier_item_solar_crest_custom_733_reduction.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_item_solar_crest_custom_733_reduction.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_item_solar_crest_custom_733_reduction.prototype.GetEffectName(self)
    return "particles/items2_fx/medallion_of_courage.vpcf"
end
function modifier_item_solar_crest_custom_733_reduction.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_item_solar_crest_custom_733_reduction = __TS__Decorate(
    modifier_item_solar_crest_custom_733_reduction,
    modifier_item_solar_crest_custom_733_reduction,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_solar_crest_custom_733_reduction"}
)
____exports.modifier_item_solar_crest_custom_733_reduction = modifier_item_solar_crest_custom_733_reduction
return ____exports
