local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 23,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 23,["33"] = 27,["34"] = 28,["35"] = 27,["36"] = 31,["37"] = 32,["38"] = 31,["39"] = 35,["40"] = 36,["41"] = 35,["42"] = 4,["43"] = 4,["44"] = 4,["45"] = 3,["48"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_invoker_deafening_blast_custom_732_disarm = __TS__Class()
local modifier_invoker_deafening_blast_custom_732_disarm = ____exports.modifier_invoker_deafening_blast_custom_732_disarm
modifier_invoker_deafening_blast_custom_732_disarm.name = "modifier_invoker_deafening_blast_custom_732_disarm"
__TS__ClassExtends(modifier_invoker_deafening_blast_custom_732_disarm, BaseModifier)
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.IsHidden(self)
    return false
end
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.CheckState(self)
    return {[MODIFIER_STATE_DISARMED] = true}
end
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.GetEffectName(self)
    return ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_invoker/invoker_deafening_blast_disarm_debuff.vpcf",
        self:GetCaster()
    )
end
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_iceblast.vpcf"
end
function modifier_invoker_deafening_blast_custom_732_disarm.prototype.StatusEffectPriority(self)
    return 10
end
modifier_invoker_deafening_blast_custom_732_disarm = __TS__Decorate(
    modifier_invoker_deafening_blast_custom_732_disarm,
    modifier_invoker_deafening_blast_custom_732_disarm,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_deafening_blast_custom_732_disarm"}
)
____exports.modifier_invoker_deafening_blast_custom_732_disarm = modifier_invoker_deafening_blast_custom_732_disarm
return ____exports
