local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 4,["19"] = 4,["20"] = 6,["21"] = 7,["22"] = 6,["23"] = 7,["25"] = 7,["26"] = 10,["27"] = 11,["28"] = 12,["29"] = 13,["30"] = 17,["31"] = 18,["32"] = 20,["33"] = 22,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 26,["38"] = 31,["39"] = 32,["40"] = 33,["41"] = 31,["42"] = 36,["43"] = 37,["44"] = 36,["45"] = 40,["46"] = 41,["47"] = 42,["48"] = 43,["49"] = 40,["50"] = 46,["51"] = 47,["52"] = 49,["53"] = 50,["55"] = 53,["56"] = 54,["57"] = 56,["58"] = 57,["59"] = 58,["60"] = 60,["61"] = 61,["63"] = 61,["66"] = 64,["67"] = 64,["68"] = 64,["69"] = 66,["70"] = 67,["71"] = 68,["72"] = 70,["73"] = 72,["74"] = 73,["75"] = 82,["76"] = 83,["77"] = 84,["78"] = 86,["79"] = 87,["80"] = 92,["81"] = 93,["82"] = 93,["83"] = 93,["84"] = 93,["85"] = 93,["86"] = 93,["87"] = 93,["88"] = 93,["89"] = 93,["90"] = 94,["91"] = 95,["92"] = 95,["93"] = 95,["94"] = 95,["95"] = 95,["96"] = 96,["97"] = 97,["98"] = 97,["99"] = 97,["100"] = 97,["101"] = 97,["102"] = 98,["103"] = 98,["104"] = 98,["105"] = 98,["106"] = 98,["107"] = 99,["108"] = 99,["109"] = 99,["110"] = 99,["111"] = 99,["112"] = 99,["113"] = 99,["114"] = 99,["115"] = 99,["116"] = 101,["117"] = 103,["118"] = 103,["119"] = 103,["120"] = 103,["121"] = 103,["122"] = 103,["123"] = 103,["124"] = 103,["125"] = 103,["126"] = 103,["127"] = 103,["128"] = 103,["129"] = 118,["130"] = 120,["131"] = 121,["132"] = 46,["133"] = 124,["134"] = 125,["135"] = 124,["136"] = 128,["137"] = 129,["138"] = 131,["139"] = 131,["141"] = 133,["142"] = 134,["143"] = 135,["144"] = 136,["146"] = 139,["147"] = 140,["148"] = 141,["149"] = 141,["150"] = 141,["151"] = 141,["152"] = 143,["153"] = 150,["154"] = 151,["155"] = 151,["156"] = 151,["157"] = 151,["158"] = 151,["159"] = 151,["160"] = 151,["161"] = 158,["162"] = 160,["163"] = 162,["164"] = 163,["165"] = 168,["166"] = 168,["167"] = 168,["168"] = 168,["169"] = 168,["170"] = 168,["171"] = 168,["172"] = 168,["173"] = 168,["174"] = 169,["176"] = 172,["177"] = 172,["178"] = 172,["179"] = 172,["180"] = 172,["181"] = 172,["182"] = 172,["183"] = 173,["184"] = 174,["185"] = 176,["186"] = 177,["187"] = 179,["188"] = 180,["189"] = 181,["190"] = 183,["191"] = 184,["192"] = 185,["194"] = 187,["195"] = 188,["196"] = 190,["201"] = 196,["202"] = 197,["203"] = 199,["204"] = 200,["205"] = 201,["207"] = 204,["208"] = 205,["209"] = 207,["210"] = 208,["211"] = 210,["212"] = 210,["213"] = 210,["214"] = 210,["215"] = 210,["216"] = 210,["217"] = 210,["218"] = 218,["219"] = 220,["220"] = 222,["221"] = 223,["222"] = 223,["223"] = 223,["224"] = 223,["225"] = 223,["226"] = 223,["227"] = 223,["228"] = 223,["229"] = 223,["230"] = 224,["231"] = 224,["232"] = 224,["233"] = 224,["234"] = 224,["235"] = 225,["236"] = 225,["237"] = 225,["238"] = 225,["239"] = 225,["241"] = 227,["242"] = 227,["243"] = 227,["244"] = 227,["245"] = 227,["246"] = 227,["247"] = 227,["248"] = 227,["249"] = 227,["251"] = 230,["252"] = 231,["254"] = 233,["255"] = 234,["256"] = 235,["258"] = 238,["259"] = 240,["260"] = 241,["262"] = 244,["263"] = 245,["264"] = 246,["266"] = 248,["270"] = 252,["271"] = 253,["273"] = 253,["276"] = 256,["277"] = 257,["278"] = 258,["279"] = 259,["280"] = 261,["281"] = 262,["282"] = 264,["283"] = 265,["286"] = 269,["287"] = 270,["288"] = 271,["289"] = 272,["291"] = 275,["292"] = 128,["293"] = 278,["294"] = 279,["295"] = 280,["296"] = 282,["297"] = 283,["298"] = 284,["299"] = 285,["300"] = 285,["301"] = 285,["302"] = 285,["303"] = 286,["304"] = 287,["305"] = 288,["306"] = 288,["307"] = 288,["308"] = 288,["309"] = 289,["310"] = 289,["311"] = 290,["312"] = 290,["314"] = 292,["316"] = 294,["319"] = 294,["323"] = 294,["325"] = 294,["326"] = 295,["328"] = 297,["329"] = 298,["330"] = 299,["331"] = 299,["332"] = 299,["333"] = 299,["334"] = 300,["335"] = 300,["337"] = 301,["338"] = 302,["339"] = 303,["340"] = 304,["341"] = 304,["342"] = 304,["343"] = 304,["344"] = 305,["346"] = 307,["349"] = 310,["350"] = 310,["351"] = 310,["352"] = 310,["353"] = 310,["354"] = 311,["358"] = 315,["359"] = 316,["360"] = 317,["361"] = 317,["362"] = 317,["363"] = 317,["364"] = 318,["366"] = 320,["367"] = 321,["368"] = 321,["369"] = 321,["370"] = 321,["371"] = 322,["373"] = 324,["376"] = 327,["377"] = 328,["378"] = 329,["379"] = 329,["380"] = 329,["381"] = 329,["382"] = 330,["384"] = 332,["385"] = 333,["386"] = 333,["387"] = 333,["388"] = 333,["389"] = 335,["390"] = 335,["391"] = 336,["392"] = 336,["393"] = 337,["394"] = 337,["395"] = 338,["396"] = 338,["397"] = 339,["398"] = 339,["400"] = 341,["402"] = 343,["406"] = 347,["407"] = 347,["408"] = 347,["409"] = 347,["410"] = 348,["413"] = 352,["414"] = 278,["415"] = 355,["416"] = 356,["417"] = 355,["418"] = 362,["419"] = 363,["420"] = 365,["421"] = 365,["423"] = 366,["425"] = 362,["426"] = 370,["427"] = 371,["428"] = 373,["429"] = 374,["430"] = 376,["431"] = 377,["432"] = 382,["433"] = 382,["434"] = 382,["435"] = 382,["436"] = 382,["437"] = 383,["438"] = 370,["439"] = 7,["440"] = 7,["441"] = 7,["442"] = 6,["445"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_pudge_meat_hook_custom_722_followthrough = require("abilities.heroes.pudge.722.meat_hook.modifier_pudge_meat_hook_custom_722_followthrough")
local modifier_pudge_meat_hook_custom_722_followthrough = ____modifier_pudge_meat_hook_custom_722_followthrough.modifier_pudge_meat_hook_custom_722_followthrough
local ____modifier_pudge_meat_hook_custom_722 = require("abilities.heroes.pudge.722.meat_hook.modifier_pudge_meat_hook_custom_722")
local modifier_pudge_meat_hook_custom_722 = ____modifier_pudge_meat_hook_custom_722.modifier_pudge_meat_hook_custom_722
____exports.pudge_meat_hook_custom_722 = __TS__Class()
local pudge_meat_hook_custom_722 = ____exports.pudge_meat_hook_custom_722
pudge_meat_hook_custom_722.name = "pudge_meat_hook_custom_722"
__TS__ClassExtends(pudge_meat_hook_custom_722, CustomAbility)
function pudge_meat_hook_custom_722.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "pudge_meat_hook")
    self.projectileLocation = Vector(0, 0, 0)
    self.startPosition = Vector(0, 0, 0)
    self.targetPosition = Vector(0, 0, 0)
    self.hookOffset = Vector(0, 0, 96)
    self.chainAttached = false
    self.retracting = false
    self.heroStreak = 0
