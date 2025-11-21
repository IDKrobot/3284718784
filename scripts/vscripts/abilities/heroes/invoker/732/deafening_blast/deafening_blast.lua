local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 6,["19"] = 8,["20"] = 9,["21"] = 8,["22"] = 9,["24"] = 9,["25"] = 10,["26"] = 12,["27"] = 14,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 23,["33"] = 24,["35"] = 26,["36"] = 28,["37"] = 29,["38"] = 30,["39"] = 32,["40"] = 34,["41"] = 35,["42"] = 37,["43"] = 40,["44"] = 41,["46"] = 44,["47"] = 45,["48"] = 47,["49"] = 47,["50"] = 47,["51"] = 48,["52"] = 47,["53"] = 47,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 51,["59"] = 51,["60"] = 51,["61"] = 51,["62"] = 51,["63"] = 51,["64"] = 51,["65"] = 51,["66"] = 66,["67"] = 67,["69"] = 68,["70"] = 68,["71"] = 69,["72"] = 69,["73"] = 69,["74"] = 69,["75"] = 69,["76"] = 70,["77"] = 72,["78"] = 68,["81"] = 75,["82"] = 77,["83"] = 18,["84"] = 80,["85"] = 81,["86"] = 83,["89"] = 84,["90"] = 84,["91"] = 84,["92"] = 84,["95"] = 86,["96"] = 86,["97"] = 88,["98"] = 89,["99"] = 90,["100"] = 91,["101"] = 93,["102"] = 97,["103"] = 98,["104"] = 100,["105"] = 102,["106"] = 102,["107"] = 102,["108"] = 102,["109"] = 102,["110"] = 102,["111"] = 102,["112"] = 109,["113"] = 111,["114"] = 112,["115"] = 112,["116"] = 112,["117"] = 112,["118"] = 112,["119"] = 112,["121"] = 122,["122"] = 80,["123"] = 135,["124"] = 136,["125"] = 137,["128"] = 139,["131"] = 140,["134"] = 142,["135"] = 142,["136"] = 142,["137"] = 142,["138"] = 144,["139"] = 146,["140"] = 150,["142"] = 152,["143"] = 153,["145"] = 155,["146"] = 156,["148"] = 159,["149"] = 160,["150"] = 160,["151"] = 160,["152"] = 161,["153"] = 160,["154"] = 160,["155"] = 135,["156"] = 9,["157"] = 9,["158"] = 9,["159"] = 8,["162"] = 9});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_deafening_blast_custom_732_disarm = require("abilities.heroes.invoker.732.deafening_blast.modifier_invoker_deafening_blast_custom_732_disarm")
local modifier_invoker_deafening_blast_custom_732_disarm = ____modifier_invoker_deafening_blast_custom_732_disarm.modifier_invoker_deafening_blast_custom_732_disarm
local ____modifier_invoker_deafening_blast_custom_732_knockback = require("abilities.heroes.invoker.732.deafening_blast.modifier_invoker_deafening_blast_custom_732_knockback")
local modifier_invoker_deafening_blast_custom_732_knockback = ____modifier_invoker_deafening_blast_custom_732_knockback.modifier_invoker_deafening_blast_custom_732_knockback
LinkLuaModifier("modifier_generic_arc", "abilities/generic/modifier_generic_arc.lua", LUA_MODIFIER_MOTION_BOTH)
____exports.invoker_deafening_blast_custom_732 = __TS__Class()
local invoker_deafening_blast_custom_732 = ____exports.invoker_deafening_blast_custom_732
invoker_deafening_blast_custom_732.name = "invoker_deafening_blast_custom_732"
__TS__ClassExtends(invoker_deafening_blast_custom_732, BaseInvokerAbility)
function invoker_deafening_blast_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_deafening_blast")
    self.phraseCooldown = false
    self.hit_targets = {}
