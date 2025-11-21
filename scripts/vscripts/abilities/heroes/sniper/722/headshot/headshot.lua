local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 11,["25"] = 16,["26"] = 17,["27"] = 16,["28"] = 6,["29"] = 6,["30"] = 6,["31"] = 5,["34"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_sniper_headshot_custom_722 = require("abilities.heroes.sniper.722.headshot.modifier_sniper_headshot_custom_722")
local modifier_sniper_headshot_custom_722 = ____modifier_sniper_headshot_custom_722.modifier_sniper_headshot_custom_722
____exports.sniper_headshot_custom_722 = __TS__Class()
local sniper_headshot_custom_722 = ____exports.sniper_headshot_custom_722
sniper_headshot_custom_722.name = "sniper_headshot_custom_722"
__TS__ClassExtends(sniper_headshot_custom_722, CustomAbility)
function sniper_headshot_custom_722.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "sniper_headshot")
end
function sniper_headshot_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_sniper.vsndevts")
end
function sniper_headshot_custom_722.prototype.GetIntrinsicModifierName(self)
    return modifier_sniper_headshot_custom_722.name
end
sniper_headshot_custom_722 = __TS__Decorate(
    sniper_headshot_custom_722,
    sniper_headshot_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "sniper_headshot_custom_722"}
)
____exports.sniper_headshot_custom_722 = sniper_headshot_custom_722
return ____exports
