local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 9,["21"] = 80,["22"] = 3,["23"] = 13,["24"] = 14,["25"] = 13,["26"] = 17,["27"] = 18,["28"] = 17,["29"] = 21,["30"] = 22,["31"] = 21,["32"] = 25,["33"] = 26,["34"] = 25,["35"] = 29,["36"] = 30,["37"] = 31,["38"] = 33,["39"] = 35,["40"] = 37,["43"] = 39,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 50,["53"] = 51,["54"] = 29,["55"] = 54,["56"] = 55,["57"] = 57,["58"] = 59,["59"] = 54,["60"] = 62,["61"] = 63,["62"] = 62,["63"] = 68,["64"] = 69,["65"] = 68,["66"] = 72,["67"] = 73,["68"] = 72,["69"] = 82,["70"] = 83,["71"] = 85,["74"] = 86,["77"] = 87,["80"] = 89,["81"] = 89,["82"] = 89,["83"] = 89,["84"] = 89,["85"] = 89,["86"] = 89,["87"] = 90,["88"] = 92,["89"] = 82,["90"] = 95,["91"] = 96,["92"] = 95,["93"] = 99,["94"] = 100,["95"] = 99,["96"] = 103,["97"] = 104,["98"] = 103,["99"] = 107,["100"] = 108,["101"] = 107,["102"] = 4,["103"] = 4,["104"] = 4,["105"] = 3,["108"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_dazzle_poison_touch_custom_734_slow = __TS__Class()
local modifier_dazzle_poison_touch_custom_734_slow = ____exports.modifier_dazzle_poison_touch_custom_734_slow
modifier_dazzle_poison_touch_custom_734_slow.name = "modifier_dazzle_poison_touch_custom_734_slow"
__TS__ClassExtends(modifier_dazzle_poison_touch_custom_734_slow, BaseModifier)
function modifier_dazzle_poison_touch_custom_734_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slow = 0
    self.bonus_slow = 0
    self.damage = 0
    self.duration = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.slow end
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.IsHidden(self)
    return false
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.IsPurgable(self)
    return true
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.IsDebuff(self)
    return true
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.OnCreated(self, params)
    self.slow = self:GetSpecialValueFor("slow")
    self.bonus_slow = self:GetSpecialValueFor("bonus_slow")
    self.duration = self:GetDuration()
    self.damage = self:GetSpecialValueFor("damage")
    if not IsServer() then
        return
    end
    self:SetHasCustomTransmitterData(true)
    self.damageTable = {
        attacker = self:GetCaster(),
        damage = self.damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        victim = self:GetParent(),
        ability = self:GetAbility(),
        damage_flags = DOTA_DAMAGE_FLAG_BYPASSES_BLOCK
    }
    self:OnIntervalThink()
    self:StartIntervalThink(1)
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    ApplyDamage(self.damageTable)
    parent:EmitSound("Hero_Dazzle.Poison_Tick")
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.AddCustomTransmitterData(self)
    return {slow = self.slow}
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.HandleCustomTransmitterData(self, data)
    self.slow = data.slow
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_EVENT_ON_ATTACK_LANDED}
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    if event.target ~= parent then
        return
    end
    if event.attacker ~= self:GetCaster() then
        return
    end
    self:SetDuration(
        parent:CalculateDuration(
            self:GetCaster(),
            self.duration
        ),
        true
    )
    self.slow = self.slow + self.bonus_slow
    self:SendBuffRefreshToClients()
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_dazzle/dazzle_poison_debuff.vpcf"
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_poison_dazzle.vpcf"
end
function modifier_dazzle_poison_touch_custom_734_slow.prototype.StatusEffectPriority(self)
    return MODIFIER_PRIORITY_HIGH
end
modifier_dazzle_poison_touch_custom_734_slow = __TS__Decorate(
    modifier_dazzle_poison_touch_custom_734_slow,
    modifier_dazzle_poison_touch_custom_734_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_dazzle_poison_touch_custom_734_slow"}
)
____exports.modifier_dazzle_poison_touch_custom_734_slow = modifier_dazzle_poison_touch_custom_734_slow
return ____exports
