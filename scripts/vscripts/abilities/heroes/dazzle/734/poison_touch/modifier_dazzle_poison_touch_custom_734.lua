local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 17,["26"] = 19,["27"] = 20,["28"] = 21,["29"] = 22,["32"] = 25,["33"] = 15,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 3,["40"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_dazzle_poison_touch_custom_734 = __TS__Class()
local modifier_dazzle_poison_touch_custom_734 = ____exports.modifier_dazzle_poison_touch_custom_734
modifier_dazzle_poison_touch_custom_734.name = "modifier_dazzle_poison_touch_custom_734"
__TS__ClassExtends(modifier_dazzle_poison_touch_custom_734, BaseModifier)
function modifier_dazzle_poison_touch_custom_734.prototype.IsHidden(self)
    return true
end
function modifier_dazzle_poison_touch_custom_734.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACK_RANGE_BONUS}
end
function modifier_dazzle_poison_touch_custom_734.prototype.GetModifierAttackRangeBonus(self)
    local bonus = self:GetSpecialValueFor("attack_range_bonus")
    if bonus == 0 then
        return 0
    end
    if IsServer() then
        local target = self:GetParent():GetAggroTarget()
        if target and target:HasModifier("modifier_dazzle_poison_touch_custom_734_slow") then
            return bonus
        end
    end
    return 0
end
modifier_dazzle_poison_touch_custom_734 = __TS__Decorate(
    modifier_dazzle_poison_touch_custom_734,
    modifier_dazzle_poison_touch_custom_734,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_dazzle_poison_touch_custom_734"}
)
____exports.modifier_dazzle_poison_touch_custom_734 = modifier_dazzle_poison_touch_custom_734
return ____exports
