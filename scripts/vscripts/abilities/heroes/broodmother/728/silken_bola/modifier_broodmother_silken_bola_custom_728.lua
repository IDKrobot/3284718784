local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 20,["27"] = 25,["28"] = 25,["29"] = 25,["30"] = 25,["31"] = 25,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 28,["50"] = 28,["51"] = 29,["52"] = 29,["53"] = 29,["54"] = 29,["55"] = 29,["56"] = 29,["57"] = 29,["58"] = 29,["59"] = 17,["60"] = 32,["61"] = 33,["62"] = 32,["63"] = 39,["64"] = 40,["65"] = 39,["66"] = 4,["67"] = 4,["68"] = 4,["69"] = 3,["72"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_silken_bola_custom_728 = __TS__Class()
local modifier_broodmother_silken_bola_custom_728 = ____exports.modifier_broodmother_silken_bola_custom_728
modifier_broodmother_silken_bola_custom_728.name = "modifier_broodmother_silken_bola_custom_728"
__TS__ClassExtends(modifier_broodmother_silken_bola_custom_728, BaseModifier)
function modifier_broodmother_silken_bola_custom_728.prototype.IsHidden(self)
    return false
end
function modifier_broodmother_silken_bola_custom_728.prototype.IsPurgable(self)
    return true
end
function modifier_broodmother_silken_bola_custom_728.prototype.IsDebuff(self)
    return true
end
function modifier_broodmother_silken_bola_custom_728.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_broodmother/broodmother_silken_bola_root.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(
            self:GetDuration(),
            0,
            0
        )
    )
    ParticleManager:SetParticleControl(
        particle,
        4,
        parent:GetAbsOrigin()
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_broodmother_silken_bola_custom_728.prototype.CheckState(self)
    return {[MODIFIER_STATE_ROOTED] = true, [MODIFIER_STATE_INVISIBLE] = false}
end
function modifier_broodmother_silken_bola_custom_728.prototype.GetPriority(self)
    return 9999
end
modifier_broodmother_silken_bola_custom_728 = __TS__Decorate(
    modifier_broodmother_silken_bola_custom_728,
    modifier_broodmother_silken_bola_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_silken_bola_custom_728"}
)
____exports.modifier_broodmother_silken_bola_custom_728 = modifier_broodmother_silken_bola_custom_728
return ____exports
