local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 7,["16"] = 6,["17"] = 7,["19"] = 7,["20"] = 8,["21"] = 10,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 14,["26"] = 19,["27"] = 20,["28"] = 19,["29"] = 23,["30"] = 24,["31"] = 23,["32"] = 27,["33"] = 28,["34"] = 30,["37"] = 31,["40"] = 33,["41"] = 34,["42"] = 36,["43"] = 37,["44"] = 39,["45"] = 41,["46"] = 42,["48"] = 45,["49"] = 50,["50"] = 50,["51"] = 50,["52"] = 50,["53"] = 50,["54"] = 51,["56"] = 27,["57"] = 55,["58"] = 56,["59"] = 58,["60"] = 59,["61"] = 61,["62"] = 62,["63"] = 63,["64"] = 64,["65"] = 65,["66"] = 65,["67"] = 65,["68"] = 65,["69"] = 65,["70"] = 65,["71"] = 65,["72"] = 65,["73"] = 66,["75"] = 68,["76"] = 69,["78"] = 72,["80"] = 55,["81"] = 7,["82"] = 7,["83"] = 7,["84"] = 6,["87"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_pudge_flesh_heap_custom_722 = require("abilities.heroes.pudge.722.flesh_heap.modifier_pudge_flesh_heap_custom_722")
local modifier_pudge_flesh_heap_custom_722 = ____modifier_pudge_flesh_heap_custom_722.modifier_pudge_flesh_heap_custom_722
____exports.pudge_flesh_heap_custom_722 = __TS__Class()
local pudge_flesh_heap_custom_722 = ____exports.pudge_flesh_heap_custom_722
pudge_flesh_heap_custom_722.name = "pudge_flesh_heap_custom_722"
__TS__ClassExtends(pudge_flesh_heap_custom_722, CustomAbility)
function pudge_flesh_heap_custom_722.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "pudge_flesh_heap")
    self.kills = 0
end
function pudge_flesh_heap_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pudge.vsndevts")
end
function pudge_flesh_heap_custom_722.prototype.GetIntrinsicModifierName(self)
    return modifier_pudge_flesh_heap_custom_722.name
end
function pudge_flesh_heap_custom_722.prototype.OnUpgrade(self)
    self:EmitPhrase()
end
function pudge_flesh_heap_custom_722.prototype.OnHeroDiedNearby(self, unit, attacker, event)
    local caster = self:GetCaster()
    if unit:GetTeamNumber() == caster:GetTeamNumber() then
        return
    end
    if not caster:IsAlive() then
        return
    end
    local radius = self:GetSpecialValueFor("flesh_heap_rangeradius")
    local distance = caster:GetAbsOrigin():__sub(unit:GetAbsOrigin()):Length2D()
    if attacker == caster or distance < radius then
        self.kills = self.kills + 1
        local modifier = caster:FindModifierByName(modifier_pudge_flesh_heap_custom_722.name)
        if modifier then
            modifier:SetStackCount(self.kills)
        end
        local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_pudge/pudge_fleshheap_count.vpcf", PATTACH_OVERHEAD_FOLLOW, caster)
        ParticleManager:SetParticleControl(
            particle,
            1,
            Vector(1, 0, 0)
        )
        ParticleManager:ReleaseParticleIndex(particle)
    end
end
function pudge_flesh_heap_custom_722.prototype.EmitPhrase(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() == "npc_dota_hero_pudge" then
        local soundName = ""
        if caster:HasArcana() then
            local random = RollVoiceLines(nil, 1, 2)
            soundName = "pudge_pud_arc_ability_heap_" .. random
        elseif caster:HasPersona() then
            local random = RollVoiceLines(
                nil,
                1,
                2,
                3,
                4,
                5
            )
            soundName = "pudge_toy_pug_ability_heap_" .. random
        else
            local random = RollVoiceLines(nil, 1, 2)
            soundName = "pudge_pud_ability_heap_" .. random
        end
        caster:EmitSoundOnClient(soundName)
    end
end
pudge_flesh_heap_custom_722 = __TS__Decorate(
    pudge_flesh_heap_custom_722,
    pudge_flesh_heap_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "pudge_flesh_heap_custom_722"}
)
____exports.pudge_flesh_heap_custom_722 = pudge_flesh_heap_custom_722
return ____exports
