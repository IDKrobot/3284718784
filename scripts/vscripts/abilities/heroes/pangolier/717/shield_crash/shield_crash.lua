local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 4,["21"] = 4,["22"] = 6,["23"] = 8,["24"] = 9,["25"] = 8,["26"] = 9,["28"] = 9,["29"] = 10,["30"] = 14,["31"] = 15,["32"] = 16,["33"] = 14,["34"] = 19,["35"] = 20,["36"] = 21,["37"] = 23,["38"] = 24,["40"] = 9,["41"] = 19,["42"] = 29,["43"] = 30,["44"] = 29,["45"] = 33,["46"] = 34,["47"] = 36,["48"] = 37,["49"] = 39,["50"] = 41,["51"] = 42,["52"] = 43,["53"] = 45,["54"] = 46,["55"] = 47,["56"] = 48,["57"] = 50,["58"] = 51,["59"] = 52,["62"] = 55,["63"] = 56,["64"] = 57,["66"] = 60,["67"] = 61,["68"] = 63,["69"] = 67,["70"] = 67,["71"] = 67,["72"] = 67,["73"] = 67,["74"] = 67,["75"] = 67,["76"] = 63,["77"] = 78,["78"] = 80,["81"] = 82,["82"] = 83,["83"] = 88,["84"] = 88,["85"] = 88,["86"] = 88,["87"] = 88,["88"] = 89,["89"] = 89,["90"] = 89,["91"] = 89,["92"] = 89,["93"] = 89,["94"] = 89,["95"] = 89,["96"] = 91,["97"] = 92,["98"] = 93,["100"] = 95,["101"] = 95,["102"] = 95,["103"] = 95,["104"] = 95,["105"] = 95,["107"] = 105,["108"] = 107,["109"] = 107,["110"] = 107,["111"] = 107,["112"] = 107,["113"] = 107,["114"] = 107,["115"] = 115,["116"] = 117,["117"] = 117,["118"] = 117,["119"] = 117,["120"] = 117,["121"] = 117,["122"] = 117,["123"] = 117,["124"] = 117,["125"] = 117,["126"] = 117,["127"] = 129,["128"] = 129,["129"] = 129,["130"] = 130,["131"] = 131,["132"] = 133,["133"] = 134,["134"] = 134,["135"] = 134,["136"] = 135,["137"] = 136,["139"] = 134,["140"] = 134,["142"] = 129,["143"] = 129,["144"] = 140,["145"] = 140,["146"] = 140,["147"] = 141,["148"] = 142,["150"] = 140,["151"] = 140,["152"] = 145,["153"] = 145,["154"] = 145,["155"] = 145,["156"] = 147,["157"] = 147,["158"] = 147,["159"] = 147,["160"] = 147,["161"] = 147,["162"] = 155,["163"] = 156,["165"] = 158,["166"] = 159,["167"] = 164,["168"] = 164,["169"] = 164,["170"] = 164,["171"] = 164,["172"] = 165,["173"] = 166,["174"] = 168,["175"] = 168,["176"] = 168,["177"] = 168,["178"] = 168,["179"] = 91,["180"] = 33,["181"] = 172,["182"] = 173,["183"] = 175,["186"] = 176,["189"] = 178,["192"] = 178,["196"] = 178,["198"] = 178,["199"] = 179,["200"] = 172,["201"] = 182,["202"] = 183,["203"] = 185,["206"] = 186,["209"] = 188,["210"] = 189,["211"] = 182,["212"] = 9,["213"] = 9,["214"] = 9,["215"] = 8,["218"] = 9});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_pangolier_shield_crash_custom_717_buff = require("abilities.heroes.pangolier.717.shield_crash.modifier_pangolier_shield_crash_custom_717_buff")
local modifier_pangolier_shield_crash_custom_717_buff = ____modifier_pangolier_shield_crash_custom_717_buff.modifier_pangolier_shield_crash_custom_717_buff
local ____modifier_pangolier_gyroshell_custom_717_turn_boost = require("abilities.heroes.pangolier.717.gyroshell.modifier_pangolier_gyroshell_custom_717_turn_boost")
local modifier_pangolier_gyroshell_custom_717_turn_boost = ____modifier_pangolier_gyroshell_custom_717_turn_boost.modifier_pangolier_gyroshell_custom_717_turn_boost
LinkLuaModifier("modifier_generic_arc", "abilities/generic/modifier_generic_arc.lua", LUA_MODIFIER_MOTION_BOTH)
____exports.pangolier_shield_crash_custom_717 = __TS__Class()
local pangolier_shield_crash_custom_717 = ____exports.pangolier_shield_crash_custom_717
pangolier_shield_crash_custom_717.name = "pangolier_shield_crash_custom_717"
__TS__ClassExtends(pangolier_shield_crash_custom_717, CustomAbility)
function pangolier_shield_crash_custom_717.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "pangolier_shield_crash")
end
function pangolier_shield_crash_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pangolier.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pangolier.vsndevts")
end
function pangolier_shield_crash_custom_717.prototype.GetCooldown(self, level)
    local caster = self:GetCaster()
    local gyroshell_cooldown = self:GetSpecialValueFor("gyroshell_cooldown")
    if caster:HasModifier("modifier_pangolier_gyroshell_custom_717") and gyroshell_cooldown > 0 then
        return gyroshell_cooldown
    end
    return CustomAbility.prototype.GetCooldown(self, level)
