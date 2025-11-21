local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 15,["27"] = 17,["28"] = 19,["29"] = 20,["30"] = 22,["32"] = 25,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 31,["37"] = 33,["38"] = 35,["39"] = 35,["40"] = 35,["41"] = 35,["42"] = 35,["43"] = 35,["44"] = 12,["45"] = 45,["46"] = 46,["47"] = 47,["48"] = 49,["49"] = 50,["50"] = 55,["51"] = 56,["52"] = 58,["53"] = 59,["54"] = 64,["55"] = 65,["56"] = 67,["57"] = 68,["58"] = 45,["59"] = 7,["60"] = 7,["61"] = 7,["62"] = 6,["65"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerItem = ____blink.BlinkDaggerItem
local ____modifier_item_swift_blink_custom = require("abilities.items.swift_blink.modifier_item_swift_blink_custom")
local modifier_item_swift_blink_custom = ____modifier_item_swift_blink_custom.modifier_item_swift_blink_custom
local ____modifier_item_swift_blink_custom_buff = require("abilities.items.swift_blink.modifier_item_swift_blink_custom_buff")
local modifier_item_swift_blink_custom_buff = ____modifier_item_swift_blink_custom_buff.modifier_item_swift_blink_custom_buff
____exports.item_swift_blink = __TS__Class()
local item_swift_blink = ____exports.item_swift_blink
item_swift_blink.name = "item_swift_blink"
__TS__ClassExtends(item_swift_blink, BlinkDaggerItem)
function item_swift_blink.prototype.GetIntrinsicModifierName(self)
    return modifier_item_swift_blink_custom.name
end
function item_swift_blink.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local origin = caster:GetAbsOrigin()
    local maxRange = self:GetSpecialValueFor("blink_range") + caster:GetCastRangeBonus()
    local direction = point:__sub(origin)
    if direction:Length2D() > maxRange then
        direction = direction:Normalized():__mul(maxRange)
    end
    ProjectileManager:ProjectileDodge(caster)
    local blinkPosition = origin:__add(direction)
    caster:SetAbsOrigin(blinkPosition)
    FindClearSpaceForUnit(caster, blinkPosition, true)
    self:PlayEffects(origin)
    caster:StartGesture(ACT_DOTA_BLINK_DAGGER_END)
    modifier_item_swift_blink_custom_buff:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("duration")}
    )
end
function item_swift_blink.prototype.PlayEffects(self, origin)
    local caster = self:GetCaster()
    local casterOrigin = caster:GetAbsOrigin()
    local particleStartName = ParticleManager:GetParticleReplacement("particles/items3_fx/blink_swift_start.vpcf", caster)
    local particleStart = ParticleManager:CreateParticle(particleStartName, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(particleStart, 0, origin)
    ParticleManager:ReleaseParticleIndex(particleStart)
    local particleEndName = ParticleManager:GetParticleReplacement("particles/items3_fx/blink_swift_end.vpcf", caster)
    local particleEnd = ParticleManager:CreateParticle(particleEndName, PATTACH_ABSORIGIN, caster)
    ParticleManager:SetParticleControl(particleEnd, 0, casterOrigin)
    ParticleManager:ReleaseParticleIndex(particleEnd)
    EmitSoundOnLocationWithCaster(origin, "DOTA_Item.Swift_Blink.Activate", caster)
    EmitSoundOnLocationWithCaster(casterOrigin, "DOTA_Item.Swift_Blink.NailedIt", caster)
end
item_swift_blink = __TS__Decorate(
    item_swift_blink,
    item_swift_blink,
    {registerAbility(nil)},
    {kind = "class", name = "item_swift_blink"}
)
____exports.item_swift_blink = item_swift_blink
return ____exports
