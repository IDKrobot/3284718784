local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 4,["21"] = 4,["22"] = 6,["23"] = 7,["24"] = 9,["25"] = 10,["26"] = 9,["27"] = 10,["28"] = 13,["29"] = 14,["30"] = 15,["31"] = 17,["32"] = 18,["33"] = 13,["34"] = 21,["35"] = 22,["36"] = 24,["37"] = 26,["38"] = 31,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 32,["53"] = 32,["54"] = 32,["55"] = 32,["56"] = 33,["57"] = 33,["58"] = 33,["59"] = 33,["60"] = 33,["61"] = 34,["62"] = 34,["63"] = 34,["64"] = 34,["65"] = 34,["66"] = 36,["67"] = 21,["68"] = 39,["69"] = 40,["70"] = 42,["71"] = 43,["72"] = 44,["74"] = 39,["75"] = 48,["76"] = 49,["77"] = 51,["78"] = 52,["79"] = 53,["81"] = 56,["82"] = 56,["83"] = 56,["84"] = 56,["85"] = 56,["86"] = 56,["87"] = 56,["88"] = 58,["89"] = 58,["90"] = 58,["91"] = 58,["92"] = 58,["93"] = 58,["94"] = 67,["95"] = 48,["96"] = 70,["97"] = 71,["98"] = 73,["99"] = 73,["100"] = 73,["101"] = 73,["102"] = 73,["103"] = 73,["104"] = 73,["105"] = 73,["106"] = 73,["107"] = 73,["108"] = 73,["109"] = 73,["110"] = 83,["111"] = 84,["114"] = 85,["117"] = 87,["118"] = 73,["119"] = 73,["120"] = 70,["121"] = 91,["122"] = 92,["123"] = 94,["124"] = 95,["125"] = 97,["126"] = 98,["128"] = 100,["130"] = 102,["131"] = 102,["132"] = 102,["133"] = 102,["134"] = 102,["135"] = 102,["136"] = 102,["137"] = 109,["138"] = 111,["139"] = 117,["140"] = 91,["141"] = 127,["142"] = 128,["143"] = 130,["146"] = 132,["147"] = 133,["150"] = 133,["154"] = 133,["156"] = 133,["157"] = 134,["158"] = 135,["159"] = 136,["161"] = 127,["162"] = 140,["163"] = 141,["164"] = 143,["167"] = 145,["168"] = 145,["169"] = 145,["170"] = 145,["171"] = 146,["172"] = 140,["173"] = 10,["174"] = 10,["175"] = 10,["176"] = 9,["179"] = 10});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_pangolier_gyroshell_custom_717 = require("abilities.heroes.pangolier.717.gyroshell.modifier_pangolier_gyroshell_custom_717")
local modifier_pangolier_gyroshell_custom_717 = ____modifier_pangolier_gyroshell_custom_717.modifier_pangolier_gyroshell_custom_717
local ____modifier_pangolier_gyroshell_custom_717_damage_cooldown = require("abilities.heroes.pangolier.717.gyroshell.modifier_pangolier_gyroshell_custom_717_damage_cooldown")
local modifier_pangolier_gyroshell_custom_717_damage_cooldown = ____modifier_pangolier_gyroshell_custom_717_damage_cooldown.modifier_pangolier_gyroshell_custom_717_damage_cooldown
local ____modifier_pangolier_gyroshell_custom_717_stun_knockback = require("abilities.heroes.pangolier.717.gyroshell.modifier_pangolier_gyroshell_custom_717_stun_knockback")
local modifier_pangolier_gyroshell_custom_717_stun_knockback = ____modifier_pangolier_gyroshell_custom_717_stun_knockback.modifier_pangolier_gyroshell_custom_717_stun_knockback
LinkLuaModifier("modifier_generic_knockback", "abilities/generic/modifier_generic_knockback.lua", LUA_MODIFIER_MOTION_BOTH)
LinkLuaModifier("modifier_generic_arc", "abilities/generic/modifier_generic_arc.lua", LUA_MODIFIER_MOTION_VERTICAL)
____exports.pangolier_gyroshell_custom_717 = __TS__Class()
local pangolier_gyroshell_custom_717 = ____exports.pangolier_gyroshell_custom_717
pangolier_gyroshell_custom_717.name = "pangolier_gyroshell_custom_717"
__TS__ClassExtends(pangolier_gyroshell_custom_717, BaseAbility)
function pangolier_gyroshell_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pangolier.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pangolier.vsndevts")
    context:AddResource("particles/units/heroes/hero_centaur/centaur_warstomp.vpcf")
    context:AddResource("particles/units/heroes/hero_techies/techies_blast_off_trail.vpcf")
