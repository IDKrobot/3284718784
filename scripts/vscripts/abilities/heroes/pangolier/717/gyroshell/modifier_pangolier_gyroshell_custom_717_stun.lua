local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 33,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 17,["31"] = 21,["32"] = 22,["33"] = 21,["34"] = 27,["35"] = 28,["36"] = 27,["37"] = 35,["38"] = 36,["39"] = 35,["40"] = 39,["41"] = 40,["42"] = 39,["43"] = 4,["44"] = 4,["45"] = 4,["46"] = 3,["49"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_gyroshell_custom_717_stun = __TS__Class()
local modifier_pangolier_gyroshell_custom_717_stun = ____exports.modifier_pangolier_gyroshell_custom_717_stun
modifier_pangolier_gyroshell_custom_717_stun.name = "modifier_pangolier_gyroshell_custom_717_stun"
__TS__ClassExtends(modifier_pangolier_gyroshell_custom_717_stun, BaseModifier)
function modifier_pangolier_gyroshell_custom_717_stun.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetOverrideAnimation = function() return ACT_DOTA_DISABLED end
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.IsHidden(self)
    return false
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.IsDebuff(self)
    return true
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.IsStunDebuff(self)
    return true
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.GetEffectName(self)
    return "particles/generic_gameplay/generic_stunned.vpcf"
end
function modifier_pangolier_gyroshell_custom_717_stun.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_pangolier_gyroshell_custom_717_stun = __TS__Decorate(
    modifier_pangolier_gyroshell_custom_717_stun,
    modifier_pangolier_gyroshell_custom_717_stun,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_gyroshell_custom_717_stun"}
)
____exports.modifier_pangolier_gyroshell_custom_717_stun = modifier_pangolier_gyroshell_custom_717_stun
return ____exports
