local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 46,["19"] = 3,["20"] = 9,["21"] = 10,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 13,["26"] = 17,["27"] = 18,["28"] = 17,["29"] = 21,["30"] = 22,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 32,["41"] = 21,["42"] = 35,["43"] = 36,["44"] = 35,["45"] = 39,["46"] = 40,["47"] = 39,["48"] = 4,["49"] = 4,["50"] = 4,["51"] = 3,["54"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_poison_sting_custom_728_debuff = __TS__Class()
local modifier_broodmother_poison_sting_custom_728_debuff = ____exports.modifier_broodmother_poison_sting_custom_728_debuff
modifier_broodmother_poison_sting_custom_728_debuff.name = "modifier_broodmother_poison_sting_custom_728_debuff"
__TS__ClassExtends(modifier_broodmother_poison_sting_custom_728_debuff, BaseModifier)
function modifier_broodmother_poison_sting_custom_728_debuff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.damage = 8
    self.OnTooltip = function() return self.damage end
end
function modifier_broodmother_poison_sting_custom_728_debuff.prototype.IsHidden(self)
    return false
end
function modifier_broodmother_poison_sting_custom_728_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_broodmother_poison_sting_custom_728_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_broodmother_poison_sting_custom_728_debuff.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.damageTable = {
        attacker = self:GetCaster(),
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = self:GetParent(),
        ability = self:GetAbility()
    }
    self:StartIntervalThink(1)
end
function modifier_broodmother_poison_sting_custom_728_debuff.prototype.OnIntervalThink(self)
    ApplyDamage(self.damageTable)
end
function modifier_broodmother_poison_sting_custom_728_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_TOOLTIP}
end
modifier_broodmother_poison_sting_custom_728_debuff = __TS__Decorate(
    modifier_broodmother_poison_sting_custom_728_debuff,
    modifier_broodmother_poison_sting_custom_728_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_poison_sting_custom_728_debuff"}
)
____exports.modifier_broodmother_poison_sting_custom_728_debuff = modifier_broodmother_poison_sting_custom_728_debuff
return ____exports
