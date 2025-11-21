local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 36,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 16,["30"] = 18,["31"] = 20,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 25,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 26,["49"] = 27,["50"] = 27,["51"] = 27,["52"] = 27,["53"] = 27,["54"] = 27,["55"] = 27,["56"] = 27,["57"] = 27,["58"] = 13,["59"] = 30,["60"] = 31,["61"] = 30,["62"] = 38,["63"] = 39,["64"] = 38,["65"] = 42,["66"] = 43,["67"] = 42,["68"] = 4,["69"] = 4,["70"] = 4,["71"] = 3,["74"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_shield_crash_custom_717_buff = __TS__Class()
local modifier_pangolier_shield_crash_custom_717_buff = ____exports.modifier_pangolier_shield_crash_custom_717_buff
modifier_pangolier_shield_crash_custom_717_buff.name = "modifier_pangolier_shield_crash_custom_717_buff"
__TS__ClassExtends(modifier_pangolier_shield_crash_custom_717_buff, BaseModifier)
function modifier_pangolier_shield_crash_custom_717_buff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierIncomingDamage_Percentage = function() return -self:GetStackCount() end
end
function modifier_pangolier_shield_crash_custom_717_buff.prototype.IsHidden(self)
    return false
end
function modifier_pangolier_shield_crash_custom_717_buff.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_shield_crash_custom_717_buff.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:EmitSound("Hero_Pangolier.TailThump.Shield")
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_tailthump_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        parent,
        PATTACH_ABSORIGIN_FOLLOW,
        nil,
        Vector(0, 0, 0),
        false
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        true,
        false
    )
    ParticleManager:SetParticleControl(
        particle,
        3,
        Vector(
            self:GetStackCount() * 3,
            255,
            255
        )
    )
end
function modifier_pangolier_shield_crash_custom_717_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE}
end
function modifier_pangolier_shield_crash_custom_717_buff.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_pangolier_shield.vpcf"
end
function modifier_pangolier_shield_crash_custom_717_buff.prototype.StatusEffectPriority(self)
    return MODIFIER_PRIORITY_NORMAL
end
modifier_pangolier_shield_crash_custom_717_buff = __TS__Decorate(
    modifier_pangolier_shield_crash_custom_717_buff,
    modifier_pangolier_shield_crash_custom_717_buff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_shield_crash_custom_717_buff"}
)
____exports.modifier_pangolier_shield_crash_custom_717_buff = modifier_pangolier_shield_crash_custom_717_buff
return ____exports
