local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["27"] = 16,["30"] = 18,["31"] = 20,["32"] = 21,["33"] = 23,["34"] = 25,["35"] = 27,["36"] = 29,["37"] = 34,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 34,["42"] = 35,["43"] = 37,["44"] = 38,["45"] = 38,["46"] = 38,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 47,["51"] = 10,["52"] = 50,["53"] = 51,["54"] = 52,["55"] = 54,["56"] = 55,["57"] = 60,["58"] = 61,["59"] = 63,["60"] = 64,["61"] = 69,["62"] = 70,["63"] = 72,["64"] = 73,["65"] = 50,["66"] = 5,["67"] = 5,["68"] = 5,["69"] = 4,["72"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_abyssal_blade_custom_725 = require("abilities.items.abyssal_blade.725.modifier_item_abyssal_blade_custom_725")
local modifier_item_abyssal_blade_custom_725 = ____modifier_item_abyssal_blade_custom_725.modifier_item_abyssal_blade_custom_725
____exports.item_abyssal_blade_custom_725 = __TS__Class()
local item_abyssal_blade_custom_725 = ____exports.item_abyssal_blade_custom_725
item_abyssal_blade_custom_725.name = "item_abyssal_blade_custom_725"
__TS__ClassExtends(item_abyssal_blade_custom_725, BaseItem)
function item_abyssal_blade_custom_725.prototype.GetIntrinsicModifierName(self)
    return modifier_item_abyssal_blade_custom_725.name
end
function item_abyssal_blade_custom_725.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local origin = caster:GetAbsOrigin()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local blinkPosition = target:GetAbsOrigin():__sub(caster:GetForwardVector():__mul(45))
    caster:SetAbsOrigin(blinkPosition)
    FindClearSpaceForUnit(caster, blinkPosition, true)
    caster:StartGesture(ACT_DOTA_BLINK_DAGGER_END)
    self:PlayEffects(origin)
    caster:MoveToTargetToAttack(target)
    local particle = ParticleManager:CreateParticle("particles/items_fx/abyssal_blade.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControl(
        particle,
        0,
        target:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local duration = self:GetSpecialValueFor("stun_duration")
    target:AddNewModifier(
        caster,
        self,
        "modifier_bashed",
        {duration = target:CalculateDuration(caster, duration)}
    )
    target:EmitSound("DOTA_Item.AbyssalBlade.Activate")
end
function item_abyssal_blade_custom_725.prototype.PlayEffects(self, origin)
    local caster = self:GetCaster()
    local casterOrigin = caster:GetAbsOrigin()
    local particleStartName = ParticleManager:GetParticleReplacement("particles/items_fx/blink_dagger_start.vpcf", caster)
    local particleStart = ParticleManager:CreateParticle(particleStartName, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(particleStart, 0, origin)
    ParticleManager:ReleaseParticleIndex(particleStart)
    local particleEndName = ParticleManager:GetParticleReplacement("particles/items_fx/blink_dagger_end.vpcf", caster)
    local particleEnd = ParticleManager:CreateParticle(particleEndName, PATTACH_ABSORIGIN, caster)
    ParticleManager:SetParticleControl(particleEnd, 0, casterOrigin)
    ParticleManager:ReleaseParticleIndex(particleEnd)
    EmitSoundOnLocationWithCaster(origin, "DOTA_Item.BlinkDagger.Activate", caster)
    EmitSoundOnLocationWithCaster(casterOrigin, "DOTA_Item.BlinkDagger.NailedIt", caster)
end
item_abyssal_blade_custom_725 = __TS__Decorate(
    item_abyssal_blade_custom_725,
    item_abyssal_blade_custom_725,
    {registerAbility(nil)},
    {kind = "class", name = "item_abyssal_blade_custom_725"}
)
____exports.item_abyssal_blade_custom_725 = item_abyssal_blade_custom_725
return ____exports
