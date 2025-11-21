local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 7,["19"] = 85,["20"] = 3,["21"] = 9,["22"] = 10,["23"] = 9,["24"] = 13,["25"] = 14,["26"] = 13,["27"] = 17,["28"] = 18,["29"] = 20,["32"] = 21,["35"] = 23,["36"] = 25,["37"] = 27,["38"] = 17,["39"] = 30,["40"] = 31,["41"] = 32,["42"] = 34,["43"] = 36,["44"] = 38,["45"] = 40,["46"] = 41,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 43,["59"] = 43,["60"] = 55,["63"] = 57,["64"] = 30,["65"] = 60,["66"] = 61,["67"] = 60,["68"] = 66,["69"] = 67,["70"] = 66,["71"] = 70,["72"] = 71,["73"] = 70,["74"] = 79,["75"] = 80,["76"] = 79,["77"] = 87,["78"] = 88,["79"] = 87,["80"] = 91,["81"] = 92,["82"] = 94,["85"] = 96,["86"] = 98,["87"] = 99,["90"] = 103,["91"] = 91,["92"] = 106,["93"] = 107,["94"] = 107,["95"] = 107,["96"] = 107,["97"] = 106,["98"] = 110,["99"] = 111,["100"] = 110,["101"] = 4,["102"] = 4,["103"] = 4,["104"] = 3,["107"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_clinkz_burning_army_custom_730_archer = __TS__Class()
local modifier_clinkz_burning_army_custom_730_archer = ____exports.modifier_clinkz_burning_army_custom_730_archer
modifier_clinkz_burning_army_custom_730_archer.name = "modifier_clinkz_burning_army_custom_730_archer"
__TS__ClassExtends(modifier_clinkz_burning_army_custom_730_archer, BaseModifier)
function modifier_clinkz_burning_army_custom_730_archer.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.attack_range = 0
    self.base_attack_range = 0
    self.GetModifierAttackRangeBonus = function() return self.attack_range end
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.IsHidden(self)
    return true
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.IsPurgable(self)
    return false
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    if not caster then
        return
    end
    if not IsServer() then
        return
    end
    self.base_attack_range = self:GetParent():Script_GetAttackRange()
    self:SetHasCustomTransmitterData(true)
    self:StartIntervalThink(0.1)
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.OnIntervalThink(self)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    self.attack_range = caster:Script_GetAttackRange() - self.base_attack_range
    self:SendBuffRefreshToClients()
    local attack_range = parent:Script_GetAttackRange()
    local aggroTarget = parent:GetAggroTarget()
    if aggroTarget and aggroTarget:IsHero() then
        return
    end
    local enemy = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        attack_range,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO,
        bit.bor(DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, DOTA_UNIT_TARGET_FLAG_NO_INVIS),
        FIND_CLOSEST,
        false
    )[1]
    if not enemy or not enemy:IsHero() then
        return
    end
    parent:SetAggroTarget(enemy)
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.AddCustomTransmitterData(self)
    return {attack_range = self.attack_range}
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.HandleCustomTransmitterData(self, data)
    self.attack_range = data.attack_range
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACK_RANGE_BONUS, MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE, MODIFIER_EVENT_ON_ATTACKED}
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.CheckState(self)
    return {[MODIFIER_STATE_COMMAND_RESTRICTED] = true}
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.GetModifierIncomingDamage_Percentage(self, event)
    return -100
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.OnAttacked(self, event)
    local parent = self:GetParent()
    if event.target ~= parent then
        return
    end
    local health = parent:GetHealth() - (event.attacker:IsHero() and 750 or 150)
    if health <= 0 then
        parent:Kill(nil, event.attacker)
        return
    end
    parent:SetHealth(health)
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.GetEffectName(self)
    return ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_clinkz/clinkz_burning_army_ambient.vpcf",
        self:GetCaster()
    )
end
function modifier_clinkz_burning_army_custom_730_archer.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_clinkz_burning_army_custom_730_archer = __TS__Decorate(
    modifier_clinkz_burning_army_custom_730_archer,
    modifier_clinkz_burning_army_custom_730_archer,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_clinkz_burning_army_custom_730_archer"}
)
____exports.modifier_clinkz_burning_army_custom_730_archer = modifier_clinkz_burning_army_custom_730_archer
return ____exports
