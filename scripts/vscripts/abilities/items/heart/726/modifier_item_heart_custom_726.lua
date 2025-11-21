local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 39,["18"] = 40,["19"] = 41,["20"] = 42,["21"] = 44,["22"] = 3,["23"] = 5,["24"] = 6,["25"] = 5,["26"] = 9,["27"] = 10,["28"] = 9,["29"] = 13,["30"] = 14,["31"] = 13,["32"] = 17,["33"] = 18,["34"] = 19,["36"] = 17,["37"] = 22,["38"] = 23,["39"] = 22,["40"] = 26,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 27,["47"] = 27,["48"] = 27,["49"] = 26,["50"] = 46,["51"] = 47,["52"] = 48,["53"] = 50,["56"] = 51,["59"] = 52,["62"] = 53,["65"] = 54,["68"] = 56,["69"] = 57,["70"] = 46,["71"] = 4,["72"] = 4,["73"] = 4,["74"] = 3,["77"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_heart_custom_726 = __TS__Class()
local modifier_item_heart_custom_726 = ____exports.modifier_item_heart_custom_726
modifier_item_heart_custom_726.name = "modifier_item_heart_custom_726"
__TS__ClassExtends(modifier_item_heart_custom_726, BaseModifier)
function modifier_item_heart_custom_726.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
    self.GetModifierHealthBonus = function() return self:GetSpecialValueFor("bonus_health") end
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("bonus_hp_regen") end
    self.GetModifierHPRegenAmplify_Percentage = function() return self:GetSpecialValueFor("hp_regen_amp") end
    self.GetModifierHealthRegenPercentageUnique = function() return self:GetStackCount() == 1 and 5 or 0 end
end
function modifier_item_heart_custom_726.prototype.IsHidden(self)
    return true
end
function modifier_item_heart_custom_726.prototype.IsPurgable(self)
    return false
end
function modifier_item_heart_custom_726.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_heart_custom_726.prototype.OnCreated(self, params)
    if IsServer() then
        self:StartIntervalThink(FrameTime())
    end
end
function modifier_item_heart_custom_726.prototype.OnIntervalThink(self)
    self:SetStackCount(self:GetAbility():IsCooldownReady() and 1 or 0)
end
function modifier_item_heart_custom_726.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE,
        MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE_UNIQUE,
        MODIFIER_EVENT_ON_ATTACKED
    }
end
function modifier_item_heart_custom_726.prototype.OnAttacked(self, event)
    local parent = self:GetParent()
    local attacker = event.attacker
    if not IsServer() then
        return
    end
    if parent ~= event.target then
        return
    end
    if event.damage <= 0 then
        return
    end
    if bit.band(event.damage_flags, DOTA_DAMAGE_FLAG_HPLOSS) == DOTA_DAMAGE_FLAG_HPLOSS then
        return
    end
    if not (attacker:IsHero() or attacker:IsRoshan() or attacker:IsFountain()) then
        return
    end
    local cooldown = (parent:IsRangedAttacker() and 7 or 5) * parent:GetCooldownReduction()
    self:GetAbility():StartCooldown(cooldown)
end
modifier_item_heart_custom_726 = __TS__Decorate(
    modifier_item_heart_custom_726,
    modifier_item_heart_custom_726,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_heart_custom_726"}
)
____exports.modifier_item_heart_custom_726 = modifier_item_heart_custom_726
return ____exports
