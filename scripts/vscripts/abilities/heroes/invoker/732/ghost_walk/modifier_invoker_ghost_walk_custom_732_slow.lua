local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["17"] = 5,["18"] = 24,["19"] = 4,["20"] = 6,["21"] = 7,["22"] = 6,["23"] = 10,["24"] = 11,["25"] = 10,["26"] = 14,["27"] = 15,["28"] = 14,["29"] = 18,["30"] = 19,["31"] = 18,["32"] = 26,["33"] = 27,["34"] = 26,["35"] = 30,["36"] = 31,["37"] = 30,["38"] = 34,["39"] = 35,["40"] = 34,["41"] = 38,["42"] = 39,["43"] = 38,["44"] = 5,["45"] = 5,["46"] = 5,["47"] = 4,["50"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
____exports.modifier_invoker_ghost_walk_custom_732_slow = __TS__Class()
local modifier_invoker_ghost_walk_custom_732_slow = ____exports.modifier_invoker_ghost_walk_custom_732_slow
modifier_invoker_ghost_walk_custom_732_slow.name = "modifier_invoker_ghost_walk_custom_732_slow"
__TS__ClassExtends(modifier_invoker_ghost_walk_custom_732_slow, BaseInvokerModifier)
function modifier_invoker_ghost_walk_custom_732_slow.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.GetModifierMoveSpeedBonus_Percentage = function() return -self:GetOrbSpecialValueFor("enemy_slow", "quas") end
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.IsHidden(self)
    return false
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.IsDebuff(self)
    return true
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_invoker/invoker_ghost_walk_debuff.vpcf"
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_frost.vpcf"
end
function modifier_invoker_ghost_walk_custom_732_slow.prototype.StatusEffectPriority(self)
    return 9999
end
modifier_invoker_ghost_walk_custom_732_slow = __TS__Decorate(
    modifier_invoker_ghost_walk_custom_732_slow,
    modifier_invoker_ghost_walk_custom_732_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_ghost_walk_custom_732_slow"}
)
____exports.modifier_invoker_ghost_walk_custom_732_slow = modifier_invoker_ghost_walk_custom_732_slow
return ____exports
