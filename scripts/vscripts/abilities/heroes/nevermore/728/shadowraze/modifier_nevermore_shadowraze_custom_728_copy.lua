local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 19,["31"] = 23,["32"] = 24,["33"] = 26,["34"] = 23,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 33,["39"] = 34,["40"] = 33,["41"] = 39,["42"] = 40,["43"] = 39,["44"] = 43,["45"] = 44,["46"] = 43,["47"] = 47,["48"] = 48,["49"] = 47,["50"] = 4,["51"] = 4,["52"] = 4,["53"] = 3,["56"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_nevermore_shadowraze_custom_728_copy = __TS__Class()
local modifier_nevermore_shadowraze_custom_728_copy = ____exports.modifier_nevermore_shadowraze_custom_728_copy
modifier_nevermore_shadowraze_custom_728_copy.name = "modifier_nevermore_shadowraze_custom_728_copy"
__TS__ClassExtends(modifier_nevermore_shadowraze_custom_728_copy, BaseModifier)
function modifier_nevermore_shadowraze_custom_728_copy.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.stack_damage = 0
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.IsHidden(self)
    return false
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.IsDebuff(self)
    return true
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.IsStunDebuff(self)
    return false
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.IsPurgable(self)
    return true
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.OnCreated(self, params)
    self:SetStackCount(1)
    self.stack_damage = self:GetAbility():GetSpecialValueFor("stack_bonus_damage")
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.OnRefresh(self, params)
    self.stack_damage = self:GetAbility():GetSpecialValueFor("stack_bonus_damage")
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_TOOLTIP}
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.OnTooltip(self)
    return self.stack_damage * self:GetStackCount()
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_nevermore/nevermore_shadowraze_debuff.vpcf"
end
function modifier_nevermore_shadowraze_custom_728_copy.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_nevermore_shadowraze_custom_728_copy = __TS__Decorate(
    modifier_nevermore_shadowraze_custom_728_copy,
    modifier_nevermore_shadowraze_custom_728_copy,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_nevermore_shadowraze_custom_728_copy"}
)
____exports.modifier_nevermore_shadowraze_custom_728_copy = modifier_nevermore_shadowraze_custom_728_copy
return ____exports
