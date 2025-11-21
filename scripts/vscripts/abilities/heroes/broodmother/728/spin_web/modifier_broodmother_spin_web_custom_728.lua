local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 31,["18"] = 32,["19"] = 33,["20"] = 3,["21"] = 5,["22"] = 6,["23"] = 5,["24"] = 9,["25"] = 10,["26"] = 9,["27"] = 13,["28"] = 14,["29"] = 13,["30"] = 17,["31"] = 18,["32"] = 17,["33"] = 25,["34"] = 26,["35"] = 25,["36"] = 4,["37"] = 4,["38"] = 4,["39"] = 3,["42"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_spin_web_custom_728 = __TS__Class()
local modifier_broodmother_spin_web_custom_728 = ____exports.modifier_broodmother_spin_web_custom_728
modifier_broodmother_spin_web_custom_728.name = "modifier_broodmother_spin_web_custom_728"
__TS__ClassExtends(modifier_broodmother_spin_web_custom_728, BaseModifier)
function modifier_broodmother_spin_web_custom_728.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierConstantHealthRegen = function() return self:GetSpecialValueFor("heath_regen") end
    self.GetModifierMoveSpeedBonus_Percentage = function() return self:GetSpecialValueFor("bonus_movespeed") end
    self.GetModifierIgnoreMovespeedLimit = function() return self:GetCaster():HasScepter() and 1 or 0 end
end
function modifier_broodmother_spin_web_custom_728.prototype.IsHidden(self)
    return false
end
function modifier_broodmother_spin_web_custom_728.prototype.IsDebuff(self)
    return false
end
function modifier_broodmother_spin_web_custom_728.prototype.IsPurgable(self)
    return false
end
function modifier_broodmother_spin_web_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT, MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT}
end
function modifier_broodmother_spin_web_custom_728.prototype.CheckState(self)
    return {[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true}
end
modifier_broodmother_spin_web_custom_728 = __TS__Decorate(
    modifier_broodmother_spin_web_custom_728,
    modifier_broodmother_spin_web_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_spin_web_custom_728"}
)
____exports.modifier_broodmother_spin_web_custom_728 = modifier_broodmother_spin_web_custom_728
return ____exports
