local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["21"] = 7,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 12,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 20,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 22,["38"] = 22,["39"] = 31,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 40,["47"] = 42,["48"] = 17,["49"] = 7,["50"] = 7,["51"] = 7,["52"] = 6,["55"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_huskar_life_break_custom_717_buff = require("abilities.heroes.huskar.717.life_break.modifier_huskar_life_break_custom_717_buff")
local modifier_huskar_life_break_custom_717_buff = ____modifier_huskar_life_break_custom_717_buff.modifier_huskar_life_break_custom_717_buff
local ____modifier_huskar_life_break_custom_717 = require("abilities.heroes.huskar.717.life_break.modifier_huskar_life_break_custom_717")
local modifier_huskar_life_break_custom_717 = ____modifier_huskar_life_break_custom_717.modifier_huskar_life_break_custom_717
____exports.huskar_life_break_custom_717 = __TS__Class()
local huskar_life_break_custom_717 = ____exports.huskar_life_break_custom_717
huskar_life_break_custom_717.name = "huskar_life_break_custom_717"
__TS__ClassExtends(huskar_life_break_custom_717, CustomAbility)
function huskar_life_break_custom_717.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "huskar_life_break")
end
function huskar_life_break_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_huskar.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_huskar.vsndevts")
end
function huskar_life_break_custom_717.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    modifier_huskar_life_break_custom_717:apply(
        caster,
        caster,
        self,
        {target = target:entindex()}
    )
    modifier_huskar_life_break_custom_717_buff:apply(caster, caster, self, {duration = 5})
    caster:Purge(
        false,
        true,
        false,
        false,
        false
    )
    caster:EmitSound("Hero_Huskar.Life_Break")
end
huskar_life_break_custom_717 = __TS__Decorate(
    huskar_life_break_custom_717,
    huskar_life_break_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "huskar_life_break_custom_717"}
)
____exports.huskar_life_break_custom_717 = huskar_life_break_custom_717
return ____exports
