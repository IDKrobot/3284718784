local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 14,["18"] = 15,["19"] = 14,["20"] = 15,["22"] = 15,["23"] = 16,["24"] = 19,["25"] = 21,["26"] = 23,["27"] = 27,["28"] = 28,["29"] = 29,["30"] = 27,["31"] = 32,["32"] = 33,["33"] = 35,["34"] = 39,["35"] = 39,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 41,["40"] = 42,["41"] = 48,["42"] = 55,["43"] = 32,["44"] = 58,["45"] = 59,["46"] = 61,["47"] = 63,["48"] = 64,["49"] = 65,["51"] = 68,["53"] = 68,["55"] = 58,["56"] = 71,["57"] = 72,["58"] = 74,["59"] = 76,["60"] = 76,["61"] = 76,["62"] = 77,["63"] = 79,["64"] = 79,["65"] = 79,["66"] = 81,["67"] = 76,["68"] = 76,["69"] = 84,["71"] = 84,["73"] = 86,["74"] = 87,["76"] = 89,["77"] = 93,["78"] = 95,["79"] = 96,["80"] = 98,["81"] = 99,["82"] = 101,["83"] = 102,["84"] = 102,["85"] = 102,["86"] = 102,["87"] = 102,["88"] = 103,["89"] = 103,["90"] = 103,["91"] = 103,["92"] = 103,["93"] = 104,["94"] = 104,["95"] = 104,["96"] = 104,["97"] = 104,["98"] = 105,["99"] = 107,["100"] = 108,["101"] = 108,["102"] = 108,["103"] = 108,["104"] = 108,["105"] = 109,["106"] = 109,["107"] = 109,["108"] = 109,["109"] = 109,["110"] = 110,["111"] = 112,["112"] = 113,["113"] = 115,["114"] = 117,["115"] = 119,["116"] = 120,["117"] = 120,["118"] = 120,["119"] = 121,["120"] = 122,["121"] = 124,["122"] = 126,["123"] = 126,["124"] = 126,["125"] = 127,["126"] = 129,["127"] = 130,["128"] = 132,["129"] = 132,["130"] = 132,["131"] = 132,["132"] = 132,["133"] = 132,["134"] = 132,["135"] = 132,["136"] = 126,["137"] = 126,["138"] = 120,["139"] = 120,["141"] = 71,["142"] = 137,["143"] = 138,["144"] = 139,["145"] = 139,["146"] = 139,["147"] = 139,["148"] = 139,["149"] = 139,["150"] = 139,["152"] = 141,["153"] = 141,["154"] = 141,["155"] = 141,["156"] = 141,["157"] = 141,["158"] = 141,["160"] = 137,["161"] = 144,["162"] = 145,["163"] = 147,["164"] = 149,["165"] = 151,["166"] = 153,["167"] = 154,["168"] = 155,["169"] = 155,["170"] = 155,["171"] = 155,["172"] = 155,["173"] = 155,["174"] = 155,["177"] = 158,["178"] = 158,["179"] = 159,["180"] = 160,["181"] = 160,["182"] = 160,["183"] = 160,["184"] = 160,["185"] = 162,["186"] = 163,["187"] = 163,["188"] = 163,["189"] = 163,["190"] = 163,["191"] = 163,["192"] = 163,["193"] = 158,["196"] = 144,["197"] = 167,["198"] = 168,["199"] = 169,["200"] = 171,["201"] = 173,["204"] = 175,["205"] = 176,["206"] = 177,["207"] = 179,["208"] = 181,["209"] = 182,["211"] = 184,["212"] = 185,["213"] = 187,["214"] = 187,["215"] = 187,["216"] = 187,["217"] = 187,["218"] = 187,["219"] = 187,["220"] = 195,["221"] = 197,["222"] = 198,["224"] = 200,["225"] = 202,["226"] = 203,["227"] = 204,["228"] = 204,["229"] = 204,["230"] = 204,["231"] = 204,["232"] = 204,["234"] = 213,["235"] = 213,["236"] = 213,["237"] = 213,["238"] = 214,["239"] = 214,["240"] = 214,["241"] = 214,["244"] = 218,["245"] = 218,["246"] = 218,["247"] = 218,["248"] = 218,["249"] = 218,["250"] = 167,["251"] = 228,["252"] = 229,["253"] = 231,["254"] = 232,["255"] = 233,["256"] = 234,["257"] = 236,["258"] = 237,["259"] = 238,["260"] = 240,["261"] = 240,["262"] = 240,["263"] = 240,["264"] = 240,["265"] = 240,["266"] = 240,["267"] = 240,["268"] = 240,["269"] = 240,["270"] = 240,["271"] = 240,["272"] = 240,["273"] = 253,["274"] = 253,["275"] = 253,["276"] = 253,["277"] = 253,["278"] = 253,["279"] = 240,["280"] = 240,["281"] = 263,["282"] = 265,["283"] = 267,["284"] = 268,["285"] = 269,["286"] = 270,["287"] = 270,["288"] = 270,["289"] = 270,["290"] = 270,["291"] = 271,["292"] = 228,["293"] = 274,["294"] = 275,["295"] = 276,["296"] = 278,["297"] = 274,["298"] = 15,["299"] = 15,["300"] = 15,["301"] = 14,["304"] = 15});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_nevermore_requiem_custom_728 = require("abilities.heroes.nevermore.728.requiem.modifier_nevermore_requiem_custom_728")
local modifier_nevermore_requiem_custom_728 = ____modifier_nevermore_requiem_custom_728.modifier_nevermore_requiem_custom_728
local ____modifier_nevermore_requiem_custom_728_debuff = require("abilities.heroes.nevermore.728.requiem.modifier_nevermore_requiem_custom_728_debuff")
local modifier_nevermore_requiem_custom_728_debuff = ____modifier_nevermore_requiem_custom_728_debuff.modifier_nevermore_requiem_custom_728_debuff
____exports.nevermore_requiem_custom_728 = __TS__Class()
local nevermore_requiem_custom_728 = ____exports.nevermore_requiem_custom_728
nevermore_requiem_custom_728.name = "nevermore_requiem_custom_728"
__TS__ClassExtends(nevermore_requiem_custom_728, CustomAbility)
function nevermore_requiem_custom_728.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "nevermore_requiem")
    self.sound = ""
    self.souls = 0
    self.damage_dealt = {}
