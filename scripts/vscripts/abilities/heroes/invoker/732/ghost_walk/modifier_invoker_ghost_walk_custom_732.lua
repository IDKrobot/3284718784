local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 53,["23"] = 5,["24"] = 10,["25"] = 11,["26"] = 10,["27"] = 14,["28"] = 15,["29"] = 14,["30"] = 18,["31"] = 19,["32"] = 18,["33"] = 22,["34"] = 23,["35"] = 24,["36"] = 22,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 27,["41"] = 32,["42"] = 33,["43"] = 32,["44"] = 42,["45"] = 43,["46"] = 42,["47"] = 49,["48"] = 50,["49"] = 49,["50"] = 55,["51"] = 56,["52"] = 57,["54"] = 55,["55"] = 60,["56"] = 61,["57"] = 62,["59"] = 60,["60"] = 65,["61"] = 66,["62"] = 65,["63"] = 69,["64"] = 70,["65"] = 69,["66"] = 73,["67"] = 74,["68"] = 73,["69"] = 77,["70"] = 78,["71"] = 77,["72"] = 81,["73"] = 82,["74"] = 81,["75"] = 6,["76"] = 6,["77"] = 6,["78"] = 5,["81"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
local ____modifier_invoker_ghost_walk_custom_732_slow = require("abilities.heroes.invoker.732.ghost_walk.modifier_invoker_ghost_walk_custom_732_slow")
local modifier_invoker_ghost_walk_custom_732_slow = ____modifier_invoker_ghost_walk_custom_732_slow.modifier_invoker_ghost_walk_custom_732_slow
____exports.modifier_invoker_ghost_walk_custom_732 = __TS__Class()
local modifier_invoker_ghost_walk_custom_732 = ____exports.modifier_invoker_ghost_walk_custom_732
modifier_invoker_ghost_walk_custom_732.name = "modifier_invoker_ghost_walk_custom_732"
__TS__ClassExtends(modifier_invoker_ghost_walk_custom_732, BaseInvokerModifier)
function modifier_invoker_ghost_walk_custom_732.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.movespeed = 0
    self.radius = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.movespeed end
end
function modifier_invoker_ghost_walk_custom_732.prototype.IsHidden(self)
    return false
end
function modifier_invoker_ghost_walk_custom_732.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_ghost_walk_custom_732.prototype.IsAura(self)
    return true
end
function modifier_invoker_ghost_walk_custom_732.prototype.OnCreated(self, params)
    self.movespeed = self:GetOrbSpecialValueFor("self_slow", "wex")
    self.radius = self:GetSpecialValueFor("area_of_effect")
end
function modifier_invoker_ghost_walk_custom_732.prototype.OnRefresh(self, params)
    self.movespeed = self:GetOrbSpecialValueFor("self_slow", "wex")
    self.radius = self:GetSpecialValueFor("area_of_effect")
end
function modifier_invoker_ghost_walk_custom_732.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_INVISIBILITY_LEVEL, MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_EVENT_ON_ABILITY_EXECUTED, MODIFIER_EVENT_ON_ATTACK}
end
function modifier_invoker_ghost_walk_custom_732.prototype.CheckState(self)
    return {[MODIFIER_STATE_INVISIBLE] = true, [MODIFIER_STATE_NO_UNIT_COLLISION] = true}
end
function modifier_invoker_ghost_walk_custom_732.prototype.GetModifierInvisibilityLevel(self)
    return 1
end
function modifier_invoker_ghost_walk_custom_732.prototype.OnAbilityExecuted(self, event)
    if IsServer() and event.unit == self:GetParent() then
        self:Destroy()
    end
end
function modifier_invoker_ghost_walk_custom_732.prototype.OnAttack(self, event)
    if IsServer() and event.attacker == self:GetParent() then
        self:Destroy()
    end
end
function modifier_invoker_ghost_walk_custom_732.prototype.GetModifierAura(self)
    return modifier_invoker_ghost_walk_custom_732_slow.name
end
function modifier_invoker_ghost_walk_custom_732.prototype.GetAuraDuration(self)
    return 2
end
function modifier_invoker_ghost_walk_custom_732.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_invoker_ghost_walk_custom_732.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_invoker_ghost_walk_custom_732.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC)
end
modifier_invoker_ghost_walk_custom_732 = __TS__Decorate(
    modifier_invoker_ghost_walk_custom_732,
    modifier_invoker_ghost_walk_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_ghost_walk_custom_732"}
)
____exports.modifier_invoker_ghost_walk_custom_732 = modifier_invoker_ghost_walk_custom_732
return ____exports
