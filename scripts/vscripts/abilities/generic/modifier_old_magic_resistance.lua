local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 29,["34"] = 30,["35"] = 29,["36"] = 35,["37"] = 36,["38"] = 38,["39"] = 35,["40"] = 4,["41"] = 4,["42"] = 4,["43"] = 3,["46"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_old_magic_resistance = __TS__Class()
local modifier_old_magic_resistance = ____exports.modifier_old_magic_resistance
modifier_old_magic_resistance.name = "modifier_old_magic_resistance"
__TS__ClassExtends(modifier_old_magic_resistance, BaseModifier)
function modifier_old_magic_resistance.prototype.IsHidden(self)
    return true
end
function modifier_old_magic_resistance.prototype.IsPurgable(self)
    return false
end
function modifier_old_magic_resistance.prototype.IsPurgeException(self)
    return false
end
function modifier_old_magic_resistance.prototype.RemoveOnDeath(self)
    return false
end
function modifier_old_magic_resistance.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_PERMANENT
end
function modifier_old_magic_resistance.prototype.StackOnIllusion(self)
    return true
end
function modifier_old_magic_resistance.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS}
end
function modifier_old_magic_resistance.prototype.GetModifierMagicalResistanceBonus(self, event)
    local parent = self:GetParent()
    return -(parent:GetIntellect(false) * 0.1)
end
modifier_old_magic_resistance = __TS__Decorate(
    modifier_old_magic_resistance,
    modifier_old_magic_resistance,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_old_magic_resistance"}
)
____exports.modifier_old_magic_resistance = modifier_old_magic_resistance
return ____exports