end
function pangolier_gyroshell_custom_717.prototype.OnAbilityPhaseStart(self)
    local caster = self:GetCaster()
    caster:EmitSound("Hero_Pangolier.Gyroshell.Cast")
    self.particle_cast = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_gyroshell_cast.vpcf", PATTACH_CUSTOMORIGIN, caster)
    ParticleManager:SetParticleControlEnt(
        self.particle_cast,
        0,
        caster,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        self.particle_cast,
        3,
        caster,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlForward(
        self.particle_cast,
        0,
        caster:GetForwardVector()
    )
    ParticleManager:SetParticleControlForward(
        self.particle_cast,
        3,
        caster:GetForwardVector()
    )
    return true
end
function pangolier_gyroshell_custom_717.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():StopSound("Hero_Pangolier.Gyroshell.Cast")
    if self.particle_cast then
        ParticleManager:DestroyParticle(self.particle_cast, true)
        ParticleManager:ReleaseParticleIndex(self.particle_cast)
    end
end
function pangolier_gyroshell_custom_717.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    if self.particle_cast then
        ParticleManager:DestroyParticle(self.particle_cast, true)
        ParticleManager:ReleaseParticleIndex(self.particle_cast)
    end
    caster:Purge(
        false,
        true,
        false,
        false,
        false
    )
    modifier_pangolier_gyroshell_custom_717:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("duration")}
    )
    self:RollCastResponse()
end
function pangolier_gyroshell_custom_717.prototype.RollUpEnemies(self)
    local caster = self:GetCaster()
    __TS__ArrayForEach(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            caster:GetAbsOrigin(),
            nil,
            self:GetSpecialValueFor("hit_radius"),
            2,
            bit.bor(1, 18),
            0,
            1,
            false
        ),
        function(____, enemy)
            if enemy:HasModifier(modifier_pangolier_gyroshell_custom_717_damage_cooldown.name) then
                return
            end
            if enemy:IsRoshan() then
                return
            end
            self:DealDamage(enemy)
        end
    )
end
function pangolier_gyroshell_custom_717.prototype.DealDamage(self, target)
    local caster = self:GetCaster()
    local stun_duration = self:GetSpecialValueFor("stun_duration")
    local bounce_duration = self:GetSpecialValueFor("bounce_duration")
    if target:IsHero() then
        target:EmitSound("Hero_Pangolier.Gyroshell.Stun")
    else
        target:EmitSound("Hero_Pangolier.Gyroshell.Stun.Creep")
    end
    local damageTable = {
        attacker = caster,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    modifier_pangolier_gyroshell_custom_717_stun_knockback:apply(target, caster, self, {})
    modifier_pangolier_gyroshell_custom_717_damage_cooldown:apply(target, caster, self, {duration = stun_duration + bounce_duration})
end
function pangolier_gyroshell_custom_717.prototype.RollCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_pangolier" then
        return
    end
    if RollPercentage(50) then
        local ____RollVoiceLines_1 = RollVoiceLines
        local ____array_0 = __TS__SparseArrayNew(
            nil,
            __TS__Spread(range(nil, 1, 7))
        )
        __TS__SparseArrayPush(
            ____array_0,
            __TS__Spread(range(nil, 9, 12))
        )
        local response = ____RollVoiceLines_1(__TS__SparseArraySpread(____array_0))
        caster:EmitSoundOnClient("pangolin_pangolin_ability4_" .. response)
    elseif RollPercentage(30) then
        caster:EmitSoundOnClient("pangolin_pangolin_ability4_8")
    end
end
function pangolier_gyroshell_custom_717.prototype.RollCrashResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_pangolier" then
        return
    end
    local response = RollVoiceLines(
        nil,
        __TS__Spread(range(nil, 13, 20))
    )
    caster:EmitSoundOnClient("pangolin_pangolin_ability4_" .. response)
end
pangolier_gyroshell_custom_717 = __TS__Decorate(
    pangolier_gyroshell_custom_717,
    pangolier_gyroshell_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "pangolier_gyroshell_custom_717"}
)
____exports.pangolier_gyroshell_custom_717 = pangolier_gyroshell_custom_717
return ____exports
