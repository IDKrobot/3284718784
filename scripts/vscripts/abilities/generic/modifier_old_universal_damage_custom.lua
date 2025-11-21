local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 48,["19"] = 3,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 27,["36"] = 28,["37"] = 27,["38"] = 31,["39"] = 32,["42"] = 34,["43"] = 36,["46"] = 38,["47"] = 39,["48"] = 31,["49"] = 42,["50"] = 43,["51"] = 42,["52"] = 50,["53"] = 51,["54"] = 52,["55"] = 52,["57"] = 54,["58"] = 55,["59"] = 59,["60"] = 60,["61"] = 50,["62"] = 4,["63"] = 4,["64"] = 4,["65"] = 3,["68"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_old_universal_damage_custom = __TS__Class()
local modifier_old_universal_damage_custom = ____exports.modifier_old_universal_damage_custom
modifier_old_universal_damage_custom.name = "modifier_old_universal_damage_custom"
__TS__ClassExtends(modifier_old_universal_damage_custom, BaseModifier)
function modifier_old_universal_damage_custom.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.multiplier = 100
    self.GetModifierBaseAttack_BonusDamage = function() return self:CalculateBonusDamage() end
end
function modifier_old_universal_damage_custom.prototype.IsHidden(self)
    return true
end
function modifier_old_universal_damage_custom.prototype.IsPurgable(self)
    return false
end
function modifier_old_universal_damage_custom.prototype.IsPurgeException(self)
    return false
end
function modifier_old_universal_damage_custom.prototype.RemoveOnDeath(self)
    return false
end
function modifier_old_universal_damage_custom.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_PERMANENT
end
function modifier_old_universal_damage_custom.prototype.StackOnIllusion(self)
    return true
end
function modifier_old_universal_damage_custom.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    local old_damage = params.bonus_damage
    if not old_damage then
        return
    end
    local allDamage = old_damage - GameModeEntity:GetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_ALL_DAMAGE)
    self:SetStackCount(allDamage * self.multiplier)
end
function modifier_old_universal_damage_custom.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE}
end
function modifier_old_universal_damage_custom.prototype.CalculateBonusDamage(self)
    local old_damage = self:GetStackCount()
    if old_damage == 0 then
        return 0
    end
    local parent = self:GetParent()
    local attributes = parent:IsRealHero() and parent:GetAllAttributes() or 0
    local bonus_damage = old_damage / self.multiplier
    return attributes * bonus_damage
end
modifier_old_universal_damage_custom = __TS__Decorate(
    modifier_old_universal_damage_custom,
    modifier_old_universal_damage_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_old_universal_damage_custom"}
)
____exports.modifier_old_universal_damage_custom = modifier_old_universal_damage_custom
return ____exports
