local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 31,["20"] = 32,["21"] = 33,["22"] = 34,["23"] = 35,["24"] = 36,["25"] = 4,["26"] = 6,["27"] = 7,["28"] = 6,["29"] = 10,["30"] = 11,["31"] = 10,["32"] = 14,["33"] = 15,["34"] = 14,["35"] = 18,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 19,["40"] = 19,["41"] = 19,["42"] = 19,["43"] = 19,["44"] = 19,["45"] = 18,["46"] = 38,["47"] = 39,["48"] = 40,["49"] = 42,["52"] = 43,["55"] = 44,["58"] = 45,["61"] = 46,["64"] = 48,["65"] = 50,["66"] = 50,["67"] = 50,["68"] = 50,["69"] = 50,["70"] = 50,["71"] = 38,["72"] = 5,["73"] = 5,["74"] = 5,["75"] = 4,["78"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_bloodthorn_custom_733_mage_slayer = require("abilities.items.bloodthorn.733.modifier_item_bloodthorn_custom_733_mage_slayer")
local modifier_item_bloodthorn_custom_733_mage_slayer = ____modifier_item_bloodthorn_custom_733_mage_slayer.modifier_item_bloodthorn_custom_733_mage_slayer
____exports.modifier_item_bloodthorn_custom_733 = __TS__Class()
local modifier_item_bloodthorn_custom_733 = ____exports.modifier_item_bloodthorn_custom_733
modifier_item_bloodthorn_custom_733.name = "modifier_item_bloodthorn_custom_733"
__TS__ClassExtends(modifier_item_bloodthorn_custom_733, BaseModifier)
function modifier_item_bloodthorn_custom_733.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierConstantManaRegen = function() return self:GetSpecialValueFor("bonus_mana_regen") end
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("bonus_health_regen") end
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("bonus_attack_speed") end
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
    self.GetModifierMagicalResistanceBonusUnique = function() return self:GetSpecialValueFor("bonus_magic_resistance") end
end
function modifier_item_bloodthorn_custom_733.prototype.IsHidden(self)
    return true
end
function modifier_item_bloodthorn_custom_733.prototype.IsPurgable(self)
    return false
end
function modifier_item_bloodthorn_custom_733.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_bloodthorn_custom_733.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS_UNIQUE,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end
function modifier_item_bloodthorn_custom_733.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if parent == target then
        return
    end
    if target:IsBuilding() then
        return
    end
    if target:IsOther() then
        return
    end
    local duration = self:GetSpecialValueFor("duration")
    modifier_item_bloodthorn_custom_733_mage_slayer:apply(
        target,
        parent,
        self:GetAbility(),
        {duration = target:CalculateDuration(parent, duration)}
    )
end
modifier_item_bloodthorn_custom_733 = __TS__Decorate(
    modifier_item_bloodthorn_custom_733,
    modifier_item_bloodthorn_custom_733,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodthorn_custom_733"}
)
____exports.modifier_item_bloodthorn_custom_733 = modifier_item_bloodthorn_custom_733
return ____exports
