local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 19,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 3,["34"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_spawn_spiderlings_custom_728_bonuses = __TS__Class()
local modifier_broodmother_spawn_spiderlings_custom_728_bonuses = ____exports.modifier_broodmother_spawn_spiderlings_custom_728_bonuses
modifier_broodmother_spawn_spiderlings_custom_728_bonuses.name = "modifier_broodmother_spawn_spiderlings_custom_728_bonuses"
__TS__ClassExtends(modifier_broodmother_spawn_spiderlings_custom_728_bonuses, BaseModifier)
function modifier_broodmother_spawn_spiderlings_custom_728_bonuses.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierPreAttack_BonusDamage = function() return 18 end
end
function modifier_broodmother_spawn_spiderlings_custom_728_bonuses.prototype.IsHidden(self)
    return true
end
function modifier_broodmother_spawn_spiderlings_custom_728_bonuses.prototype.IsPurgable(self)
    return false
end
function modifier_broodmother_spawn_spiderlings_custom_728_bonuses.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE}
end
modifier_broodmother_spawn_spiderlings_custom_728_bonuses = __TS__Decorate(
    modifier_broodmother_spawn_spiderlings_custom_728_bonuses,
    modifier_broodmother_spawn_spiderlings_custom_728_bonuses,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_spawn_spiderlings_custom_728_bonuses"}
)
____exports.modifier_broodmother_spawn_spiderlings_custom_728_bonuses = modifier_broodmother_spawn_spiderlings_custom_728_bonuses
return ____exports
