local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["17"] = 4,["18"] = 7,["19"] = 9,["20"] = 13,["21"] = 14,["22"] = 15,["23"] = 13,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 22,["30"] = 24,["31"] = 25,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 38,["43"] = 40,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 42,["54"] = 44,["55"] = 46,["56"] = 47,["57"] = 47,["58"] = 47,["59"] = 48,["60"] = 47,["61"] = 47,["63"] = 18,["64"] = 53,["65"] = 54,["66"] = 54,["68"] = 56,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 58,["73"] = 58,["74"] = 58,["75"] = 58,["76"] = 66,["77"] = 66,["78"] = 66,["79"] = 66,["80"] = 66,["81"] = 66,["82"] = 66,["83"] = 66,["84"] = 66,["85"] = 66,["86"] = 66,["87"] = 66,["88"] = 76,["89"] = 77,["90"] = 78,["91"] = 66,["92"] = 66,["93"] = 81,["94"] = 53,["95"] = 84,["96"] = 85,["97"] = 86,["100"] = 88,["101"] = 90,["102"] = 91,["103"] = 96,["104"] = 96,["105"] = 96,["106"] = 96,["107"] = 96,["108"] = 96,["109"] = 96,["110"] = 96,["111"] = 96,["112"] = 97,["113"] = 97,["114"] = 97,["115"] = 97,["116"] = 97,["117"] = 97,["118"] = 97,["119"] = 97,["120"] = 97,["121"] = 98,["122"] = 100,["123"] = 104,["124"] = 104,["125"] = 104,["126"] = 104,["127"] = 104,["128"] = 84,["129"] = 108,["130"] = 108,["131"] = 108,["132"] = 108,["134"] = 108,["135"] = 109,["136"] = 108,["137"] = 116,["138"] = 117,["139"] = 116,["140"] = 120,["141"] = 121,["142"] = 120,["143"] = 124,["144"] = 125,["145"] = 124,["146"] = 128,["147"] = 129,["148"] = 130,["149"] = 131,["150"] = 133,["153"] = 135,["156"] = 137,["157"] = 138,["158"] = 140,["159"] = 141,["160"] = 143,["161"] = 144,["162"] = 145,["163"] = 146,["164"] = 148,["165"] = 150,["166"] = 151,["167"] = 152,["169"] = 154,["170"] = 155,["172"] = 158,["173"] = 160,["174"] = 161,["175"] = 163,["176"] = 165,["177"] = 165,["178"] = 165,["179"] = 165,["180"] = 165,["181"] = 165,["182"] = 165,["183"] = 165,["184"] = 165,["185"] = 165,["186"] = 165,["187"] = 165,["188"] = 165,["189"] = 185,["190"] = 187,["191"] = 188,["192"] = 190,["193"] = 128,["194"] = 193,["195"] = 194,["196"] = 196,["199"] = 198,["200"] = 200,["201"] = 193,["202"] = 203,["203"] = 204,["204"] = 206,["205"] = 207,["206"] = 203,["207"] = 210,["208"] = 211,["209"] = 210});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
____exports.TinkerMarchOfTheMachinesAbilityClass = __TS__Class()
local TinkerMarchOfTheMachinesAbilityClass = ____exports.TinkerMarchOfTheMachinesAbilityClass
TinkerMarchOfTheMachinesAbilityClass.name = "TinkerMarchOfTheMachinesAbilityClass"
__TS__ClassExtends(TinkerMarchOfTheMachinesAbilityClass, CustomAbility)
function TinkerMarchOfTheMachinesAbilityClass.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "tinker_march_of_the_machines")
    self.phraseCooldown = false
end
function TinkerMarchOfTheMachinesAbilityClass.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function TinkerMarchOfTheMachinesAbilityClass.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    if self.modifierThinker == nil then
        return
    end
    if caster:GetAbsOrigin() == point then
        point = caster:GetForwardVector():__mul(5)
    end
    CreateModifierThinker(
        caster,
        self,
        self.modifierThinker.name,
        {},
        point,
        caster:GetTeamNumber(),
        false
    )
    self:PlayEffects()
    if not self.phraseCooldown and caster:GetUnitName() == "npc_dota_hero_tinker" then
        local random = RollVoiceLines(
            nil,
            3,
            4,
            5,
            9,
            10,
            11
        )
        local cast_response = "tinker_tink_ability_marchofthemachines_" .. random
        caster:EmitSoundOnClient(cast_response)
        self.phraseCooldown = true
        Timers:CreateTimer(
            20,
            function()
                self.phraseCooldown = false
            end
        )
    end
