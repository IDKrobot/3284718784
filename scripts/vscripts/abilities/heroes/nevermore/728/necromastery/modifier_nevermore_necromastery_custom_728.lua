local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 6,["18"] = 10,["19"] = 11,["20"] = 10,["21"] = 19,["22"] = 20,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 21,["27"] = 19,["28"] = 24,["29"] = 25,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 26,["34"] = 24,["35"] = 29,["36"] = 30,["37"] = 32,["40"] = 33,["43"] = 35,["44"] = 36,["45"] = 37,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 39,["50"] = 41,["51"] = 42,["52"] = 43,["53"] = 44,["54"] = 46,["55"] = 47,["56"] = 47,["58"] = 49,["60"] = 29,["61"] = 53,["62"] = 54,["63"] = 56,["64"] = 58,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 58,["73"] = 58,["74"] = 69,["75"] = 53,["76"] = 5,["77"] = 5,["78"] = 5,["79"] = 4,["82"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_nevermore_necromastery_custom_728 = __TS__Class()
local modifier_nevermore_necromastery_custom_728 = ____exports.modifier_nevermore_necromastery_custom_728
modifier_nevermore_necromastery_custom_728.name = "modifier_nevermore_necromastery_custom_728"
__TS__ClassExtends(modifier_nevermore_necromastery_custom_728, BaseModifier)
function modifier_nevermore_necromastery_custom_728.prototype.IsHidden(self)
    return false
end
function modifier_nevermore_necromastery_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE, MODIFIER_EVENT_ON_DEATH}
end
function modifier_nevermore_necromastery_custom_728.prototype.GetModifierPreAttack_BonusDamage(self)
    local souls = math.min(
        self:GetStackCount(),
        self:GetSpecialValueFor("max_souls")
    )
    return self:GetSpecialValueFor("damage_per_soul") * souls
end
function modifier_nevermore_necromastery_custom_728.prototype.GetModifierSpellAmplify_Percentage(self, event)
    local souls = math.min(
        self:GetStackCount(),
        self:GetSpecialValueFor("max_souls")
    )
    return self:GetSpecialValueFor("spell_amp_per_soul") * souls
end
function modifier_nevermore_necromastery_custom_728.prototype.OnDeath(self, event)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    if not (event.unit:IsHero() or event.unit:IsCreep()) then
        return
    end
    if parent ~= event.unit and parent == event.attacker and not parent:PassivesDisabled() then
        local max_souls = self:GetSpecialValueFor("max_souls")
        local bonus_soul = self:GetSpecialValueFor("souls_per_kill")
        self:SetStackCount(math.min(
            self:GetStackCount() + bonus_soul,
            max_souls
        ))
        self:PlayEffects(event.unit)
    elseif parent == event.unit and parent ~= event.attacker and not parent:IsIllusion() then
        local soul_lost = self:GetSpecialValueFor("soul_release")
        local stacks_lost = math.floor(self:GetStackCount() * soul_lost)
        local requiem = parent:FindAbilityByName("nevermore_requiem_custom_728")
        if requiem and requiem:IsTrained() then
            requiem:OnSpellStart(true)
        end
        self:SetStackCount(stacks_lost)
    end
end
function modifier_nevermore_necromastery_custom_728.prototype.PlayEffects(self, target)
    local parent = self:GetParent()
    local particle = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_nevermore/nevermore_necro_souls.vpcf", parent)
    local info = {
        Target = parent,
        Source = target,
        Ability = self:GetAbility(),
        EffectName = particle,
        bDodgeable = true,
        bProvidesVision = true,
        iMoveSpeed = 900,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
    }
    ProjectileManager:CreateTrackingProjectile(info)
end
modifier_nevermore_necromastery_custom_728 = __TS__Decorate(
    modifier_nevermore_necromastery_custom_728,
    modifier_nevermore_necromastery_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_nevermore_necromastery_custom_728"}
)
____exports.modifier_nevermore_necromastery_custom_728 = modifier_nevermore_necromastery_custom_728
return ____exports
