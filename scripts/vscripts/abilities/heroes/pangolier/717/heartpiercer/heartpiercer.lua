local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 9,["23"] = 10,["24"] = 8,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 20,["33"] = 21,["36"] = 22,["39"] = 24,["40"] = 25,["43"] = 27,["44"] = 28,["45"] = 28,["46"] = 28,["47"] = 28,["48"] = 32,["49"] = 33,["50"] = 33,["51"] = 28,["52"] = 28,["53"] = 36,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 37,["61"] = 47,["62"] = 48,["64"] = 50,["66"] = 17,["67"] = 7,["68"] = 7,["69"] = 7,["70"] = 6,["73"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_pangolier_heartpiercer_custom_717 = require("abilities.heroes.pangolier.717.heartpiercer.modifier_pangolier_heartpiercer_custom_717")
local modifier_pangolier_heartpiercer_custom_717 = ____modifier_pangolier_heartpiercer_custom_717.modifier_pangolier_heartpiercer_custom_717
local ____modifier_pangolier_heartpiercer_custom_717_delay = require("abilities.heroes.pangolier.717.heartpiercer.modifier_pangolier_heartpiercer_custom_717_delay")
local modifier_pangolier_heartpiercer_custom_717_delay = ____modifier_pangolier_heartpiercer_custom_717_delay.modifier_pangolier_heartpiercer_custom_717_delay
local ____modifier_pangolier_heartpiercer_custom_717_debuff = require("abilities.heroes.pangolier.717.heartpiercer.modifier_pangolier_heartpiercer_custom_717_debuff")
local modifier_pangolier_heartpiercer_custom_717_debuff = ____modifier_pangolier_heartpiercer_custom_717_debuff.modifier_pangolier_heartpiercer_custom_717_debuff
____exports.pangolier_heartpiercer_custom_717 = __TS__Class()
local pangolier_heartpiercer_custom_717 = ____exports.pangolier_heartpiercer_custom_717
pangolier_heartpiercer_custom_717.name = "pangolier_heartpiercer_custom_717"
__TS__ClassExtends(pangolier_heartpiercer_custom_717, BaseAbility)
function pangolier_heartpiercer_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pangolier.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pangolier.vsndevts")
end
function pangolier_heartpiercer_custom_717.prototype.GetIntrinsicModifierName(self)
    return modifier_pangolier_heartpiercer_custom_717.name
end
function pangolier_heartpiercer_custom_717.prototype.ProcPassive(self, target)
    local caster = self:GetCaster()
    if caster:PassivesDisabled() then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() or target:IsRoshan() then
        return
    end
    local chance = self:GetSpecialValueFor("chance_pct")
    if not RollPseudoRandomPercentage(chance, DOTA_PSEUDO_RANDOM_ARMADILLO_HEARTPIERCER, caster) then
        return
    end
    if target:HasModifier(modifier_pangolier_heartpiercer_custom_717_debuff.name) then
        modifier_pangolier_heartpiercer_custom_717_debuff:apply(
            target,
            caster,
            self,
            {duration = target:CalculateDuration(
                caster,
                self:GetSpecialValueFor("duration")
            )}
        )
    elseif not target:HasModifier(modifier_pangolier_heartpiercer_custom_717_delay.name) then
        modifier_pangolier_heartpiercer_custom_717_delay:apply(
            target,
            caster,
            self,
            {duration = self:GetSpecialValueFor("debuff_delay")}
        )
    end
    if target:IsHero() then
        target:EmitSound("Hero_Pangolier.HeartPiercer")
    else
        target:EmitSound("Hero_Pangolier.HeartPiercer.Creep")
    end
end
pangolier_heartpiercer_custom_717 = __TS__Decorate(
    pangolier_heartpiercer_custom_717,
    pangolier_heartpiercer_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "pangolier_heartpiercer_custom_717"}
)
____exports.pangolier_heartpiercer_custom_717 = pangolier_heartpiercer_custom_717
return ____exports