end
function pudge_meat_hook_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pudge.vsndevts")
end
function pudge_meat_hook_custom_722.prototype.OnAbilityPhaseStart(self)
    self:GetCaster():StartGesture(ACT_DOTA_OVERRIDE_ABILITY_1)
    return true
end
function pudge_meat_hook_custom_722.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():RemoveGesture(ACT_DOTA_OVERRIDE_ABILITY_1)
end
function pudge_meat_hook_custom_722.prototype.OnOwnerDied(self)
    local caster = self:GetCaster()
    caster:RemoveGesture(ACT_DOTA_OVERRIDE_ABILITY_1)
    caster:RemoveGesture(ACT_DOTA_CHANNEL_ABILITY_1)
end
function pudge_meat_hook_custom_722.prototype.OnSpellStart(self)
    self.chainAttached = false
    if self.victim ~= nil then
        self.victim:InterruptMotionControllers(true)
    end
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local hookDistance = self:GetSpecialValueFor("hook_distance") + caster:GetCastRangeBonus()
    local hookSpeed = self:GetSpecialValueFor("hook_speed")
    local hookWidth = self:GetSpecialValueFor("hook_width")
    if caster:IsHero() then
        local ____opt_0 = caster:GetTogglableWearable(DOTA_LOADOUT_TYPE_WEAPON)
        if ____opt_0 ~= nil then
            ____opt_0:AddEffects(EF_NODRAW)
        end
    end
    local ____temp_2 = caster:GetOrigin()
    self.startPosition = ____temp_2
    self.projectileLocation = ____temp_2
    local direction = point:__sub(self.startPosition)
    direction.z = 0
    direction = direction:Normalized():__mul(hookDistance)
    self.targetPosition = self.startPosition:__add(direction)
    local followthroughDuration = hookDistance / hookSpeed * 0.65
    modifier_pudge_meat_hook_custom_722_followthrough:apply(caster, caster, self, {duration = followthroughDuration})
    self.hookOffset = Vector(0, 0, 96)
    local hookTarget = self.targetPosition:__add(self.hookOffset)
    local killSwitch = Vector(hookDistance / hookSpeed * 2, 0, 0)
    local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pudge/pudge_meathook.vpcf", caster)
    self.chainParticle = ParticleManager:CreateParticle(particleName, PATTACH_CUSTOMORIGIN, caster)
    ParticleManager:SetParticleAlwaysSimulate(self.chainParticle)
    ParticleManager:SetParticleControlEnt(
        self.chainParticle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_weapon_chain_rt",
        caster:GetOrigin():__add(self.hookOffset),
        true
    )
    ParticleManager:SetParticleControl(self.chainParticle, 1, hookTarget)
    ParticleManager:SetParticleControl(
        self.chainParticle,
        2,
        Vector(hookSpeed, hookDistance, hookWidth)
    )
    ParticleManager:SetParticleControl(self.chainParticle, 3, killSwitch)
    ParticleManager:SetParticleControl(
        self.chainParticle,
        4,
        Vector(1, 0, 0)
    )
    ParticleManager:SetParticleControl(
        self.chainParticle,
        5,
        Vector(0, 0, 0)
    )
    ParticleManager:SetParticleControlEnt(
        self.chainParticle,
        7,
        caster,
        PATTACH_CUSTOMORIGIN,
        nil,
        caster:GetOrigin():__add(self.hookOffset),
        true
    )
    caster:EmitSound(caster:HasPersona("npc_dota_hero_pudge") and "Hero_Pudge.Hook.Cast.Persona" or "Hero_Pudge.AttackHookExtend")
    local projectileInfo = {
        Ability = self,
        Source = caster,
        vSpawnOrigin = caster:GetOrigin(),
        vVelocity = direction:Normalized():__mul(hookSpeed),
        fDistance = hookDistance,
        fStartRadius = hookWidth,
        fEndRadius = hookWidth,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_BOTH,
        iUnitTargetType = bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        iUnitTargetFlags = bit.bor(DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS)
    }
    ProjectileManager:CreateLinearProjectile(projectileInfo)
    self.retracting = false
    self.victim = nil
