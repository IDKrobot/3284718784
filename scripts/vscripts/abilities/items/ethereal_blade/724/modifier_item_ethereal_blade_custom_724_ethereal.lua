local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 18,["28"] = 20,["31"] = 22,["32"] = 27,["33"] = 27,["34"] = 27,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 15,["50"] = 31,["51"] = 32,["52"] = 31,["53"] = 38,["54"] = 39,["55"] = 38,["56"] = 42,["57"] = 43,["58"] = 42,["59"] = 46,["60"] = 47,["61"] = 46,["62"] = 53,["63"] = 54,["64"] = 53,["65"] = 57,["66"] = 58,["67"] = 57,["68"] = 61,["69"] = 62,["70"] = 61,["71"] = 65,["72"] = 66,["73"] = 65,["74"] = 4,["75"] = 4,["76"] = 4,["77"] = 3,["80"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_ethereal_blade_custom_724_ethereal = __TS__Class()
local modifier_item_ethereal_blade_custom_724_ethereal = ____exports.modifier_item_ethereal_blade_custom_724_ethereal
modifier_item_ethereal_blade_custom_724_ethereal.name = "modifier_item_ethereal_blade_custom_724_ethereal"
__TS__ClassExtends(modifier_item_ethereal_blade_custom_724_ethereal, BaseModifier)
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonus_damage = 0
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.IsHidden(self)
    return false
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.IsPurgable(self)
    return true
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.bonus_damage = self:GetSpecialValueFor("ethereal_damage_bonus")
    if not IsServer() then
        return
    end
    local particle = ParticleManager:CreateParticle("particles/items_fx/ethereal_blade_explosion.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    self:AddParticle(
        particle,
        false,
        false,
        0,
        true,
        false
    )
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DECREPIFY_UNIQUE, MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PHYSICAL}
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.GetModifierMagicalResistanceDecrepifyUnique(self, event)
    return self.bonus_damage
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.GetAbsoluteNoDamagePhysical(self, event)
    return 1
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.CheckState(self)
    return {[MODIFIER_STATE_ATTACK_IMMUNE] = true, [MODIFIER_STATE_DISARMED] = true}
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_ghost.vpcf"
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.StatusEffectPriority(self)
    return 10
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.GetEffectName(self)
    return "particles/items_fx/ghost.vpcf"
end
function modifier_item_ethereal_blade_custom_724_ethereal.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_ethereal_blade_custom_724_ethereal = __TS__Decorate(
    modifier_item_ethereal_blade_custom_724_ethereal,
    modifier_item_ethereal_blade_custom_724_ethereal,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_ethereal_blade_custom_724_ethereal"}
)
____exports.modifier_item_ethereal_blade_custom_724_ethereal = modifier_item_ethereal_blade_custom_724_ethereal
return ____exports
