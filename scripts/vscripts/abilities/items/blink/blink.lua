local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 7,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 16,["26"] = 18,["27"] = 19,["28"] = 21,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 28,["34"] = 30,["35"] = 32,["36"] = 11,["37"] = 35,["38"] = 36,["39"] = 37,["40"] = 39,["41"] = 40,["42"] = 45,["43"] = 46,["44"] = 48,["45"] = 49,["46"] = 54,["47"] = 55,["48"] = 57,["49"] = 58,["50"] = 35,["51"] = 6,["52"] = 6,["53"] = 6,["54"] = 5,["57"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerItem = ____blink.BlinkDaggerItem
local ____modifier_item_blink_custom = require("abilities.items.blink.modifier_item_blink_custom")
local modifier_item_blink_custom = ____modifier_item_blink_custom.modifier_item_blink_custom
____exports.item_blink = __TS__Class()
local item_blink = ____exports.item_blink
item_blink.name = "item_blink"
__TS__ClassExtends(item_blink, BlinkDaggerItem)
function item_blink.prototype.GetIntrinsicModifierName(self)
    return modifier_item_blink_custom.name
end
function item_blink.prototype.OnSpellStart(self)
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
    caster:StartGesture(ACT_DOTA_BLINK_DAGGER_END)
    self:PlayEffects(origin)
end
function item_blink.prototype.PlayEffects(self, origin)
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
item_blink = __TS__Decorate(
    item_blink,
    item_blink,
    {registerAbility(nil)},
    {kind = "class", name = "item_blink"}
)
____exports.item_blink = item_blink
return ____exports
