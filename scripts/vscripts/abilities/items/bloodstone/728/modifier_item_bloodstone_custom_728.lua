local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 3,["14"] = 4,["15"] = 3,["16"] = 4,["18"] = 4,["19"] = 36,["20"] = 37,["21"] = 38,["22"] = 39,["23"] = 40,["24"] = 3,["25"] = 5,["26"] = 6,["27"] = 5,["28"] = 9,["29"] = 10,["30"] = 9,["31"] = 13,["32"] = 14,["33"] = 13,["34"] = 17,["35"] = 18,["36"] = 17,["37"] = 21,["38"] = 22,["39"] = 22,["40"] = 22,["41"] = 22,["42"] = 22,["43"] = 22,["44"] = 22,["45"] = 22,["46"] = 22,["47"] = 22,["48"] = 22,["49"] = 21,["50"] = 41,["51"] = 42,["52"] = 43,["53"] = 44,["54"] = 41,["55"] = 46,["56"] = 47,["57"] = 48,["58"] = 46,["59"] = 51,["60"] = 52,["61"] = 53,["62"] = 55,["65"] = 57,["68"] = 58,["71"] = 59,["74"] = 60,["77"] = 61,["80"] = 62,["83"] = 63,["86"] = 65,["87"] = 69,["88"] = 71,["89"] = 71,["90"] = 71,["91"] = 71,["92"] = 71,["93"] = 71,["94"] = 71,["95"] = 71,["96"] = 73,["97"] = 78,["98"] = 51,["99"] = 81,["100"] = 82,["101"] = 83,["102"] = 84,["103"] = 86,["106"] = 88,["107"] = 88,["108"] = 88,["109"] = 88,["110"] = 88,["111"] = 88,["112"] = 88,["115"] = 95,["116"] = 96,["117"] = 98,["118"] = 98,["119"] = 98,["120"] = 98,["121"] = 99,["122"] = 100,["123"] = 101,["124"] = 103,["125"] = 103,["126"] = 103,["127"] = 103,["128"] = 104,["131"] = 81,["132"] = 4,["133"] = 4,["134"] = 4,["135"] = 3,["138"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bloodstone_custom_728 = __TS__Class()
local modifier_item_bloodstone_custom_728 = ____exports.modifier_item_bloodstone_custom_728
modifier_item_bloodstone_custom_728.name = "modifier_item_bloodstone_custom_728"
__TS__ClassExtends(modifier_item_bloodstone_custom_728, BaseModifier)
function modifier_item_bloodstone_custom_728.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierHealthBonus = function() return self:GetSpecialValueFor("bonus_health") end
    self.GetModifierManaBonus = function() return self:GetSpecialValueFor("bonus_mana") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierMPRegenAmplify_Percentage = function() return self:GetSpecialValueFor("mana_regen_multiplier") end
    self.GetModifierLifestealRegenAmplify_Percentage = function() return self:GetSpecialValueFor("spell_lifesteal_amp") end
end
function modifier_item_bloodstone_custom_728.prototype.IsHidden(self)
    return true
end
function modifier_item_bloodstone_custom_728.prototype.IsPurgable(self)
    return false
end
function modifier_item_bloodstone_custom_728.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_bloodstone_custom_728.prototype.GetAttributeStackingType(self)
    return "bloodstone"
end
function modifier_item_bloodstone_custom_728.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_PROPERTY_MANA_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
        MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
        MODIFIER_PROPERTY_LIFESTEAL_AMPLIFY_PERCENTAGE,
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_EVENT_ON_TAKEDAMAGE,
        MODIFIER_EVENT_ON_DEATH
    }
end
function modifier_item_bloodstone_custom_728.prototype.GetModifierSpellAmplify_Percentage(self, event)
    local spell_amp = self:GetSpecialValueFor("spell_amp")
    local amp_per_charge = self:GetSpecialValueFor("amp_per_charge")
    return spell_amp + amp_per_charge * self:GetAbility():GetCurrentCharges()
end
function modifier_item_bloodstone_custom_728.prototype.GetModifierConstantManaRegen(self)
    local regen_per_charge = self:GetSpecialValueFor("regen_per_charge")
    return regen_per_charge * self:GetAbility():GetCurrentCharges()
end
function modifier_item_bloodstone_custom_728.prototype.OnTakeDamage(self, event)
    local parent = self:GetParent()
    local target = event.unit
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if parent == target then
        return
    end
    if not parent:IsUnit() then
        return
    end
    if parent:IsIllusion() then
        return
    end
    if event.damage <= 0 then
        return
    end
    if event.inflictor == nil then
        return
    end
    if bit.band(event.damage_flags, DOTA_DAMAGE_FLAG_REFLECTION) == DOTA_DAMAGE_FLAG_REFLECTION then
        return
    end
    local lifesteal = target:IsHero() and self:GetSpecialValueFor("hero_lifesteal") or self:GetSpecialValueFor("creep_lifesteal")
    local heal = event.damage * lifesteal / 100
    parent:HealWithParams(
        heal,
        event.inflictor,
        true,
        true,
        parent,
        true
    )
    local particle = ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:ReleaseParticleIndex(particle)
end
function modifier_item_bloodstone_custom_728.prototype.OnDeath(self, event)
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
        local death_charges = ability:GetSpecialValueFor("death_charges")
        ability:SetCurrentCharges(math.max(
            0,
            ability:GetCurrentCharges() - death_charges
        ))
    elseif target:GetTeamNumber() ~= parent:GetTeamNumber() and target:IsFullyRealHero() then
        local distance = ability:GetSpecialValueFor("charge_range")
        local kill_charges = ability:GetSpecialValueFor("kill_charges")
        if target:IsPositionInRange(
            parent:GetAbsOrigin(),
            distance
        ) then
            ability:SetCurrentCharges(ability:GetCurrentCharges() + kill_charges)
        end
    end
end
modifier_item_bloodstone_custom_728 = __TS__Decorate(
    modifier_item_bloodstone_custom_728,
    modifier_item_bloodstone_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodstone_custom_728"}
)
____exports.modifier_item_bloodstone_custom_728 = modifier_item_bloodstone_custom_728
return ____exports
