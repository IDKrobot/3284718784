local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 14,["24"] = 15,["25"] = 14,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 22,["32"] = 23,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 29,["40"] = 30,["41"] = 30,["42"] = 25,["43"] = 25,["44"] = 18,["45"] = 35,["46"] = 36,["47"] = 35,["48"] = 39,["49"] = 40,["50"] = 39,["51"] = 5,["52"] = 5,["53"] = 5,["54"] = 4,["57"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_pangolier_heartpiercer_custom_717_debuff = require("abilities.heroes.pangolier.717.heartpiercer.modifier_pangolier_heartpiercer_custom_717_debuff")
local modifier_pangolier_heartpiercer_custom_717_debuff = ____modifier_pangolier_heartpiercer_custom_717_debuff.modifier_pangolier_heartpiercer_custom_717_debuff
____exports.modifier_pangolier_heartpiercer_custom_717_delay = __TS__Class()
local modifier_pangolier_heartpiercer_custom_717_delay = ____exports.modifier_pangolier_heartpiercer_custom_717_delay
modifier_pangolier_heartpiercer_custom_717_delay.name = "modifier_pangolier_heartpiercer_custom_717_delay"
__TS__ClassExtends(modifier_pangolier_heartpiercer_custom_717_delay, BaseModifier)
function modifier_pangolier_heartpiercer_custom_717_delay.prototype.IsHidden(self)
    return false
end
function modifier_pangolier_heartpiercer_custom_717_delay.prototype.IsPurgable(self)
    return true
end
function modifier_pangolier_heartpiercer_custom_717_delay.prototype.IsDebuff(self)
    return true
end
function modifier_pangolier_heartpiercer_custom_717_delay.prototype.OnDestroy(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    if self:GetRemainingTime() > 0 then
        return
    end
    modifier_pangolier_heartpiercer_custom_717_debuff:apply(
        parent,
        caster,
        self:GetAbility(),
        {duration = parent:CalculateDuration(
            caster,
            self:GetSpecialValueFor("duration")
        )}
    )
end
function modifier_pangolier_heartpiercer_custom_717_delay.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_pangolier/pangolier_heartpiercer_delay.vpcf"
end
function modifier_pangolier_heartpiercer_custom_717_delay.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_pangolier_heartpiercer_custom_717_delay = __TS__Decorate(
    modifier_pangolier_heartpiercer_custom_717_delay,
    modifier_pangolier_heartpiercer_custom_717_delay,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_heartpiercer_custom_717_delay"}
)
____exports.modifier_pangolier_heartpiercer_custom_717_delay = modifier_pangolier_heartpiercer_custom_717_delay
return ____exports
