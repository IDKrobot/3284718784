local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 28,["20"] = 29,["21"] = 3,["22"] = 8,["23"] = 9,["24"] = 8,["25"] = 12,["26"] = 13,["27"] = 12,["28"] = 16,["29"] = 17,["30"] = 18,["31"] = 16,["32"] = 21,["33"] = 22,["34"] = 21,["35"] = 4,["36"] = 4,["37"] = 4,["38"] = 3,["41"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_magnetic_field_custom_731_speed_bonus = __TS__Class()
local modifier_arc_warden_magnetic_field_custom_731_speed_bonus = ____exports.modifier_arc_warden_magnetic_field_custom_731_speed_bonus
modifier_arc_warden_magnetic_field_custom_731_speed_bonus.name = "modifier_arc_warden_magnetic_field_custom_731_speed_bonus"
__TS__ClassExtends(modifier_arc_warden_magnetic_field_custom_731_speed_bonus, BaseModifier)
function modifier_arc_warden_magnetic_field_custom_731_speed_bonus.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.attack_speed = 0
    self.magic_resist = 0
    self.GetModifierAttackSpeedBonus_Constant = function() return self.attack_speed end
    self.GetModifierMagicalResistanceBonus = function() return self.magic_resist end
end
function modifier_arc_warden_magnetic_field_custom_731_speed_bonus.prototype.IsHidden(self)
    return false
end
function modifier_arc_warden_magnetic_field_custom_731_speed_bonus.prototype.IsPurgable(self)
    return false
end
function modifier_arc_warden_magnetic_field_custom_731_speed_bonus.prototype.OnCreated(self, params)
    self.attack_speed = self:GetSpecialValueFor("attack_speed_bonus")
    self.magic_resist = self:GetSpecialValueFor("magic_resist_bonus")
end
function modifier_arc_warden_magnetic_field_custom_731_speed_bonus.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS}
end
modifier_arc_warden_magnetic_field_custom_731_speed_bonus = __TS__Decorate(
    modifier_arc_warden_magnetic_field_custom_731_speed_bonus,
    modifier_arc_warden_magnetic_field_custom_731_speed_bonus,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_magnetic_field_custom_731_speed_bonus"}
)
____exports.modifier_arc_warden_magnetic_field_custom_731_speed_bonus = modifier_arc_warden_magnetic_field_custom_731_speed_bonus
return ____exports
