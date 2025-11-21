local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 15,["22"] = 16,["23"] = 18,["26"] = 20,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 15,["32"] = 4,["33"] = 4,["34"] = 4,["35"] = 3,["38"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pudge_dismember_custom_722_channel = __TS__Class()
local modifier_pudge_dismember_custom_722_channel = ____exports.modifier_pudge_dismember_custom_722_channel
modifier_pudge_dismember_custom_722_channel.name = "modifier_pudge_dismember_custom_722_channel"
__TS__ClassExtends(modifier_pudge_dismember_custom_722_channel, BaseModifier)
function modifier_pudge_dismember_custom_722_channel.prototype.IsHidden(self)
    return true
end
function modifier_pudge_dismember_custom_722_channel.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ABILITY_EXECUTED}
end
function modifier_pudge_dismember_custom_722_channel.prototype.OnAbilityExecuted(self, event)
    local ability = self:GetAbility()
    if event.ability ~= ability or ability == nil or event.target == nil then
        return
    end
    local duration = event.target:IsHero() and self:GetSpecialValueFor("AbilityChannelTime") or self:GetSpecialValueFor("creep_dismember_duration_tooltip")
    self:SetStackCount(event.target:CalculateDuration(
        self:GetCaster(),
        duration
    ) * 100)
end
modifier_pudge_dismember_custom_722_channel = __TS__Decorate(
    modifier_pudge_dismember_custom_722_channel,
    modifier_pudge_dismember_custom_722_channel,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pudge_dismember_custom_722_channel"}
)
____exports.modifier_pudge_dismember_custom_722_channel = modifier_pudge_dismember_custom_722_channel
return ____exports
