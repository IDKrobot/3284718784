local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 15,["27"] = 17,["28"] = 19,["29"] = 20,["30"] = 21,["32"] = 23,["33"] = 25,["34"] = 26,["35"] = 27,["36"] = 29,["37"] = 31,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 12,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 47,["49"] = 48,["50"] = 53,["51"] = 54,["52"] = 56,["53"] = 57,["54"] = 62,["55"] = 63,["56"] = 65,["57"] = 66,["58"] = 43,["59"] = 7,["60"] = 7,["61"] = 7,["62"] = 6,["65"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerItem = ____blink.BlinkDaggerItem
local ____modifier_item_arcane_blink_custom_730 = require("abilities.items.arcane_blink.730.modifier_item_arcane_blink_custom_730")
local modifier_item_arcane_blink_custom_730 = ____modifier_item_arcane_blink_custom_730.modifier_item_arcane_blink_custom_730
local ____modifier_item_arcane_blink_custom_730_buff = require("abilities.items.arcane_blink.730.modifier_item_arcane_blink_custom_730_buff")
local modifier_item_arcane_blink_custom_730_buff = ____modifier_item_arcane_blink_custom_730_buff.modifier_item_arcane_blink_custom_730_buff
____exports.item_arcane_blink_custom_730 = __TS__Class()
local item_arcane_blink_custom_730 = ____exports.item_arcane_blink_custom_730
item_arcane_blink_custom_730.name = "item_arcane_blink_custom_730"
__TS__ClassExtends(item_arcane_blink_custom_730, BlinkDaggerItem)
function item_arcane_blink_custom_730.prototype.GetIntrinsicModifierName(self)
    return modifier_item_arcane_blink_custom_730.name
end
function item_arcane_blink_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local origin = caster:GetAbsOrigin()
    local maxRange = self:GetSpecialValueFor("blink_range") + caster:GetCastRangeBonus()
    local direction = point:__sub(origin)
    if direction:Length2D() > maxRange then
        direction = direction:Normalized():__mul(maxRange * 4 / 5)
    end
    ProjectileManager:ProjectileDodge(caster)
    local blinkPosition = origin:__add(direction)
    caster:SetAbsOrigin(blinkPosition)
    FindClearSpaceForUnit(caster, blinkPosition, true)
    self:PlayEffects(origin)
    caster:StartGesture(ACT_DOTA_BLINK_DAGGER_END)
    modifier_item_arcane_blink_custom_730_buff:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("duration")}
    )
end
function item_arcane_blink_custom_730.prototype.PlayEffects(self, origin)
    local caster = self:GetCaster()
    local casterOrigin = caster:GetAbsOrigin()
    local particleStartName = ParticleManager:GetParticleReplacement("particles/items3_fx/blink_arcane_start.vpcf", caster)
    local particleStart = ParticleManager:CreateParticle(particleStartName, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(particleStart, 0, origin)
    ParticleManager:ReleaseParticleIndex(particleStart)
    local particleEndName = ParticleManager:GetParticleReplacement("particles/items3_fx/blink_arcane_end.vpcf", caster)
    local particleEnd = ParticleManager:CreateParticle(particleEndName, PATTACH_ABSORIGIN, caster)
    ParticleManager:SetParticleControl(particleEnd, 0, casterOrigin)
    ParticleManager:ReleaseParticleIndex(particleEnd)
    EmitSoundOnLocationWithCaster(origin, "DOTA_Item.Arcane_Blink.Activate", caster)
    EmitSoundOnLocationWithCaster(casterOrigin, "DOTA_Item.Arcane_Blink.NailedIt", caster)
end
item_arcane_blink_custom_730 = __TS__Decorate(
    item_arcane_blink_custom_730,
    item_arcane_blink_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "item_arcane_blink_custom_730"}
)
____exports.item_arcane_blink_custom_730 = item_arcane_blink_custom_730
return ____exports
