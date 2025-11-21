local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 4,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 12,["27"] = 16,["28"] = 17,["29"] = 16,["30"] = 20,["31"] = 21,["32"] = 23,["33"] = 25,["36"] = 27,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 20,["46"] = 35,["47"] = 36,["48"] = 35,["49"] = 41,["50"] = 42,["51"] = 41,["52"] = 47,["53"] = 48,["54"] = 49,["55"] = 51,["58"] = 52,["61"] = 54,["62"] = 54,["63"] = 54,["64"] = 54,["65"] = 54,["66"] = 54,["67"] = 47,["68"] = 64,["69"] = 65,["70"] = 64,["71"] = 68,["72"] = 69,["73"] = 68,["74"] = 5,["75"] = 5,["76"] = 5,["77"] = 4,["80"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_nullifier_custom_721_slow = require("abilities.items.nullifier.721.modifier_item_nullifier_custom_721_slow")
local modifier_item_nullifier_custom_721_slow = ____modifier_item_nullifier_custom_721_slow.modifier_item_nullifier_custom_721_slow
____exports.modifier_item_nullifier_custom_721_mute = __TS__Class()
local modifier_item_nullifier_custom_721_mute = ____exports.modifier_item_nullifier_custom_721_mute
modifier_item_nullifier_custom_721_mute.name = "modifier_item_nullifier_custom_721_mute"
__TS__ClassExtends(modifier_item_nullifier_custom_721_mute, BaseModifier)
function modifier_item_nullifier_custom_721_mute.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slow_duration = 0
end
function modifier_item_nullifier_custom_721_mute.prototype.IsHidden(self)
    return false
end
function modifier_item_nullifier_custom_721_mute.prototype.IsPurgable(self)
    return true
end
function modifier_item_nullifier_custom_721_mute.prototype.IsDebuff(self)
    return true
end
function modifier_item_nullifier_custom_721_mute.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.slow_duration = self:GetSpecialValueFor("slow_duration")
    if not IsServer() then
        return
    end
    local particle = ParticleManager:CreateParticle("particles/items4_fx/nullifier_mute.vpcf", PATTACH_OVERHEAD_FOLLOW, parent)
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_item_nullifier_custom_721_mute.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end
function modifier_item_nullifier_custom_721_mute.prototype.CheckState(self)
    return {[MODIFIER_STATE_MUTED] = true}
end
function modifier_item_nullifier_custom_721_mute.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    if event.target ~= parent then
        return
    end
    modifier_item_nullifier_custom_721_slow:apply(
        parent,
        caster,
        self:GetAbility(),
        {duration = parent:CalculateDuration(caster, self.slow_duration)}
    )
end
function modifier_item_nullifier_custom_721_mute.prototype.GetEffectName(self)
    return "particles/items4_fx/nullifier_mute_debuff.vpcf"
end
function modifier_item_nullifier_custom_721_mute.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_nullifier.vpcf"
end
modifier_item_nullifier_custom_721_mute = __TS__Decorate(
    modifier_item_nullifier_custom_721_mute,
    modifier_item_nullifier_custom_721_mute,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_nullifier_custom_721_mute"}
)
____exports.modifier_item_nullifier_custom_721_mute = modifier_item_nullifier_custom_721_mute
return ____exports