end
function pudge_meat_hook_custom_722.prototype.OnProjectileThink(self, location)
    self.projectileLocation = location
end
function pudge_meat_hook_custom_722.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if target == caster then
        return false
    end
    if self.retracting == false then
        if target ~= nil and not (target:IsCreep() or target:IsConsideredHero()) then
            Msg("Target was invalid")
            return false
        end
        local targetPulled = false
        if target ~= nil then
            EmitSoundOn(
                caster:HasPersona("npc_dota_hero_pudge") and "Hero_Pudge.Hook.Target.Persona" or "Hero_Pudge.AttackHookImpact",
                target
            )
            modifier_pudge_meat_hook_custom_722:apply(target, caster, self, {})
            if target:GetTeamNumber() ~= caster:GetTeamNumber() then
                local damageTable = {
                    attacker = caster,
                    damage = self:GetSpecialValueFor("damage"),
                    damage_type = DAMAGE_TYPE_PURE,
                    victim = target,
                    ability = self
                }
                ApplyDamage(damageTable)
                target:Interrupt()
                local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pudge/pudge_meathook_impact.vpcf", caster)
                local particle = ParticleManager:CreateParticle(particleName, PATTACH_CUSTOMORIGIN, target)
                ParticleManager:SetParticleControlEnt(
                    particle,
                    0,
                    target,
                    PATTACH_POINT_FOLLOW,
                    "attach_hitloc",
                    caster:GetOrigin(),
                    true
                )
                ParticleManager:ReleaseParticleIndex(particle)
            end
            AddFOWViewer(
                caster:GetTeamNumber(),
                target:GetOrigin(),
                self:GetSpecialValueFor("vision_radius"),
                self:GetSpecialValueFor("vision_duration"),
                false
            )
            self.victim = target
            targetPulled = true
            if caster:GetUnitName() == "npc_dota_hero_pudge" then
                self:EmitTargetPhrase(target)
                if caster:HasArcana() then
                    if target:IsHero() and target:GetTeamNumber() ~= caster:GetTeamNumber() then
                        self.heroStreak = self.heroStreak + 1
                        if self.heroStreak > 1 then
                            self:PlayStreakEffect()
                            self:EmitSoundStreak()
                        end
                    elseif target:IsCreep() then
                        self.heroStreak = 0
                        self:EmitLoseStreakPhrase()
                    end
                end
            end
        end
        local hookPosition = self.targetPosition
        local pad = caster:GetPaddedCollisionRadius()
        if target ~= nil then
            hookPosition = target:GetOrigin()
            pad = pad + target:GetPaddedCollisionRadius()
        end
        local velocity = self.startPosition:__sub(hookPosition)
        velocity.z = 0
        local distance = velocity:Length2D() - pad
        velocity = velocity:Normalized():__mul(self:GetSpecialValueFor("hook_speed"))
        local projectileInfo = {
            Ability = self,
            Source = caster,
            vSpawnOrigin = hookPosition,
            vVelocity = velocity,
            fDistance = distance
        }
        ProjectileManager:CreateLinearProjectile(projectileInfo)
        self.projectileLocation = hookPosition
        if target ~= nil and not target:IsInvisible() and targetPulled then
            ParticleManager:SetParticleControlEnt(
                self.chainParticle,
                1,
                target,
                PATTACH_POINT_FOLLOW,
                "attach_hitloc",
                target:GetOrigin():__add(self.hookOffset),
                true
            )
            ParticleManager:SetParticleControl(
                self.chainParticle,
                4,
                Vector(0, 0, 0)
            )
            ParticleManager:SetParticleControl(
                self.chainParticle,
                5,
                Vector(1, 0, 0)
            )
        else
            ParticleManager:SetParticleControlEnt(
                self.chainParticle,
                1,
                caster,
                PATTACH_POINT_FOLLOW,
                "attach_weapon_chain_rt",
                caster:GetOrigin():__add(self.hookOffset),
                true
            )
        end
        if target then
            target:EmitSound(caster:HasPersona("npc_dota_hero_pudge") and "Hero_Pudge.Hook.Retract.Persona" or "Hero_Pudge.AttackHookRetract")
        end
        if caster:IsAlive() then
            caster:FadeGesture(ACT_DOTA_OVERRIDE_ABILITY_1)
            caster:StartGesture(ACT_DOTA_CHANNEL_ABILITY_1)
        end
        self.retracting = true
        if not targetPulled then
            self.heroStreak = 0
        end
        if caster:GetUnitName() == "npc_dota_hero_pudge" then
            if caster:HasArcana() then
                self:EmitLoseStreakPhrase()
            else
                self:EmitTargetPhrase(nil)
            end
        end
    else
        if caster:IsHero() then
            local ____opt_3 = caster:GetTogglableWearable(DOTA_LOADOUT_TYPE_WEAPON)
            if ____opt_3 ~= nil then
                ____opt_3:RemoveEffects(EF_NODRAW)
            end
        end
        if self.victim ~= nil then
            local finalHookPosition = location
            self.victim:InterruptMotionControllers(true)
            self.victim:RemoveModifierByName(modifier_pudge_meat_hook_custom_722.name)
            local victimPosCheck = self.victim:GetOrigin():__sub(finalHookPosition)
            local pad = caster:GetPaddedCollisionRadius() + self.victim:GetPaddedCollisionRadius()
            if victimPosCheck:Length2D() > pad then
                FindClearSpaceForUnit(self.victim, self.startPosition, false)
            end
        end
        self.victim = nil
        ParticleManager:DestroyParticle(self.chainParticle, true)
        caster:EmitSound("Hero_Pudge.AttackHookRetractStop")
        caster:StopSound(caster:HasPersona("npc_dota_hero_pudge") and "Hero_Pudge.Hook.Cast.Persona" or "Hero_Pudge.AttackHookExtend")
    end
    return true