end
function invoker_deafening_blast_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local point = self:GetCursorPosition()
    if point == origin then
        point = point:__add(caster:GetForwardVector())
    end
    local direction = point:__sub(origin):Normalized()
    local distance = self:GetSpecialValueFor("travel_distance")
    local start_radius = self:GetSpecialValueFor("radius_start")
    local end_radius = self:GetSpecialValueFor("radius_end")
    caster:StartGesture(ACT_DOTA_CAST_DEAFENING_BLAST)
    local sound = "Hero_Invoker.DeafeningBlast"
    local particle_name = "particles/units/heroes/hero_invoker/invoker_deafening_blast.vpcf"
    if caster:HasPersona("npc_dota_hero_invoker") and caster:HasWearable("models/items/invoker_kid/dark_artistry_kid/invoker_kid_dark_artistry_back.vmdl") or caster:HasWearable("models/items/invoker/dark_artistry/dark_artistry_cape_model.vmdl") then
        sound = "Hero_Invoker.DeafeningBlast.Immortal"
        particle_name = "particles/econ/items/invoker/invoker_ti6/invoker_deafening_blast_ti6.vpcf"
    end
    local uniqueKey = DoUniqueString(self.constructor.name)
    self.hit_targets[uniqueKey] = {}
    Timers:CreateTimer(
        20,
        function()
            self.hit_targets[uniqueKey] = nil
        end
    )
    local info = {
        Ability = self,
        EffectName = particle_name,
        vSpawnOrigin = origin,
        fDistance = distance,
        fStartRadius = start_radius,
        fEndRadius = end_radius,
        Source = caster,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        ExtraData = {key = uniqueKey}
    }
    local count = self:GetSpecialValueFor("radial_count")
    local circle = 360 / count
    do
        local i = 0
        while i < count do
            info.vVelocity = RotatePosition(
                Vector(0, 0, 0),
                QAngle(0, i * circle, 0),
                direction
            ):__mul(1100)
            info.vVelocity.z = 0
            ProjectileManager:CreateLinearProjectile(info)
            i = i + 1
        end
    end
    caster:EmitSound(sound)
    self:EmitCastResponse()
end
function invoker_deafening_blast_custom_732.prototype.OnProjectileHit_ExtraData(self, target, location, extraData)
    local caster = self:GetCaster()
    if not target then
        return
    end
    if __TS__ArrayIncludes(
        self.hit_targets[extraData.key],
        target:entindex()
    ) then
        return
    end
    local ____self_hit_targets_extraData_key_0 = self.hit_targets[extraData.key]
    ____self_hit_targets_extraData_key_0[#____self_hit_targets_extraData_key_0 + 1] = target:entindex()
    local damage = self:GetOrbSpecialValueFor("damage", "exort")
    local knockback_duration = self:GetOrbSpecialValueFor("knockback_duration", "quas")
    local knockback_distance = self:GetOrbSpecialValueFor("knockback_distance", "quas")
    local disarm_duration = self:GetOrbSpecialValueFor("disarm_duration", "wex")
    local center = location == target:GetAbsOrigin() and caster:GetAbsOrigin() or location
    local direction = target:GetAbsOrigin():__sub(center):Normalized()
    direction.z = 0
    local point = target:GetAbsOrigin():__add(direction:__mul(knockback_distance))
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    if not target:HasModifier(modifier_invoker_deafening_blast_custom_732_knockback.name) then
        modifier_invoker_deafening_blast_custom_732_disarm:apply(
            target,
            caster,
            self,
            {duration = target:CalculateDuration(caster, disarm_duration)}
        )
    end
    modifier_invoker_deafening_blast_custom_732_knockback:apply(target, caster, self, {duration = knockback_duration, distance = knockback_distance, point_x = point.x, point_y = point.y})
end
function invoker_deafening_blast_custom_732.prototype.EmitCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_invoker" then
        return
    end
    if self.phraseCooldown then
        return
    end
    if not RollPercentage(50) then
        return
    end
    local random = RollVoiceLines(
        nil,
        __TS__Spread(range(nil, 1, 6))
    )
    if caster:HasPersona("npc_dota_hero_invoker") then
        if RollPercentage(50) and (random == "01" or random == "02" or random == "06") then
            random = random .. "_02"
        end
        local response = "invoker_kidvo_la_ability_deafeningblast_" .. random
        caster:EmitSoundOnClient(response)
    else
        local response = "invoker_invo_ability_deafeningblast_" .. random
        caster:EmitSoundOnClient(response)
    end
    self.phraseCooldown = true
    Timers:CreateTimer(
        60,
        function()
            self.phraseCooldown = false
        end
    )
end
invoker_deafening_blast_custom_732 = __TS__Decorate(
    invoker_deafening_blast_custom_732,
    invoker_deafening_blast_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_deafening_blast_custom_732"}
)
____exports.invoker_deafening_blast_custom_732 = invoker_deafening_blast_custom_732
return ____exports
