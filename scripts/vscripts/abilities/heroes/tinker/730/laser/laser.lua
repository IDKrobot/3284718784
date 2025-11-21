local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 6,["25"] = 6,["26"] = 7,["27"] = 11,["28"] = 12,["29"] = 13,["30"] = 11,["31"] = 16,["32"] = 17,["33"] = 19,["34"] = 16,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 25,["41"] = 27,["44"] = 29,["45"] = 30,["46"] = 32,["47"] = 33,["48"] = 34,["49"] = 35,["50"] = 37,["51"] = 37,["52"] = 37,["53"] = 37,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 37,["60"] = 37,["61"] = 37,["62"] = 47,["63"] = 48,["64"] = 48,["66"] = 50,["67"] = 37,["68"] = 37,["69"] = 55,["70"] = 56,["71"] = 56,["72"] = 56,["73"] = 56,["74"] = 56,["75"] = 56,["76"] = 56,["77"] = 56,["78"] = 60,["81"] = 64,["82"] = 65,["83"] = 65,["84"] = 65,["85"] = 65,["86"] = 65,["87"] = 65,["88"] = 65,["89"] = 73,["90"] = 74,["91"] = 75,["92"] = 75,["93"] = 75,["94"] = 75,["95"] = 75,["96"] = 75,["97"] = 75,["98"] = 83,["99"] = 85,["100"] = 87,["101"] = 89,["102"] = 89,["103"] = 89,["104"] = 90,["105"] = 94,["106"] = 94,["107"] = 94,["108"] = 94,["109"] = 94,["110"] = 94,["111"] = 103,["112"] = 104,["113"] = 106,["114"] = 106,["115"] = 106,["116"] = 106,["117"] = 106,["118"] = 106,["119"] = 106,["120"] = 106,["121"] = 106,["122"] = 106,["123"] = 106,["124"] = 106,["125"] = 116,["126"] = 117,["129"] = 119,["130"] = 121,["131"] = 122,["132"] = 124,["133"] = 125,["136"] = 106,["137"] = 106,["138"] = 130,["139"] = 131,["141"] = 89,["142"] = 89,["143"] = 135,["144"] = 136,["145"] = 137,["146"] = 139,["147"] = 140,["148"] = 141,["149"] = 143,["151"] = 145,["153"] = 148,["156"] = 22,["157"] = 153,["158"] = 154,["159"] = 156,["160"] = 160,["161"] = 161,["162"] = 166,["163"] = 166,["164"] = 166,["165"] = 166,["166"] = 166,["167"] = 166,["168"] = 166,["169"] = 166,["170"] = 166,["171"] = 167,["172"] = 167,["173"] = 167,["174"] = 167,["175"] = 167,["176"] = 167,["177"] = 167,["178"] = 167,["179"] = 167,["180"] = 168,["181"] = 170,["182"] = 171,["183"] = 173,["185"] = 174,["186"] = 174,["187"] = 175,["188"] = 177,["189"] = 174,["193"] = 153,["194"] = 182,["195"] = 183,["196"] = 183,["197"] = 183,["198"] = 183,["199"] = 184,["200"] = 182,["201"] = 187,["202"] = 188,["203"] = 188,["204"] = 188,["205"] = 188,["206"] = 188,["207"] = 193,["208"] = 193,["209"] = 193,["210"] = 193,["211"] = 193,["212"] = 193,["213"] = 193,["214"] = 193,["215"] = 193,["216"] = 194,["217"] = 194,["218"] = 194,["219"] = 194,["220"] = 194,["221"] = 194,["222"] = 194,["223"] = 194,["224"] = 194,["225"] = 195,["226"] = 187,["227"] = 6,["228"] = 6,["229"] = 6,["230"] = 5,["233"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_tinker_laser_custom_730_blind = require("abilities.heroes.tinker.730.laser.modifier_tinker_laser_custom_730_blind")
local modifier_tinker_laser_custom_730_blind = ____modifier_tinker_laser_custom_730_blind.modifier_tinker_laser_custom_730_blind
____exports.tinker_laser_custom_730 = __TS__Class()
local tinker_laser_custom_730 = ____exports.tinker_laser_custom_730
tinker_laser_custom_730.name = "tinker_laser_custom_730"
__TS__ClassExtends(tinker_laser_custom_730, CustomAbility)
function tinker_laser_custom_730.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "tinker_laser")
end
function tinker_laser_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function tinker_laser_custom_730.prototype.OnAbilityPhaseStart(self)
    self:GetCaster():EmitSound("Hero_Tinker.LaserAnim")
    return true
