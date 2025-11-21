local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 12,["23"] = 14,["24"] = 15,["25"] = 16,["27"] = 9,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 3,["34"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_tempest_double_custom_731_tracker = __TS__Class()
local modifier_arc_warden_tempest_double_custom_731_tracker = ____exports.modifier_arc_warden_tempest_double_custom_731_tracker
modifier_arc_warden_tempest_double_custom_731_tracker.name = "modifier_arc_warden_tempest_double_custom_731_tracker"
__TS__ClassExtends(modifier_arc_warden_tempest_double_custom_731_tracker, BaseModifier)
function modifier_arc_warden_tempest_double_custom_731_tracker.prototype.IsHidden(self)
    return true
end
function modifier_arc_warden_tempest_double_custom_731_tracker.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    local player = PlayerResource:GetPlayer(parent:GetPlayerOwnerID())
    if player ~= nil then
        CustomGameEventManager:Send_ServerToPlayer(player, "update_tempest_double", {entindex = nil})
    end
end
modifier_arc_warden_tempest_double_custom_731_tracker = __TS__Decorate(
    modifier_arc_warden_tempest_double_custom_731_tracker,
    modifier_arc_warden_tempest_double_custom_731_tracker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_tempest_double_custom_731_tracker"}
)
____exports.modifier_arc_warden_tempest_double_custom_731_tracker = modifier_arc_warden_tempest_double_custom_731_tracker
return ____exports
