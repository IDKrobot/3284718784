local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 3,["21"] = 9,["22"] = 10,["23"] = 9,["24"] = 13,["25"] = 14,["26"] = 13,["27"] = 17,["28"] = 18,["29"] = 17,["30"] = 21,["31"] = 22,["32"] = 24,["33"] = 25,["34"] = 26,["35"] = 28,["38"] = 30,["39"] = 31,["40"] = 21,["41"] = 34,["42"] = 35,["43"] = 36,["44"] = 37,["45"] = 39,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 39,["50"] = 39,["51"] = 39,["52"] = 46,["53"] = 34,["54"] = 49,["55"] = 50,["56"] = 49,["57"] = 56,["58"] = 57,["59"] = 56,["60"] = 60,["61"] = 61,["62"] = 60,["63"] = 64,["64"] = 65,["65"] = 64,["66"] = 68,["67"] = 69,["68"] = 68,["69"] = 72,["70"] = 73,["71"] = 72,["72"] = 4,["73"] = 4,["74"] = 4,["75"] = 3,["78"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_overwhelming_blink_custom_debuff = __TS__Class()
local modifier_item_overwhelming_blink_custom_debuff = ____exports.modifier_item_overwhelming_blink_custom_debuff
modifier_item_overwhelming_blink_custom_debuff.name = "modifier_item_overwhelming_blink_custom_debuff"
__TS__ClassExtends(modifier_item_overwhelming_blink_custom_debuff, BaseModifier)
function modifier_item_overwhelming_blink_custom_debuff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.movespeed = 0
    self.attackSpeed = 0
    self.damage = 0
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.IsHidden(self)
    return false
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    self.movespeed = self:GetSpecialValueFor("movement_slow")
    self.attackSpeed = self:GetSpecialValueFor("attack_slow")
    self.damage = caster:GetStrength() * self:GetSpecialValueFor("damage_pct_over_time") / 100 / self:GetDuration()
    if IsClient() then
        return
    end
    self:OnIntervalThink()
    self:StartIntervalThink(1)
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.OnIntervalThink(self)
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    local parent = self:GetParent()
    local damageTable = {
        attacker = caster,
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = parent,
        ability = ability
    }
    ApplyDamage(damageTable)
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return -self.movespeed
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.GetModifierAttackSpeedBonus_Constant(self)
    return -self.attackSpeed
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_brewmaster_thunder_clap.vpcf"
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_brewmaster/brewmaster_thunder_clap_debuff.vpcf"
end
function modifier_item_overwhelming_blink_custom_debuff.prototype.StatusEffectPriority(self)
    return MODIFIER_PRIORITY_HIGH
end
modifier_item_overwhelming_blink_custom_debuff = __TS__Decorate(
    modifier_item_overwhelming_blink_custom_debuff,
    modifier_item_overwhelming_blink_custom_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_overwhelming_blink_custom_debuff"}
)
____exports.modifier_item_overwhelming_blink_custom_debuff = modifier_item_overwhelming_blink_custom_debuff
return ____exports
