local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["17"] = 5,["18"] = 6,["19"] = 4,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 20,["30"] = 21,["31"] = 20,["32"] = 26,["33"] = 27,["34"] = 27,["36"] = 29,["37"] = 26,["38"] = 32,["39"] = 33,["40"] = 32,["41"] = 36,["42"] = 37,["43"] = 36,["44"] = 40,["45"] = 41,["46"] = 40,["47"] = 5,["48"] = 5,["49"] = 5,["50"] = 4,["53"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
____exports.modifier_invoker_ice_wall_custom_732_slow = __TS__Class()
local modifier_invoker_ice_wall_custom_732_slow = ____exports.modifier_invoker_ice_wall_custom_732_slow
modifier_invoker_ice_wall_custom_732_slow.name = "modifier_invoker_ice_wall_custom_732_slow"
__TS__ClassExtends(modifier_invoker_ice_wall_custom_732_slow, BaseInvokerModifier)
function modifier_invoker_ice_wall_custom_732_slow.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.slow = 0
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.IsHidden(self)
    return false
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.OnCreated(self, params)
    self.slow = -self:GetOrbSpecialValueFor("slow", "quas")
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    if IsServer() then
        return self.slow
    end
    return 0
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_invoker/invoker_ice_wall_debuff.vpcf"
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_frost.vpcf"
end
function modifier_invoker_ice_wall_custom_732_slow.prototype.StatusEffectPriority(self)
    return 9999
end
modifier_invoker_ice_wall_custom_732_slow = __TS__Decorate(
    modifier_invoker_ice_wall_custom_732_slow,
    modifier_invoker_ice_wall_custom_732_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_ice_wall_custom_732_slow"}
)
____exports.modifier_invoker_ice_wall_custom_732_slow = modifier_invoker_ice_wall_custom_732_slow
return ____exports
