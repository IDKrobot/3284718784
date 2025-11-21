local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 11,["22"] = 9,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 18,["27"] = 14,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 3,["34"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_clinkz_burning_barrage_custom_730_tracker = __TS__Class()
local modifier_clinkz_burning_barrage_custom_730_tracker = ____exports.modifier_clinkz_burning_barrage_custom_730_tracker
modifier_clinkz_burning_barrage_custom_730_tracker.name = "modifier_clinkz_burning_barrage_custom_730_tracker"
__TS__ClassExtends(modifier_clinkz_burning_barrage_custom_730_tracker, BaseModifier)
function modifier_clinkz_burning_barrage_custom_730_tracker.prototype.IsHidden(self)
    return true
end
function modifier_clinkz_burning_barrage_custom_730_tracker.prototype.OnCreated(self, params)
    if IsServer() then
        self:StartIntervalThink(FrameTime())
    end
end
function modifier_clinkz_burning_barrage_custom_730_tracker.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local attack_range_bonus = parent:Script_GetAttackRange() - parent:GetBaseAttackRange()
    self:SetStackCount(attack_range_bonus)
end
modifier_clinkz_burning_barrage_custom_730_tracker = __TS__Decorate(
    modifier_clinkz_burning_barrage_custom_730_tracker,
    modifier_clinkz_burning_barrage_custom_730_tracker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_clinkz_burning_barrage_custom_730_tracker"}
)
____exports.modifier_clinkz_burning_barrage_custom_730_tracker = modifier_clinkz_burning_barrage_custom_730_tracker
return ____exports
