local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 3,["14"] = 3,["15"] = 4,["16"] = 3,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 6,["21"] = 11,["22"] = 12,["23"] = 11,["24"] = 15,["25"] = 16,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 22,["30"] = 22,["35"] = 22,["36"] = 26,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 37,["47"] = 37,["48"] = 37,["49"] = 37,["50"] = 37,["51"] = 37,["52"] = 37,["53"] = 37,["54"] = 37,["55"] = 37,["56"] = 37,["58"] = 49,["59"] = 49,["60"] = 50,["61"] = 51,["62"] = 49,["65"] = 54,["66"] = 55,["68"] = 57,["70"] = 60,["71"] = 61,["72"] = 62,["73"] = 64,["74"] = 66,["75"] = 67,["76"] = 67,["77"] = 67,["78"] = 68,["79"] = 67,["80"] = 67,["82"] = 15,["83"] = 73,["84"] = 74,["87"] = 76,["88"] = 78,["89"] = 79,["90"] = 80,["91"] = 81,["92"] = 81,["93"] = 81,["94"] = 81,["95"] = 81,["96"] = 81,["98"] = 91,["99"] = 91,["100"] = 91,["101"] = 91,["102"] = 91,["103"] = 91,["104"] = 91,["105"] = 98,["106"] = 100,["107"] = 101,["110"] = 105,["111"] = 73,["112"] = 108,["113"] = 109,["114"] = 109,["115"] = 109,["116"] = 109,["117"] = 110,["118"] = 115,["119"] = 117,["120"] = 108,["121"] = 120,["122"] = 121,["123"] = 123,["124"] = 127,["125"] = 129,["126"] = 130,["127"] = 135,["128"] = 136,["129"] = 136,["130"] = 136,["131"] = 136,["132"] = 136,["133"] = 137,["134"] = 139,["135"] = 120});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
____exports.TinkerHeatSeekingMissileAbilityClass = __TS__Class()
local TinkerHeatSeekingMissileAbilityClass = ____exports.TinkerHeatSeekingMissileAbilityClass
TinkerHeatSeekingMissileAbilityClass.name = "TinkerHeatSeekingMissileAbilityClass"
__TS__ClassExtends(TinkerHeatSeekingMissileAbilityClass, BaseAbility)
function TinkerHeatSeekingMissileAbilityClass.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.phraseCooldown = false
end
function TinkerHeatSeekingMissileAbilityClass.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function TinkerHeatSeekingMissileAbilityClass.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function TinkerHeatSeekingMissileAbilityClass.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local radius = self:GetSpecialValueFor("radius")
    local targetCount = self:GetSpecialValueFor("targets")
    local projectileSpeed = self:GetSpecialValueFor("speed")
    local ____temp_0
    if caster:ScriptLookupAttachment("attach_attack3") ~= 0 then
        ____temp_0 = DOTA_PROJECTILE_ATTACHMENT_ATTACK_3
    else
        ____temp_0 = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
    end
    local attachment = ____temp_0
    local projectileName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_tinker/tinker_missile.vpcf", caster)
    local projectileInfo = {
        Source = caster,
        vSourceLoc = caster:GetAbsOrigin(),
        Ability = self,
        EffectName = projectileName,
        iMoveSpeed = projectileSpeed,
        bDodgeable = true,
        iSourceAttachment = attachment
    }
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        caster:GetOrigin(),
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO,
        bit.bor(DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, DOTA_UNIT_TARGET_FLAG_NO_INVIS),
        FIND_CLOSEST,
        false
    )
    do
        local i = 0
        while i < math.min(#enemies, targetCount) do
            projectileInfo.Target = enemies[i + 1]
            ProjectileManager:CreateTrackingProjectile(projectileInfo)
            i = i + 1
        end
    end
    if #enemies == 0 then
        self:PlayEffects2()
    else
        caster:EmitSound("Hero_Tinker.Heat-Seeking_Missile")
    end
    if not self.phraseCooldown and caster:GetUnitName() == "npc_dota_hero_tinker" then
        local random = RollVoiceLines(nil, 1, 2, 3)
        local cast_response = "tinker_tink_ability_heatseekingmissile_" .. random
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
function TinkerHeatSeekingMissileAbilityClass.prototype.OnProjectileHit(self, target, location)
    if target == nil then
        return
    end
    local caster = self:GetCaster()
    if not target:IsMagicImmune() then
        local bashDuration = self:GetSpecialValueFor("bash_duration")
        if bashDuration > 0 then
            target:AddNewModifier(
                caster,
                self,
                "modifier_bashed",
                {duration = target:CalculateDuration(caster, bashDuration)}
            )
        end
        local damageTable = {
            attacker = caster,
            damage = self:GetSpecialValueFor("damage"),
            damage_type = DAMAGE_TYPE_MAGICAL,
            victim = target,
            ability = self
        }
        ApplyDamage(damageTable)
        if not target:IsAlive() and RollPercentage(25) and caster:GetUnitName() == "npc_dota_hero_tinker" then
            caster:EmitSoundOnClient("tinker_tink_ability_heatseekingmissile_05")
        end
    end
    self:PlayEffects(target)
end
function TinkerHeatSeekingMissileAbilityClass.prototype.PlayEffects(self, target)
    local particleName = ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_tinker/tinker_missle_explosion.vpcf",
        self:GetCaster()
    )
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:ReleaseParticleIndex(particle)
    target:EmitSound("Hero_Tinker.Heat-Seeking_Missile.Impact")
end
function TinkerHeatSeekingMissileAbilityClass.prototype.PlayEffects2(self)
    local caster = self:GetCaster()
    local attachment = caster:ScriptLookupAttachment("attach_attack3") ~= 0 and "attach_attack3" or "attach_attack1"
    local point = caster:GetAttachmentOrigin(caster:ScriptLookupAttachment(attachment))
    local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_tinker/tinker_missile_dud.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_WORLDORIGIN, caster)
    ParticleManager:SetParticleControl(particle, 0, point)
    ParticleManager:SetParticleControlForward(
        particle,
        0,
        caster:GetForwardVector()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("Hero_Tinker.Heat-Seeking_Missile_Dud")
end
return ____exports
