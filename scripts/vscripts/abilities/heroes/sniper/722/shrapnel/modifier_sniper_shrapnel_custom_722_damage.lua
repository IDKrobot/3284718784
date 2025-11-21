local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 49,["19"] = 3,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 20,["30"] = 21,["31"] = 23,["32"] = 25,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 35,["43"] = 36,["44"] = 20,["45"] = 39,["46"] = 40,["47"] = 39,["48"] = 43,["49"] = 44,["50"] = 43,["51"] = 4,["52"] = 4,["53"] = 4,["54"] = 3,["57"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_sniper_shrapnel_custom_722_damage = __TS__Class()
local modifier_sniper_shrapnel_custom_722_damage = ____exports.modifier_sniper_shrapnel_custom_722_damage
modifier_sniper_shrapnel_custom_722_damage.name = "modifier_sniper_shrapnel_custom_722_damage"
__TS__ClassExtends(modifier_sniper_shrapnel_custom_722_damage, BaseModifier)
function modifier_sniper_shrapnel_custom_722_damage.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slow = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.slow end
end
function modifier_sniper_shrapnel_custom_722_damage.prototype.IsHidden(self)
    return false
end
function modifier_sniper_shrapnel_custom_722_damage.prototype.IsPurgable(self)
    return false
end
function modifier_sniper_shrapnel_custom_722_damage.prototype.IsDebuff(self)
    return true
end
function modifier_sniper_shrapnel_custom_722_damage.prototype.OnCreated(self, params)
    self.slow = self:GetSpecialValueFor("slow_movement_speed")
    local damage = self:GetSpecialValueFor("shrapnel_damage")
    if not IsServer() then
        return
    end
    self.damageTable = {
        attacker = self:GetCaster(),
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = self:GetParent(),
        ability = self:GetAbility()
    }
    self:OnIntervalThink()
    self:StartIntervalThink(1)
end
function modifier_sniper_shrapnel_custom_722_damage.prototype.OnIntervalThink(self)
    ApplyDamage(self.damageTable)
end
function modifier_sniper_shrapnel_custom_722_damage.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
modifier_sniper_shrapnel_custom_722_damage = __TS__Decorate(
    modifier_sniper_shrapnel_custom_722_damage,
    modifier_sniper_shrapnel_custom_722_damage,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_shrapnel_custom_722_damage"}
)
____exports.modifier_sniper_shrapnel_custom_722_damage = modifier_sniper_shrapnel_custom_722_damage
return ____exports
