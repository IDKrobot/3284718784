local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 18,["24"] = 19,["25"] = 20,["26"] = 22,["29"] = 23,["32"] = 24,["35"] = 25,["38"] = 26,["41"] = 28,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 18,["49"] = 42,["50"] = 43,["51"] = 45,["52"] = 46,["54"] = 42,["55"] = 5,["56"] = 5,["57"] = 5,["58"] = 4,["61"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_broodmother_poison_sting_custom_728_debuff = require("abilities.heroes.broodmother.728.poison_sting.modifier_broodmother_poison_sting_custom_728_debuff")
local modifier_broodmother_poison_sting_custom_728_debuff = ____modifier_broodmother_poison_sting_custom_728_debuff.modifier_broodmother_poison_sting_custom_728_debuff
____exports.modifier_broodmother_poison_sting_custom_728 = __TS__Class()
local modifier_broodmother_poison_sting_custom_728 = ____exports.modifier_broodmother_poison_sting_custom_728
modifier_broodmother_poison_sting_custom_728.name = "modifier_broodmother_poison_sting_custom_728"
__TS__ClassExtends(modifier_broodmother_poison_sting_custom_728, BaseModifier)
function modifier_broodmother_poison_sting_custom_728.prototype.IsHidden(self)
    return true
end
function modifier_broodmother_poison_sting_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end
function modifier_broodmother_poison_sting_custom_728.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    local duration = target:IsHero() and 2 or 6
    modifier_broodmother_poison_sting_custom_728_debuff:apply(
        target,
        parent,
        self:GetAbility(),
        {duration = duration * (1 - target:GetStatusResistance())}
    )
end
function modifier_broodmother_poison_sting_custom_728.prototype.OnDeath(self, event)
    local parent = self:GetParent()
    if IsServer() and event.unit == parent then
        parent:EmitSound("Hero_Broodmother.SpawnSpiderlingsDeath")
    end
end
modifier_broodmother_poison_sting_custom_728 = __TS__Decorate(
    modifier_broodmother_poison_sting_custom_728,
    modifier_broodmother_poison_sting_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_poison_sting_custom_728"}
)
____exports.modifier_broodmother_poison_sting_custom_728 = modifier_broodmother_poison_sting_custom_728
return ____exports
