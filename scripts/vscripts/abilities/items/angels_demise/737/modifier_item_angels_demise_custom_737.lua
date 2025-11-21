local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 31,["20"] = 32,["21"] = 33,["22"] = 35,["23"] = 36,["24"] = 37,["25"] = 39,["26"] = 4,["27"] = 6,["28"] = 7,["29"] = 6,["30"] = 10,["31"] = 11,["32"] = 10,["33"] = 14,["34"] = 15,["35"] = 15,["36"] = 15,["37"] = 15,["38"] = 15,["39"] = 15,["40"] = 15,["41"] = 15,["42"] = 15,["43"] = 15,["44"] = 15,["45"] = 14,["46"] = 41,["47"] = 42,["48"] = 43,["49"] = 44,["50"] = 46,["53"] = 47,["56"] = 48,["59"] = 49,["62"] = 50,["65"] = 51,["68"] = 52,["71"] = 53,["74"] = 54,["77"] = 55,["80"] = 57,["81"] = 58,["82"] = 59,["83"] = 61,["84"] = 61,["85"] = 61,["86"] = 61,["87"] = 61,["88"] = 61,["89"] = 61,["90"] = 68,["91"] = 70,["92"] = 70,["93"] = 70,["94"] = 70,["95"] = 70,["96"] = 70,["97"] = 70,["98"] = 78,["99"] = 78,["100"] = 78,["101"] = 78,["102"] = 78,["103"] = 78,["104"] = 87,["105"] = 89,["106"] = 41,["107"] = 92,["108"] = 93,["109"] = 93,["111"] = 95,["112"] = 97,["113"] = 97,["114"] = 97,["115"] = 97,["116"] = 97,["117"] = 98,["119"] = 100,["120"] = 92,["121"] = 103,["122"] = 104,["123"] = 106,["124"] = 107,["125"] = 112,["126"] = 112,["127"] = 112,["128"] = 112,["129"] = 112,["130"] = 112,["131"] = 112,["132"] = 112,["133"] = 112,["134"] = 113,["135"] = 115,["136"] = 116,["137"] = 121,["138"] = 121,["139"] = 121,["140"] = 121,["141"] = 121,["142"] = 121,["143"] = 121,["144"] = 121,["145"] = 121,["146"] = 122,["147"] = 122,["148"] = 122,["149"] = 122,["150"] = 122,["151"] = 122,["152"] = 122,["153"] = 122,["154"] = 122,["155"] = 123,["156"] = 125,["157"] = 103,["158"] = 5,["159"] = 5,["160"] = 5,["161"] = 4,["164"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_angels_demise_custom_737_slow = require("abilities.items.angels_demise.737.modifier_item_angels_demise_custom_737_slow")
local modifier_item_angels_demise_custom_737_slow = ____modifier_item_angels_demise_custom_737_slow.modifier_item_angels_demise_custom_737_slow
____exports.modifier_item_angels_demise_custom_737 = __TS__Class()
local modifier_item_angels_demise_custom_737 = ____exports.modifier_item_angels_demise_custom_737
modifier_item_angels_demise_custom_737.name = "modifier_item_angels_demise_custom_737"
__TS__ClassExtends(modifier_item_angels_demise_custom_737, BaseModifier)
function modifier_item_angels_demise_custom_737.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierConstantManaRegen = function() return self:GetSpecialValueFor("bonus_mana_regen") end
    self.GetModifierHealthBonus = function() return self:GetSpecialValueFor("bonus_health") end
    self.GetModifierManaBonus = function() return self:GetSpecialValueFor("bonus_mana") end
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_all_stats") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_all_stats") end
    self.GetModifierBonusStats_Strength = function() return self:GetSpecialValueFor("bonus_all_stats") end
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
end
function modifier_item_angels_demise_custom_737.prototype.IsHidden(self)
    return true
end
function modifier_item_angels_demise_custom_737.prototype.IsPurgable(self)
    return false
end
function modifier_item_angels_demise_custom_737.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_PROPERTY_MANA_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_EVENT_SPELL_APPLIED_SUCCESSFULLY,
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
    }
end
function modifier_item_angels_demise_custom_737.prototype.OnSpellAppliedSuccessfully(self, event)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local target = event.target
    if not IsServer() then
        return
    end
    if not ability then
        return
    end
    if not target then
        return
    end
    if parent ~= event.ability:GetCaster() then
        return
    end
    if parent:IsIllusion() then
        return
    end
    if event.ability:IsItem() then
        return
    end
    if not ability:IsFullyCastable() then
        return
    end
    if not target:IsUnit() then
        return
    end
    if parent:HasItemInInventory("item_angels_demise") or parent:HasItemInInventory("item_phylactery") then
        return
    end
    if parent:FindAllModifiersByName("modifier_item_angels_demise_custom_737")[1] ~= self then
        return
    end
    local baseDamage = self:GetSpecialValueFor("bonus_spell_damage")
    local attackDamage = parent:GetAverageTrueAttackDamage(nil) * self:GetSpecialValueFor("bonus_attack_damage") / 100
    local damage = baseDamage + attackDamage
    local damageTable = {
        attacker = parent,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = ability
    }
    ApplyDamage(damageTable)
    SendOverheadEventMessage(
        nil,
        OVERHEAD_ALERT_BONUS_SPELL_DAMAGE,
        target,
        damage,
        nil
    )
    modifier_item_angels_demise_custom_737_slow:apply(
        target,
        parent,
        ability,
        {duration = target:CalculateDuration(parent, 1.5)}
    )
    self:PlayEffects(target)
    ability:UseResources(false, false, false, true)
end
function modifier_item_angels_demise_custom_737.prototype.GetModifierPreAttack_CriticalStrike(self, event)
    if not IsServer() then
        return 0
    end
    local chance = self:GetSpecialValueFor("crit_chance")
    if RollPseudoRandomPercentage(
        chance,
        DOTA_PSEUDO_RANDOM_ITEM_LESSERCRIT,
        self:GetParent()
    ) then
        return self:GetSpecialValueFor("crit_multiplier")
    end
    return 0
end
function modifier_item_angels_demise_custom_737.prototype.PlayEffects(self, target)
    local parent = self:GetParent()
    local particle_target_name = ParticleManager:GetParticleReplacement("particles/items_fx/phylactery_target.vpcf", parent)
    local particle_target = ParticleManager:CreateParticle(particle_target_name, PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControlEnt(
        particle_target,
        0,
        target,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        target:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle_target)
    local particle_name = ParticleManager:GetParticleReplacement("particles/items_fx/phylactery.vpcf", parent)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        target,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        target:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    target:EmitSound("Item.Phylactery.Target")
end
modifier_item_angels_demise_custom_737 = __TS__Decorate(
    modifier_item_angels_demise_custom_737,
    modifier_item_angels_demise_custom_737,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_angels_demise_custom_737"}
)
____exports.modifier_item_angels_demise_custom_737 = modifier_item_angels_demise_custom_737
return ____exports
