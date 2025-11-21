local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 8,["25"] = 8,["26"] = 9,["27"] = 14,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 18,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["39"] = 27,["40"] = 23,["41"] = 30,["42"] = 31,["43"] = 32,["45"] = 34,["46"] = 30,["47"] = 37,["48"] = 38,["49"] = 37,["50"] = 41,["51"] = 42,["52"] = 43,["53"] = 44,["54"] = 46,["55"] = 50,["56"] = 52,["57"] = 53,["58"] = 55,["59"] = 56,["60"] = 56,["61"] = 56,["62"] = 56,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["71"] = 68,["72"] = 68,["74"] = 70,["76"] = 73,["77"] = 73,["78"] = 73,["79"] = 74,["80"] = 73,["81"] = 73,["82"] = 84,["83"] = 86,["84"] = 41,["85"] = 89,["86"] = 90,["87"] = 92,["88"] = 92,["89"] = 92,["90"] = 93,["91"] = 92,["92"] = 92,["93"] = 95,["94"] = 89,["95"] = 98,["96"] = 99,["97"] = 101,["98"] = 103,["99"] = 103,["100"] = 103,["101"] = 103,["102"] = 103,["103"] = 105,["104"] = 106,["105"] = 106,["106"] = 106,["107"] = 106,["108"] = 106,["109"] = 106,["110"] = 106,["111"] = 106,["112"] = 106,["113"] = 106,["114"] = 106,["115"] = 106,["116"] = 119,["117"] = 119,["118"] = 119,["119"] = 120,["120"] = 120,["121"] = 120,["122"] = 120,["123"] = 120,["124"] = 120,["125"] = 120,["126"] = 120,["127"] = 120,["128"] = 131,["129"] = 133,["130"] = 134,["131"] = 134,["132"] = 134,["133"] = 134,["134"] = 139,["135"] = 119,["136"] = 119,["137"] = 98,["138"] = 143,["139"] = 144,["142"] = 146,["143"] = 147,["146"] = 149,["147"] = 143,["148"] = 152,["149"] = 153,["150"] = 155,["153"] = 157,["154"] = 159,["155"] = 160,["156"] = 161,["157"] = 162,["159"] = 165,["160"] = 167,["163"] = 169,["164"] = 170,["168"] = 173,["169"] = 174,["170"] = 180,["171"] = 180,["172"] = 180,["173"] = 180,["174"] = 180,["175"] = 180,["176"] = 180,["177"] = 180,["178"] = 180,["179"] = 180,["180"] = 181,["182"] = 184,["183"] = 184,["184"] = 184,["185"] = 184,["186"] = 184,["187"] = 184,["188"] = 184,["189"] = 191,["190"] = 193,["191"] = 193,["192"] = 193,["193"] = 194,["196"] = 196,["197"] = 197,["198"] = 198,["199"] = 199,["201"] = 201,["202"] = 201,["203"] = 201,["204"] = 201,["205"] = 202,["206"] = 203,["207"] = 204,["209"] = 206,["210"] = 206,["211"] = 206,["212"] = 206,["215"] = 193,["216"] = 193,["217"] = 211,["218"] = 152,["219"] = 221,["220"] = 222,["221"] = 223,["224"] = 225,["225"] = 225,["226"] = 225,["227"] = 225,["228"] = 225,["229"] = 225,["230"] = 225,["231"] = 227,["232"] = 231,["233"] = 221,["234"] = 234,["235"] = 235,["236"] = 236,["239"] = 238,["240"] = 240,["241"] = 241,["242"] = 242,["243"] = 243,["244"] = 243,["245"] = 243,["246"] = 243,["247"] = 243,["248"] = 243,["249"] = 243,["251"] = 245,["253"] = 248,["254"] = 252,["255"] = 234,["256"] = 255,["257"] = 256,["258"] = 257,["261"] = 259,["262"] = 259,["263"] = 259,["264"] = 259,["265"] = 259,["266"] = 261,["267"] = 265,["268"] = 255,["269"] = 8,["270"] = 8,["271"] = 8,["272"] = 7,["275"] = 8});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_sniper_assassinate_custom_722_target = require("abilities.heroes.sniper.722.assassinate.modifier_sniper_assassinate_custom_722_target")
local modifier_sniper_assassinate_custom_722_target = ____modifier_sniper_assassinate_custom_722_target.modifier_sniper_assassinate_custom_722_target
local ____modifier_sniper_assassinate_custom_722_thinker = require("abilities.heroes.sniper.722.assassinate.modifier_sniper_assassinate_custom_722_thinker")
local modifier_sniper_assassinate_custom_722_thinker = ____modifier_sniper_assassinate_custom_722_thinker.modifier_sniper_assassinate_custom_722_thinker
local ____modifier_sniper_assassinate_custom_722_attack = require("abilities.heroes.sniper.722.assassinate.modifier_sniper_assassinate_custom_722_attack")
local modifier_sniper_assassinate_custom_722_attack = ____modifier_sniper_assassinate_custom_722_attack.modifier_sniper_assassinate_custom_722_attack
____exports.sniper_assassinate_custom_722 = __TS__Class()
local sniper_assassinate_custom_722 = ____exports.sniper_assassinate_custom_722
sniper_assassinate_custom_722.name = "sniper_assassinate_custom_722"
__TS__ClassExtends(sniper_assassinate_custom_722, CustomAbility)
function sniper_assassinate_custom_722.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "sniper_assassinate")
    self.targets = {}