end
function pangolier_shield_crash_custom_717.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function pangolier_shield_crash_custom_717.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:StartGesture(ACT_DOTA_CAST_ABILITY_2)
    caster:EmitSound("Hero_Pangolier.TailThump.Cast")
    local radius = self:GetSpecialValueFor("radius")
    local jump_duration = self:GetSpecialValueFor("jump_duration")
    local height = self:GetSpecialValueFor("jump_height")
    local distance = self:GetSpecialValueFor("jump_horizontal_distance")
    if caster:HasModifier("modifier_pangolier_gyroshell_custom_717") then
        jump_duration = self:GetSpecialValueFor("jump_duration_gyroshell")
        height = self:GetSpecialValueFor("jump_height_gyroshell")
        distance = 600 * jump_duration
        local gyroshell = caster:FindModifierByName("modifier_pangolier_gyroshell_custom_717")
        if gyroshell:GetRemainingTime() < jump_duration then
            gyroshell:SetDuration(jump_duration, true)
        end
    end
    if caster:IsRooted() or caster:IsStunned() or caster:IsLeashed() then
        distance = 1
        height = height * 0.7
    end
    local speed = math.max(1, distance / jump_duration)
    local point = caster:GetAbsOrigin():__add(caster:GetForwardVector():__mul(distance))
    local arc = caster:AddNewModifier(caster, self, "modifier_generic_arc", {
        target_x = point.x,
        target_y = point.y,
        distance = distance,
        speed = speed,
        height = height,
        fix_end = false,
        isStun = true
    })
    self:RollCastResponse()
    if not arc then
        return
    end
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pangolier/pangolier_tailthump_cast.vpcf", caster)
    local particle_cast = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControl(
        particle_cast,
        0,
        caster:GetAbsOrigin()
    )
    arc:AddParticle(
        particle_cast,
        false,
        false,
        -1,
        false,
        false
    )
    arc:SetEndCallback(function()
        if not caster:HasModifier("modifier_pangolier_gyroshell_custom_717") then
            caster:FadeGesture(ACT_DOTA_RUN)
        else
            modifier_pangolier_gyroshell_custom_717_turn_boost:apply(
                caster,
                caster,
                caster:FindAbilityByName("modifier_pangolier_gyroshell_custom_717"),
                {duration = 0.25}
            )
        end
        local reduction = self:GetSpecialValueFor("hero_stacks")
        local damageTable = {
            attacker = caster,
            damage = self:GetSpecialValueFor("damage"),
            damage_type = DAMAGE_TYPE_MAGICAL,
            victim = nil,
            ability = self
        }
        local enemyKilled = false
        local enemies = FindUnitsInRadius(
            caster:GetTeamNumber(),
            caster:GetAbsOrigin(),
            nil,
            radius,
            DOTA_UNIT_TARGET_TEAM_ENEMY,
            bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
            DOTA_UNIT_TARGET_FLAG_NONE,
            FIND_ANY_ORDER,
            false
        )
        __TS__ArrayForEach(
            enemies,
            function(____, enemy)
                damageTable.victim = enemy
                ApplyDamage(damageTable)
                if enemy:IsRealHero() then
                    Timers:CreateTimer(
                        FrameTime(),
                        function()
                            if not enemy:IsAlive() and not enemyKilled then
                                enemyKilled = true
                            end
                        end
                    )
                end
            end
        )
        Timers:CreateTimer(
            FrameTime() * #enemies,
            function()
                if enemyKilled then
                    self:RollKillResponse()
                end
            end
        )
        local stacks = reduction * #__TS__ArrayFilter(
            enemies,
            function(____, enemy) return enemy:IsRealHero() end
        )
        local buff = modifier_pangolier_shield_crash_custom_717_buff:apply(
            caster,
            caster,
            self,
            {duration = self:GetSpecialValueFor("duration")}
        )
        if buff:GetStackCount() < stacks then
            buff:SetStackCount(stacks)
        end
        local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pangolier/pangolier_tailthump_hero.vpcf", caster)
        local particle = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, nil)
        ParticleManager:SetParticleControl(
            particle,
            0,
            caster:GetAbsOrigin()
        )
        ParticleManager:DestroyParticle(particle, false)
        ParticleManager:ReleaseParticleIndex(particle)
        EmitSoundOnLocationWithCaster(
            caster:GetAbsOrigin(),
            "Hero_Pangolier.TailThump",
            caster
        )
    end)
end
function pangolier_shield_crash_custom_717.prototype.RollCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_pangolier" then
        return
    end
    if RollPercentage(50) then
        return
    end
    local ____RollVoiceLines_1 = RollVoiceLines
    local ____array_0 = __TS__SparseArrayNew(
        nil,
        __TS__Spread(range(nil, 1, 4))
    )
    __TS__SparseArrayPush(
        ____array_0,
        __TS__Spread(range(nil, 7, 11))
    )
    local response = ____RollVoiceLines_1(__TS__SparseArraySpread(____array_0))
    caster:EmitSoundOnClient("pangolin_pangolin_ability2_" .. response)
end
function pangolier_shield_crash_custom_717.prototype.RollKillResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_pangolier" then
        return
    end
    if RollPercentage(50) then
        return
    end
    local response = RollVoiceLines(nil, 5, 6)
    caster:EmitSoundOnClient("pangolin_pangolin_ability2_" .. response)
end
pangolier_shield_crash_custom_717 = __TS__Decorate(
    pangolier_shield_crash_custom_717,
    pangolier_shield_crash_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "pangolier_shield_crash_custom_717"}
)
____exports.pangolier_shield_crash_custom_717 = pangolier_shield_crash_custom_717
return ____exports
