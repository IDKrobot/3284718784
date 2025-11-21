local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 20,["29"] = 22,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 29,["40"] = 29,["41"] = 29,["42"] = 29,["43"] = 29,["44"] = 31,["45"] = 32,["46"] = 17,["47"] = 35,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 36,["54"] = 36,["55"] = 35,["56"] = 45,["57"] = 46,["58"] = 45,["59"] = 49,["60"] = 50,["61"] = 49,["62"] = 53,["63"] = 54,["64"] = 53,["65"] = 57,["66"] = 58,["67"] = 57,["68"] = 61,["69"] = 62,["70"] = 61,["71"] = 4,["72"] = 4,["73"] = 4,["74"] = 3,["77"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_sniper_assassinate_custom_722_target = __TS__Class()
local modifier_sniper_assassinate_custom_722_target = ____exports.modifier_sniper_assassinate_custom_722_target
modifier_sniper_assassinate_custom_722_target.name = "modifier_sniper_assassinate_custom_722_target"
__TS__ClassExtends(modifier_sniper_assassinate_custom_722_target, BaseModifier)
function modifier_sniper_assassinate_custom_722_target.prototype.IsHidden(self)
    return false
end
function modifier_sniper_assassinate_custom_722_target.prototype.IsPurgable(self)
    return false
end
function modifier_sniper_assassinate_custom_722_target.prototype.IsAura(self)
    return true
end
function modifier_sniper_assassinate_custom_722_target.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_sniper/sniper_crosshair.vpcf", caster)
    local particle = ParticleManager:CreateParticleForTeam(
        particle_name,
        PATTACH_OVERHEAD_FOLLOW,
        self:GetParent(),
        caster:GetTeamNumber()
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    self:OnIntervalThink()
    self:StartIntervalThink(0.1)
end
function modifier_sniper_assassinate_custom_722_target.prototype.OnIntervalThink(self)
    AddFOWViewer(
        self:GetCaster():GetTeamNumber(),
        self:GetParent():GetAbsOrigin(),
        10,
        0.11,
        true
    )
end
function modifier_sniper_assassinate_custom_722_target.prototype.GetAuraRadius(self)
    return 10
end
function modifier_sniper_assassinate_custom_722_target.prototype.GetModifierAura(self)
    return "modifier_truesight"
end
function modifier_sniper_assassinate_custom_722_target.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end
function modifier_sniper_assassinate_custom_722_target.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC)
end
function modifier_sniper_assassinate_custom_722_target.prototype.GetAuraSearchFlags(self)
    return bit.bor(DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, DOTA_UNIT_TARGET_FLAG_INVULNERABLE)
end
modifier_sniper_assassinate_custom_722_target = __TS__Decorate(
    modifier_sniper_assassinate_custom_722_target,
    modifier_sniper_assassinate_custom_722_target,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_assassinate_custom_722_target"}
)
____exports.modifier_sniper_assassinate_custom_722_target = modifier_sniper_assassinate_custom_722_target
return ____exports
