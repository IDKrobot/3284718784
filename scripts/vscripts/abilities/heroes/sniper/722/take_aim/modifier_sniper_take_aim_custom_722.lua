local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 18,["26"] = 20,["27"] = 15,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 3,["34"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_sniper_take_aim_custom_722 = __TS__Class()
local modifier_sniper_take_aim_custom_722 = ____exports.modifier_sniper_take_aim_custom_722
modifier_sniper_take_aim_custom_722.name = "modifier_sniper_take_aim_custom_722"
__TS__ClassExtends(modifier_sniper_take_aim_custom_722, BaseModifier)
function modifier_sniper_take_aim_custom_722.prototype.IsHidden(self)
    return true
end
function modifier_sniper_take_aim_custom_722.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACK_RANGE_BONUS}
end
function modifier_sniper_take_aim_custom_722.prototype.GetModifierAttackRangeBonus(self)
    local base = self:GetSpecialValueFor("bonus_attack_range")
    if self:GetParent():HasModifier("modifier_sniper_take_aim_custom_722_bonus") then
        return base * 2
    end
    return base
end
modifier_sniper_take_aim_custom_722 = __TS__Decorate(
    modifier_sniper_take_aim_custom_722,
    modifier_sniper_take_aim_custom_722,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_take_aim_custom_722"}
)
____exports.modifier_sniper_take_aim_custom_722 = modifier_sniper_take_aim_custom_722
return ____exports
