local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 16,["26"] = 18,["27"] = 20,["28"] = 22,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 34,["38"] = 36,["39"] = 13,["40"] = 39,["41"] = 40,["42"] = 41,["45"] = 43,["48"] = 44,["51"] = 46,["52"] = 47,["53"] = 47,["54"] = 47,["55"] = 47,["56"] = 48,["57"] = 49,["59"] = 51,["60"] = 51,["61"] = 51,["62"] = 51,["63"] = 52,["64"] = 53,["66"] = 56,["67"] = 57,["68"] = 57,["69"] = 57,["70"] = 58,["71"] = 57,["72"] = 57,["73"] = 39,["74"] = 6,["75"] = 6,["76"] = 6,["77"] = 5,["80"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_ice_wall_custom_732_thinker = require("abilities.heroes.invoker.732.ice_wall.modifier_invoker_ice_wall_custom_732_thinker")
local modifier_invoker_ice_wall_custom_732_thinker = ____modifier_invoker_ice_wall_custom_732_thinker.modifier_invoker_ice_wall_custom_732_thinker
____exports.invoker_ice_wall_custom_732 = __TS__Class()
local invoker_ice_wall_custom_732 = ____exports.invoker_ice_wall_custom_732
invoker_ice_wall_custom_732.name = "invoker_ice_wall_custom_732"
__TS__ClassExtends(invoker_ice_wall_custom_732, BaseInvokerAbility)
function invoker_ice_wall_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_ice_wall")
    self.phraseCooldown = false
end
function invoker_ice_wall_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = caster:GetAbsOrigin():__add(caster:GetForwardVector():__mul(200))
    local duration = self:GetOrbSpecialValueFor("duration", "quas")
    caster:StartGesture(ACT_DOTA_CAST_ICE_WALL)
    CreateModifierThinker(
        caster,
        self,
        modifier_invoker_ice_wall_custom_732_thinker.name,
        {duration = duration},
        point,
        caster:GetTeamNumber(),
        false
    )
    caster:EmitSound("Hero_Invoker.IceWall.Cast")
    self:EmitCastResponse()
end
function invoker_ice_wall_custom_732.prototype.EmitCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_invoker" then
        return
    end
    if self.phraseCooldown then
        return
    end
    if not RollPercentage(75) then
        return
    end
    if caster:HasPersona("npc_dota_hero_invoker") then
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 7))
        )
        local response = "invoker_kidvo_la_ability_icewall_" .. random
        caster:EmitSoundOnClient(response)
    else
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 5))
        )
        local response = "invoker_invo_ability_icewall_" .. random
        caster:EmitSoundOnClient(response)
    end
    self.phraseCooldown = true
    Timers:CreateTimer(
        60,
        function()
            self.phraseCooldown = false
        end
    )
end
invoker_ice_wall_custom_732 = __TS__Decorate(
    invoker_ice_wall_custom_732,
    invoker_ice_wall_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_ice_wall_custom_732"}
)
____exports.invoker_ice_wall_custom_732 = invoker_ice_wall_custom_732
return ____exports
