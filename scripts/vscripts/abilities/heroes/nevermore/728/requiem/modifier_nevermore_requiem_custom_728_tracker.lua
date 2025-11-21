local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 6,["18"] = 10,["19"] = 11,["20"] = 11,["22"] = 10,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 18,["27"] = 19,["30"] = 23,["31"] = 25,["32"] = 14,["33"] = 5,["34"] = 5,["35"] = 5,["36"] = 4,["39"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_nevermore_requiem_custom_728_tracker = __TS__Class()
local modifier_nevermore_requiem_custom_728_tracker = ____exports.modifier_nevermore_requiem_custom_728_tracker
modifier_nevermore_requiem_custom_728_tracker.name = "modifier_nevermore_requiem_custom_728_tracker"
__TS__ClassExtends(modifier_nevermore_requiem_custom_728_tracker, BaseModifier)
function modifier_nevermore_requiem_custom_728_tracker.prototype.IsHidden(self)
    return true
end
function modifier_nevermore_requiem_custom_728_tracker.prototype.OnCreated(self, params)
    if IsServer() then
        self:StartIntervalThink(FrameTime())
    end
end
function modifier_nevermore_requiem_custom_728_tracker.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if ability:IsStolen() then
        self:StopIntervalThink()
        return
    end
    local necromastery_count = parent:GetModifierStackCount("modifier_nevermore_necromastery_custom_728", parent)
    ability.souls = necromastery_count
end
modifier_nevermore_requiem_custom_728_tracker = __TS__Decorate(
    modifier_nevermore_requiem_custom_728_tracker,
    modifier_nevermore_requiem_custom_728_tracker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_nevermore_requiem_custom_728_tracker"}
)
____exports.modifier_nevermore_requiem_custom_728_tracker = modifier_nevermore_requiem_custom_728_tracker
return ____exports
