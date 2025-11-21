local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 4,["19"] = 4,["20"] = 4,["21"] = 3,["24"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_land_mines_custom_684 = __TS__Class()
local modifier_techies_land_mines_custom_684 = ____exports.modifier_techies_land_mines_custom_684
modifier_techies_land_mines_custom_684.name = "modifier_techies_land_mines_custom_684"
__TS__ClassExtends(modifier_techies_land_mines_custom_684, BaseModifier)
function modifier_techies_land_mines_custom_684.prototype.IsHidden(self)
    return false
end
modifier_techies_land_mines_custom_684 = __TS__Decorate(
    modifier_techies_land_mines_custom_684,
    modifier_techies_land_mines_custom_684,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_land_mines_custom_684"}
)
____exports.modifier_techies_land_mines_custom_684 = modifier_techies_land_mines_custom_684
return ____exports
