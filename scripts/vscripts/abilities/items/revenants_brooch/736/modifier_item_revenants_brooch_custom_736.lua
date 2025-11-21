local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["16"] = 6,["17"] = 50,["18"] = 5,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 23,["34"] = 24,["37"] = 26,["38"] = 27,["40"] = 19,["41"] = 36,["42"] = 37,["43"] = 38,["45"] = 36,["46"] = 41,["47"] = 42,["48"] = 41,["49"] = 52,["50"] = 53,["51"] = 54,["52"] = 56,["55"] = 58,["58"] = 59,["61"] = 60,["64"] = 61,["67"] = 62,["70"] = 63,["73"] = 64,["76"] = 66,["77"] = 70,["78"] = 72,["79"] = 72,["80"] = 72,["81"] = 72,["82"] = 72,["83"] = 72,["84"] = 72,["85"] = 72,["86"] = 74,["87"] = 79,["88"] = 52,["89"] = 82,["90"] = 83,["91"] = 84,["92"] = 85,["93"] = 87,["94"] = 87,["96"] = 88,["97"] = 88,["99"] = 89,["100"] = 89,["102"] = 90,["103"] = 90,["105"] = 91,["106"] = 91,["108"] = 92,["109"] = 92,["111"] = 93,["112"] = 93,["114"] = 94,["115"] = 94,["117"] = 96,["118"] = 98,["119"] = 99,["120"] = 99,["121"] = 99,["122"] = 99,["123"] = 99,["124"] = 99,["125"] = 99,["126"] = 99,["127"] = 107,["129"] = 110,["130"] = 114,["131"] = 116,["132"] = 82,["133"] = 6,["134"] = 6,["135"] = 6,["136"] = 5,["139"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_revenants_brooch_custom_736 = __TS__Class()
local modifier_item_revenants_brooch_custom_736 = ____exports.modifier_item_revenants_brooch_custom_736
modifier_item_revenants_brooch_custom_736.name = "modifier_item_revenants_brooch_custom_736"
__TS__ClassExtends(modifier_item_revenants_brooch_custom_736, BaseModifier)
function modifier_item_revenants_brooch_custom_736.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
end
function modifier_item_revenants_brooch_custom_736.prototype.IsHidden(self)
    return true
end
function modifier_item_revenants_brooch_custom_736.prototype.IsPurgable(self)
    return false
end
function modifier_item_revenants_brooch_custom_736.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_revenants_brooch_custom_736.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    if not ability then
        return
    end
    if ability:GetToggleState() and not parent:HasModifier("modifier_item_revenants_brooch_custom_736_active") then
        parent:AddNewModifier(parent, ability, "modifier_item_revenants_brooch_custom_736_active", {})
    end
end
function modifier_item_revenants_brooch_custom_736.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():RemoveModifierByName("modifier_item_revenants_brooch_custom_736_active")
    end
end
function modifier_item_revenants_brooch_custom_736.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE, MODIFIER_EVENT_ON_TAKEDAMAGE, MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE}
end
function modifier_item_revenants_brooch_custom_736.prototype.OnTakeDamage(self, event)
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
function modifier_item_revenants_brooch_custom_736.prototype.GetModifierTotalDamageOutgoing_Percentage(self, event)
    local parent = self:GetParent()
    local target = event.target
    local ability = self:GetAbility()
    if not IsServer() then
        return 0
    end
    if not ability then
        return 0
    end
    if parent ~= event.attacker then
        return 0
    end
    if event.inflictor and not event.no_attack_cooldown then
        return 0
    end
    if not target:IsUnit() then
        return 0
    end
    if event.damage_category ~= DOTA_DAMAGE_CATEGORY_ATTACK then
        return 0
    end
    if event.damage_type == DAMAGE_TYPE_MAGICAL then
        return 0
    end
    if not ability.attack_records[event.record] then
        return 0
    end
    ability.attack_records[event.record] = nil
    if not parent:IsIllusion() then
        local damageTable = {
            attacker = parent,
            damage = event.original_damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            victim = target,
            ability = ability,
            damage_flags = DOTA_DAMAGE_FLAG_MAGIC_AUTO_ATTACK
        }
        ApplyDamage(damageTable)
    end
    local sound = parent:IsRangedAttacker() and "Item.Brooch.Target.Ranged" or "Item.Brooch.Target.Melee"
    target:EmitSound(sound)
    return -200
end
modifier_item_revenants_brooch_custom_736 = __TS__Decorate(
    modifier_item_revenants_brooch_custom_736,
    modifier_item_revenants_brooch_custom_736,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_revenants_brooch_custom_736"}
)
____exports.modifier_item_revenants_brooch_custom_736 = modifier_item_revenants_brooch_custom_736
return ____exports
