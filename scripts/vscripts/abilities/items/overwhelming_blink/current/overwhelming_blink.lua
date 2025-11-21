local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 17,["31"] = 19,["32"] = 21,["33"] = 22,["34"] = 24,["36"] = 27,["37"] = 29,["38"] = 30,["39"] = 31,["40"] = 33,["41"] = 35,["42"] = 37,["43"] = 38,["44"] = 39,["45"] = 39,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 39,["50"] = 39,["51"] = 47,["52"] = 48,["53"] = 49,["54"] = 49,["55"] = 49,["56"] = 49,["57"] = 49,["58"] = 49,["59"] = 49,["60"] = 49,["61"] = 49,["62"] = 49,["63"] = 49,["64"] = 49,["65"] = 59,["66"] = 60,["67"] = 61,["68"] = 63,["69"] = 63,["70"] = 63,["71"] = 63,["72"] = 63,["73"] = 63,["74"] = 49,["75"] = 49,["76"] = 73,["77"] = 12,["78"] = 76,["79"] = 77,["80"] = 78,["81"] = 80,["82"] = 81,["83"] = 86,["84"] = 87,["85"] = 89,["86"] = 90,["87"] = 95,["88"] = 96,["89"] = 98,["90"] = 99,["91"] = 76,["92"] = 102,["93"] = 103,["94"] = 104,["95"] = 106,["96"] = 107,["97"] = 112,["98"] = 112,["99"] = 112,["100"] = 112,["101"] = 112,["102"] = 113,["103"] = 113,["104"] = 113,["105"] = 113,["106"] = 113,["107"] = 114,["108"] = 102,["109"] = 7,["110"] = 7,["111"] = 7,["112"] = 6,["115"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____blink = require("abilities.items.global_usage.blink")
local BlinkDaggerItem = ____blink.BlinkDaggerItem
local ____modifier_item_overwhelming_blink_custom = require("abilities.items.overwhelming_blink.current.modifier_item_overwhelming_blink_custom")
local modifier_item_overwhelming_blink_custom = ____modifier_item_overwhelming_blink_custom.modifier_item_overwhelming_blink_custom
local ____modifier_item_overwhelming_blink_custom_debuff = require("abilities.items.overwhelming_blink.current.modifier_item_overwhelming_blink_custom_debuff")
local modifier_item_overwhelming_blink_custom_debuff = ____modifier_item_overwhelming_blink_custom_debuff.modifier_item_overwhelming_blink_custom_debuff
____exports.item_overwhelming_blink = __TS__Class()
local item_overwhelming_blink = ____exports.item_overwhelming_blink
item_overwhelming_blink.name = "item_overwhelming_blink"
__TS__ClassExtends(item_overwhelming_blink, BlinkDaggerItem)
function item_overwhelming_blink.prototype.GetIntrinsicModifierName(self)
    return modifier_item_overwhelming_blink_custom.name
end
function item_overwhelming_blink.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local origin = caster:GetAbsOrigin()
    if not caster:IsHero() then
        return
    end
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
    local damageStrength = caster:GetStrength() * self:GetSpecialValueFor("damage_pct_instant") / 100
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
            modifier_item_overwhelming_blink_custom_debuff:apply(
                enemy,
                caster,
                self,
                {duration = enemy:CalculateDuration(caster, duration)}
            )
        end
    )
    self:PlayEffects2()
end
function item_overwhelming_blink.prototype.PlayEffects(self, origin)
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
function item_overwhelming_blink.prototype.PlayEffects2(self)
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
item_overwhelming_blink = __TS__Decorate(
    item_overwhelming_blink,
    item_overwhelming_blink,
    {registerAbility(nil)},
    {kind = "class", name = "item_overwhelming_blink"}
)
____exports.item_overwhelming_blink = item_overwhelming_blink
return ____exports
