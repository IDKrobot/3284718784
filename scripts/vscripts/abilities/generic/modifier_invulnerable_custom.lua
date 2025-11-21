local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 10,["21"] = 10,["22"] = 10,["23"] = 10,["24"] = 10,["25"] = 10,["26"] = 10,["27"] = 9,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 3,["34"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_invulnerable_custom = __TS__Class()
local modifier_invulnerable_custom = ____exports.modifier_invulnerable_custom
modifier_invulnerable_custom.name = "modifier_invulnerable_custom"
__TS__ClassExtends(modifier_invulnerable_custom, BaseModifier)
function modifier_invulnerable_custom.prototype.IsHidden(self)
    return true
end
function modifier_invulnerable_custom.prototype.CheckState(self)
    return {
        [MODIFIER_STATE_INVISIBLE] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
        [MODIFIER_STATE_UNSELECTABLE] = true,
        [MODIFIER_STATE_UNTARGETABLE] = true,
        [MODIFIER_STATE_MAGIC_IMMUNE] = true,
        [MODIFIER_STATE_DEBUFF_IMMUNE] = true
    }
end
modifier_invulnerable_custom = __TS__Decorate(
    modifier_invulnerable_custom,
    modifier_invulnerable_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invulnerable_custom"}
)
____exports.modifier_invulnerable_custom = modifier_invulnerable_custom
return ____exports
