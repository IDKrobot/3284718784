local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 4,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 12,["27"] = 16,["28"] = 17,["29"] = 19,["30"] = 21,["33"] = 23,["34"] = 25,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 30,["39"] = 30,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 31,["48"] = 16,["49"] = 34,["50"] = 35,["51"] = 35,["53"] = 34,["54"] = 38,["55"] = 39,["56"] = 38,["57"] = 42,["58"] = 43,["59"] = 42,["60"] = 46,["61"] = 47,["62"] = 46,["63"] = 50,["64"] = 51,["65"] = 50,["66"] = 54,["67"] = 55,["68"] = 54,["69"] = 58,["70"] = 59,["71"] = 58,["72"] = 5,["73"] = 5,["74"] = 5,["75"] = 4,["78"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_arc_warden_magnetic_field_custom_731_bonus = require("abilities.heroes.arc_warden.731.magnetic_field.modifier_arc_warden_magnetic_field_custom_731_bonus")
local modifier_arc_warden_magnetic_field_custom_731_bonus = ____modifier_arc_warden_magnetic_field_custom_731_bonus.modifier_arc_warden_magnetic_field_custom_731_bonus
____exports.modifier_arc_warden_magnetic_field_custom_731_thinker = __TS__Class()
local modifier_arc_warden_magnetic_field_custom_731_thinker = ____exports.modifier_arc_warden_magnetic_field_custom_731_thinker
modifier_arc_warden_magnetic_field_custom_731_thinker.name = "modifier_arc_warden_magnetic_field_custom_731_thinker"
__TS__ClassExtends(modifier_arc_warden_magnetic_field_custom_731_thinker, BaseModifier)
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.IsHidden(self)
    return true
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.IsAura(self)
    return true
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    if not IsServer() then
        return
    end
    parent:EmitSound("Hero_ArcWarden.MagneticField")
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_arc_warden/arc_warden_magnetic.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(self.radius, 0, 0)
    )
    self:AddParticle(
        particle,
        false,
        false,
        1,
        false,
        false
    )
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():StopSound("Hero_ArcWarden.MagneticField")
    end
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.GetAuraDuration(self)
    return 0.1
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.GetModifierAura(self)
    return modifier_arc_warden_magnetic_field_custom_731_bonus.name
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BUILDING)
end
function modifier_arc_warden_magnetic_field_custom_731_thinker.prototype.GetAuraSearchFlags(self)
    return DOTA_UNIT_TARGET_FLAG_NONE
end
modifier_arc_warden_magnetic_field_custom_731_thinker = __TS__Decorate(
    modifier_arc_warden_magnetic_field_custom_731_thinker,
    modifier_arc_warden_magnetic_field_custom_731_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_magnetic_field_custom_731_thinker"}
)
____exports.modifier_arc_warden_magnetic_field_custom_731_thinker = modifier_arc_warden_magnetic_field_custom_731_thinker
return ____exports
