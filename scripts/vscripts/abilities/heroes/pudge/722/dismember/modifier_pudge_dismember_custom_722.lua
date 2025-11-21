local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["13"] = 5,["14"] = 6,["15"] = 5,["16"] = 6,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 5,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 24,["36"] = 26,["37"] = 30,["38"] = 35,["39"] = 35,["40"] = 35,["41"] = 35,["42"] = 35,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 37,["49"] = 37,["50"] = 37,["51"] = 37,["52"] = 37,["53"] = 38,["54"] = 38,["55"] = 38,["56"] = 38,["57"] = 38,["58"] = 38,["59"] = 38,["60"] = 38,["61"] = 40,["62"] = 40,["63"] = 40,["64"] = 41,["65"] = 42,["66"] = 44,["67"] = 45,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 47,["72"] = 47,["73"] = 47,["74"] = 19,["75"] = 57,["76"] = 58,["79"] = 60,["80"] = 61,["81"] = 61,["82"] = 61,["83"] = 61,["84"] = 57,["85"] = 64,["86"] = 65,["89"] = 67,["91"] = 67,["93"] = 68,["95"] = 68,["97"] = 64,["98"] = 71,["99"] = 72,["100"] = 71,["101"] = 77,["102"] = 78,["103"] = 77,["104"] = 83,["105"] = 84,["106"] = 83,["107"] = 6,["108"] = 6,["109"] = 6,["110"] = 5,["113"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_pudge_dismember_custom_722_pull = require("abilities.heroes.pudge.722.dismember.modifier_pudge_dismember_custom_722_pull")
local modifier_pudge_dismember_custom_722_pull = ____modifier_pudge_dismember_custom_722_pull.modifier_pudge_dismember_custom_722_pull
____exports.modifier_pudge_dismember_custom_722 = __TS__Class()
local modifier_pudge_dismember_custom_722 = ____exports.modifier_pudge_dismember_custom_722
modifier_pudge_dismember_custom_722.name = "modifier_pudge_dismember_custom_722"
__TS__ClassExtends(modifier_pudge_dismember_custom_722, BaseModifier)
function modifier_pudge_dismember_custom_722.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.max = 0
    self.count = 0
    self.tickInterval = 0
end
function modifier_pudge_dismember_custom_722.prototype.IsDebuff(self)
    return true
end
function modifier_pudge_dismember_custom_722.prototype.IsStunDebuff(self)
    return true
end
function modifier_pudge_dismember_custom_722.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not IsServer() or caster == nil or ability == nil then
        return
    end
    local particleName = caster:HasArcana("npc_dota_hero_pudge") and ParticleManager:GetParticleReplacement("particles/econ/items/pudge/pudge_arcana/pudge_arcana_dismember_default.vpcf", caster) or ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pudge/pudge_dismember.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN, parent)
    ParticleManager:SetParticleControl(
        particle,
        1,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        8,
        Vector(1, 1, 1)
    )
    ParticleManager:SetParticleControl(
        particle,
        15,
        Vector(64, 9, 9)
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    local ____temp_0 = ability:GetSpecialValueFor("ticks")
    self.max = ____temp_0
    local tick = ____temp_0
    self.count = 0
    self.tickInterval = ability:GetChannelTime() / tick
    self:OnIntervalThink()
    self:StartIntervalThink(self.tickInterval)
    modifier_pudge_dismember_custom_722_pull:apply(
        parent,
        caster,
        ability,
        {duration = ability:GetChannelTime()}
    )
end
function modifier_pudge_dismember_custom_722.prototype.OnIntervalThink(self)
    if self.count >= self.max then
        return
    end
    self.count = self.count + 1
    self:GetAbility():DealDamage(
        self:GetParent(),
        self.tickInterval
    )
end
function modifier_pudge_dismember_custom_722.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    local ____opt_1 = self:GetAbility()
    if ____opt_1 ~= nil then
        ____opt_1:EndChannel(false)
    end
    local ____opt_3 = self:GetCaster()
    if ____opt_3 ~= nil then
        ____opt_3:MoveToPositionAggressive(self:GetParent():GetAbsOrigin())
    end
end
function modifier_pudge_dismember_custom_722.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_pudge_dismember_custom_722.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
function modifier_pudge_dismember_custom_722.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_FLAIL
end
modifier_pudge_dismember_custom_722 = __TS__Decorate(
    modifier_pudge_dismember_custom_722,
    modifier_pudge_dismember_custom_722,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pudge_dismember_custom_722"}
)
____exports.modifier_pudge_dismember_custom_722 = modifier_pudge_dismember_custom_722
return ____exports
