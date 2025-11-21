local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 4,["22"] = 8,["23"] = 9,["24"] = 10,["25"] = 8,["26"] = 13,["27"] = 14,["28"] = 15,["29"] = 17,["30"] = 18,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 31,["48"] = 31,["49"] = 31,["50"] = 31,["51"] = 31,["52"] = 43,["53"] = 45,["54"] = 45,["55"] = 45,["56"] = 46,["57"] = 47,["58"] = 49,["59"] = 50,["60"] = 51,["62"] = 53,["63"] = 54,["65"] = 57,["66"] = 58,["68"] = 45,["69"] = 45,["70"] = 62,["71"] = 63,["72"] = 63,["73"] = 63,["74"] = 63,["75"] = 63,["76"] = 63,["77"] = 63,["78"] = 65,["79"] = 66,["80"] = 71,["81"] = 73,["82"] = 77,["83"] = 79,["84"] = 79,["85"] = 79,["86"] = 79,["87"] = 79,["88"] = 79,["89"] = 79,["90"] = 79,["91"] = 88,["92"] = 95,["93"] = 96,["94"] = 96,["96"] = 98,["97"] = 100,["100"] = 102,["101"] = 104,["102"] = 105,["103"] = 106,["104"] = 107,["106"] = 109,["107"] = 109,["108"] = 109,["109"] = 109,["110"] = 109,["111"] = 109,["112"] = 109,["113"] = 109,["116"] = 112,["117"] = 113,["119"] = 115,["122"] = 119,["123"] = 13,["124"] = 122,["125"] = 123,["128"] = 125,["129"] = 127,["130"] = 128,["131"] = 130,["134"] = 132,["135"] = 133,["136"] = 134,["138"] = 136,["139"] = 136,["140"] = 136,["141"] = 136,["142"] = 136,["143"] = 136,["144"] = 136,["146"] = 139,["148"] = 122,["149"] = 5,["150"] = 5,["151"] = 5,["152"] = 4,["155"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_techies_suicide_custom_684 = require("abilities.heroes.techies.684.suicide.modifier_techies_suicide_custom_684")
local modifier_techies_suicide_custom_684 = ____modifier_techies_suicide_custom_684.modifier_techies_suicide_custom_684
____exports.techies_suicide_custom_684 = __TS__Class()
local techies_suicide_custom_684 = ____exports.techies_suicide_custom_684
techies_suicide_custom_684.name = "techies_suicide_custom_684"
__TS__ClassExtends(techies_suicide_custom_684, BaseAbility)
function techies_suicide_custom_684.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.dead = false
end
function techies_suicide_custom_684.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_suicide_custom_684.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local small_radius = self:GetSpecialValueFor("small_radius")
    local big_radius = self:GetSpecialValueFor("big_radius")
    local vision_radius = self:GetSpecialValueFor("vision_radius")
    local damage = self:GetSpecialValueFor("damage")
    local partial_damage = self:GetSpecialValueFor("partial_damage")
    local damageTable = {
        attacker = caster,
        victim = nil,
        damage = damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        ability = self
    }
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        big_radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
        FIND_ANY_ORDER,
        false
    )
    local enemy_died = false
    __TS__ArrayForEach(
        enemies,
        function(____, enemy)
            damageTable.damage = damage
            damageTable.victim = enemy
            local distance = origin:__sub(enemy:GetAbsOrigin()):Length2D()
            if distance <= small_radius then
                ApplyDamage(damageTable)
            else
                damageTable.damage = partial_damage
                ApplyDamage(damageTable)
            end
            if not enemy_died and not enemy:IsAlive() then
                enemy_died = true
            end
        end
    )
    GridNav:DestroyTreesAroundPoint(origin, big_radius, false)
    AddFOWViewer(
        caster:GetTeamNumber(),
        origin,
        vision_radius,
        2,
        false
    )
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_techies/techies_suicide.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN, caster)
    ParticleManager:ReleaseParticleIndex(particle)
    local sound_name = caster:HasArcana("npc_dota_hero_techies") and "Hero_Techies.Suicide.Arcana" or "Hero_Techies.Suicide"
    caster:EmitSound(sound_name)
    local selfDamageTable = {
        attacker = caster,
        victim = caster,
        damage = caster:GetHealth(),
        damage_type = DAMAGE_TYPE_PURE,
        ability = self,
        damage_flags = DOTA_DAMAGE_FLAG_HPLOSS
    }
    local modifier = modifier_techies_suicide_custom_684:apply(caster, caster, self, {})
    ApplyDamage(selfDamageTable)
    if caster:IsAlive() then
        caster:ForceKill(false)
    end
    modifier:Destroy()
    if caster:GetUnitName() ~= "npc_dota_hero_techies" then
        return
    end
    self.dead = true
    local response = "techies_tech_suicidesquad_"
    if enemy_died then
        if RollPercentage(15) then
            response = response .. 14
        else
            response = response .. RollVoiceLines(
                nil,
                2,
                3,
                6,
                11,
                12
            )
        end
    else
        if RollPercentage(15) then
            response = response .. RollVoiceLines(nil, 1, 8)
        else
            response = response .. RollVoiceLines(nil, 4, 9, 13)
        end
    end
    caster:EmitSoundOnClient(response)
end
function techies_suicide_custom_684.prototype.OnOwnerSpawned(self)
    if not IsServer() then
        return
    end
    local caster = self:GetCaster()
    if self.dead and caster:GetUnitName() ~= "npc_dota_hero_techies" then
        self.dead = false
        if not RollPercentage(75) then
            return
        end
        local response
        if RollPercentage(20) then
            response = "techies_tech_respawn_01"
        else
            response = "techies_tech_respawn_ssa_" .. RollVoiceLines(
                nil,
                1,
                2,
                3,
                4
            )
        end
        caster:EmitSoundOnClient(response)
    end
end
techies_suicide_custom_684 = __TS__Decorate(
    techies_suicide_custom_684,
    techies_suicide_custom_684,
    {registerAbility(nil)},
    {kind = "class", name = "techies_suicide_custom_684"}
)
____exports.techies_suicide_custom_684 = techies_suicide_custom_684
return ____exports
