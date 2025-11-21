local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 4,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 12,["27"] = 16,["28"] = 17,["29"] = 16,["30"] = 20,["31"] = 21,["32"] = 20,["33"] = 24,["34"] = 25,["35"] = 24,["36"] = 28,["37"] = 29,["38"] = 28,["39"] = 32,["40"] = 33,["41"] = 32,["42"] = 36,["43"] = 37,["44"] = 36,["45"] = 40,["46"] = 41,["47"] = 40,["48"] = 5,["49"] = 5,["50"] = 5,["51"] = 4,["54"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_arc_warden_magnetic_field_custom_731_speed_bonus = require("abilities.heroes.arc_warden.731.magnetic_field.modifier_arc_warden_magnetic_field_custom_731_speed_bonus")
local modifier_arc_warden_magnetic_field_custom_731_speed_bonus = ____modifier_arc_warden_magnetic_field_custom_731_speed_bonus.modifier_arc_warden_magnetic_field_custom_731_speed_bonus
____exports.modifier_arc_warden_magnetic_field_custom_731_speed_thinker = __TS__Class()
local modifier_arc_warden_magnetic_field_custom_731_speed_thinker = ____exports.modifier_arc_warden_magnetic_field_custom_731_speed_thinker
modifier_arc_warden_magnetic_field_custom_731_speed_thinker.name = "modifier_arc_warden_magnetic_field_custom_731_speed_thinker"
__TS__ClassExtends(modifier_arc_warden_magnetic_field_custom_731_speed_thinker, BaseModifier)
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.IsHidden(self)
    return true
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.IsAura(self)
    return true
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.OnCreated(self, params)
    self.radius = self:GetSpecialValueFor("radius")
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.GetAuraDuration(self)
    return 0.1
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.GetModifierAura(self)
    return modifier_arc_warden_magnetic_field_custom_731_speed_bonus.name
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BUILDING)
end
function modifier_arc_warden_magnetic_field_custom_731_speed_thinker.prototype.GetAuraSearchFlags(self)
    return DOTA_UNIT_TARGET_FLAG_NONE
end
modifier_arc_warden_magnetic_field_custom_731_speed_thinker = __TS__Decorate(
    modifier_arc_warden_magnetic_field_custom_731_speed_thinker,
    modifier_arc_warden_magnetic_field_custom_731_speed_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_magnetic_field_custom_731_speed_thinker"}
)
____exports.modifier_arc_warden_magnetic_field_custom_731_speed_thinker = modifier_arc_warden_magnetic_field_custom_731_speed_thinker
return ____exports