end
function nevermore_requiem_custom_728.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_nevermore.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_nevermore.vsndevts")
end
function nevermore_requiem_custom_728.prototype.OnAbilityPhaseStart(self)
    local caster = self:GetCaster()
    self.sound = caster:HasArcana("npc_dota_hero_nevermore") and "Hero_Nevermore.ROS.Arcana.Cast" or "Hero_Nevermore.RequiemOfSoulsCast"
    EmitSoundOnLocationForAllies(
        caster:GetAbsOrigin(),
        self.sound,
        caster
    )
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_nevermore/nevermore_wings.vpcf", caster)
    self.particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, caster)
    modifier_nevermore_requiem_custom_728:apply(caster, caster, self, {})
    return true
end
function nevermore_requiem_custom_728.prototype.OnAbilityPhaseInterrupted(self)
    local caster = self:GetCaster()
    caster:StopSound(self.sound)
    if self.particle then
        ParticleManager:DestroyParticle(self.particle, true)
        ParticleManager:ReleaseParticleIndex(self.particle)
    end
    local ____opt_0 = caster:FindModifierByName(modifier_nevermore_requiem_custom_728.name)
    if ____opt_0 ~= nil then
        ____opt_0:Destroy()
    end
end
function nevermore_requiem_custom_728.prototype.OnSpellStart(self, death_cast)
    death_cast = not not death_cast
    local caster = self:GetCaster()
    Timers:CreateTimer(
        0.1,
        function()
            local response = (caster:HasArcana("npc_dota_hero_nevermore") and "nevermore_nev_arc_ability_requiem_" or "nevermore_nev_ability_requiem_") .. RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 14))
            )
            caster:EmitSoundOnClient(response)
        end
    )
    local ____opt_2 = caster:FindModifierByName(modifier_nevermore_requiem_custom_728.name)
    if ____opt_2 ~= nil then
        ____opt_2:Destroy()
    end
    if self.particle then
        ParticleManager:ReleaseParticleIndex(self.particle)
    end
    local sound_name = caster:HasArcana("npc_dota_hero_nevermore") and "Hero_Nevermore.ROS.Arcana" or "Hero_Nevermore.RequiemOfSouls"
    caster:EmitSound(sound_name)
    local particle_souls_name = "particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_a.vpcf"
    local particle_ground_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_nevermore/nevermore_requiemofsouls.vpcf", caster)
    local necromastery = caster:FindModifierByName("modifier_nevermore_necromastery_custom_728")
    local stacks = necromastery and necromastery:GetStackCount() or self.souls
    local particle_souls = ParticleManager:CreateParticle(particle_souls_name, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(
        particle_souls,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle_souls,
        1,
        Vector(stacks, 0, 0)
    )
    ParticleManager:SetParticleControl(
        particle_souls,
        2,
        caster:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle_souls)
    local particle_ground = ParticleManager:CreateParticle(particle_ground_name, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(
        particle_ground,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle_ground,
        1,
        Vector(stacks, 0, 0)
    )
    ParticleManager:ReleaseParticleIndex(particle_ground)
    local travel_distance = self:GetSpecialValueFor("radius")
    local lines_travel_speed = self:GetSpecialValueFor("line_speed")
    self:Explode(stacks, death_cast, false)
    local max_distance_time = travel_distance / lines_travel_speed
    if caster:HasScepter() and not death_cast then
        Timers:CreateTimer(
            max_distance_time + FrameTime(),
            function()
                local key = DoUniqueString("requiem_scepter")
                self.damage_dealt[key] = 0
                self:Explode(stacks, not not death_cast, true, key)
                Timers:CreateTimer(
                    max_distance_time + FrameTime(),
                    function()
                        local line_heal_pct = self:GetSpecialValueFor("heal_pct_scepter")
                        local heal = self.damage_dealt[key] * line_heal_pct / 100
                        self.damage_dealt[key] = nil
                        caster:HealWithParams(
                            heal,
                            self,
                            true,
                            true,
                            caster,
                            true
                        )
                    end
                )
            end
        )
    end
end
function nevermore_requiem_custom_728.prototype.CreateLine(self, start_pos, end_pos, death_cast, is_scepter, damage_key)
    if is_scepter then
        self:CreateRequiemSoulLine(
            start_pos,
            end_pos,
            false,
            true,
            damage_key
        )
    else
        self:CreateRequiemSoulLine(
            end_pos,
            start_pos,
            death_cast,
            false,
            damage_key
        )
    end
end
function nevermore_requiem_custom_728.prototype.Explode(self, stacks, death_cast, is_scepter, damage_key)
    local caster = self:GetCaster()
    local travel_distance = self:GetSpecialValueFor("radius")
    local qangle_rotation_rate = 360 / stacks
    local line_position = caster:GetAbsOrigin():__add(caster:GetForwardVector():__mul(travel_distance))
    if stacks >= 1 then
        local start_pos = caster:GetAbsOrigin():__add(line_position:__sub(caster:GetAbsOrigin()):Normalized():__mul(105))
        self:CreateLine(
            start_pos,
            line_position,
            death_cast,
            is_scepter,
            damage_key
        )
    end
    do
        local i = 0
        while i < stacks - 1 do
            local qangle = QAngle(0, qangle_rotation_rate, 0)
            line_position = RotatePosition(
                caster:GetAbsOrigin(),
                qangle,
                line_position
            )
            local start_pos = caster:GetAbsOrigin():__add(line_position:__sub(caster:GetAbsOrigin()):Normalized():__mul(105))
            self:CreateLine(
                start_pos,
                line_position,
                death_cast,
                is_scepter,
                damage_key
            )
            i = i + 1
        end
    end
end
function nevermore_requiem_custom_728.prototype.OnProjectileHit_ExtraData(self, target, location, extraData)
    local is_scepter = extraData.is_scepter and extraData.is_scepter == 1
    local death_cast = extraData.death_cast and extraData.death_cast == 1
    local caster = self:GetCaster()
    if not target then
        return
    end
    local damage = self:GetSpecialValueFor("damage")
    local slow_duration = self:GetSpecialValueFor("slow_duration")
    local max_duration = self:GetSpecialValueFor("slow_duration_max")
    local line_damage_pct = self:GetSpecialValueFor("damage_pct_scepter")
    if is_scepter then
        damage = damage * (line_damage_pct / 100)
    end
    target:RemoveModifierByName(modifier_nevermore_requiem_custom_728_debuff.name)
    target:EmitSound("Hero_Nevermore.RequiemOfSouls.Damage")
    local damageTable = {
        victim = target,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        attacker = caster,
        ability = self
    }
    local damage_dealt = ApplyDamage(damageTable)
    if is_scepter then
        self.damage_dealt[extraData.damage_key] = (self.damage_dealt[extraData.damage_key] or 0) + damage_dealt
    end
    local fear_mod = target:FindModifierByName("modifier_nevermore_requiem_fear")
    if not death_cast and not target:IsAbilityImmune() then
        if not fear_mod then
            target:AddNewModifier(
                caster,
                self,
                "modifier_nevermore_requiem_fear",
                {duration = target:CalculateDuration(caster, slow_duration)}
            )
        else
            local duration = math.min(
                fear_mod:GetRemainingTime() + slow_duration,
                max_duration
            )
            fear_mod:SetDuration(
                target:CalculateDuration(caster, duration),
                true
            )
        end
    end
    modifier_nevermore_requiem_custom_728_debuff:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, max_duration)}
    )
