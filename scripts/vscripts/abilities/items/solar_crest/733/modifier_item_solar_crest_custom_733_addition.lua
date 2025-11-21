local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 37,["21"] = 38,["22"] = 39,["23"] = 3,["24"] = 9,["25"] = 10,["26"] = 9,["27"] = 13,["28"] = 14,["29"] = 13,["30"] = 17,["31"] = 18,["32"] = 20,["33"] = 21,["34"] = 22,["35"] = 17,["36"] = 25,["37"] = 26,["38"] = 25,["39"] = 29,["40"] = 30,["41"] = 29,["42"] = 41,["43"] = 42,["44"] = 41,["45"] = 45,["46"] = 46,["47"] = 45,["48"] = 4,["49"] = 4,["50"] = 4,["51"] = 3,["54"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_solar_crest_custom_733_addition = __TS__Class()
local modifier_item_solar_crest_custom_733_addition = ____exports.modifier_item_solar_crest_custom_733_addition
modifier_item_solar_crest_custom_733_addition.name = "modifier_item_solar_crest_custom_733_addition"
__TS__ClassExtends(modifier_item_solar_crest_custom_733_addition, BaseModifier)
function modifier_item_solar_crest_custom_733_addition.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.armor = 0
    self.attack_speed = 0
    self.movespeed = 0
    self.GetModifierPhysicalArmorBonus = function() return self.armor end
    self.GetModifierAttackSpeedBonus_Constant = function() return self.attack_speed end
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.movespeed end
end
function modifier_item_solar_crest_custom_733_addition.prototype.IsHidden(self)
    return false
end
function modifier_item_solar_crest_custom_733_addition.prototype.IsPurgable(self)
    return true
end
function modifier_item_solar_crest_custom_733_addition.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.armor = self:GetSpecialValueFor("bonus_armor")
    self.attack_speed = self:GetSpecialValueFor("target_attack_speed")
    self.movespeed = self:GetSpecialValueFor("target_movement_speed")
end
function modifier_item_solar_crest_custom_733_addition.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_item_solar_crest_custom_733_addition.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_item_solar_crest_custom_733_addition.prototype.GetEffectName(self)
    return "particles/items2_fx/medallion_of_courage_friend.vpcf"
end
function modifier_item_solar_crest_custom_733_addition.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_item_solar_crest_custom_733_addition = __TS__Decorate(
    modifier_item_solar_crest_custom_733_addition,
    modifier_item_solar_crest_custom_733_addition,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_solar_crest_custom_733_addition"}
)
____exports.modifier_item_solar_crest_custom_733_addition = modifier_item_solar_crest_custom_733_addition
return ____exports
