local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 11,["25"] = 16,["26"] = 17,["27"] = 16,["28"] = 20,["29"] = 21,["32"] = 23,["33"] = 24,["34"] = 26,["35"] = 30,["37"] = 20,["38"] = 6,["39"] = 6,["40"] = 6,["41"] = 5,["44"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_nevermore_necromastery_custom_728 = require("abilities.heroes.nevermore.728.necromastery.modifier_nevermore_necromastery_custom_728")
local modifier_nevermore_necromastery_custom_728 = ____modifier_nevermore_necromastery_custom_728.modifier_nevermore_necromastery_custom_728
____exports.nevermore_necromastery_custom_728 = __TS__Class()
local nevermore_necromastery_custom_728 = ____exports.nevermore_necromastery_custom_728
nevermore_necromastery_custom_728.name = "nevermore_necromastery_custom_728"
__TS__ClassExtends(nevermore_necromastery_custom_728, CustomAbility)
function nevermore_necromastery_custom_728.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "nevermore_necromastery")
end
function nevermore_necromastery_custom_728.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_nevermore.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_nevermore.vsndevts")
end
function nevermore_necromastery_custom_728.prototype.GetIntrinsicModifierName(self)
    return modifier_nevermore_necromastery_custom_728.name
end
function nevermore_necromastery_custom_728.prototype.OnUpgrade(self)
    if not IsServer() then
        return
    end
    if self:GetLevel() == 1 then
        local caster = self:GetCaster()
        local sound_name = caster:HasArcana("npc_dota_hero_nevermore") and "nevermore_nev_arc_ability_mastery_01" or "nevermore_nev_ability_mastery_01"
        caster:EmitSoundOnClient(sound_name)
    end
end
nevermore_necromastery_custom_728 = __TS__Decorate(
    nevermore_necromastery_custom_728,
    nevermore_necromastery_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "nevermore_necromastery_custom_728"}
)
____exports.nevermore_necromastery_custom_728 = nevermore_necromastery_custom_728
return ____exports
