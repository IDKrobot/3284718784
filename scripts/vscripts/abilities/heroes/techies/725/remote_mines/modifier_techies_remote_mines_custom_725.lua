local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 8,["18"] = 3,["19"] = 10,["20"] = 11,["21"] = 10,["22"] = 14,["23"] = 15,["24"] = 14,["25"] = 18,["26"] = 19,["27"] = 18,["28"] = 22,["29"] = 23,["30"] = 25,["31"] = 27,["32"] = 29,["35"] = 31,["36"] = 35,["37"] = 40,["38"] = 40,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 41,["43"] = 41,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 42,["48"] = 44,["49"] = 44,["50"] = 44,["55"] = 44,["56"] = 45,["57"] = 22,["58"] = 48,["59"] = 49,["61"] = 49,["62"] = 49,["68"] = 51,["69"] = 52,["70"] = 52,["72"] = 48,["73"] = 55,["74"] = 56,["75"] = 55,["76"] = 62,["77"] = 63,["78"] = 68,["79"] = 69,["81"] = 72,["82"] = 62,["83"] = 75,["84"] = 76,["85"] = 75,["86"] = 79,["87"] = 80,["88"] = 79,["89"] = 4,["90"] = 4,["91"] = 4,["92"] = 3,["95"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_remote_mines_custom_725 = __TS__Class()
local modifier_techies_remote_mines_custom_725 = ____exports.modifier_techies_remote_mines_custom_725
modifier_techies_remote_mines_custom_725.name = "modifier_techies_remote_mines_custom_725"
__TS__ClassExtends(modifier_techies_remote_mines_custom_725, BaseModifier)
function modifier_techies_remote_mines_custom_725.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.ability_level = 0
end
function modifier_techies_remote_mines_custom_725.prototype.IsHidden(self)
    return true
end
function modifier_techies_remote_mines_custom_725.prototype.IsPurgable(self)
    return true
end
function modifier_techies_remote_mines_custom_725.prototype.CanParentBeAutoAttacked(self)
    return false
end
function modifier_techies_remote_mines_custom_725.prototype.OnCreated(self, params)
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
    local ____parent_SetMoveCapability_1 = parent.SetMoveCapability
    local ____temp_0
    if self:GetSpecialValueFor("mines_move") == 0 then
        ____temp_0 = DOTA_UNIT_CAP_MOVE_NONE
    else
        ____temp_0 = DOTA_UNIT_CAP_MOVE_GROUND
    end
    ____parent_SetMoveCapability_1(parent, ____temp_0)
    self:StartIntervalThink(0.1)
end
function modifier_techies_remote_mines_custom_725.prototype.OnIntervalThink(self)
    local ____self_3 = self:GetParent()
    local ____self_3_SetMoveCapability_4 = ____self_3.SetMoveCapability
    local ____temp_2
    if self:GetSpecialValueFor("mines_move") == 0 then
        ____temp_2 = DOTA_UNIT_CAP_MOVE_NONE
    else
        ____temp_2 = DOTA_UNIT_CAP_MOVE_GROUND
    end
    ____self_3_SetMoveCapability_4(____self_3, ____temp_2)
    local ability = self:GetAbility()
    if ability then
        self.ability_level = ability:GetLevel()
    end
end
function modifier_techies_remote_mines_custom_725.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE, MODIFIER_PROPERTY_MODEL_SCALE}
end
function modifier_techies_remote_mines_custom_725.prototype.CheckState(self)
    local states = {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true}
    if self:GetElapsedTime() > self.activation_time then
        states[MODIFIER_STATE_INVISIBLE] = true
    end
    return states
end
function modifier_techies_remote_mines_custom_725.prototype.GetModifierMoveSpeed_Absolute(self)
    return self:GetSpecialValueFor("mines_move")
end
function modifier_techies_remote_mines_custom_725.prototype.GetModifierModelScale(self)
    return self.model_scale
end
modifier_techies_remote_mines_custom_725 = __TS__Decorate(
    modifier_techies_remote_mines_custom_725,
    modifier_techies_remote_mines_custom_725,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_remote_mines_custom_725"}
)
____exports.modifier_techies_remote_mines_custom_725 = modifier_techies_remote_mines_custom_725
return ____exports
