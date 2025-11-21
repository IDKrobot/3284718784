local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 16,["22"] = 17,["23"] = 18,["24"] = 19,["27"] = 22,["28"] = 16,["29"] = 25,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 30,["34"] = 31,["36"] = 32,["37"] = 33,["39"] = 33,["41"] = 34,["43"] = 34,["45"] = 35,["47"] = 35,["49"] = 36,["51"] = 36,["58"] = 42,["59"] = 25,["60"] = 4,["61"] = 4,["62"] = 4,["63"] = 3,["66"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_morphling_waveform_custom_729_tracker = __TS__Class()
local modifier_morphling_waveform_custom_729_tracker = ____exports.modifier_morphling_waveform_custom_729_tracker
modifier_morphling_waveform_custom_729_tracker.name = "modifier_morphling_waveform_custom_729_tracker"
__TS__ClassExtends(modifier_morphling_waveform_custom_729_tracker, BaseModifier)
function modifier_morphling_waveform_custom_729_tracker.prototype.IsHidden(self)
    return true
end
function modifier_morphling_waveform_custom_729_tracker.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL, MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL_VALUE}
end
function modifier_morphling_waveform_custom_729_tracker.prototype.GetModifierOverrideAbilitySpecial(self, event)
    if event.ability == self:GetAbility() then
        if event.ability_special_value == "AbilityChargeRestoreTime" then
            return 1
        end
    end
    return 0
end
function modifier_morphling_waveform_custom_729_tracker.prototype.GetModifierOverrideAbilitySpecialValue(self, event)
    local ability = event.ability
    local value = event.ability_special_value
    local level = event.ability_special_level
    local talent = ability:GetCaster():FindAbilityByName("special_bonus_unique_morphling_729_custom_4")
    if talent and talent:GetLevel() > 0 then
        repeat
            local ____switch9 = ability:GetLevel()
            local ____cond9 = ____switch9 == 1
            if ____cond9 then
                return 20
            end
            ____cond9 = ____cond9 or ____switch9 == 2
            if ____cond9 then
                return 17
            end
            ____cond9 = ____cond9 or ____switch9 == 3
            if ____cond9 then
                return 14
            end
            ____cond9 = ____cond9 or ____switch9 == 4
            if ____cond9 then
                return 11
            end
            do
                break
            end
        until true
    end
    return ability:GetLevelSpecialValueNoOverride(value, level)
end
modifier_morphling_waveform_custom_729_tracker = __TS__Decorate(
    modifier_morphling_waveform_custom_729_tracker,
    modifier_morphling_waveform_custom_729_tracker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_morphling_waveform_custom_729_tracker"}
)
____exports.modifier_morphling_waveform_custom_729_tracker = modifier_morphling_waveform_custom_729_tracker
return ____exports
