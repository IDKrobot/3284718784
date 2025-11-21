local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 7,["18"] = 3,["19"] = 9,["20"] = 10,["21"] = 9,["22"] = 13,["23"] = 14,["24"] = 13,["25"] = 17,["26"] = 18,["27"] = 17,["28"] = 21,["29"] = 22,["30"] = 21,["31"] = 25,["32"] = 26,["33"] = 28,["34"] = 30,["37"] = 31,["40"] = 32,["43"] = 34,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 34,["50"] = 41,["51"] = 43,["52"] = 48,["53"] = 48,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 25,["58"] = 51,["59"] = 52,["60"] = 51,["61"] = 57,["62"] = 58,["63"] = 57,["64"] = 64,["65"] = 65,["66"] = 67,["69"] = 68,["72"] = 69,["75"] = 71,["76"] = 64,["77"] = 74,["78"] = 75,["79"] = 74,["80"] = 78,["81"] = 79,["82"] = 78,["83"] = 4,["84"] = 4,["85"] = 4,["86"] = 3,["89"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bloodthorn_custom_733_debuff = __TS__Class()
local modifier_item_bloodthorn_custom_733_debuff = ____exports.modifier_item_bloodthorn_custom_733_debuff
modifier_item_bloodthorn_custom_733_debuff.name = "modifier_item_bloodthorn_custom_733_debuff"
__TS__ClassExtends(modifier_item_bloodthorn_custom_733_debuff, BaseModifier)
function modifier_item_bloodthorn_custom_733_debuff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.damage = 0
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.IsHidden(self)
    return false
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.OnCreated(self, params)
    self.ability = self:GetAbility()
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.OnDestroy(self)
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
function modifier_item_bloodthorn_custom_733_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.CheckState(self)
    return {[MODIFIER_STATE_SILENCED] = true, [MODIFIER_STATE_EVADE_DISABLED] = true}
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.OnTakeDamage(self, event)
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
function modifier_item_bloodthorn_custom_733_debuff.prototype.GetEffectName(self)
    return "particles/items2_fx/orchid.vpcf"
end
function modifier_item_bloodthorn_custom_733_debuff.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_item_bloodthorn_custom_733_debuff = __TS__Decorate(
    modifier_item_bloodthorn_custom_733_debuff,
    modifier_item_bloodthorn_custom_733_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodthorn_custom_733_debuff"}
)
____exports.modifier_item_bloodthorn_custom_733_debuff = modifier_item_bloodthorn_custom_733_debuff
return ____exports
