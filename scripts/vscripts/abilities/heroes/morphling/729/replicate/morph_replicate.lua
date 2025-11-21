local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 7,["19"] = 12,["20"] = 13,["21"] = 12,["22"] = 16,["23"] = 17,["24"] = 16,["25"] = 20,["26"] = 21,["27"] = 23,["28"] = 25,["29"] = 26,["30"] = 27,["32"] = 29,["33"] = 30,["34"] = 30,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 30,["39"] = 38,["42"] = 20,["43"] = 6,["44"] = 6,["45"] = 6,["46"] = 5,["49"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.morphling_morph_replicate_custom_729 = __TS__Class()
local morphling_morph_replicate_custom_729 = ____exports.morphling_morph_replicate_custom_729
morphling_morph_replicate_custom_729.name = "morphling_morph_replicate_custom_729"
__TS__ClassExtends(morphling_morph_replicate_custom_729, BaseAbility)
function morphling_morph_replicate_custom_729.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_morphling.vsndevts")
end
function morphling_morph_replicate_custom_729.prototype.IsStealable(self)
    return false
end
function morphling_morph_replicate_custom_729.prototype.ProcsMagicStick(self)
    return false
end
function morphling_morph_replicate_custom_729.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local replicate = caster:FindAbilityByName("morphling_replicate_custom_729")
    if caster:HasModifier("modifier_morphling_replicate") then
        caster:RemoveModifierByName("modifier_morphling_replicate")
        caster:RemoveModifierByName("modifier_morphling_replicate_custom_729")
    else
        if replicate.target and not replicate.target:IsNull() then
            caster:AddNewModifier(
                caster,
                replicate,
                "modifier_morphling_replicate_custom_729",
                {target = replicate.target:entindex()}
            )
            caster:AddNewModifier(replicate.target, replicate, "modifier_morphling_replicate", {})
        end
    end
end
morphling_morph_replicate_custom_729 = __TS__Decorate(
    morphling_morph_replicate_custom_729,
    morphling_morph_replicate_custom_729,
    {registerAbility(nil)},
    {kind = "class", name = "morphling_morph_replicate_custom_729"}
)
____exports.morphling_morph_replicate_custom_729 = morphling_morph_replicate_custom_729
return ____exports
