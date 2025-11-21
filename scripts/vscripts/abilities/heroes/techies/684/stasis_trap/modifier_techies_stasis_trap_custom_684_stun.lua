local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 28,["31"] = 29,["32"] = 28,["33"] = 32,["34"] = 33,["35"] = 32,["36"] = 4,["37"] = 4,["38"] = 4,["39"] = 3,["42"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_stasis_trap_custom_684_stun = __TS__Class()
local modifier_techies_stasis_trap_custom_684_stun = ____exports.modifier_techies_stasis_trap_custom_684_stun
modifier_techies_stasis_trap_custom_684_stun.name = "modifier_techies_stasis_trap_custom_684_stun"
__TS__ClassExtends(modifier_techies_stasis_trap_custom_684_stun, BaseModifier)
function modifier_techies_stasis_trap_custom_684_stun.prototype.IsHidden(self)
    return false
end
function modifier_techies_stasis_trap_custom_684_stun.prototype.IsPurgable(self)
    return true
end
function modifier_techies_stasis_trap_custom_684_stun.prototype.IsDebuff(self)
    return true
end
function modifier_techies_stasis_trap_custom_684_stun.prototype.IsStunDebuff(self)
    return true
end
function modifier_techies_stasis_trap_custom_684_stun.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true, [MODIFIER_STATE_FROZEN] = true}
end
function modifier_techies_stasis_trap_custom_684_stun.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_techies_stasis.vpcf"
end
function modifier_techies_stasis_trap_custom_684_stun.prototype.GetPriority(self)
    return 9999
end
modifier_techies_stasis_trap_custom_684_stun = __TS__Decorate(
    modifier_techies_stasis_trap_custom_684_stun,
    modifier_techies_stasis_trap_custom_684_stun,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_stasis_trap_custom_684_stun"}
)
____exports.modifier_techies_stasis_trap_custom_684_stun = modifier_techies_stasis_trap_custom_684_stun
return ____exports
