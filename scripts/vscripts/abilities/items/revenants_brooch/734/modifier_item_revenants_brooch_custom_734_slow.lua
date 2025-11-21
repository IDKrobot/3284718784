local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 65,["19"] = 3,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 22,["32"] = 23,["34"] = 19,["35"] = 26,["36"] = 27,["37"] = 26,["38"] = 30,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 35,["43"] = 36,["46"] = 40,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 41,["54"] = 48,["55"] = 50,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 50,["60"] = 50,["61"] = 50,["62"] = 30,["63"] = 59,["64"] = 60,["65"] = 59,["66"] = 67,["67"] = 68,["68"] = 67,["69"] = 71,["70"] = 72,["71"] = 71,["72"] = 4,["73"] = 4,["74"] = 4,["75"] = 3,["78"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_revenants_brooch_custom_734_slow = __TS__Class()
local modifier_item_revenants_brooch_custom_734_slow = ____exports.modifier_item_revenants_brooch_custom_734_slow
modifier_item_revenants_brooch_custom_734_slow.name = "modifier_item_revenants_brooch_custom_734_slow"
__TS__ClassExtends(modifier_item_revenants_brooch_custom_734_slow, BaseModifier)
function modifier_item_revenants_brooch_custom_734_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.move_speed = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.move_speed end
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.IsHidden(self)
    return false
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.IsPurgable(self)
    return true
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.IsDebuff(self)
    return true
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.OnCreated(self, params)
    self.move_speed = -self:GetSpecialValueFor("slow")
    if IsServer() then
        self:StartIntervalThink(1)
    end
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.OnRefresh(self, params)
    self.move_speed = -self:GetSpecialValueFor("slow")
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    if not ability then
        self:Destroy()
        return
    end
    local damage = caster:GetIntellect(false) * ability:GetSpecialValueFor("int_damage_multiplier")
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = parent,
        ability = ability
    }
    ApplyDamage(damageTable)
    SendOverheadEventMessage(
        nil,
        OVERHEAD_ALERT_BONUS_POISON_DAMAGE,
        parent,
        damage,
        nil
    )
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.GetEffectName(self)
    return "particles/items3_fx/witch_blade_debuff.vpcf"
end
function modifier_item_revenants_brooch_custom_734_slow.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_revenants_brooch_custom_734_slow = __TS__Decorate(
    modifier_item_revenants_brooch_custom_734_slow,
    modifier_item_revenants_brooch_custom_734_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_revenants_brooch_custom_734_slow"}
)
____exports.modifier_item_revenants_brooch_custom_734_slow = modifier_item_revenants_brooch_custom_734_slow
return ____exports
