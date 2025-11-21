local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 6,["18"] = 8,["19"] = 3,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 14,["24"] = 15,["25"] = 14,["26"] = 18,["27"] = 19,["28"] = 18,["29"] = 22,["30"] = 23,["31"] = 25,["32"] = 22,["33"] = 28,["34"] = 29,["35"] = 31,["36"] = 33,["39"] = 34,["42"] = 35,["45"] = 37,["46"] = 37,["47"] = 37,["48"] = 37,["49"] = 37,["50"] = 37,["51"] = 37,["52"] = 44,["53"] = 46,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 51,["59"] = 28,["60"] = 54,["61"] = 55,["62"] = 54,["63"] = 61,["64"] = 62,["65"] = 61,["66"] = 68,["67"] = 69,["68"] = 71,["71"] = 72,["74"] = 73,["77"] = 75,["78"] = 68,["79"] = 78,["80"] = 79,["81"] = 79,["83"] = 81,["84"] = 78,["85"] = 84,["86"] = 85,["87"] = 84,["88"] = 88,["89"] = 89,["90"] = 88,["91"] = 4,["92"] = 4,["93"] = 4,["94"] = 3,["97"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bloodthorn_custom_730_debuff = __TS__Class()
local modifier_item_bloodthorn_custom_730_debuff = ____exports.modifier_item_bloodthorn_custom_730_debuff
modifier_item_bloodthorn_custom_730_debuff.name = "modifier_item_bloodthorn_custom_730_debuff"
__TS__ClassExtends(modifier_item_bloodthorn_custom_730_debuff, BaseModifier)
function modifier_item_bloodthorn_custom_730_debuff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.crit_damage = 0
    self.damage = 0
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.IsHidden(self)
    return false
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.OnCreated(self, params)
    self.ability = self:GetAbility()
    self.crit_damage = self.ability:GetSpecialValueFor("crit_damage")
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.OnDestroy(self)
    local parent = self:GetParent()
    local damage_pct = self.ability:GetSpecialValueFor("silence_damage_percent")
    if not IsServer() then
        return
    end
    if self.damage == 0 then
        return
    end
    if self:GetRemainingTime() > 0.2 then
        return
    end
    local damageTable = {
        attacker = self.ability:GetCaster(),
        victim = parent,
        damage = self.damage * damage_pct / 100,
        damage_type = DAMAGE_TYPE_MAGICAL,
        ability = self.ability
    }
    ApplyDamage(damageTable)
    local particle = ParticleManager:CreateParticle("particles/items2_fx/orchid_pop.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(self.damage)
    )
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_TAKEDAMAGE, MODIFIER_PROPERTY_PREATTACK_TARGET_CRITICALSTRIKE}
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.CheckState(self)
    return {[MODIFIER_STATE_SILENCED] = true, [MODIFIER_STATE_EVADE_DISABLED] = true}
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.OnTakeDamage(self, event)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    if event.unit ~= parent then
        return
    end
    if bit.band(event.damage_flags, DOTA_DAMAGE_FLAG_HPLOSS) == DOTA_DAMAGE_FLAG_HPLOSS then
        return
    end
    self.damage = self.damage + event.damage
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.GetModifierPreAttack_Target_CriticalStrike(self)
    if not IsServer() then
        return 0
    end
    return self.crit_damage
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.GetEffectName(self)
    return "particles/items2_fx/orchid.vpcf"
end
function modifier_item_bloodthorn_custom_730_debuff.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_item_bloodthorn_custom_730_debuff = __TS__Decorate(
    modifier_item_bloodthorn_custom_730_debuff,
    modifier_item_bloodthorn_custom_730_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodthorn_custom_730_debuff"}
)
____exports.modifier_item_bloodthorn_custom_730_debuff = modifier_item_bloodthorn_custom_730_debuff
return ____exports
