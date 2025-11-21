local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 6,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 19,["29"] = 30,["30"] = 15,["31"] = 33,["32"] = 34,["33"] = 36,["34"] = 38,["35"] = 40,["36"] = 40,["37"] = 40,["38"] = 40,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 48,["46"] = 48,["47"] = 48,["48"] = 48,["49"] = 48,["50"] = 48,["51"] = 48,["52"] = 48,["53"] = 48,["54"] = 58,["55"] = 59,["56"] = 59,["57"] = 59,["58"] = 59,["59"] = 63,["60"] = 64,["61"] = 64,["62"] = 59,["63"] = 59,["64"] = 68,["65"] = 69,["66"] = 48,["67"] = 48,["68"] = 72,["69"] = 73,["70"] = 78,["71"] = 78,["72"] = 78,["73"] = 78,["74"] = 78,["75"] = 79,["76"] = 79,["77"] = 79,["78"] = 79,["79"] = 79,["80"] = 80,["81"] = 80,["82"] = 80,["83"] = 80,["84"] = 80,["85"] = 81,["86"] = 83,["87"] = 87,["88"] = 89,["89"] = 89,["90"] = 89,["91"] = 89,["92"] = 89,["93"] = 91,["94"] = 92,["95"] = 94,["96"] = 95,["97"] = 95,["98"] = 95,["99"] = 95,["100"] = 95,["101"] = 95,["102"] = 101,["103"] = 101,["104"] = 101,["105"] = 101,["106"] = 101,["107"] = 101,["108"] = 95,["109"] = 95,["110"] = 107,["112"] = 33,["113"] = 5,["114"] = 5,["115"] = 5,["116"] = 4,["119"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_techies_suicide_custom_725 = require("abilities.heroes.techies.725.suicide.modifier_techies_suicide_custom_725")
local modifier_techies_suicide_custom_725 = ____modifier_techies_suicide_custom_725.modifier_techies_suicide_custom_725
____exports.techies_suicide_custom_725 = __TS__Class()
local techies_suicide_custom_725 = ____exports.techies_suicide_custom_725
techies_suicide_custom_725.name = "techies_suicide_custom_725"
__TS__ClassExtends(techies_suicide_custom_725, BaseAbility)
function techies_suicide_custom_725.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_suicide_custom_725.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function techies_suicide_custom_725.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local position = self:GetCursorPosition()
    modifier_techies_suicide_custom_725:apply(caster, caster, self, {x = position.x, y = position.y, z = position.z})
    caster:EmitSound("Hero_Techies.BlastOff.Cast")
end
function techies_suicide_custom_725.prototype.BlastOff(self)
    local caster = self:GetCaster()
    local radius = self:GetSpecialValueFor("radius")
    local damage = self:GetSpecialValueFor("damage")
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = self
    }
    __TS__ArrayForEach(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            caster:GetOrigin(),
            nil,
            radius,
            2,
            bit.bor(1, 18),
            0,
            0,
            false
        ),
        function(____, enemy)
            enemy:AddNewModifier(
                caster,
                self,
                "modifier_silence",
                {duration = enemy:CalculateDuration(
                    caster,
                    self:GetSpecialValueFor("silence_duration")
                )}
            )
            damageTable.victim = enemy
            ApplyDamage(damageTable)
        end
    )
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_techies/techies_blast_off.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_CUSTOMORIGIN, nil)
    ParticleManager:SetParticleControl(
        particle,
        0,
        caster:GetOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(radius, 0, 1)
    )
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(radius, 0, 1)
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local sound = caster:HasArcana("npc_dota_hero_techies") and "Hero_Techies.Suicide.Arcana" or "Hero_Techies.Suicide"
    caster:EmitSound(sound)
    GridNav:DestroyTreesAroundPoint(
        caster:GetOrigin(),
        400,
        false
    )
    if caster:IsAlive() then
        local hp_cost = self:GetSpecialValueFor("hp_cost")
        local damage = caster:GetMaxHealth() * hp_cost / 100
        local selfDamageTable = {
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            victim = caster,
            ability = self,
            damage_flags = bit.bor(
                bit.bor(
                    bit.bor(DOTA_DAMAGE_FLAG_HPLOSS, DOTA_DAMAGE_FLAG_REFLECTION),
                    DOTA_DAMAGE_FLAG_NO_DAMAGE_MULTIPLIERS
                ),
                DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION
            )
        }
        ApplyDamage(selfDamageTable)
    end
end
techies_suicide_custom_725 = __TS__Decorate(
    techies_suicide_custom_725,
    techies_suicide_custom_725,
    {registerAbility(nil)},
    {kind = "class", name = "techies_suicide_custom_725"}
)
____exports.techies_suicide_custom_725 = techies_suicide_custom_725
return ____exports
