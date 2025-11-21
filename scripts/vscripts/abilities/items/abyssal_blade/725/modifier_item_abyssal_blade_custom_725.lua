local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 29,["22"] = 30,["23"] = 31,["24"] = 32,["25"] = 4,["26"] = 8,["27"] = 9,["28"] = 8,["29"] = 12,["30"] = 13,["31"] = 12,["32"] = 16,["33"] = 17,["34"] = 17,["35"] = 17,["36"] = 17,["37"] = 17,["38"] = 17,["39"] = 17,["40"] = 17,["41"] = 17,["42"] = 16,["43"] = 34,["44"] = 35,["45"] = 37,["46"] = 39,["47"] = 43,["48"] = 44,["50"] = 46,["51"] = 34,["52"] = 49,["53"] = 50,["54"] = 51,["55"] = 53,["58"] = 54,["61"] = 56,["62"] = 62,["63"] = 62,["64"] = 62,["65"] = 62,["66"] = 63,["67"] = 64,["68"] = 65,["75"] = 69,["78"] = 70,["81"] = 71,["84"] = 72,["87"] = 73,["90"] = 74,["93"] = 75,["96"] = 77,["97"] = 81,["98"] = 82,["100"] = 49,["101"] = 85,["102"] = 86,["103"] = 87,["104"] = 88,["105"] = 90,["108"] = 91,["111"] = 92,["114"] = 93,["117"] = 95,["118"] = 97,["119"] = 98,["120"] = 99,["121"] = 101,["122"] = 101,["123"] = 101,["124"] = 101,["125"] = 101,["126"] = 101,["127"] = 101,["128"] = 109,["129"] = 118,["130"] = 118,["131"] = 118,["132"] = 118,["133"] = 118,["134"] = 118,["135"] = 127,["136"] = 129,["137"] = 129,["138"] = 129,["139"] = 129,["140"] = 129,["141"] = 129,["142"] = 129,["143"] = 137,["144"] = 85,["145"] = 5,["146"] = 5,["147"] = 5,["148"] = 4,["151"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_abyssal_blade_custom_725_cooldown = require("abilities.items.abyssal_blade.725.modifier_item_abyssal_blade_custom_725_cooldown")
local modifier_item_abyssal_blade_custom_725_cooldown = ____modifier_item_abyssal_blade_custom_725_cooldown.modifier_item_abyssal_blade_custom_725_cooldown
____exports.modifier_item_abyssal_blade_custom_725 = __TS__Class()
local modifier_item_abyssal_blade_custom_725 = ____exports.modifier_item_abyssal_blade_custom_725
modifier_item_abyssal_blade_custom_725.name = "modifier_item_abyssal_blade_custom_725"
__TS__ClassExtends(modifier_item_abyssal_blade_custom_725, BaseModifier)
function modifier_item_abyssal_blade_custom_725.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bash_proc = false
    self.GetModifierHealthBonus = function() return self:GetSpecialValueFor("bonus_health") end
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("bonus_health_regen") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_strength") end
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
end
function modifier_item_abyssal_blade_custom_725.prototype.IsHidden(self)
    return true
end
function modifier_item_abyssal_blade_custom_725.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_abyssal_blade_custom_725.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK,
        MODIFIER_EVENT_ON_ATTACK,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end
function modifier_item_abyssal_blade_custom_725.prototype.GetModifierPhysical_ConstantBlock(self, event)
    local parent = self:GetParent()
    local block_chance = self:GetSpecialValueFor("block_chance")
    local block_damage = parent:IsRangedAttacker() and self:GetSpecialValueFor("block_damage_ranged") or self:GetSpecialValueFor("block_damage_melee")
    if RollPseudoRandomPercentage(block_chance, DOTA_PSEUDO_RANDOM_ITEM_ABYSSAL_BLOCK, parent) then
        return block_damage
    end
    return 0
end
function modifier_item_abyssal_blade_custom_725.prototype.OnAttack(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    local excludedHeroes = {"npc_dota_hero_spirit_breaker", "npc_dota_hero_faceless_void", "npc_dota_hero_slardar", "npc_dota_hero_kez"}
    if __TS__ArrayIncludes(
        excludedHeroes,
        parent:GetUnitName()
    ) then
        if parent:GetUnitName() == "npc_dota_hero_kez" then
            local saiAbility = parent:FindAbilityByName("kez_shodo_sai")
            if saiAbility and saiAbility:IsTrained() and not saiAbility:IsHidden() then
                return
            end
        else
            return
        end
    end
    if parent:FindAllModifiersByName(self:GetName())[1] ~= self then
        return
    end
    if parent:IsIllusion() then
        return
    end
    if parent:IsTempestDouble() then
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
    if parent:HasModifier(modifier_item_abyssal_blade_custom_725_cooldown.name) then
        return
    end
    local chance = parent:IsRangedAttacker() and self:GetSpecialValueFor("bash_chance_ranged") or self:GetSpecialValueFor("bash_chance_melee")
    if RollPseudoRandomPercentage(chance, DOTA_PSEUDO_RANDOM_ITEM_BASHER, parent) then
        self.bash_proc = true
    end
end
function modifier_item_abyssal_blade_custom_725.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local target = event.target
    if not ability then
        return
    end
    if event.attacker ~= parent then
        return
    end
    if target:IsBuildingType() then
        return
    end
    if not self.bash_proc then
        return
    end
    self.bash_proc = false
    local cooldown = ability:GetSpecialValueFor("bash_cooldown")
    local duration = ability:GetSpecialValueFor("bash_duration")
    local damage = ability:GetSpecialValueFor("bonus_chance_damage")
    local damageTable = {
        attacker = parent,
        damage = damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        victim = target,
        ability = ability
    }
    modifier_item_abyssal_blade_custom_725_cooldown:apply(parent, parent, ability, {duration = cooldown})
    target:AddNewModifier(
        parent,
        ability,
        "modifier_bashed",
        {duration = target:CalculateDuration(parent, duration)}
    )
    ApplyDamage(damageTable)
    SendOverheadEventMessage(
        nil,
        OVERHEAD_ALERT_BONUS_SPELL_DAMAGE,
        target,
        damage,
        nil
    )
    target:EmitSound("DOTA_Item.SkullBasher")
end
modifier_item_abyssal_blade_custom_725 = __TS__Decorate(
    modifier_item_abyssal_blade_custom_725,
    modifier_item_abyssal_blade_custom_725,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_abyssal_blade_custom_725"}
)
____exports.modifier_item_abyssal_blade_custom_725 = modifier_item_abyssal_blade_custom_725
return ____exports
