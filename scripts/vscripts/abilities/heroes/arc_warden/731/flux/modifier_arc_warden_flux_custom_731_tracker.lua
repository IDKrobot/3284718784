local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 4,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 5,["19"] = 9,["20"] = 10,["21"] = 9,["22"] = 13,["23"] = 14,["24"] = 13,["25"] = 17,["26"] = 18,["27"] = 18,["29"] = 17,["30"] = 21,["31"] = 22,["32"] = 23,["33"] = 24,["34"] = 26,["37"] = 28,["38"] = 30,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 30,["46"] = 30,["47"] = 30,["48"] = 30,["49"] = 42,["50"] = 42,["51"] = 42,["52"] = 42,["53"] = 44,["54"] = 21,["55"] = 4,["56"] = 4,["57"] = 4,["58"] = 3,["61"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_flux_custom_731_tracker = __TS__Class()
local modifier_arc_warden_flux_custom_731_tracker = ____exports.modifier_arc_warden_flux_custom_731_tracker
modifier_arc_warden_flux_custom_731_tracker.name = "modifier_arc_warden_flux_custom_731_tracker"
__TS__ClassExtends(modifier_arc_warden_flux_custom_731_tracker, BaseModifier)
function modifier_arc_warden_flux_custom_731_tracker.prototype.IsHidden(self)
    return true
end
function modifier_arc_warden_flux_custom_731_tracker.prototype.IsPurgable(self)
    return true
end
function modifier_arc_warden_flux_custom_731_tracker.prototype.IsDebuff(self)
    return false
end
function modifier_arc_warden_flux_custom_731_tracker.prototype.OnCreated(self, params)
    if IsServer() then
        self:StartIntervalThink(FrameTime())
    end
end
function modifier_arc_warden_flux_custom_731_tracker.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    if not caster or not ability then
        return
    end
    local radius = self:GetSpecialValueFor("search_radius")
    local units = FindUnitsInRadius(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
        FIND_ANY_ORDER,
        false
    )
    local no_near = #__TS__ArrayFilter(
        units,
        function(____, unit) return unit ~= parent end
    ) <= 0
    self:SetStackCount(no_near and 1 or 0)
end
modifier_arc_warden_flux_custom_731_tracker = __TS__Decorate(
    modifier_arc_warden_flux_custom_731_tracker,
    modifier_arc_warden_flux_custom_731_tracker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_flux_custom_731_tracker"}
)
____exports.modifier_arc_warden_flux_custom_731_tracker = modifier_arc_warden_flux_custom_731_tracker
return ____exports
