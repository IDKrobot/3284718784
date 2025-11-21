local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 20,["29"] = 21,["32"] = 22,["35"] = 23,["38"] = 24,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 35,["48"] = 36,["50"] = 16,["51"] = 5,["52"] = 5,["53"] = 5,["54"] = 4,["57"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_forged_spirit_melting_strike_custom_732_armor = require("abilities.heroes.invoker.732.forge_spirit.modifier_forged_spirit_melting_strike_custom_732_armor")
local modifier_forged_spirit_melting_strike_custom_732_armor = ____modifier_forged_spirit_melting_strike_custom_732_armor.modifier_forged_spirit_melting_strike_custom_732_armor
____exports.modifier_forged_spirit_melting_strike_custom_732 = __TS__Class()
local modifier_forged_spirit_melting_strike_custom_732 = ____exports.modifier_forged_spirit_melting_strike_custom_732
modifier_forged_spirit_melting_strike_custom_732.name = "modifier_forged_spirit_melting_strike_custom_732"
__TS__ClassExtends(modifier_forged_spirit_melting_strike_custom_732, BaseModifier)
function modifier_forged_spirit_melting_strike_custom_732.prototype.IsHidden(self)
    return true
end
function modifier_forged_spirit_melting_strike_custom_732.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end
function modifier_forged_spirit_melting_strike_custom_732.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    if event.attacker ~= parent then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    local modifier = modifier_forged_spirit_melting_strike_custom_732_armor:apply(
        target,
        parent,
        self:GetAbility(),
        {duration = 5 * (1 - target:GetStatusResistance())}
    )
    if modifier:GetStackCount() < 20 then
        modifier:IncrementStackCount()
    end
end
modifier_forged_spirit_melting_strike_custom_732 = __TS__Decorate(
    modifier_forged_spirit_melting_strike_custom_732,
    modifier_forged_spirit_melting_strike_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_forged_spirit_melting_strike_custom_732"}
)
____exports.modifier_forged_spirit_melting_strike_custom_732 = modifier_forged_spirit_melting_strike_custom_732
return ____exports
