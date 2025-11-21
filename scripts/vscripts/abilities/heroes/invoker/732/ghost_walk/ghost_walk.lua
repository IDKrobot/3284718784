local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 16,["26"] = 18,["27"] = 20,["28"] = 29,["29"] = 34,["30"] = 36,["31"] = 38,["32"] = 13,["33"] = 41,["34"] = 42,["35"] = 43,["38"] = 45,["41"] = 47,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 48,["46"] = 49,["47"] = 50,["49"] = 52,["50"] = 52,["51"] = 52,["52"] = 52,["53"] = 53,["54"] = 54,["56"] = 57,["57"] = 58,["58"] = 58,["59"] = 58,["60"] = 59,["61"] = 58,["62"] = 58,["63"] = 41,["64"] = 6,["65"] = 6,["66"] = 6,["67"] = 5,["70"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_ghost_walk_custom_732 = require("abilities.heroes.invoker.732.ghost_walk.modifier_invoker_ghost_walk_custom_732")
local modifier_invoker_ghost_walk_custom_732 = ____modifier_invoker_ghost_walk_custom_732.modifier_invoker_ghost_walk_custom_732
____exports.invoker_ghost_walk_custom_732 = __TS__Class()
local invoker_ghost_walk_custom_732 = ____exports.invoker_ghost_walk_custom_732
invoker_ghost_walk_custom_732.name = "invoker_ghost_walk_custom_732"
__TS__ClassExtends(invoker_ghost_walk_custom_732, BaseInvokerAbility)
function invoker_ghost_walk_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_ghost_walk")
    self.phraseCooldown = false
end
function invoker_ghost_walk_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:StartGesture(ACT_DOTA_CAST_GHOST_WALK)
    local duration = self:GetSpecialValueFor("duration")
    modifier_invoker_ghost_walk_custom_732:apply(caster, caster, self, {duration = duration})
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_ghost_walk.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("Hero_Invoker.GhostWalk")
    self:EmitCastResponse()
end
function invoker_ghost_walk_custom_732.prototype.EmitCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_invoker" then
        return
    end
    if self.phraseCooldown then
        return
    end
    if caster:HasPersona("npc_dota_hero_invoker") then
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 6))
        )
        local response = "invoker_kidvo_la_ability_ghostwalk_" .. random
        caster:EmitSoundOnClient(response)
    else
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 5))
        )
        local response = "invoker_invo_ability_ghostwalk_" .. random
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
invoker_ghost_walk_custom_732 = __TS__Decorate(
    invoker_ghost_walk_custom_732,
    invoker_ghost_walk_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_ghost_walk_custom_732"}
)
____exports.invoker_ghost_walk_custom_732 = invoker_ghost_walk_custom_732
return ____exports
