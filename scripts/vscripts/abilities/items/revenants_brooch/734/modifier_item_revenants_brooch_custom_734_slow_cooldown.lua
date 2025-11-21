local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 3,["36"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_revenants_brooch_custom_734_slow_cooldown = __TS__Class()
local modifier_item_revenants_brooch_custom_734_slow_cooldown = ____exports.modifier_item_revenants_brooch_custom_734_slow_cooldown
modifier_item_revenants_brooch_custom_734_slow_cooldown.name = "modifier_item_revenants_brooch_custom_734_slow_cooldown"
__TS__ClassExtends(modifier_item_revenants_brooch_custom_734_slow_cooldown, BaseModifier)
function modifier_item_revenants_brooch_custom_734_slow_cooldown.prototype.IsHidden(self)
    return true
end
function modifier_item_revenants_brooch_custom_734_slow_cooldown.prototype.IsPurgable(self)
    return false
end
function modifier_item_revenants_brooch_custom_734_slow_cooldown.prototype.RemoveOnDeath(self)
    return false
end
function modifier_item_revenants_brooch_custom_734_slow_cooldown.prototype.AllowIllusionDuplicate(self)
    return false
end
function modifier_item_revenants_brooch_custom_734_slow_cooldown.prototype.IsDebuff(self)
    return false
end
modifier_item_revenants_brooch_custom_734_slow_cooldown = __TS__Decorate(
    modifier_item_revenants_brooch_custom_734_slow_cooldown,
    modifier_item_revenants_brooch_custom_734_slow_cooldown,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_revenants_brooch_custom_734_slow_cooldown"}
)
____exports.modifier_item_revenants_brooch_custom_734_slow_cooldown = modifier_item_revenants_brooch_custom_734_slow_cooldown
return ____exports
