local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 4,["28"] = 4,["29"] = 4,["30"] = 3,["33"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_dazzle_bad_juju_custom_734_cost = __TS__Class()
local modifier_dazzle_bad_juju_custom_734_cost = ____exports.modifier_dazzle_bad_juju_custom_734_cost
modifier_dazzle_bad_juju_custom_734_cost.name = "modifier_dazzle_bad_juju_custom_734_cost"
__TS__ClassExtends(modifier_dazzle_bad_juju_custom_734_cost, BaseModifier)
function modifier_dazzle_bad_juju_custom_734_cost.prototype.IsHidden(self)
    return false
end
function modifier_dazzle_bad_juju_custom_734_cost.prototype.IsPurgable(self)
    return false
end
function modifier_dazzle_bad_juju_custom_734_cost.prototype.RemoveOnDeath(self)
    return false
end
function modifier_dazzle_bad_juju_custom_734_cost.prototype.IsDebuff(self)
    return true
end
modifier_dazzle_bad_juju_custom_734_cost = __TS__Decorate(
    modifier_dazzle_bad_juju_custom_734_cost,
    modifier_dazzle_bad_juju_custom_734_cost,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_dazzle_bad_juju_custom_734_cost"}
)
____exports.modifier_dazzle_bad_juju_custom_734_cost = modifier_dazzle_bad_juju_custom_734_cost
return ____exports