end
function sniper_assassinate_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_sniper.vsndevts")
end
function sniper_assassinate_custom_722.prototype.GetBehavior(self)
    if self:GetCaster():HasScepter() then
        return bit.bor(
            bit.bor(DOTA_ABILITY_BEHAVIOR_POINT, DOTA_ABILITY_BEHAVIOR_AOE),
            DOTA_ABILITY_BEHAVIOR_NORMAL_WHEN_STOLEN
        )
    end
    return bit.bor(DOTA_ABILITY_BEHAVIOR_UNIT_TARGET, DOTA_ABILITY_BEHAVIOR_NORMAL_WHEN_STOLEN)
end
function sniper_assassinate_custom_722.prototype.GetAOERadius(self)
    if self:GetCaster():HasScepter() then
        return self:GetSpecialValueFor("scepter_radius")
    end
    return 0
end
function sniper_assassinate_custom_722.prototype.GetCastPoint(self)
    return self:GetSpecialValueFor("cast_point")
end
function sniper_assassinate_custom_722.prototype.OnAbilityPhaseStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local point = self:GetCursorPosition()
    local sound = caster:HasWearable("models/items/sniper/machine_gun_charlie/machine_gun_charlie.vmdl") and "Ability.MKG_AssassinateLoad" or "Ability.AssassinateLoad"
    caster:EmitSound(sound)
    local rate = 2 / self:GetCastPoint()
    caster:StartGestureWithPlaybackRate(ACT_DOTA_CAST_ABILITY_4, rate)
    if caster:HasScepter() then
        self.targets = FindUnitsInRadius(
            caster:GetTeamNumber(),
            point,
            nil,
            self:GetSpecialValueFor("scepter_radius"),
            DOTA_UNIT_TARGET_TEAM_ENEMY,
            bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
            bit.bor(DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, DOTA_UNIT_TARGET_FLAG_NO_INVIS),
            FIND_CLOSEST,
            false
        )
    else
        if not target then
            return false
        end
        self.targets = {target}
    end
    __TS__ArrayForEach(
        self.targets,
        function(____, enemy)
            modifier_sniper_assassinate_custom_722_target:apply(enemy, caster, self, {duration = 5})
        end
    )
    self:EmitCastResponse()
    return true
end
function sniper_assassinate_custom_722.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():FadeGesture(ACT_DOTA_CAST_ABILITY_4)
    __TS__ArrayForEach(
        self.targets,
        function(____, enemy)
            enemy:RemoveModifierByName(modifier_sniper_assassinate_custom_722_target.name)
        end
    )
    self.targets = {}
end
function sniper_assassinate_custom_722.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:FadeGesture(ACT_DOTA_CAST_ABILITY_4)
    EmitSoundOnLocationWithCaster(
        caster:GetAbsOrigin(),
        "Ability.Assassinate",
        caster
    )
    local projectile_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_sniper/sniper_assassinate.vpcf", caster)
    local info = {
        EffectName = projectile_name,
        Ability = self,
        Source = caster,
        bDodgeable = true,
        vSourceLoc = caster:GetAbsOrigin(),
        iMoveSpeed = 2500,
        iVisionRadius = 100,
        iVisionTeamNumber = caster:GetAbsOrigin(),
        bProvidesVision = true,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
    }
    __TS__ArrayForEach(
        self.targets,
        function(____, target)
            local sound_thinker = CreateModifierThinker(
                caster,
                self,
                modifier_sniper_assassinate_custom_722_thinker.name,
                {duration = 1.2},
                caster:GetAbsOrigin(),
                caster:GetTeamNumber(),
                false
            )
            sound_thinker:EmitSound("Hero_Sniper.AssassinateProjectile")
            info.Target = target
            info.ExtraData = {
                thinker = sound_thinker:entindex(),
                scepter = caster:HasScepter()
            }
            ProjectileManager:CreateTrackingProjectile(info)
        end
    )
