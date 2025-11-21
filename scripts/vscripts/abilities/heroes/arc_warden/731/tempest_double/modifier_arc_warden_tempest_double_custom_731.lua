local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 7,["21"] = 66,["22"] = 4,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 13,["27"] = 14,["28"] = 13,["29"] = 17,["30"] = 18,["31"] = 20,["32"] = 21,["33"] = 23,["36"] = 25,["37"] = 26,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["44"] = 31,["45"] = 17,["46"] = 34,["47"] = 35,["48"] = 36,["49"] = 37,["50"] = 39,["51"] = 41,["52"] = 42,["53"] = 43,["56"] = 50,["58"] = 50,["61"] = 34,["62"] = 54,["63"] = 55,["64"] = 54,["65"] = 62,["66"] = 63,["67"] = 62,["68"] = 5,["69"] = 5,["70"] = 5,["71"] = 4,["74"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_arc_warden_tempest_double_custom_731_penalty = require("abilities.heroes.arc_warden.731.tempest_double.modifier_arc_warden_tempest_double_custom_731_penalty")
local modifier_arc_warden_tempest_double_custom_731_penalty = ____modifier_arc_warden_tempest_double_custom_731_penalty.modifier_arc_warden_tempest_double_custom_731_penalty
____exports.modifier_arc_warden_tempest_double_custom_731 = __TS__Class()
local modifier_arc_warden_tempest_double_custom_731 = ____exports.modifier_arc_warden_tempest_double_custom_731
modifier_arc_warden_tempest_double_custom_731.name = "modifier_arc_warden_tempest_double_custom_731"
__TS__ClassExtends(modifier_arc_warden_tempest_double_custom_731, BaseModifier)
function modifier_arc_warden_tempest_double_custom_731.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.penalty_radius = 0
    self.cooldown_reduction = 0
    self.GetModifierPercentageCooldown = function() return self.cooldown_reduction end
end
function modifier_arc_warden_tempest_double_custom_731.prototype.IsHidden(self)
    return true
end
function modifier_arc_warden_tempest_double_custom_731.prototype.IsPurgable(self)
    return false
end
function modifier_arc_warden_tempest_double_custom_731.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.cooldown_reduction = self:GetSpecialValueFor("tempest_cooldown_reduction")
    self.penalty_radius = self:GetSpecialValueFor("damage_penalty_distance")
    if not IsServer() then
        return
    end
    local player = PlayerResource:GetPlayer(parent:GetPlayerOwnerID())
    if player ~= nil then
        CustomGameEventManager:Send_ServerToPlayer(
            player,
            "update_tempest_double",
            {entindex = parent:entindex()}
        )
    end
    self:StartIntervalThink(FrameTime())
end
function modifier_arc_warden_tempest_double_custom_731.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    local distance = caster:GetAbsOrigin():__sub(parent:GetAbsOrigin()):Length2D()
    if distance > self.penalty_radius or not caster:IsAlive() then
        if not parent:HasModifier(modifier_arc_warden_tempest_double_custom_731_penalty.name) then
            modifier_arc_warden_tempest_double_custom_731_penalty:apply(parent, caster, ability, {})
        end
    else
        local ____opt_0 = parent:FindModifierByName(modifier_arc_warden_tempest_double_custom_731_penalty.name)
        if ____opt_0 ~= nil then
            ____opt_0:Destroy()
        end
    end
end
function modifier_arc_warden_tempest_double_custom_731.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE}
end
function modifier_arc_warden_tempest_double_custom_731.prototype.GetModifierBonusStats_Strength(self)
    return 2
end
modifier_arc_warden_tempest_double_custom_731 = __TS__Decorate(
    modifier_arc_warden_tempest_double_custom_731,
    modifier_arc_warden_tempest_double_custom_731,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_tempest_double_custom_731"}
)
____exports.modifier_arc_warden_tempest_double_custom_731 = modifier_arc_warden_tempest_double_custom_731
return ____exports
