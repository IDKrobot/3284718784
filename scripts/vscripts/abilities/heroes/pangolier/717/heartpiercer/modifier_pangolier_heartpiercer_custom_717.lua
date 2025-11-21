local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 6,["18"] = 10,["19"] = 11,["20"] = 10,["21"] = 16,["22"] = 17,["23"] = 18,["24"] = 20,["27"] = 21,["30"] = 22,["33"] = 23,["36"] = 24,["39"] = 25,["42"] = 27,["43"] = 16,["44"] = 5,["45"] = 5,["46"] = 5,["47"] = 4,["50"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_heartpiercer_custom_717 = __TS__Class()
local modifier_pangolier_heartpiercer_custom_717 = ____exports.modifier_pangolier_heartpiercer_custom_717
modifier_pangolier_heartpiercer_custom_717.name = "modifier_pangolier_heartpiercer_custom_717"
__TS__ClassExtends(modifier_pangolier_heartpiercer_custom_717, BaseModifier)
function modifier_pangolier_heartpiercer_custom_717.prototype.IsHidden(self)
    return true
end
function modifier_pangolier_heartpiercer_custom_717.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end
function modifier_pangolier_heartpiercer_custom_717.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    if parent:GetTeamNumber() == target:GetTeamNumber() then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() or target:IsRoshan() then
        return
    end
    self:GetAbility():ProcPassive(target)
end
modifier_pangolier_heartpiercer_custom_717 = __TS__Decorate(
    modifier_pangolier_heartpiercer_custom_717,
    modifier_pangolier_heartpiercer_custom_717,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_heartpiercer_custom_717"}
)
____exports.modifier_pangolier_heartpiercer_custom_717 = modifier_pangolier_heartpiercer_custom_717
return ____exports
