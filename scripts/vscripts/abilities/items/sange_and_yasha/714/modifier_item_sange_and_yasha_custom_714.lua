local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 29,["24"] = 4,["25"] = 6,["26"] = 7,["27"] = 6,["28"] = 10,["29"] = 11,["30"] = 10,["31"] = 14,["32"] = 15,["33"] = 15,["34"] = 15,["35"] = 15,["36"] = 15,["37"] = 15,["38"] = 15,["39"] = 15,["40"] = 14,["41"] = 31,["42"] = 32,["43"] = 33,["44"] = 40,["45"] = 40,["46"] = 40,["47"] = 40,["48"] = 41,["50"] = 44,["51"] = 31,["52"] = 47,["53"] = 48,["54"] = 49,["55"] = 50,["56"] = 52,["59"] = 53,["62"] = 54,["65"] = 56,["68"] = 57,["71"] = 58,["74"] = 59,["77"] = 61,["80"] = 63,["81"] = 63,["82"] = 63,["83"] = 63,["84"] = 63,["85"] = 63,["86"] = 72,["87"] = 47,["88"] = 5,["89"] = 5,["90"] = 5,["91"] = 4,["94"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_sange_and_yasha_custom_714_debuff = require("abilities.items.sange_and_yasha.714.modifier_item_sange_and_yasha_custom_714_debuff")
local modifier_item_sange_and_yasha_custom_714_debuff = ____modifier_item_sange_and_yasha_custom_714_debuff.modifier_item_sange_and_yasha_custom_714_debuff
____exports.modifier_item_sange_and_yasha_custom_714 = __TS__Class()
local modifier_item_sange_and_yasha_custom_714 = ____exports.modifier_item_sange_and_yasha_custom_714
modifier_item_sange_and_yasha_custom_714.name = "modifier_item_sange_and_yasha_custom_714"
__TS__ClassExtends(modifier_item_sange_and_yasha_custom_714, BaseModifier)
function modifier_item_sange_and_yasha_custom_714.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_agility") end
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("bonus_attack_speed") end
end
function modifier_item_sange_and_yasha_custom_714.prototype.IsHidden(self)
    return true
end
function modifier_item_sange_and_yasha_custom_714.prototype.IsPurgable(self)
    return false
end
function modifier_item_sange_and_yasha_custom_714.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE_UNIQUE,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end
function modifier_item_sange_and_yasha_custom_714.prototype.GetModifierMoveSpeedBonus_Percentage_Unique(self)
    local parent = self:GetParent()
    local yashaItems = {"item_yasha", "item_manta", "item_sange_and_yasha", "item_yasha_and_kaya"}
    if __TS__ArraySome(
        yashaItems,
        function(____, item) return parent:HasItemInInventory(item) end
    ) then
        return 0
    end
    return self:GetSpecialValueFor("movement_speed_percent_bonus")
end
function modifier_item_sange_and_yasha_custom_714.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local target = event.target
    if not IsServer() then
        return
    end
    if not ability then
        return
    end
    if event.attacker ~= parent then
        return
    end
    if parent:FindAllModifiersByName(self:GetName())[1] ~= self then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    if target:IsBuildingType() then
        return
    end
    if not RollPseudoRandomPercentage(40, DOTA_PSEUDO_RANDOM_ITEM_SANGEYASHA_MAIM, parent) then
        return
    end
    modifier_item_sange_and_yasha_custom_714_debuff:apply(
        target,
        parent,
        ability,
        {duration = target:CalculateDuration(parent, 5)}
    )
    target:EmitSound("DOTA_Item.Maim")
end
modifier_item_sange_and_yasha_custom_714 = __TS__Decorate(
    modifier_item_sange_and_yasha_custom_714,
    modifier_item_sange_and_yasha_custom_714,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_sange_and_yasha_custom_714"}
)
____exports.modifier_item_sange_and_yasha_custom_714 = modifier_item_sange_and_yasha_custom_714
return ____exports
