local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["22"] = 14,["23"] = 15,["26"] = 17,["27"] = 19,["28"] = 19,["29"] = 19,["30"] = 20,["33"] = 21,["36"] = 23,["37"] = 19,["38"] = 19,["39"] = 11,["40"] = 27,["41"] = 28,["42"] = 27,["43"] = 34,["44"] = 35,["45"] = 34,["46"] = 38,["47"] = 39,["48"] = 38,["49"] = 6,["50"] = 6,["51"] = 6,["52"] = 5,["55"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pudge_flesh_heap_custom_722 = __TS__Class()
local modifier_pudge_flesh_heap_custom_722 = ____exports.modifier_pudge_flesh_heap_custom_722
modifier_pudge_flesh_heap_custom_722.name = "modifier_pudge_flesh_heap_custom_722"
__TS__ClassExtends(modifier_pudge_flesh_heap_custom_722, BaseModifier)
function modifier_pudge_flesh_heap_custom_722.prototype.IsHidden(self)
    return false
end
function modifier_pudge_flesh_heap_custom_722.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    local ability = self:GetAbility()
    if not ability then
        return
    end
    local count = ability.kills
    Timers:CreateTimer(
        0.1,
        function()
            if not self or self:IsNull() then
                return
            end
            if not count then
                return
            end
            self:SetStackCount(self:GetStackCount() + count)
        end
    )
end
function modifier_pudge_flesh_heap_custom_722.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_STRENGTH_BONUS, MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT}
end
function modifier_pudge_flesh_heap_custom_722.prototype.GetModifierBonusStats_Strength(self)
    return self:GetSpecialValueFor("flesh_heap_strength_buff_amount") * self:GetStackCount()
end
function modifier_pudge_flesh_heap_custom_722.prototype.GetModifierConstantHealthRegen(self)
    return self:GetSpecialValueFor("flesh_heap_health_regeneration")
end
modifier_pudge_flesh_heap_custom_722 = __TS__Decorate(
    modifier_pudge_flesh_heap_custom_722,
    modifier_pudge_flesh_heap_custom_722,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pudge_flesh_heap_custom_722"}
)
____exports.modifier_pudge_flesh_heap_custom_722 = modifier_pudge_flesh_heap_custom_722
return ____exports