end
function pudge_meat_hook_custom_722.prototype.EmitTargetPhrase(self, target)
    local caster = self:GetCaster()
    local soundName = ""
    if target then
        if target:IsHero() then
            if caster:HasArcana("npc_dota_hero_pudge") then
                local random = RollVoiceLines(
                    nil,
                    __TS__Spread(range(nil, 1, 21))
                )
                soundName = "pudge_pud_arc_ability_hook_" .. random
            elseif caster:HasPersona("npc_dota_hero_pudge") then
                local random = RollVoiceLines(
                    nil,
                    __TS__Spread(range(nil, 1, 22))
                )
                if random == "01" then
                    random = "01_02"
                elseif random == "10" then
                    random = "10_02"
                end
                soundName = "pudge_toy_pug_ability_hook_" .. random
            else
                local ____RollVoiceLines_6 = RollVoiceLines
                local ____array_5 = __TS__SparseArrayNew(
                    nil,
                    __TS__Spread(range(nil, 1, 4))
                )
                __TS__SparseArrayPush(
                    ____array_5,
                    __TS__Spread(range(nil, 6, 10))
                )
                local random = ____RollVoiceLines_6(__TS__SparseArraySpread(____array_5))
                soundName = "pudge_pud_ability_hook_" .. random
            end
        elseif target:IsCreep() then
            if caster:HasArcana("npc_dota_hero_pudge") then
                local random = RollVoiceLines(
                    nil,
                    __TS__Spread(range(nil, 1, 9))
                )
                if random == "09" and RollPercentage(50) then
                    random = "09_01"
                end
                soundName = "pudge_pud_arc_ability_hook_miss_" .. random
            elseif caster:HasPersona("npc_dota_hero_pudge") then
                if RollPercentage(90) then
                    local random = RollVoiceLines(
                        nil,
                        __TS__Spread(range(nil, 1, 10))
                    )
                    soundName = "pudge_toy_pug_ability_hook_miss_" .. random
                else
                    soundName = "pudge_toy_pug_getoff_02"
                end
            else
                local random = RollVoiceLines(
                    nil,
                    1,
                    __TS__Spread(range(nil, 3, 10))
                )
                soundName = "pudge_pud_ability_hook_miss_" .. random
            end
        end
    else
        if caster:HasArcana("npc_dota_hero_pudge") then
            if RollPercentage(63) then
                local random = RollVoiceLines(
                    nil,
                    __TS__Spread(range(nil, 10, 20))
                )
                soundName = "pudge_pud_arc_ability_hook_miss_" .. random
            else
                if RollPercentage(80) then
                    local random = RollVoiceLines(
                        nil,
                        __TS__Spread(range(nil, 1, 5))
                    )
                    soundName = "pudge_pud_arc_anger_" .. random
                else
                    soundName = "pudge_pud_arc_getoff_01"
                end
            end
        elseif caster:HasPersona("npc_dota_hero_pudge") then
            if RollPercentage(54) then
                local random = RollVoiceLines(
                    nil,
                    __TS__Spread(range(nil, 11, 23))
                )
                soundName = "pudge_toy_pug_ability_hook_miss_" .. random
            else
                if RollPercentage(90) then
                    local random = RollVoiceLines(
                        nil,
                        __TS__Spread(range(nil, 1, 5))
                    )
                    if random == "01" and RollPercentage(33) then
                        random = "01_02"
                    elseif random == "01" and RollPercentage(33) then
                        random = "01_03"
                    elseif random == "02" and RollPercentage(50) then
                        random = "02_03"
                    elseif random == "03" and RollPercentage(50) then
                        random = "03_02"
                    elseif random == "05" and RollPercentage(50) then
                        random = "05_02"
                    end
                    soundName = "pudge_toy_pug_anger_" .. random
                else
                    soundName = "pudge_toy_pug_getoff_01"
                end
            end
        else
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 5))
            )
            soundName = "pudge_pud_anger_" .. random
        end
    end
    caster:EmitSoundOnClient(soundName)
