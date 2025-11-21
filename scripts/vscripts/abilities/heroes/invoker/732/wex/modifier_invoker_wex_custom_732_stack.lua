local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["17"] = 5,["18"] = 13,["19"] = 14,["20"] = 4,["21"] = 6,["22"] = 7,["23"] = 6,["24"] = 5,["25"] = 5,["26"] = 5,["27"] = 4,["30"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseSphereStackModifier = ____spheres.BaseSphereStackModifier
____exports.modifier_invoker_wex_custom_732_stack = __TS__Class()
local modifier_invoker_wex_custom_732_stack = ____exports.modifier_invoker_wex_custom_732_stack
modifier_invoker_wex_custom_732_stack.name = "modifier_invoker_wex_custom_732_stack"
__TS__ClassExtends(modifier_invoker_wex_custom_732_stack, BaseSphereStackModifier)
function modifier_invoker_wex_custom_732_stack.prototype.____constructor(self, ...)
    BaseSphereStackModifier.prototype.____constructor(self, ...)
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("attack_speed_per_instance") end
    self.GetModifierMoveSpeedBonus_Percentage = function() return self:GetSpecialValueFor("move_speed_per_instance") end
end
function modifier_invoker_wex_custom_732_stack.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
modifier_invoker_wex_custom_732_stack = __TS__Decorate(
    modifier_invoker_wex_custom_732_stack,
    modifier_invoker_wex_custom_732_stack,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_wex_custom_732_stack"}
)
____exports.modifier_invoker_wex_custom_732_stack = modifier_invoker_wex_custom_732_stack
return ____exports
