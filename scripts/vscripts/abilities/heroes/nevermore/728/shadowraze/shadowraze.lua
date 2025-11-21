local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 6,["19"] = 6,["20"] = 6,["21"] = 6,["22"] = 6,["23"] = 6,["24"] = 6,["25"] = 12,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 19,["30"] = 18,["31"] = 19,["32"] = 19,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 23,["37"] = 28,["38"] = 29,["39"] = 28,["40"] = 32,["41"] = 33,["42"] = 35,["43"] = 36,["44"] = 37,["45"] = 39,["46"] = 40,["47"] = 41,["48"] = 42,["49"] = 44,["50"] = 44,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 44,["56"] = 44,["57"] = 44,["58"] = 44,["59"] = 44,["60"] = 56,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 58,["65"] = 59,["66"] = 63,["67"] = 57,["68"] = 57,["69"] = 66,["70"] = 67,["72"] = 76,["75"] = 80,["76"] = 80,["77"] = 80,["78"] = 81,["79"] = 82,["80"] = 86,["81"] = 86,["82"] = 86,["83"] = 86,["84"] = 86,["85"] = 86,["86"] = 86,["87"] = 94,["88"] = 96,["89"] = 97,["90"] = 97,["91"] = 97,["92"] = 97,["93"] = 97,["94"] = 97,["96"] = 106,["97"] = 107,["99"] = 80,["100"] = 80,["101"] = 111,["102"] = 113,["103"] = 113,["104"] = 113,["105"] = 114,["106"] = 115,["107"] = 113,["108"] = 113,["109"] = 118,["110"] = 119,["111"] = 120,["113"] = 122,["114"] = 123,["118"] = 128,["119"] = 128,["120"] = 128,["121"] = 128,["122"] = 130,["123"] = 134,["124"] = 32,["125"] = 137,["126"] = 138,["127"] = 140,["128"] = 142,["129"] = 143,["130"] = 147,["131"] = 152,["132"] = 153,["133"] = 153,["134"] = 153,["135"] = 153,["136"] = 153,["137"] = 154,["138"] = 156,["139"] = 137,["140"] = 160,["141"] = 161,["142"] = 160,["143"] = 161,["145"] = 161,["146"] = 162,["147"] = 161,["148"] = 161,["149"] = 161,["150"] = 160,["153"] = 161,["154"] = 167,["155"] = 168,["156"] = 167,["157"] = 168,["159"] = 168,["160"] = 169,["161"] = 168,["162"] = 168,["163"] = 168,["164"] = 167,["167"] = 168,["168"] = 174,["169"] = 175,["170"] = 174,["171"] = 175,["173"] = 175,["174"] = 176,["175"] = 175,["176"] = 175,["177"] = 175,["178"] = 174,["181"] = 175});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_nevermore_shadowraze_custom_728 = require("abilities.heroes.nevermore.728.shadowraze.modifier_nevermore_shadowraze_custom_728")
local modifier_nevermore_shadowraze_custom_728 = ____modifier_nevermore_shadowraze_custom_728.modifier_nevermore_shadowraze_custom_728
local ____modifier_nevermore_shadowraze_custom_728_counter = require("abilities.heroes.nevermore.728.shadowraze.modifier_nevermore_shadowraze_custom_728_counter")
local modifier_nevermore_shadowraze_custom_728_counter = ____modifier_nevermore_shadowraze_custom_728_counter.modifier_nevermore_shadowraze_custom_728_counter
local ShadowrazeType = ShadowrazeType or ({})
ShadowrazeType.NEAR = 0
ShadowrazeType[ShadowrazeType.NEAR] = "NEAR"
ShadowrazeType.MEDIUM = 1
ShadowrazeType[ShadowrazeType.MEDIUM] = "MEDIUM"
ShadowrazeType.FAR = 2
ShadowrazeType[ShadowrazeType.FAR] = "FAR"
local VOICE_LINES = {[ShadowrazeType.NEAR] = {7, 18, 21}, [ShadowrazeType.MEDIUM] = {8, 20, 22}, [ShadowrazeType.FAR] = {11, 19, 23}}
local Shadowraze = __TS__Class()
Shadowraze.name = "Shadowraze"
__TS__ClassExtends(Shadowraze, CustomAbility)
function Shadowraze.prototype.____constructor(self, abilityName, ____type)
    CustomAbility.prototype.____constructor(self, abilityName)
    self.type = ____type
