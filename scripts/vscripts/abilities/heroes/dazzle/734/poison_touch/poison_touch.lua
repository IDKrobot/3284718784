local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 4,["19"] = 4,["20"] = 5,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 10,["27"] = 10,["28"] = 11,["29"] = 15,["30"] = 16,["31"] = 17,["32"] = 15,["33"] = 20,["34"] = 21,["35"] = 20,["36"] = 24,["37"] = 25,["38"] = 26,["39"] = 27,["42"] = 29,["45"] = 31,["46"] = 32,["47"] = 34,["48"] = 35,["49"] = 36,["50"] = 38,["51"] = 39,["52"] = 40,["53"] = 41,["54"] = 43,["55"] = 44,["56"] = 46,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 46,["62"] = 46,["63"] = 46,["64"] = 46,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 56,["71"] = 56,["72"] = 56,["73"] = 56,["74"] = 56,["75"] = 56,["76"] = 56,["77"] = 56,["78"] = 56,["79"] = 56,["80"] = 56,["81"] = 56,["82"] = 56,["83"] = 56,["84"] = 56,["85"] = 69,["86"] = 70,["87"] = 71,["88"] = 56,["89"] = 56,["90"] = 74,["91"] = 76,["92"] = 77,["95"] = 77,["99"] = 77,["101"] = 77,["102"] = 78,["104"] = 24,["105"] = 82,["106"] = 83,["107"] = 85,["110"] = 87,["111"] = 88,["112"] = 88,["114"] = 90,["115"] = 91,["116"] = 91,["117"] = 91,["118"] = 91,["119"] = 95,["120"] = 96,["121"] = 96,["122"] = 91,["123"] = 91,["124"] = 100,["125"] = 101,["126"] = 101,["127"] = 101,["128"] = 101,["129"] = 105,["130"] = 106,["131"] = 106,["132"] = 101,["133"] = 101,["134"] = 110,["135"] = 111,["139"] = 115,["140"] = 82,["141"] = 10,["142"] = 10,["143"] = 10,["144"] = 9,["147"] = 10});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_dazzle_poison_touch_custom_734 = require("abilities.heroes.dazzle.734.poison_touch.modifier_dazzle_poison_touch_custom_734")
local modifier_dazzle_poison_touch_custom_734 = ____modifier_dazzle_poison_touch_custom_734.modifier_dazzle_poison_touch_custom_734
local ____modifier_dazzle_poison_touch_custom_734_slow = require("abilities.heroes.dazzle.734.poison_touch.modifier_dazzle_poison_touch_custom_734_slow")
local modifier_dazzle_poison_touch_custom_734_slow = ____modifier_dazzle_poison_touch_custom_734_slow.modifier_dazzle_poison_touch_custom_734_slow
____exports.dazzle_poison_touch_custom_734 = __TS__Class()
local dazzle_poison_touch_custom_734 = ____exports.dazzle_poison_touch_custom_734
dazzle_poison_touch_custom_734.name = "dazzle_poison_touch_custom_734"
__TS__ClassExtends(dazzle_poison_touch_custom_734, CustomAbility)
function dazzle_poison_touch_custom_734.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "dazzle_poison_touch")
end
function dazzle_poison_touch_custom_734.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_dazzle.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_dazzle.vsndevts")
end
function dazzle_poison_touch_custom_734.prototype.GetIntrinsicModifierName(self)
    return modifier_dazzle_poison_touch_custom_734.name
end
function dazzle_poison_touch_custom_734.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local casterOrigin = caster:GetAbsOrigin()
    local targetOrigin = target:GetAbsOrigin()
    local direction = targetOrigin:__sub(casterOrigin)
    direction.z = 0
    direction = direction:Normalized()
    local startRadius = self:GetSpecialValueFor("start_radius")
    local endRadius = self:GetSpecialValueFor("end_radius")
    local distance = self:GetSpecialValueFor("end_distance")
    local targets = self:GetSpecialValueFor("targets")
    local projectile_speed = self:GetSpecialValueFor("projectile_speed")
    local projectile_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_dazzle/dazzle_poison_touch.vpcf", caster)
    local info = {
        Source = caster,
        Ability = self,
        EffectName = projectile_name,
        iMoveSpeed = projectile_speed,
        bDodgeable = true,
        bVisibleToEnemies = true,
        bProvidesVision = false
    }
    __TS__ArrayForEach(
        __TS__ArraySlice(
            FindUnitsInCone(
                nil,
                caster:GetTeamNumber(),
                targetOrigin,
                casterOrigin,
                casterOrigin:__add(direction:__mul(distance)),
                nil,
                startRadius,
                endRadius,
                2,
                bit.bor(1, 18),
                0,
                1,
                false
            ),
            0,
            targets
        ),
        function(____, enemy)
            info.Target = enemy
            ProjectileManager:CreateTrackingProjectile(info)
        end
    )
    caster:EmitSound("Hero_Dazzle.Poison_Cast")
    if caster:GetUnitName() == "npc_dota_hero_dazzle" then
        local ____RollVoiceLines_1 = RollVoiceLines
        local ____array_0 = __TS__SparseArrayNew(
            nil,
            __TS__Spread(range(nil, 1, 7))
        )
        __TS__SparseArrayPush(
            ____array_0,
            __TS__Spread(range(nil, 9, 15))
        )
        local response = "dazzle_dazz_ability_sfx_" .. ____RollVoiceLines_1(__TS__SparseArraySpread(____array_0))
        caster:EmitSoundOnClient(response)
    end
end
function dazzle_poison_touch_custom_734.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    local juju = caster:FindAbilityByName("dazzle_bad_juju_custom_734")
    if juju and juju:IsTrained() then
        juju:TargetModifier(target)
    end
    if not target:IsMagicImmune() then
        modifier_dazzle_poison_touch_custom_734_slow:apply(
            target,
            caster,
            self,
            {duration = target:CalculateDuration(
                caster,
                self:GetSpecialValueFor("duration")
            )}
        )
        if caster:HasShard() then
            target:AddNewModifier(
                caster,
                self,
                "modifier_hexxed",
                {duration = target:CalculateDuration(
                    caster,
                    self:GetSpecialValueFor("hex_duration")
                )}
            )
            if target:IsIllusion() and not target:IsStrongIllusion() then
                target:Kill(self, caster)
            end
        end
    end
    target:EmitSound("Hero_Dazzle.Poison_Touch")
end
dazzle_poison_touch_custom_734 = __TS__Decorate(
    dazzle_poison_touch_custom_734,
    dazzle_poison_touch_custom_734,
    {registerAbility(nil)},
    {kind = "class", name = "dazzle_poison_touch_custom_734"}
)
____exports.dazzle_poison_touch_custom_734 = dazzle_poison_touch_custom_734
return ____exports
