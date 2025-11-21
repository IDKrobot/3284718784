local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 7,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 19,["29"] = 20,["30"] = 22,["31"] = 16,["32"] = 6,["33"] = 6,["34"] = 6,["35"] = 5,["38"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_sniper_take_aim_custom_722 = require("abilities.heroes.sniper.722.take_aim.modifier_sniper_take_aim_custom_722")
local modifier_sniper_take_aim_custom_722 = ____modifier_sniper_take_aim_custom_722.modifier_sniper_take_aim_custom_722
local ____modifier_sniper_take_aim_custom_722_bonus = require("abilities.heroes.sniper.722.take_aim.modifier_sniper_take_aim_custom_722_bonus")
local modifier_sniper_take_aim_custom_722_bonus = ____modifier_sniper_take_aim_custom_722_bonus.modifier_sniper_take_aim_custom_722_bonus
____exports.sniper_take_aim_custom_722 = __TS__Class()
local sniper_take_aim_custom_722 = ____exports.sniper_take_aim_custom_722
sniper_take_aim_custom_722.name = "sniper_take_aim_custom_722"
__TS__ClassExtends(sniper_take_aim_custom_722, BaseAbility)
function sniper_take_aim_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_sniper.vsndevts")
end
function sniper_take_aim_custom_722.prototype.GetIntrinsicModifierName(self)
    return modifier_sniper_take_aim_custom_722.name
end
function sniper_take_aim_custom_722.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    self:EndCooldown()
    self:SetActivated(false)
    modifier_sniper_take_aim_custom_722_bonus:apply(caster, caster, self, {})
end
sniper_take_aim_custom_722 = __TS__Decorate(
    sniper_take_aim_custom_722,
    sniper_take_aim_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "sniper_take_aim_custom_722"}
)
____exports.sniper_take_aim_custom_722 = sniper_take_aim_custom_722
return ____exports
