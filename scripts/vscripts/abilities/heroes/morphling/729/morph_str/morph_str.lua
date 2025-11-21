local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 7,["23"] = 12,["24"] = 13,["25"] = 15,["26"] = 16,["27"] = 17,["30"] = 20,["31"] = 12,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 27,["36"] = 28,["37"] = 27,["38"] = 31,["39"] = 32,["40"] = 31,["41"] = 35,["42"] = 36,["43"] = 37,["44"] = 39,["45"] = 40,["46"] = 47,["47"] = 48,["48"] = 49,["49"] = 51,["50"] = 52,["51"] = 53,["55"] = 56,["56"] = 57,["57"] = 58,["60"] = 35,["61"] = 6,["62"] = 6,["63"] = 6,["64"] = 5,["67"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_morphling_morph_str_custom_729 = require("abilities.heroes.morphling.729.morph_str.modifier_morphling_morph_str_custom_729")
local modifier_morphling_morph_str_custom_729 = ____modifier_morphling_morph_str_custom_729.modifier_morphling_morph_str_custom_729
local ____modifier_morphling_morph_str_custom_729_morph = require("abilities.heroes.morphling.729.morph_str.modifier_morphling_morph_str_custom_729_morph")
local modifier_morphling_morph_str_custom_729_morph = ____modifier_morphling_morph_str_custom_729_morph.modifier_morphling_morph_str_custom_729_morph
____exports.morphling_morph_str_custom_729 = __TS__Class()
local morphling_morph_str_custom_729 = ____exports.morphling_morph_str_custom_729
morphling_morph_str_custom_729.name = "morphling_morph_str_custom_729"
__TS__ClassExtends(morphling_morph_str_custom_729, BaseAbility)
function morphling_morph_str_custom_729.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_morphling.vsndevts")
end
function morphling_morph_str_custom_729.prototype.GetBehavior(self)
    local base = bit.bor(DOTA_ABILITY_BEHAVIOR_NO_TARGET, DOTA_ABILITY_BEHAVIOR_TOGGLE)
    if IsServer() then
        if self:GetCaster():HasTalent("special_bonus_unique_morphling_729_custom_5") then
            return bit.bor(base, DOTA_ABILITY_BEHAVIOR_IGNORE_PSEUDO_QUEUE)
        end
    end
    return base
end
function morphling_morph_str_custom_729.prototype.GetIntrinsicModifierName(self)
    return modifier_morphling_morph_str_custom_729.name
end
function morphling_morph_str_custom_729.prototype.ProcsMagicStick(self)
    return false
end
function morphling_morph_str_custom_729.prototype.GetAssociatedPrimaryAbilities(self)
    return "morphling_morph_agi_custom_729"
end
function morphling_morph_str_custom_729.prototype.OnToggle(self)
    local caster = self:GetCaster()
    local toggleState = self:GetToggleState()
    if toggleState then
        modifier_morphling_morph_str_custom_729_morph:apply(caster, caster, self, {})
        local morph_agi = caster:FindAbilityByName("morphling_morph_agi_custom_729")
        if morph_agi and morph_agi:GetToggleState() then
            morph_agi:ToggleAbility()
            local modifier = caster:FindAbilityByName("modifier_morphling_morph_agi_custom_729_morph")
            if modifier and not modifier:IsNull() then
                modifier:Destroy()
            end
        end
    else
        local modifier = caster:FindModifierByName(modifier_morphling_morph_str_custom_729_morph.name)
        if modifier and not modifier:IsNull() then
            modifier:Destroy()
        end
    end
end
morphling_morph_str_custom_729 = __TS__Decorate(
    morphling_morph_str_custom_729,
    morphling_morph_str_custom_729,
    {registerAbility(nil)},
    {kind = "class", name = "morphling_morph_str_custom_729"}
)
____exports.morphling_morph_str_custom_729 = morphling_morph_str_custom_729
return ____exports
