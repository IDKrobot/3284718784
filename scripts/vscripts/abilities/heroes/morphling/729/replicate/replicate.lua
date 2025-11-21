local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 10,["16"] = 11,["17"] = 10,["18"] = 11,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 14,["23"] = 19,["24"] = 20,["25"] = 19,["26"] = 23,["27"] = 24,["28"] = 26,["29"] = 26,["31"] = 28,["32"] = 28,["34"] = 30,["35"] = 31,["36"] = 31,["37"] = 32,["38"] = 32,["41"] = 35,["42"] = 23,["43"] = 38,["44"] = 39,["45"] = 38,["46"] = 42,["47"] = 43,["48"] = 44,["49"] = 45,["52"] = 47,["53"] = 48,["57"] = 51,["58"] = 53,["59"] = 55,["60"] = 63,["61"] = 63,["62"] = 63,["63"] = 63,["64"] = 63,["65"] = 63,["66"] = 72,["67"] = 80,["68"] = 42,["69"] = 88,["70"] = 89,["71"] = 91,["72"] = 97,["73"] = 98,["74"] = 99,["75"] = 100,["76"] = 101,["77"] = 102,["80"] = 104,["81"] = 105,["84"] = 107,["85"] = 108,["86"] = 109,["87"] = 111,["90"] = 88,["91"] = 11,["92"] = 11,["93"] = 11,["94"] = 10,["97"] = 11});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_morphling_replicate_custom_729 = require("abilities.heroes.morphling.729.replicate.modifier_morphling_replicate_custom_729")
local modifier_morphling_replicate_custom_729 = ____modifier_morphling_replicate_custom_729.modifier_morphling_replicate_custom_729
local ____modifier_morphling_replicate_custom_729_manager = require("abilities.heroes.morphling.729.replicate.modifier_morphling_replicate_custom_729_manager")
local modifier_morphling_replicate_custom_729_manager = ____modifier_morphling_replicate_custom_729_manager.modifier_morphling_replicate_custom_729_manager
____exports.morphling_replicate_custom_729 = __TS__Class()
local morphling_replicate_custom_729 = ____exports.morphling_replicate_custom_729
morphling_replicate_custom_729.name = "morphling_replicate_custom_729"
__TS__ClassExtends(morphling_replicate_custom_729, BaseAbility)
function morphling_replicate_custom_729.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_morphling.vsndevts")
end
function morphling_replicate_custom_729.prototype.IsStealable(self)
    return false
end
function morphling_replicate_custom_729.prototype.CastFilterResultTarget(self, target)
    local caster = self:GetCaster()
    if caster == target then
        return UF_FAIL_CUSTOM
    end
    if not target:IsHero() then
        return UF_FAIL_CREEP
    end
    if caster:GetTeamNumber() == target:GetTeamNumber() then
        if target:IsIllusion() then
            return UF_FAIL_ILLUSION
        elseif not caster:HasScepter() then
            return UF_FAIL_FRIENDLY
        end
    end
    return UF_SUCCESS
end
function morphling_replicate_custom_729.prototype.GetCustomCastErrorTarget(self, target)
    return "#dota_hud_error_cant_cast_on_self"
end
function morphling_replicate_custom_729.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    if caster:GetTeamNumber() ~= target:GetTeamNumber() then
        if target:TriggerSpellAbsorb(self) then
            return
        end
    end
    self.target = target
    local duration = self:GetSpecialValueFor("duration")
    modifier_morphling_replicate_custom_729_manager:apply(caster, caster, self, {duration = duration})
    modifier_morphling_replicate_custom_729:apply(
        caster,
        caster,
        self,
        {target = target:entindex()}
    )
    caster:AddNewModifier(target, self, "modifier_morphling_replicate_manager", {duration = duration})
    caster:AddNewModifier(target, self, "modifier_morphling_replicate", {})
end
function morphling_replicate_custom_729.prototype.OnProjectileHit_ExtraData(self, target, location, extraData)
    local caster = self:GetCaster()
    local abilities = {agi = "morphling_adaptive_strike_agi_custom_729", str = "morphling_adaptive_strike_str_custom_729", waveform = "morphling_waveform_custom_729"}
    local abilityName = abilities[extraData.abilityType]
    if abilityName then
        if caster:HasAbility(abilityName) then
            local ability = caster:FindAbilityByName(abilityName)
            if ability then
                ability:OnProjectileHit(target, location)
            end
        else
            local ability = caster:AddAbility(abilityName)
            if not ability then
                return
            end
            ability:SetLevel(extraData.abilityLevel)
            ability:SetStolen(true)
            ability:SetHidden(true)
            ability:OnProjectileHit(target, location, true)
        end
    end
end
morphling_replicate_custom_729 = __TS__Decorate(
    morphling_replicate_custom_729,
    morphling_replicate_custom_729,
    {registerAbility(nil)},
    {kind = "class", name = "morphling_replicate_custom_729"}
)
____exports.morphling_replicate_custom_729 = morphling_replicate_custom_729
return ____exports
