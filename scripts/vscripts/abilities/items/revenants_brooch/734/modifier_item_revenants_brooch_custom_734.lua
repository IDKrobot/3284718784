local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 9,["20"] = 10,["21"] = 9,["22"] = 10,["24"] = 10,["25"] = 38,["26"] = 39,["27"] = 40,["28"] = 41,["29"] = 9,["30"] = 11,["31"] = 12,["32"] = 11,["33"] = 15,["34"] = 16,["35"] = 15,["36"] = 19,["37"] = 20,["38"] = 21,["40"] = 19,["41"] = 25,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 26,["49"] = 26,["50"] = 25,["51"] = 43,["52"] = 44,["53"] = 45,["54"] = 46,["55"] = 48,["58"] = 49,["61"] = 50,["64"] = 51,["67"] = 52,["70"] = 53,["73"] = 55,["74"] = 55,["75"] = 55,["76"] = 55,["77"] = 59,["78"] = 60,["79"] = 60,["80"] = 55,["81"] = 55,["82"] = 64,["83"] = 68,["84"] = 70,["85"] = 71,["86"] = 80,["87"] = 80,["88"] = 80,["89"] = 81,["90"] = 82,["91"] = 83,["92"] = 80,["93"] = 80,["94"] = 85,["95"] = 86,["96"] = 80,["97"] = 80,["98"] = 43,["99"] = 90,["100"] = 91,["101"] = 92,["102"] = 93,["103"] = 95,["104"] = 95,["106"] = 96,["107"] = 96,["109"] = 97,["110"] = 97,["112"] = 98,["113"] = 98,["115"] = 99,["116"] = 99,["118"] = 100,["119"] = 100,["121"] = 101,["122"] = 101,["124"] = 102,["125"] = 102,["127"] = 104,["128"] = 105,["129"] = 105,["130"] = 105,["131"] = 105,["132"] = 109,["133"] = 110,["134"] = 110,["135"] = 105,["136"] = 105,["137"] = 114,["138"] = 114,["139"] = 114,["140"] = 114,["141"] = 114,["142"] = 114,["143"] = 114,["144"] = 114,["145"] = 122,["147"] = 125,["148"] = 129,["149"] = 131,["150"] = 90,["151"] = 10,["152"] = 10,["153"] = 10,["154"] = 9,["157"] = 10});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_revenants_brooch_custom_734_reduction = require("abilities.items.revenants_brooch.734.modifier_item_revenants_brooch_custom_734_reduction")
local modifier_item_revenants_brooch_custom_734_reduction = ____modifier_item_revenants_brooch_custom_734_reduction.modifier_item_revenants_brooch_custom_734_reduction
local ____modifier_item_revenants_brooch_custom_734_slow = require("abilities.items.revenants_brooch.734.modifier_item_revenants_brooch_custom_734_slow")
local modifier_item_revenants_brooch_custom_734_slow = ____modifier_item_revenants_brooch_custom_734_slow.modifier_item_revenants_brooch_custom_734_slow
local ____modifier_item_revenants_brooch_custom_734_slow_cooldown = require("abilities.items.revenants_brooch.734.modifier_item_revenants_brooch_custom_734_slow_cooldown")
local modifier_item_revenants_brooch_custom_734_slow_cooldown = ____modifier_item_revenants_brooch_custom_734_slow_cooldown.modifier_item_revenants_brooch_custom_734_slow_cooldown
____exports.modifier_item_revenants_brooch_custom_734 = __TS__Class()
local modifier_item_revenants_brooch_custom_734 = ____exports.modifier_item_revenants_brooch_custom_734
modifier_item_revenants_brooch_custom_734.name = "modifier_item_revenants_brooch_custom_734"
__TS__ClassExtends(modifier_item_revenants_brooch_custom_734, BaseModifier)
function modifier_item_revenants_brooch_custom_734.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("bonus_attack_speed") end
    self.GetModifierPhysicalArmorBonus = function() return self:GetSpecialValueFor("bonus_armor") end
    self.GetModifierProjectileSpeedBonus = function() return self:GetSpecialValueFor("projectile_speed") end
end
function modifier_item_revenants_brooch_custom_734.prototype.IsHidden(self)
    return true
end
function modifier_item_revenants_brooch_custom_734.prototype.IsPurgable(self)
    return false
end
function modifier_item_revenants_brooch_custom_734.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():RemoveModifierByName("modifier_item_revenants_brooch_custom_734_counter")
    end
end
function modifier_item_revenants_brooch_custom_734.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_PROJECTILE_SPEED_BONUS,
        MODIFIER_EVENT_ON_ATTACK_LANDED,
        MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE
    }
end
function modifier_item_revenants_brooch_custom_734.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local target = event.target
    if not IsServer() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    if parent:IsIllusion() then
        return
    end
    if target:IsBuilding() or target:IsOther() then
        return
    end
    if parent:HasModifier(modifier_item_revenants_brooch_custom_734_slow_cooldown.name) then
        return
    end
    if parent:HasItemInInventory("item_witch_blade") or parent:HasItemInInventory("item_devastator") then
        return
    end
    modifier_item_revenants_brooch_custom_734_slow:apply(
        target,
        parent,
        ability,
        {duration = target:CalculateDuration(
            parent,
            self:GetSpecialValueFor("slow_duration")
        )}
    )
    local sound = target:IsRangedAttacker() and "Item.WitchBlade.Target.Ranged" or "Item.WitchBlade.Target"
    target:EmitSound(sound)
    local cooldown = self:GetSpecialValueFor("passive_cooldown") * parent:GetCooldownReduction()
    modifier_item_revenants_brooch_custom_734_slow_cooldown:apply(parent, parent, ability, {duration = cooldown})
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            parent:GetItems(8),
            function(____, item)
                local name = item:GetName()
                return name == "item_witch_blade" or name == "item_devastator"
            end
        ),
        function(____, item)
            item:UseResources(false, false, false, true)
        end
    )
end
function modifier_item_revenants_brooch_custom_734.prototype.GetModifierTotalDamageOutgoing_Percentage(self, event)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local target = event.target
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
    if not parent:IsIllusion() then
        modifier_item_revenants_brooch_custom_734_reduction:apply(
            target,
            parent,
            ability,
            {duration = target:CalculateDuration(
                parent,
                self:GetSpecialValueFor("reduction_duration")
            )}
        )
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
modifier_item_revenants_brooch_custom_734 = __TS__Decorate(
    modifier_item_revenants_brooch_custom_734,
    modifier_item_revenants_brooch_custom_734,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_revenants_brooch_custom_734"}
)
____exports.modifier_item_revenants_brooch_custom_734 = modifier_item_revenants_brooch_custom_734
return ____exports
