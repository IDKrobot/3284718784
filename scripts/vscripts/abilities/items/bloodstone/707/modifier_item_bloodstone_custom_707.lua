local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 3,["14"] = 4,["15"] = 3,["16"] = 4,["18"] = 4,["19"] = 34,["20"] = 35,["21"] = 36,["22"] = 3,["23"] = 5,["24"] = 6,["25"] = 5,["26"] = 9,["27"] = 10,["28"] = 9,["29"] = 13,["30"] = 14,["31"] = 13,["32"] = 17,["33"] = 18,["34"] = 17,["35"] = 21,["36"] = 22,["37"] = 22,["38"] = 22,["39"] = 22,["40"] = 22,["41"] = 22,["42"] = 22,["43"] = 22,["44"] = 21,["45"] = 38,["46"] = 39,["47"] = 40,["48"] = 41,["49"] = 38,["50"] = 44,["51"] = 45,["52"] = 44,["53"] = 48,["54"] = 49,["55"] = 50,["56"] = 51,["57"] = 53,["60"] = 55,["61"] = 55,["62"] = 55,["63"] = 55,["64"] = 55,["65"] = 55,["66"] = 55,["69"] = 62,["70"] = 63,["71"] = 63,["72"] = 63,["73"] = 63,["74"] = 64,["75"] = 65,["76"] = 67,["77"] = 67,["78"] = 67,["79"] = 67,["80"] = 68,["83"] = 48,["84"] = 4,["85"] = 4,["86"] = 4,["87"] = 3,["90"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bloodstone_custom_707 = __TS__Class()
local modifier_item_bloodstone_custom_707 = ____exports.modifier_item_bloodstone_custom_707
modifier_item_bloodstone_custom_707.name = "modifier_item_bloodstone_custom_707"
__TS__ClassExtends(modifier_item_bloodstone_custom_707, BaseModifier)
function modifier_item_bloodstone_custom_707.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierHealthBonus = function() return self:GetSpecialValueFor("bonus_health") end
    self.GetModifierManaBonus = function() return self:GetSpecialValueFor("bonus_mana") end
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("bonus_health_regen") end
end
function modifier_item_bloodstone_custom_707.prototype.IsHidden(self)
    return true
end
function modifier_item_bloodstone_custom_707.prototype.IsPurgable(self)
    return false
end
function modifier_item_bloodstone_custom_707.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_bloodstone_custom_707.prototype.GetAttributeStackingType(self)
    return "bloodstone"
end
function modifier_item_bloodstone_custom_707.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_PROPERTY_MANA_BONUS,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_PROPERTY_RESPAWNTIME,
        MODIFIER_EVENT_ON_DEATH
    }
end
function modifier_item_bloodstone_custom_707.prototype.GetModifierConstantManaRegen(self)
    local base = self:GetSpecialValueFor("bonus_mana_regen")
    local per_stack = self:GetSpecialValueFor("mana_per_charge")
    return base + per_stack * self:GetAbility():GetCurrentCharges()
end
function modifier_item_bloodstone_custom_707.prototype.GetModifierConstantRespawnTime(self)
    return -(self:GetSpecialValueFor("respawn_time_reduction") * self:GetAbility():GetCurrentCharges())
end
function modifier_item_bloodstone_custom_707.prototype.OnDeath(self, event)
    local parent = self:GetParent()
    local target = event.unit
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    if __TS__ArrayFind(
        __TS__ArrayFilter(
            parent:FindAllModifiers(),
            function(____, modifier) return modifier.GetAttributeStackingType ~= nil end
        ),
        function(____, modifier) return modifier:GetAttributeStackingType() == "bloodstone" end
    ) ~= self then
        return
    end
    if target == parent then
        ability:SetCurrentCharges(math.max(
            0,
            math.floor(ability:GetCurrentCharges() * 0.67)
        ))
    elseif target:GetTeamNumber() ~= parent:GetTeamNumber() and target:IsFullyRealHero() then
        local distance = ability:GetSpecialValueFor("charge_range")
        if target:IsPositionInRange(
            parent:GetAbsOrigin(),
            distance
        ) then
            ability:SetCurrentCharges(ability:GetCurrentCharges() + 1)
        end
    end
end
modifier_item_bloodstone_custom_707 = __TS__Decorate(
    modifier_item_bloodstone_custom_707,
    modifier_item_bloodstone_custom_707,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodstone_custom_707"}
)
____exports.modifier_item_bloodstone_custom_707 = modifier_item_bloodstone_custom_707
return ____exports