end
function pudge_meat_hook_custom_722.prototype.EmitSoundStreak(self)
    local caster = self:GetCaster()
end
function pudge_meat_hook_custom_722.prototype.EmitLoseStreakPhrase(self)
    local caster = self:GetCaster()
    if self.heroStreak == 0 then
        self:EmitTargetPhrase(nil)
    else
        self:EmitTargetPhrase(nil)
    end
end
function pudge_meat_hook_custom_722.prototype.PlayStreakEffect(self)
    local caster = self:GetCaster()
    local stack_10 = math.floor(self.heroStreak / 10)
    caster:EmitSound("Hero.Pudge.Arcana.Streak")
    local particleName = ParticleManager:GetParticleReplacement("particles/econ/items/pudge/pudge_arcana/pudge_arcana_hook_streak.vpcf", caster)
    local particle_counter = ParticleManager:CreateParticle(particleName, PATTACH_OVERHEAD_FOLLOW, caster)
    ParticleManager:SetParticleControl(
        particle_counter,
        2,
        Vector(stack_10, self.heroStreak - stack_10 * 10, self.heroStreak)
    )
    ParticleManager:ReleaseParticleIndex(particle_counter)
end
pudge_meat_hook_custom_722 = __TS__Decorate(
    pudge_meat_hook_custom_722,
    pudge_meat_hook_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "pudge_meat_hook_custom_722"}
)
____exports.pudge_meat_hook_custom_722 = pudge_meat_hook_custom_722
return ____exports
