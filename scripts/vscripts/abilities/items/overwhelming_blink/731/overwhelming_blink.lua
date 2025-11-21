local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 17,["31"] = 19,["32"] = 21,["33"] = 22,["34"] = 23,["36"] = 26,["37"] = 28,["38"] = 29,["39"] = 30,["40"] = 32,["41"] = 34,["42"] = 36,["43"] = 37,["44"] = 38,["45"] = 38,["46"] = 38,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 48,["58"] = 48,["59"] = 48,["60"] = 48,["61"] = 48,["62"] = 48,["63"] = 48,["64"] = 48,["65"] = 58,["66"] = 59,["67"] = 60,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 62,["73"] = 62,["74"] = 48,["75"] = 48,["76"] = 72,["77"] = 12,["78"] = 75,["79"] = 76,["80"] = 77,["81"] = 79,["82"] = 80,["83"] = 85,["84"] = 86,["85"] = 88,["86"] = 89,["87"] = 94,["88"] = 95,["89"] = 97,["90"] = 98,["91"] = 75,["92"] = 101,["93"] = 102,["94"] = 103,["95"] = 105,["96"] = 106,["97"] = 111,["98"] = 111,["99"] = 111,["100"] = 111,["101"] = 111,["102"] = 112,["103"] = 112,["104"] = 112,["105"] = 112,["106"] = 112,["107"] = 113,["108"] = 101,["109"] = 7,["110"] = 7,["111"] = 7,["112"] = 6,["115"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerItem = ____blink.BlinkDaggerItem
local ____modifier_item_overwhelming_blink_custom_731 = require("abilities.items.overwhelming_blink.731.modifier_item_overwhelming_blink_custom_731")
local modifier_item_overwhelming_blink_custom_731 = ____modifier_item_overwhelming_blink_custom_731.modifier_item_overwhelming_blink_custom_731
local ____modifier_item_overwhelming_blink_custom_731_debuff = require("abilities.items.overwhelming_blink.731.modifier_item_overwhelming_blink_custom_731_debuff")
local modifier_item_overwhelming_blink_custom_731_debuff = ____modifier_item_overwhelming_blink_custom_731_debuff.modifier_item_overwhelming_blink_custom_731_debuff
____exports.item_overwhelming_blink_custom_731 = __TS__Class()
local item_overwhelming_blink_custom_731 = ____exports.item_overwhelming_blink_custom_731
item_overwhelming_blink_custom_731.name = "item_overwhelming_blink_custom_731"
__TS__ClassExtends(item_overwhelming_blink_custom_731, BlinkDaggerItem)
function item_overwhelming_blink_custom_731.prototype.GetIntrinsicModifierName(self)
    return modifier_item_overwhelming_blink_custom_731.name
end
function item_overwhelming_blink_custom_731.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local origin = caster:GetAbsOrigin()
    if not caster:IsHero() then
        return
    end
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
    local damageStrength = caster:GetStrength() * self:GetSpecialValueFor("damage_pct") / 100
    local damage = self:GetSpecialValueFor("damage_base") + damageStrength
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = self
    }
    local radius = self:GetSpecialValueFor("radius")
    local duration = self:GetSpecialValueFor("duration")
    __TS__ArrayForEach(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            caster:GetAbsOrigin(),
            nil,
            radius,
            2,
            bit.bor(1, 18),
            0,
            0,
            false
        ),
        function(____, enemy)
            damageTable.victim = enemy
            ApplyDamage(damageTable)
            modifier_item_overwhelming_blink_custom_731_debuff:apply(
                enemy,
                caster,
                self,
                {duration = enemy:CalculateDuration(caster, duration)}
            )
        end
    )
    self:PlayEffects2()
end
function item_overwhelming_blink_custom_731.prototype.PlayEffects(self, origin)
    local caster = self:GetCaster()
    local casterOrigin = caster:GetAbsOrigin()
    local particleStartName = ParticleManager:GetParticleReplacement("particles/items3_fx/blink_overwhelming_start.vpcf", caster)
    local particleStart = ParticleManager:CreateParticle(particleStartName, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(particleStart, 0, origin)
    ParticleManager:ReleaseParticleIndex(particleStart)
    local particleEndName = ParticleManager:GetParticleReplacement("particles/items3_fx/blink_overwhelming_end.vpcf", caster)
    local particleEnd = ParticleManager:CreateParticle(particleEndName, PATTACH_ABSORIGIN, caster)
    ParticleManager:SetParticleControl(particleEnd, 0, casterOrigin)
    ParticleManager:ReleaseParticleIndex(particleEnd)
    EmitSoundOnLocationWithCaster(origin, "DOTA_Item.Overwhelming_Blink.Activate", caster)
    EmitSoundOnLocationWithCaster(casterOrigin, "DOTA_Item.Overwhelming_Blink.NailedIt", caster)
end
function item_overwhelming_blink_custom_731.prototype.PlayEffects2(self)
    local caster = self:GetCaster()
    local radius = self:GetSpecialValueFor("radius")
    local particleName = ParticleManager:GetParticleReplacement("particles/items3_fx/blink_overwhelming_burst.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_WORLDORIGIN, caster)
    ParticleManager:SetParticleControl(
        particle,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(radius, radius, radius)
    )
    ParticleManager:ReleaseParticleIndex(particle)
end
item_overwhelming_blink_custom_731 = __TS__Decorate(
    item_overwhelming_blink_custom_731,
    item_overwhelming_blink_custom_731,
    {registerAbility(nil)},
    {kind = "class", name = "item_overwhelming_blink_custom_731"}
)
____exports.item_overwhelming_blink_custom_731 = item_overwhelming_blink_custom_731
return ____exports
