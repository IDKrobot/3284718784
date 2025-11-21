local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 19,["31"] = 25,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 25,["37"] = 29,["38"] = 30,["39"] = 29,["40"] = 33,["41"] = 34,["42"] = 33,["43"] = 4,["44"] = 4,["45"] = 4,["46"] = 3,["49"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_huskar_inner_vitality_custom_717 = __TS__Class()
local modifier_huskar_inner_vitality_custom_717 = ____exports.modifier_huskar_inner_vitality_custom_717
modifier_huskar_inner_vitality_custom_717.name = "modifier_huskar_inner_vitality_custom_717"
__TS__ClassExtends(modifier_huskar_inner_vitality_custom_717, BaseModifier)
function modifier_huskar_inner_vitality_custom_717.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.health_regen = 0
end
function modifier_huskar_inner_vitality_custom_717.prototype.IsHidden(self)
    return false
end
function modifier_huskar_inner_vitality_custom_717.prototype.IsPurgable(self)
    return true
end
function modifier_huskar_inner_vitality_custom_717.prototype.IsDebuff(self)
    return false
end
function modifier_huskar_inner_vitality_custom_717.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT}
end
function modifier_huskar_inner_vitality_custom_717.prototype.GetModifierConstantHealthRegen(self)
    return self:GetParent():GetModifierStackCount(
        "modifier_huskar_inner_vitality_custom_717_handler",
        self:GetCaster()
    )
end
function modifier_huskar_inner_vitality_custom_717.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_huskar/huskar_inner_vitality.vpcf"
end
function modifier_huskar_inner_vitality_custom_717.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_huskar_inner_vitality_custom_717 = __TS__Decorate(
    modifier_huskar_inner_vitality_custom_717,
    modifier_huskar_inner_vitality_custom_717,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_huskar_inner_vitality_custom_717"}
)
____exports.modifier_huskar_inner_vitality_custom_717 = modifier_huskar_inner_vitality_custom_717
return ____exports
