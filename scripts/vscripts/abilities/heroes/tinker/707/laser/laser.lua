local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 3,["16"] = 3,["17"] = 5,["18"] = 6,["19"] = 5,["20"] = 6,["22"] = 6,["23"] = 7,["24"] = 11,["25"] = 12,["26"] = 13,["27"] = 11,["28"] = 16,["29"] = 17,["30"] = 19,["31"] = 16,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 25,["38"] = 27,["41"] = 29,["42"] = 30,["43"] = 32,["44"] = 33,["45"] = 34,["47"] = 36,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 36,["54"] = 44,["55"] = 46,["56"] = 48,["57"] = 48,["58"] = 48,["59"] = 49,["60"] = 50,["61"] = 52,["62"] = 53,["65"] = 58,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 48,["73"] = 48,["74"] = 72,["75"] = 73,["76"] = 74,["77"] = 76,["78"] = 77,["79"] = 78,["80"] = 80,["82"] = 82,["84"] = 85,["87"] = 22,["88"] = 90,["89"] = 91,["90"] = 93,["91"] = 93,["92"] = 93,["93"] = 93,["94"] = 93,["95"] = 93,["96"] = 93,["97"] = 93,["98"] = 93,["99"] = 93,["100"] = 93,["101"] = 93,["102"] = 93,["103"] = 93,["104"] = 105,["105"] = 106,["106"] = 107,["108"] = 90,["109"] = 111,["110"] = 112,["111"] = 114,["112"] = 118,["113"] = 119,["114"] = 124,["115"] = 124,["116"] = 124,["117"] = 124,["118"] = 124,["119"] = 124,["120"] = 124,["121"] = 124,["122"] = 124,["123"] = 125,["124"] = 125,["125"] = 125,["126"] = 125,["127"] = 125,["128"] = 125,["129"] = 125,["130"] = 125,["131"] = 125,["132"] = 126,["133"] = 128,["134"] = 129,["135"] = 131,["137"] = 132,["138"] = 132,["139"] = 133,["140"] = 138,["141"] = 138,["142"] = 138,["143"] = 138,["144"] = 138,["145"] = 138,["146"] = 138,["147"] = 138,["148"] = 138,["149"] = 139,["150"] = 139,["151"] = 139,["152"] = 139,["153"] = 139,["154"] = 139,["155"] = 139,["156"] = 139,["157"] = 139,["158"] = 140,["159"] = 142,["160"] = 132,["164"] = 111,["165"] = 6,["166"] = 6,["167"] = 6,["168"] = 5,["171"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_tinker_laser_custom_707_blind = require("abilities.heroes.tinker.707.laser.modifier_tinker_laser_custom_707_blind")
local modifier_tinker_laser_custom_707_blind = ____modifier_tinker_laser_custom_707_blind.modifier_tinker_laser_custom_707_blind
____exports.tinker_laser_custom_707 = __TS__Class()
local tinker_laser_custom_707 = ____exports.tinker_laser_custom_707
tinker_laser_custom_707.name = "tinker_laser_custom_707"
__TS__ClassExtends(tinker_laser_custom_707, CustomAbility)
function tinker_laser_custom_707.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "tinker_laser")
end
function tinker_laser_custom_707.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function tinker_laser_custom_707.prototype.OnAbilityPhaseStart(self)
    self:GetCaster():EmitSound("Hero_Tinker.LaserAnim")
    return true
end
function tinker_laser_custom_707.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if target == nil then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local heroDuration = self:GetSpecialValueFor("hero_duration")
    local creepDuration = self:GetSpecialValueFor("creep_duration")
    local targets = {target}
    if caster:HasScepter() then
        self:Refract(targets, 0)
    end
    local damageTable = {
        attacker = caster,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = DAMAGE_TYPE_PURE,
        victim = nil,
        ability = self
    }
    local isEnemyDead = false
    self:PlayEffects(targets)
    __TS__ArrayForEach(
        targets,
        function(____, target)
            damageTable.victim = target
            ApplyDamage(damageTable)
            if not target:IsAlive() and target:IsRealHero() and not isEnemyDead then
                isEnemyDead = true
                return
            end
            local duration = target:IsCreep() and creepDuration or heroDuration
            modifier_tinker_laser_custom_707_blind:apply(
                target,
                caster,
                self,
                {duration = target:CalculateDuration(caster, duration)}
            )
        end
    )
    if isEnemyDead and caster:GetUnitName() == "npc_dota_hero_tinker" then
        if RollPercentage(25) then
            local soundName = ""
            if RollPercentage(75) then
                local random = RollVoiceLines(nil, 1, 3, 4)
                local cast_response = "tinker_tink_ability_laser_" .. random
                soundName = cast_response
            else
                soundName = "tinker_tink_attack_11"
            end
            caster:EmitSoundOnClient(soundName)
        end
    end
end
function tinker_laser_custom_707.prototype.Refract(self, targets, jumps)
    local bounceRadius = self:GetSpecialValueFor("bounce_radius")
    local next_target = __TS__ArrayFind(
        FindUnitsInRadius(
            self:GetCaster():GetTeamNumber(),
            targets[jumps + 1]:GetOrigin(),
            nil,
            bounceRadius,
            2,
            1,
            bit.bor(128, 256),
            1,
            false
        ),
        function(____, enemy) return not __TS__ArrayIncludes(targets, enemy) end
    )
    if next_target then
        table.insert(targets, next_target)
        self:Refract(targets, jumps + 1)
    end
end
function tinker_laser_custom_707.prototype.PlayEffects(self, targets)
    local caster = self:GetCaster()
    local attachment = caster:ScriptLookupAttachment("attach_attack2") ~= 0 and "attach_attack2" or "attach_attack1"
    local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_tinker/tinker_laser.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        targets[1],
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        Vector(0, 0, 0),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        9,
        caster,
        PATTACH_POINT_FOLLOW,
        attachment,
        Vector(0, 0, 0),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("Hero_Tinker.Laser")
    targets[1]:EmitSound("Hero_Tinker.LaserImpact")
    if #targets > 1 then
        do
            local i = 1
            while i < #targets do
                local particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN_FOLLOW, caster)
                ParticleManager:SetParticleControlEnt(
                    particle,
                    1,
                    targets[i + 1],
                    PATTACH_POINT_FOLLOW,
                    "attach_hitloc",
                    Vector(0, 0, 0),
                    true
                )
                ParticleManager:SetParticleControlEnt(
                    particle,
                    9,
                    targets[i],
                    PATTACH_POINT_FOLLOW,
                    "attach_hitloc",
                    Vector(0, 0, 0),
                    true
                )
                ParticleManager:ReleaseParticleIndex(particle)
                targets[i + 1]:EmitSound("Hero_Tinker.LaserImpact")
                i = i + 1
            end
        end
    end
end
tinker_laser_custom_707 = __TS__Decorate(
    tinker_laser_custom_707,
    tinker_laser_custom_707,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_laser_custom_707"}
)
____exports.tinker_laser_custom_707 = tinker_laser_custom_707
return ____exports