end
function nevermore_requiem_custom_728.prototype.CreateRequiemSoulLine(self, line_end_pos, line_start_pos, death_cast, is_scepter, damage_key)
    local caster = self:GetCaster()
    local travel_distance = self:GetSpecialValueFor("radius")
    local lines_starting_width = self:GetSpecialValueFor("line_width_start")
    local lines_end_width = self:GetSpecialValueFor("line_width_end")
    local lines_travel_speed = self:GetSpecialValueFor("line_speed")
    local max_distance_time = travel_distance / lines_travel_speed
    local velocity = line_end_pos:__sub(line_start_pos):Normalized():__mul(lines_travel_speed)
    velocity.z = 0
    local info = {
        Ability = self,
        Source = caster,
        vSpawnOrigin = line_start_pos,
        fDistance = travel_distance,
        fStartRadius = lines_starting_width,
        fEndRadius = lines_end_width,
        bHasFrontalCone = false,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
        vVelocity = velocity,
        bProvidesVision = false,
        ExtraData = {
            x = line_start_pos.x,
            y = line_start_pos.y,
            death_cast = death_cast,
            is_scepter = is_scepter,
            damage_key = damage_key
        }
    }
    ProjectileManager:CreateLinearProjectile(info)
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_nevermore/nevermore_requiemofsouls_line.vpcf", caster)
    local particle_line = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(particle_line, 0, line_start_pos)
    ParticleManager:SetParticleControl(particle_line, 1, velocity)
    ParticleManager:SetParticleControl(
        particle_line,
        2,
        Vector(0, max_distance_time, 0)
    )
    ParticleManager:ReleaseParticleIndex(particle_line)
end
function nevermore_requiem_custom_728.prototype.OnStolen(self, sourceAbility)
    local caster = sourceAbility:GetCaster()
    local souls = caster:GetModifierStackCount("modifier_nevermore_necromastery_custom_728", caster)
    self.souls = souls
end
nevermore_requiem_custom_728 = __TS__Decorate(
    nevermore_requiem_custom_728,
    nevermore_requiem_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "nevermore_requiem_custom_728"}
)
____exports.nevermore_requiem_custom_728 = nevermore_requiem_custom_728
return ____exports
