local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 29,["34"] = 30,["35"] = 29,["36"] = 35,["37"] = 36,["38"] = 37,["39"] = 37,["41"] = 39,["42"] = 40,["44"] = 43,["45"] = 35,["46"] = 4,["47"] = 4,["48"] = 4,["49"] = 3,["52"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_turbo_mode_values = __TS__Class()
local modifier_turbo_mode_values = ____exports.modifier_turbo_mode_values
modifier_turbo_mode_values.name = "modifier_turbo_mode_values"
__TS__ClassExtends(modifier_turbo_mode_values, BaseModifier)
function modifier_turbo_mode_values.prototype.IsHidden(self)
    return true
end
function modifier_turbo_mode_values.prototype.IsPurgable(self)
    return false
end
function modifier_turbo_mode_values.prototype.IsPurgeException(self)
    return false
end
function modifier_turbo_mode_values.prototype.IsDebuff(self)
    return false
end
function modifier_turbo_mode_values.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_PERMANENT
end
function modifier_turbo_mode_values.prototype.StackOnIllusion(self)
    return true
end
function modifier_turbo_mode_values.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE}
end
function modifier_turbo_mode_values.prototype.GetModifierPercentageCooldown(self, event)
    local ability = event.ability
    if not ability then
        return 0
    end
    if ability:GetName() == "item_tpscroll" then
        return 50
    end
    return 0
end
modifier_turbo_mode_values = __TS__Decorate(
    modifier_turbo_mode_values,
    modifier_turbo_mode_values,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_turbo_mode_values"}
)
____exports.modifier_turbo_mode_values = modifier_turbo_mode_values
return ____exports