end
function sniper_assassinate_custom_722.prototype.OnProjectileThink_ExtraData(self, location, extraData)
    if not IsServer() then
        return
    end
    local thinker = EntIndexToHScript(extraData.thinker)
    if not thinker or thinker:IsNull() then
        return
    end
    thinker:SetAbsOrigin(location)
end
function sniper_assassinate_custom_722.prototype.OnProjectileHit_ExtraData(self, target, location, extraData)
    local caster = self:GetCaster()
    if not target then
        return
    end
    target:RemoveModifierByName(modifier_sniper_assassinate_custom_722_target.name)
    local thinker = EntIndexToHScript(extraData.thinker)
    if thinker and not thinker:IsNull() then
        thinker:StopSound("Hero_Sniper.AssassinateProjectile")
        UTIL_Remove(thinker)
    end
    target:EmitSound("Hero_Sniper.AssassinateDamage")
    if target:IsMagicImmune() then
        return
    end
    if extraData.scepter == 0 then
        if target:TriggerSpellAbsorb(self) then
            return
        end
    end
    if caster:HasScepter() then
        local modifier = modifier_sniper_assassinate_custom_722_attack:apply(caster, caster, self, {})
        caster:PerformAttack(
            target,
            true,
            true,
            true,
            true,
            false,
            false,
            true
        )
        modifier:Destroy()
    end
    local damageTable = {
        attacker = caster,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    Timers:CreateTimer(
        FrameTime(),
        function()
            if not target or target:IsNull() then
                return
            end
            if target:IsHero() then
                if not target:IsAlive() then
                    if self.targetKilledTimer then
                        Timers:RemoveTimer(self.targetKilledTimer)
                    end
                    self.targetKilledTimer = Timers:CreateTimer(
                        RandomFloat(2.5, 3),
                        function() return self:EmitKillResponse() end
                    )
                elseif target:GetHealthPercent() < 11 then
                    if self.targetSurviveTimer then
                        Timers:RemoveTimer(self.targetSurviveTimer)
                    end
                    self.targetSurviveTimer = Timers:CreateTimer(
                        RandomFloat(0.7, 1),
                        function() return self:EmitTargetSurviveResponse() end
                    )
                end
            end
        end
    )
    target:AddNewModifier(caster, self, "modifier_stunned", {duration = 0.03})
end
function sniper_assassinate_custom_722.prototype.EmitCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_sniper" then
        return
    end
    local response = "snip_ability_assass_" .. RollVoiceLines(
        nil,
        2,
        6,
        7,
        8
    )
    local part = caster:HasWearable("models/items/sniper/scifi_sniper_test_gun/scifi_sniper_test_gun.vmdl") and "sniper_helmet_" or "sniper_"
    caster:EmitSoundOnClient(part .. response)
end
function sniper_assassinate_custom_722.prototype.EmitKillResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_sniper" then
        return
    end
    local response = ""
    if RollPercentage(33.33) then
        response = "snip_ability_assass_" .. RollVoiceLines(nil, 3, 4, 5)
    elseif RollPercentage(44.44) then
        response = "snip_kill_" .. RollVoiceLines(
            nil,
            3,
            8,
            10,
            13
        )
    else
        response = "snip_tf2_" .. RollVoiceLines(nil, 1, 2)
    end
    local part = caster:HasWearable("models/items/sniper/scifi_sniper_test_gun/scifi_sniper_test_gun.vmdl") and "sniper_helmet_" or "sniper_"
    caster:EmitSoundOnClient(part .. response)
end
function sniper_assassinate_custom_722.prototype.EmitTargetSurviveResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_sniper" then
        return
    end
    local response = "snip_ability_fail_" .. RollVoiceLines(
        nil,
        2,
        __TS__Spread(range(nil, 4, 8))
    )
    local part = caster:HasWearable("models/items/sniper/scifi_sniper_test_gun/scifi_sniper_test_gun.vmdl") and "sniper_helmet_" or "sniper_"
    caster:EmitSoundOnClient(part .. response)
end
sniper_assassinate_custom_722 = __TS__Decorate(
    sniper_assassinate_custom_722,
    sniper_assassinate_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "sniper_assassinate_custom_722"}
)
____exports.sniper_assassinate_custom_722 = sniper_assassinate_custom_722
return ____exports