end
function Shadowraze.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_nevermore.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_nevermore.vsndevts")
end
function Shadowraze.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("range")
end
function Shadowraze.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local distance = self:GetSpecialValueFor("range")
    local front = caster:GetForwardVector()
    local target_pos = caster:GetOrigin():__add(front:__mul(distance))
    local radius = self:GetSpecialValueFor("radius")
    local base_damage = self:GetSpecialValueFor("damage")
    local stack_damage = self:GetSpecialValueFor("stack_bonus_damage")
    local duration = self:GetSpecialValueFor("duration")
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        target_pos,
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )
    if caster:HasArcana("npc_dota_hero_nevermore") then
        local razeCounterFilter = __TS__ArraySome(
            enemies,
            function(____, enemy)
                local modifier = enemy:FindModifierByName(modifier_nevermore_shadowraze_custom_728.name)
                local stack = modifier ~= nil and modifier:GetStackCount() or 0
                return enemy:IsHero() and stack < 3
            end
        )
        if #enemies > 0 and razeCounterFilter then
            modifier_nevermore_shadowraze_custom_728_counter:apply(caster, caster, self, {duration = 3})
        else
            caster:RemoveModifierByName(modifier_nevermore_shadowraze_custom_728_counter.name)
        end
    end
    __TS__ArrayForEach(
        enemies,
        function(____, enemy)
            local modifier = enemy:FindModifierByName(modifier_nevermore_shadowraze_custom_728.name)
            local stack = modifier ~= nil and modifier:GetStackCount() or 0
            local damageTable = {
                attacker = caster,
                victim = enemy,
                damage = base_damage + stack_damage * stack,
                damage_type = DAMAGE_TYPE_MAGICAL,
                ability = self
            }
            ApplyDamage(damageTable)
            if modifier == nil then
                enemy:AddNewModifier(
                    caster,
                    self,
                    modifier_nevermore_shadowraze_custom_728.name,
                    {duration = enemy:CalculateDuration(caster, duration)}
                )
            else
                modifier:IncrementStackCount()
                modifier:ForceRefresh()
            end
        end
    )
    self:PlayEffects(target_pos, radius)
    local has_triple_raze = __TS__ArraySome(
        enemies,
        function(____, enemy)
            local modifier = enemy:FindModifierByName(modifier_nevermore_shadowraze_custom_728.name)
            return modifier ~= nil and modifier:GetStackCount() == 3
        end
    )
    if caster:HasArcana("npc_dota_hero_nevermore") then
        if has_triple_raze then
            caster:EmitSoundOnClient("nevermore_nev_arc_ability_shadow_" .. RollVoiceLines(nil, 24, 25))
            return
        elseif RollPercentage(15) then
            caster:EmitSoundOnClient("nevermore_nev_arc_ability_shadow_" .. RollVoiceLines(nil, 14, 17))
            return
        end
    end
    local voice_line = RollVoiceLines(
        nil,
        unpack(VOICE_LINES[self.type])
    )
    local response = (caster:HasArcana("npc_dota_hero_nevermore") and "nevermore_nev_arc_ability_shadow_" or "nevermore_nev_ability_shadow_") .. voice_line
    caster:EmitSoundOnClient(response)
end
function Shadowraze.prototype.PlayEffects(self, position, radius)
    local caster = self:GetCaster()
    local ground = GetGroundPosition(position, nil)
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_nevermore/nevermore_shadowraze.vpcf", caster)
    local sound_name = caster:HasArcana("npc_dota_hero_nevermore") and "Hero_Nevermore.Shadowraze.Arcana" or "Hero_Nevermore.Shadowraze"
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(particle, 0, ground)
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(radius, 1, 1)
    )
    ParticleManager:ReleaseParticleIndex(particle)
    EmitSoundOnLocationWithCaster(ground, sound_name, caster)
end
____exports.nevermore_shadowraze1_custom_728 = __TS__Class()
local nevermore_shadowraze1_custom_728 = ____exports.nevermore_shadowraze1_custom_728
nevermore_shadowraze1_custom_728.name = "nevermore_shadowraze1_custom_728"
__TS__ClassExtends(nevermore_shadowraze1_custom_728, Shadowraze)
function nevermore_shadowraze1_custom_728.prototype.____constructor(self)
    Shadowraze.prototype.____constructor(self, "nevermore_shadowraze1", ShadowrazeType.NEAR)
end
nevermore_shadowraze1_custom_728 = __TS__Decorate(
    nevermore_shadowraze1_custom_728,
    nevermore_shadowraze1_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "nevermore_shadowraze1_custom_728"}
)
____exports.nevermore_shadowraze1_custom_728 = nevermore_shadowraze1_custom_728
____exports.nevermore_shadowraze2_custom_728 = __TS__Class()
local nevermore_shadowraze2_custom_728 = ____exports.nevermore_shadowraze2_custom_728
nevermore_shadowraze2_custom_728.name = "nevermore_shadowraze2_custom_728"
__TS__ClassExtends(nevermore_shadowraze2_custom_728, Shadowraze)
function nevermore_shadowraze2_custom_728.prototype.____constructor(self)
    Shadowraze.prototype.____constructor(self, "nevermore_shadowraze2", ShadowrazeType.MEDIUM)
end
nevermore_shadowraze2_custom_728 = __TS__Decorate(
    nevermore_shadowraze2_custom_728,
    nevermore_shadowraze2_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "nevermore_shadowraze2_custom_728"}
)
____exports.nevermore_shadowraze2_custom_728 = nevermore_shadowraze2_custom_728
____exports.nevermore_shadowraze3_custom_728 = __TS__Class()
local nevermore_shadowraze3_custom_728 = ____exports.nevermore_shadowraze3_custom_728
nevermore_shadowraze3_custom_728.name = "nevermore_shadowraze3_custom_728"
__TS__ClassExtends(nevermore_shadowraze3_custom_728, Shadowraze)
function nevermore_shadowraze3_custom_728.prototype.____constructor(self)
    Shadowraze.prototype.____constructor(self, "nevermore_shadowraze3", ShadowrazeType.FAR)
end
nevermore_shadowraze3_custom_728 = __TS__Decorate(
    nevermore_shadowraze3_custom_728,
    nevermore_shadowraze3_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "nevermore_shadowraze3_custom_728"}
)
____exports.nevermore_shadowraze3_custom_728 = nevermore_shadowraze3_custom_728
return ____exports
