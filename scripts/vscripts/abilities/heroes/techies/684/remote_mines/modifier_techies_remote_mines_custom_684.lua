local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 8,["18"] = 3,["19"] = 10,["20"] = 11,["21"] = 10,["22"] = 14,["23"] = 15,["24"] = 14,["25"] = 18,["26"] = 19,["27"] = 18,["28"] = 22,["29"] = 23,["30"] = 25,["31"] = 27,["32"] = 29,["35"] = 31,["36"] = 35,["37"] = 40,["38"] = 40,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 41,["43"] = 41,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 42,["48"] = 44,["49"] = 22,["50"] = 47,["51"] = 48,["52"] = 49,["53"] = 49,["55"] = 47,["56"] = 52,["57"] = 53,["58"] = 52,["59"] = 58,["60"] = 59,["61"] = 64,["62"] = 65,["64"] = 68,["65"] = 58,["66"] = 71,["67"] = 72,["68"] = 71,["69"] = 4,["70"] = 4,["71"] = 4,["72"] = 3,["75"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_remote_mines_custom_684 = __TS__Class()
local modifier_techies_remote_mines_custom_684 = ____exports.modifier_techies_remote_mines_custom_684
modifier_techies_remote_mines_custom_684.name = "modifier_techies_remote_mines_custom_684"
__TS__ClassExtends(modifier_techies_remote_mines_custom_684, BaseModifier)
function modifier_techies_remote_mines_custom_684.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.ability_level = 0
end
function modifier_techies_remote_mines_custom_684.prototype.IsHidden(self)
    return true
end
function modifier_techies_remote_mines_custom_684.prototype.IsPurgable(self)
    return true
end
function modifier_techies_remote_mines_custom_684.prototype.CanParentBeAutoAttacked(self)
    return false
end
function modifier_techies_remote_mines_custom_684.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.model_scale = self:GetSpecialValueFor("model_scale")
    self.activation_time = 2
    if not IsServer() then
        return
    end
    local particle_name = self:GetCaster():HasArcana("npc_dota_hero_techies") and "particles/econ/items/techies/techies_arcana/techies_remote_mine_arcana.vpcf" or "particles/units/heroes/hero_techies/techies_remote_mine.vpcf"
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        3,
        parent:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    self:StartIntervalThink(0.1)
end
function modifier_techies_remote_mines_custom_684.prototype.OnIntervalThink(self)
    local ability = self:GetAbility()
    if ability then
        self.ability_level = ability:GetLevel()
    end
end
function modifier_techies_remote_mines_custom_684.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MODEL_SCALE}
end
function modifier_techies_remote_mines_custom_684.prototype.CheckState(self)
    local states = {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true}
    if self:GetElapsedTime() > self.activation_time then
        states[MODIFIER_STATE_INVISIBLE] = true
    end
    return states
end
function modifier_techies_remote_mines_custom_684.prototype.GetModifierModelScale(self)
    return self.model_scale
end
modifier_techies_remote_mines_custom_684 = __TS__Decorate(
    modifier_techies_remote_mines_custom_684,
    modifier_techies_remote_mines_custom_684,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_remote_mines_custom_684"}
)
____exports.modifier_techies_remote_mines_custom_684 = modifier_techies_remote_mines_custom_684
return ____exports
