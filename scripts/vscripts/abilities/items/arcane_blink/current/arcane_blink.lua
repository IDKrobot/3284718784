local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 7,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 16,["26"] = 18,["27"] = 19,["28"] = 21,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 28,["34"] = 30,["35"] = 32,["36"] = 34,["37"] = 35,["38"] = 37,["39"] = 37,["40"] = 37,["41"] = 37,["42"] = 37,["43"] = 37,["44"] = 37,["45"] = 37,["46"] = 38,["47"] = 40,["48"] = 40,["49"] = 40,["50"] = 40,["51"] = 40,["52"] = 40,["53"] = 40,["54"] = 41,["55"] = 41,["56"] = 41,["57"] = 41,["58"] = 41,["59"] = 41,["60"] = 41,["61"] = 11,["62"] = 44,["63"] = 45,["64"] = 46,["65"] = 48,["66"] = 49,["67"] = 54,["68"] = 55,["69"] = 57,["70"] = 58,["71"] = 63,["72"] = 64,["73"] = 66,["74"] = 67,["75"] = 44,["76"] = 6,["77"] = 6,["78"] = 6,["79"] = 5,["82"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerItem = ____blink.BlinkDaggerItem
local ____modifier_item_arcane_blink_custom = require("abilities.items.arcane_blink.current.modifier_item_arcane_blink_custom")
local modifier_item_arcane_blink_custom = ____modifier_item_arcane_blink_custom.modifier_item_arcane_blink_custom
____exports.item_arcane_blink = __TS__Class()
local item_arcane_blink = ____exports.item_arcane_blink
item_arcane_blink.name = "item_arcane_blink"
__TS__ClassExtends(item_arcane_blink, BlinkDaggerItem)
function item_arcane_blink.prototype.GetIntrinsicModifierName(self)
    return modifier_item_arcane_blink_custom.name
end
function item_arcane_blink.prototype.OnSpellStart(self)
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
    local healAmount = self:GetSpecialValueFor("heal_amount")
    local manaAmount = self:GetSpecialValueFor("mana_amount")
    caster:HealWithParams(
        healAmount,
        self,
        false,
        true,
        caster,
        false
    )
    caster:GiveMana(manaAmount)
    SendOverheadEventMessage(
        nil,
        OVERHEAD_ALERT_HEAL,
        caster,
        healAmount,
        nil
    )
    SendOverheadEventMessage(
        nil,
        OVERHEAD_ALERT_MANA_ADD,
        caster,
        manaAmount,
        nil
    )
end
function item_arcane_blink.prototype.PlayEffects(self, origin)
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
item_arcane_blink = __TS__Decorate(
    item_arcane_blink,
    item_arcane_blink,
    {registerAbility(nil)},
    {kind = "class", name = "item_arcane_blink"}
)
____exports.item_arcane_blink = item_arcane_blink
return ____exports
