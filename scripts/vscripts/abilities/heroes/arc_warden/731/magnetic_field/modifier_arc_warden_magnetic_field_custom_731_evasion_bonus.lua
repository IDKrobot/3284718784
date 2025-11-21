local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 19,["31"] = 23,["32"] = 24,["33"] = 23,["34"] = 29,["35"] = 30,["36"] = 31,["37"] = 33,["38"] = 33,["40"] = 34,["41"] = 34,["43"] = 35,["44"] = 35,["46"] = 37,["47"] = 29,["48"] = 4,["49"] = 4,["50"] = 4,["51"] = 3,["54"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_magnetic_field_custom_731_evasion_bonus = __TS__Class()
local modifier_arc_warden_magnetic_field_custom_731_evasion_bonus = ____exports.modifier_arc_warden_magnetic_field_custom_731_evasion_bonus
modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.name = "modifier_arc_warden_magnetic_field_custom_731_evasion_bonus"
__TS__ClassExtends(modifier_arc_warden_magnetic_field_custom_731_evasion_bonus, BaseModifier)
function modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
end
function modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.prototype.IsHidden(self)
    return true
end
function modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.prototype.IsPurgable(self)
    return false
end
function modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.prototype.OnCreated(self, params)
    self.radius = self:GetSpecialValueFor("radius")
end
function modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_EVASION_CONSTANT}
end
function modifier_arc_warden_magnetic_field_custom_731_evasion_bonus.prototype.GetModifierEvasion_Constant(self, event)
    local attacker = event.attacker
    local auraOwner = self:GetAuraOwner()
    if not auraOwner then
        return 0
    end
    if not attacker then
        return 0
    end
    if attacker:GetAbsOrigin():__sub(auraOwner:GetAbsOrigin()):Length2D() <= self.radius then
        return 0
    end
    return 100
end
modifier_arc_warden_magnetic_field_custom_731_evasion_bonus = __TS__Decorate(
    modifier_arc_warden_magnetic_field_custom_731_evasion_bonus,
    modifier_arc_warden_magnetic_field_custom_731_evasion_bonus,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_magnetic_field_custom_731_evasion_bonus"}
)
____exports.modifier_arc_warden_magnetic_field_custom_731_evasion_bonus = modifier_arc_warden_magnetic_field_custom_731_evasion_bonus
return ____exports
