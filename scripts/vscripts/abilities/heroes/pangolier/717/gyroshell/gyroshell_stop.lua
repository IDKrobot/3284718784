local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 5,["19"] = 10,["20"] = 11,["21"] = 13,["22"] = 10,["23"] = 16,["24"] = 17,["25"] = 19,["28"] = 21,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 23,["38"] = 24,["39"] = 25,["41"] = 16,["42"] = 4,["43"] = 4,["44"] = 4,["45"] = 3,["48"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.pangolier_gyroshell_stop_custom_717 = __TS__Class()
local pangolier_gyroshell_stop_custom_717 = ____exports.pangolier_gyroshell_stop_custom_717
pangolier_gyroshell_stop_custom_717.name = "pangolier_gyroshell_stop_custom_717"
__TS__ClassExtends(pangolier_gyroshell_stop_custom_717, BaseAbility)
function pangolier_gyroshell_stop_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pangolier.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pangolier.vsndevts")
end
function pangolier_gyroshell_stop_custom_717.prototype.OnSpellStart(self)
    self:GetCaster():RemoveModifierByName("modifier_pangolier_gyroshell_custom_717")
    self:RollCastResponse()
end
function pangolier_gyroshell_stop_custom_717.prototype.RollCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_pangolier" then
        return
    end
    if RollPercentage(50) then
        local response = RollVoiceLines(
            nil,
            1,
            2,
            4,
            5,
            6
        )
        caster:EmitSoundOnClient("pangolin_pangolin_ability_stop_" .. response)
    elseif RollPercentage(25) then
        caster:EmitSoundOnClient("pangolin_pangolin_ability_stop_03")
    end
end
pangolier_gyroshell_stop_custom_717 = __TS__Decorate(
    pangolier_gyroshell_stop_custom_717,
    pangolier_gyroshell_stop_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "pangolier_gyroshell_stop_custom_717"}
)
____exports.pangolier_gyroshell_stop_custom_717 = pangolier_gyroshell_stop_custom_717
return ____exports
