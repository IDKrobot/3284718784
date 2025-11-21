local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 23,["28"] = 24,["29"] = 23,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 3,["36"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_stasis_trap_custom_725_root = __TS__Class()
local modifier_techies_stasis_trap_custom_725_root = ____exports.modifier_techies_stasis_trap_custom_725_root
modifier_techies_stasis_trap_custom_725_root.name = "modifier_techies_stasis_trap_custom_725_root"
__TS__ClassExtends(modifier_techies_stasis_trap_custom_725_root, BaseModifier)
function modifier_techies_stasis_trap_custom_725_root.prototype.IsHidden(self)
    return false
end
function modifier_techies_stasis_trap_custom_725_root.prototype.IsPurgable(self)
    return true
end
function modifier_techies_stasis_trap_custom_725_root.prototype.IsDebuff(self)
    return true
end
function modifier_techies_stasis_trap_custom_725_root.prototype.CheckState(self)
    return {[MODIFIER_STATE_ROOTED] = true}
end
function modifier_techies_stasis_trap_custom_725_root.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_techies_stasis.vpcf"
end
modifier_techies_stasis_trap_custom_725_root = __TS__Decorate(
    modifier_techies_stasis_trap_custom_725_root,
    modifier_techies_stasis_trap_custom_725_root,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_stasis_trap_custom_725_root"}
)
____exports.modifier_techies_stasis_trap_custom_725_root = modifier_techies_stasis_trap_custom_725_root
return ____exports
