local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 61,["20"] = 62,["21"] = 3,["22"] = 10,["23"] = 11,["24"] = 10,["25"] = 14,["26"] = 15,["27"] = 14,["28"] = 18,["29"] = 19,["30"] = 21,["31"] = 22,["32"] = 24,["35"] = 26,["36"] = 28,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 33,["46"] = 18,["47"] = 36,["48"] = 37,["49"] = 38,["50"] = 36,["51"] = 41,["52"] = 42,["55"] = 44,["56"] = 46,["57"] = 47,["58"] = 48,["60"] = 41,["61"] = 52,["62"] = 53,["63"] = 52,["64"] = 64,["65"] = 65,["66"] = 66,["67"] = 68,["70"] = 69,["73"] = 70,["76"] = 71,["79"] = 72,["82"] = 74,["83"] = 75,["84"] = 75,["85"] = 75,["86"] = 75,["87"] = 75,["88"] = 75,["89"] = 75,["90"] = 75,["91"] = 77,["92"] = 82,["93"] = 64,["94"] = 4,["95"] = 4,["96"] = 4,["97"] = 3,["100"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_insatiable_hunger_custom_728 = __TS__Class()
local modifier_broodmother_insatiable_hunger_custom_728 = ____exports.modifier_broodmother_insatiable_hunger_custom_728
modifier_broodmother_insatiable_hunger_custom_728.name = "modifier_broodmother_insatiable_hunger_custom_728"
__TS__ClassExtends(modifier_broodmother_insatiable_hunger_custom_728, BaseModifier)
function modifier_broodmother_insatiable_hunger_custom_728.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonus_damage = 0
    self.bonus_lifesteal = 0
    self.OnTooltip = function() return self.bonus_lifesteal end
    self.GetModifierPreAttack_BonusDamage = function() return self.bonus_damage end
end
function modifier_broodmother_insatiable_hunger_custom_728.prototype.IsHidden(self)
    return false
end
function modifier_broodmother_insatiable_hunger_custom_728.prototype.IsPurgable(self)
    return false
end
function modifier_broodmother_insatiable_hunger_custom_728.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.bonus_damage = self:GetSpecialValueFor("bonus_damage")
    self.bonus_lifesteal = self:GetSpecialValueFor("lifesteal_pct")
    if not IsServer() then
        return
    end
    parent:EmitSound("Hero_Broodmother.InsatiableHunger")
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_broodmother/broodmother_hunger_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        self.particle,
        0,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_thorax",
        parent:GetAbsOrigin(),
        true
    )
end
function modifier_broodmother_insatiable_hunger_custom_728.prototype.OnRefresh(self, params)
    self.bonus_damage = self:GetSpecialValueFor("bonus_damage")
    self.bonus_lifesteal = self:GetSpecialValueFor("lifesteal_pct")
end
function modifier_broodmother_insatiable_hunger_custom_728.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    self:GetParent():StopSound("Hero_Broodmother.InsatiableHunger")
    if self.particle then
        ParticleManager:DestroyParticle(self.particle, false)
        ParticleManager:ReleaseParticleIndex(self.particle)
    end
end
function modifier_broodmother_insatiable_hunger_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_PROPERTY_TOOLTIP, MODIFIER_EVENT_ON_ATTACK_LANDED}
end
function modifier_broodmother_insatiable_hunger_custom_728.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if parent ~= event.attacker then
        return
    end
    if parent == target then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    local heal = event.damage * self.bonus_lifesteal / 100
    parent:HealWithParams(
        heal,
        self:GetAbility(),
        true,
        true,
        parent,
        false
    )
    local particle = ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:ReleaseParticleIndex(particle)
end
modifier_broodmother_insatiable_hunger_custom_728 = __TS__Decorate(
    modifier_broodmother_insatiable_hunger_custom_728,
    modifier_broodmother_insatiable_hunger_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_insatiable_hunger_custom_728"}
)
____exports.modifier_broodmother_insatiable_hunger_custom_728 = modifier_broodmother_insatiable_hunger_custom_728
return ____exports