end
function tinker_laser_custom_730.prototype.OnSpellStart(self)
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
        local bounceRadius = self:GetSpecialValueFor("bounce_radius")
        local bounceCount = self:GetSpecialValueFor("number_of_bounce")
        local enemies = __TS__ArraySort(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                target:GetOrigin(),
                nil,
                bounceRadius,
                2,
                bit.bor(1, 18),
                bit.bor(128, 256),
                2,
                false
            ),
            function(____, a, b)
                if a:IsCreep() == b:IsCreep() then
                    return 0
                end
                return a:IsCreep() and 1 or -1
            end
        )
        if #targets > 0 then
            local newEnemies = __TS__ArraySlice(
                __TS__ArrayFilter(
                    enemies,
                    function(____, enemy) return not __TS__ArrayIncludes(targets, enemy) end
                ),
                0,
                bounceCount
            )
            __TS__ArrayPushArray(targets, newEnemies)
        end
    end
    local damage = self:GetSpecialValueFor("damage")
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_PURE,
        victim = nil,
        ability = self
    }
    local secondDamagePct = self:GetSpecialValueFor("splash_pct")
    local secondDamage = damage * (secondDamagePct / 100)
    local secondDamageTable = {
        attacker = caster,
        damage = secondDamage,
        damage_type = DAMAGE_TYPE_PURE,
        victim = nil,
        ability = self
    }
    local secondDamageRadius = self:GetSpecialValueFor("damage_radius")
    local isEnemyDead = false
    self:PlayEffects(targets)
    __TS__ArrayForEach(
        targets,
        function(____, target)
            local duration = target:IsCreep() and creepDuration or heroDuration
            modifier_tinker_laser_custom_730_blind:apply(
                target,
                caster,
                self,
                {duration = target:CalculateDuration(caster, duration)}
            )
            damageTable.victim = target
            ApplyDamage(damageTable)
            __TS__ArrayForEach(
                FindUnitsInRadius(
                    caster:GetTeamNumber(),
                    target:GetOrigin(),
                    nil,
                    secondDamageRadius,
                    2,
                    bit.bor(1, 18),
                    bit.bor(128, 256),
                    0,
                    false
                ),
                function(____, enemy)
                    if enemy == target then
                        return
                    end
                    self:PlayEffects2(target, enemy)
                    secondDamageTable.victim = enemy
                    ApplyDamage(secondDamageTable)
                    if not enemy:IsAlive() and enemy:IsRealHero() and not isEnemyDead then
                        isEnemyDead = true
                        return
                    end
                end
            )
            if not target:IsAlive() and target:IsRealHero() and not isEnemyDead then
                isEnemyDead = true
            end
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
function tinker_laser_custom_730.prototype.PlayEffects(self, targets)
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
                self:PlayFromToTargetEffect(targets[i + 1], targets[i], particleName)
                targets[i + 1]:EmitSound("Hero_Tinker.LaserImpact")
                i = i + 1
            end
        end
    end
end
function tinker_laser_custom_730.prototype.PlayEffects2(self, fromTarget, toTarget)
    local particleName = ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_tinker/tinker_laser_secondary.vpcf",
        self:GetCaster()
    )
    self:PlayFromToTargetEffect(fromTarget, toTarget, particleName)
end
function tinker_laser_custom_730.prototype.PlayFromToTargetEffect(self, fromTarget, toTarget, particleName)
    local particle = ParticleManager:CreateParticle(
        particleName,
        PATTACH_ABSORIGIN_FOLLOW,
        self:GetCaster()
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        toTarget,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        Vector(0, 0, 0),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        9,
        fromTarget,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        Vector(0, 0, 0),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
end
tinker_laser_custom_730 = __TS__Decorate(
    tinker_laser_custom_730,
    tinker_laser_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_laser_custom_730"}
)
____exports.tinker_laser_custom_730 = tinker_laser_custom_730
return ____exports
