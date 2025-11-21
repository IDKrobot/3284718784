local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["20"] = 11,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 19,["25"] = 20,["26"] = 22,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 23,["34"] = 19,["35"] = 31,["36"] = 32,["37"] = 33,["39"] = 31,["40"] = 36,["41"] = 37,["42"] = 36,["43"] = 46,["44"] = 47,["45"] = 47,["47"] = 48,["48"] = 46,["49"] = 51,["50"] = 52,["51"] = 53,["52"] = 53,["54"] = 55,["55"] = 51,["56"] = 58,["57"] = 59,["58"] = 60,["59"] = 61,["60"] = 63,["63"] = 65,["66"] = 66,["69"] = 67,["72"] = 68,["75"] = 70,["76"] = 72,["79"] = 74,["80"] = 75,["81"] = 75,["83"] = 58,["84"] = 78,["85"] = 79,["86"] = 81,["89"] = 82,["92"] = 84,["93"] = 78,["94"] = 87,["95"] = 88,["96"] = 88,["98"] = 89,["99"] = 87,["100"] = 92,["101"] = 93,["102"] = 92,["103"] = 6,["104"] = 6,["105"] = 6,["106"] = 5,["109"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_revenants_brooch_custom_736_active = __TS__Class()
local modifier_item_revenants_brooch_custom_736_active = ____exports.modifier_item_revenants_brooch_custom_736_active
modifier_item_revenants_brooch_custom_736_active.name = "modifier_item_revenants_brooch_custom_736_active"
__TS__ClassExtends(modifier_item_revenants_brooch_custom_736_active, BaseModifier)
function modifier_item_revenants_brooch_custom_736_active.prototype.IsHidden(self)
    return true
end
function modifier_item_revenants_brooch_custom_736_active.prototype.IsPurgable(self)
    return false
end
function modifier_item_revenants_brooch_custom_736_active.prototype.AllowIllusionDuplicate(self)
    return false
end
function modifier_item_revenants_brooch_custom_736_active.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if IsServer() then
        parent:AddNewModifier(
            parent,
            self:GetAbility(),
            "modifier_item_revenants_brooch_active",
            {}
        )
    end
end
function modifier_item_revenants_brooch_custom_736_active.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():RemoveModifierByName("modifier_item_revenants_brooch_active")
    end
end
function modifier_item_revenants_brooch_custom_736_active.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PROJECTILE_NAME, MODIFIER_PROPERTY_OVERRIDE_ATTACK_MAGICAL, MODIFIER_EVENT_ON_ATTACK, MODIFIER_EVENT_ON_ATTACK_RECORD_DESTROY}
end
function modifier_item_revenants_brooch_custom_736_active.prototype.GetModifierProjectileName(self)
    if not self:GetAbility() then
        return ""
    end
    return "particles/items_fx/revenant_brooch_projectile.vpcf"
end
function modifier_item_revenants_brooch_custom_736_active.prototype.GetOverrideAttackMagical(self)
    local parent = self:GetParent()
    if parent:IsIllusion() or parent:GetMana() < 50 then
        return 0
    end
    return self:GetAbility() == nil and 0 or 1
end
function modifier_item_revenants_brooch_custom_736_active.prototype.OnAttack(self, event)
    local parent = self:GetParent()
    local target = event.target
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    if not ability then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if not target:IsUnit() then
        return
    end
    if parent:GetMana() < 50 then
        return
    end
    ability.attack_records[event.record] = true
    if parent:IsIllusion() or event.no_attack_cooldown then
        return
    end
    parent:Script_ReduceMana(50, ability)
    if parent:GetMana() < 50 then
        ability:ToggleAbility()
    end
end
function modifier_item_revenants_brooch_custom_736_active.prototype.OnAttackRecordDestroy(self, event)
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    if not ability then
        return
    end
    ability.attack_records[event.record] = nil
end
function modifier_item_revenants_brooch_custom_736_active.prototype.GetEffectName(self)
    if not self:GetAbility() then
        return ""
    end
    return "particles/items_fx/revenant_brooch_buff.vpcf"
end
function modifier_item_revenants_brooch_custom_736_active.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_revenants_brooch_custom_736_active = __TS__Decorate(
    modifier_item_revenants_brooch_custom_736_active,
    modifier_item_revenants_brooch_custom_736_active,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_revenants_brooch_custom_736_active"}
)
____exports.modifier_item_revenants_brooch_custom_736_active = modifier_item_revenants_brooch_custom_736_active
return ____exports
