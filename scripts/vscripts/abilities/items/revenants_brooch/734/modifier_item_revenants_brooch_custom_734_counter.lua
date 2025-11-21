local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["20"] = 11,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 19,["25"] = 20,["26"] = 21,["28"] = 21,["31"] = 19,["32"] = 24,["33"] = 25,["34"] = 24,["35"] = 34,["36"] = 35,["37"] = 34,["38"] = 41,["39"] = 42,["40"] = 42,["42"] = 43,["43"] = 41,["44"] = 46,["45"] = 47,["46"] = 47,["48"] = 49,["49"] = 46,["50"] = 52,["51"] = 53,["52"] = 54,["53"] = 55,["54"] = 57,["57"] = 58,["60"] = 59,["63"] = 60,["66"] = 62,["67"] = 64,["70"] = 66,["71"] = 67,["72"] = 67,["74"] = 52,["75"] = 70,["76"] = 71,["77"] = 73,["80"] = 74,["83"] = 76,["84"] = 70,["85"] = 79,["86"] = 80,["87"] = 80,["89"] = 81,["90"] = 79,["91"] = 84,["92"] = 85,["93"] = 84,["94"] = 6,["95"] = 6,["96"] = 6,["97"] = 5,["100"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_revenants_brooch_custom_734_counter = __TS__Class()
local modifier_item_revenants_brooch_custom_734_counter = ____exports.modifier_item_revenants_brooch_custom_734_counter
modifier_item_revenants_brooch_custom_734_counter.name = "modifier_item_revenants_brooch_custom_734_counter"
__TS__ClassExtends(modifier_item_revenants_brooch_custom_734_counter, BaseModifier)
function modifier_item_revenants_brooch_custom_734_counter.prototype.IsHidden(self)
    return false
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.IsPurgable(self)
    return false
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.OnCreated(self, params)
    self:SetStackCount(self:GetSpecialValueFor("number_of_attacks"))
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.OnDestroy(self)
    if IsServer() then
        local ____opt_0 = self:GetAbility()
        if ____opt_0 ~= nil then
            ____opt_0:UseResources(false, false, false, true)
        end
    end
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PROJECTILE_NAME, MODIFIER_PROPERTY_OVERRIDE_ATTACK_MAGICAL, MODIFIER_EVENT_ON_ATTACK, MODIFIER_EVENT_ON_ATTACK_RECORD_DESTROY}
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.CheckState(self)
    return {[MODIFIER_STATE_CANNOT_MISS] = true, [MODIFIER_STATE_CANNOT_TARGET_BUILDINGS] = true}
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.GetModifierProjectileName(self)
    if not self:GetAbility() then
        return ""
    end
    return "particles/items_fx/misery_projectile.vpcf"
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.GetOverrideAttackMagical(self)
    if self:GetParent():IsIllusion() then
        return 0
    end
    return self:GetAbility() == nil and 0 or 1
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.OnAttack(self, event)
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
    ability.attack_records[event.record] = true
    if parent:IsIllusion() then
        return
    end
    self:DecrementStackCount()
    if self:GetStackCount() <= 0 then
        self:Destroy()
    end
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.OnAttackRecordDestroy(self, event)
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    if not ability then
        return
    end
    ability.attack_records[event.record] = nil
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.GetEffectName(self)
    if not self:GetAbility() then
        return ""
    end
    return "particles/items5_fx/revenant_brooch.vpcf"
end
function modifier_item_revenants_brooch_custom_734_counter.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_revenants_brooch_custom_734_counter = __TS__Decorate(
    modifier_item_revenants_brooch_custom_734_counter,
    modifier_item_revenants_brooch_custom_734_counter,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_revenants_brooch_custom_734_counter"}
)
____exports.modifier_item_revenants_brooch_custom_734_counter = modifier_item_revenants_brooch_custom_734_counter
return ____exports