end
function TinkerMarchOfTheMachinesAbilityClass.prototype.OnProjectileHit_ExtraData(self, target, location, extraData)
    if not target then
        return true
    end
    local caster = self:GetCaster()
    local damageTable = {
        attacker = caster,
        damage = extraData.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = self
    }
    __TS__ArrayForEach(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            location,
            nil,
            extraData.radius,
            2,
            bit.bor(1, 18),
            0,
            0,
            false
        ),
        function(____, enemy)
            damageTable.victim = enemy
            ApplyDamage(damageTable)
        end
    )
    return true
end
function TinkerMarchOfTheMachinesAbilityClass.prototype.PlayEffects(self)
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    local hasImmortal = caster:HasWearable("models/items/tinker/roller_mawster/roller_mawster.vmdl")
    local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_tinker/tinker_motm.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_CUSTOMORIGIN, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack1",
        caster:GetOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        caster,
        PATTACH_ABSORIGIN,
        nil,
        caster:GetOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local soundName = hasImmortal and "Hero_Tinker.March_of_the_Machines.Cast.Rollermawster" or "Hero_Tinker.March_of_the_Machines.Cast"
    EmitSoundOnLocationForAllies(
        caster:GetOrigin(),
        soundName,
        caster
    )
end
____exports.TinkerMarchOfTheMachinesModifierThinkerClass = __TS__Class()
local TinkerMarchOfTheMachinesModifierThinkerClass = ____exports.TinkerMarchOfTheMachinesModifierThinkerClass
TinkerMarchOfTheMachinesModifierThinkerClass.name = "TinkerMarchOfTheMachinesModifierThinkerClass"
__TS__ClassExtends(TinkerMarchOfTheMachinesModifierThinkerClass, BaseModifier)
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
end
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.IsHidden(self)
    return true
end
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.IsDebuff(self)
    return false
end
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.IsPurgable(self)
    return false
end
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    if caster == nil or ability == nil then
        return
    end
    if not IsServer() then
        return
    end
    local duration = ability:GetSpecialValueFor("duration")
    self.radius = ability:GetSpecialValueFor("radius")
    local speed = ability:GetSpecialValueFor("speed")
    local distance = ability:GetSpecialValueFor("distance")
    local machinesPerSecond = ability:GetSpecialValueFor("machines_per_sec")
    local collisionRadius = ability:GetSpecialValueFor("collision_radius")
    local splashRadius = ability:GetSpecialValueFor("splash_radius")
    local damage = ability:GetSpecialValueFor("damage")
    local center = parent:GetOrigin()
    local direction = center:__sub(caster:GetOrigin())
    if direction:Length2D() == 0 then
        direction = caster:GetForwardVector()
    else
        direction.z = 0
        direction = direction:Normalized()
    end
    parent:SetForwardVector(direction)
    self.centerVector = parent:GetLeftVector()
    self.centerSpawn = center:__sub(direction:__mul(self.radius))
    local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_tinker/tinker_machine.vpcf", caster)
    self.projectileInfo = {
        Source = caster,
        Ability = ability,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
        EffectName = particleName,
        fDistance = distance,
        fStartRadius = collisionRadius,
        fEndRadius = collisionRadius,
        vVelocity = direction:__mul(speed),
        ExtraData = {radius = splashRadius, damage = damage}
    }
    self:SetDuration(duration, false)
    self:OnIntervalThink()
    self:StartIntervalThink(1 / machinesPerSecond)
    parent:EmitSound("Hero_Tinker.March_of_the_Machines")
end
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:StopSound("Hero_Tinker.March_of_the_Machines")
    UTIL_Remove(parent)
end
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.OnIntervalThink(self)
    local spawn = self.centerSpawn:__add(self.centerVector:__mul(RandomInt(-self.radius, self.radius)))
    self.projectileInfo.vSpawnOrigin = spawn
    ProjectileManager:CreateLinearProjectile(self.projectileInfo)
end
function TinkerMarchOfTheMachinesModifierThinkerClass.prototype.CheckState(self)
    return {[MODIFIER_STATE_NO_UNIT_COLLISION] = true}
end
return ____exports
