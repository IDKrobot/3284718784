local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 4,["25"] = 4,["26"] = 4,["27"] = 3,["30"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pudge_meat_hook_custom_722_followthrough = __TS__Class()
local modifier_pudge_meat_hook_custom_722_followthrough = ____exports.modifier_pudge_meat_hook_custom_722_followthrough
modifier_pudge_meat_hook_custom_722_followthrough.name = "modifier_pudge_meat_hook_custom_722_followthrough"
__TS__ClassExtends(modifier_pudge_meat_hook_custom_722_followthrough, BaseModifier)
function modifier_pudge_meat_hook_custom_722_followthrough.prototype.IsHidden(self)
    return true
end
function modifier_pudge_meat_hook_custom_722_followthrough.prototype.IsPurgable(self)
    return false
end
function modifier_pudge_meat_hook_custom_722_followthrough.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
modifier_pudge_meat_hook_custom_722_followthrough = __TS__Decorate(
    modifier_pudge_meat_hook_custom_722_followthrough,
    modifier_pudge_meat_hook_custom_722_followthrough,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pudge_meat_hook_custom_722_followthrough"}
)
____exports.modifier_pudge_meat_hook_custom_722_followthrough = modifier_pudge_meat_hook_custom_722_followthrough
return ____exports
