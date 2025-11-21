local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["16"] = 1,["17"] = 1,["18"] = 2,["19"] = 2,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 6,["25"] = 6,["26"] = 7,["27"] = 11,["28"] = 12,["29"] = 13,["30"] = 11,["31"] = 16,["32"] = 17,["33"] = 19,["34"] = 19,["36"] = 21,["37"] = 21,["42"] = 21,["43"] = 25,["44"] = 25,["45"] = 25,["46"] = 25,["47"] = 25,["48"] = 25,["49"] = 25,["50"] = 16,["51"] = 34,["52"] = 35,["53"] = 36,["54"] = 37,["57"] = 39,["58"] = 41,["61"] = 43,["62"] = 44,["63"] = 44,["64"] = 44,["65"] = 44,["67"] = 44,["69"] = 44,["70"] = 44,["71"] = 46,["72"] = 47,["73"] = 48,["74"] = 49,["75"] = 51,["76"] = 53,["77"] = 55,["78"] = 56,["79"] = 57,["80"] = 59,["81"] = 60,["82"] = 62,["83"] = 63,["85"] = 65,["86"] = 65,["91"] = 65,["92"] = 67,["93"] = 67,["94"] = 67,["95"] = 67,["96"] = 67,["97"] = 67,["98"] = 67,["99"] = 73,["100"] = 73,["101"] = 73,["102"] = 67,["103"] = 67,["104"] = 67,["105"] = 67,["106"] = 67,["107"] = 67,["108"] = 67,["110"] = 80,["111"] = 82,["112"] = 83,["113"] = 84,["114"] = 85,["115"] = 87,["120"] = 91,["121"] = 91,["122"] = 91,["123"] = 91,["124"] = 91,["125"] = 91,["126"] = 91,["127"] = 99,["128"] = 99,["129"] = 99,["130"] = 99,["131"] = 99,["132"] = 99,["133"] = 99,["134"] = 107,["135"] = 107,["136"] = 107,["137"] = 107,["138"] = 108,["139"] = 109,["140"] = 110,["141"] = 111,["142"] = 112,["143"] = 113,["144"] = 114,["145"] = 115,["147"] = 117,["148"] = 107,["149"] = 107,["150"] = 118,["151"] = 119,["152"] = 121,["153"] = 122,["154"] = 122,["155"] = 122,["156"] = 122,["157"] = 122,["158"] = 122,["159"] = 122,["160"] = 122,["161"] = 124,["162"] = 124,["163"] = 124,["164"] = 124,["165"] = 124,["166"] = 124,["167"] = 124,["168"] = 124,["169"] = 124,["170"] = 124,["171"] = 124,["172"] = 124,["173"] = 134,["174"] = 135,["175"] = 137,["176"] = 138,["177"] = 140,["178"] = 124,["179"] = 124,["181"] = 143,["184"] = 145,["185"] = 146,["186"] = 148,["187"] = 148,["188"] = 148,["189"] = 148,["190"] = 148,["191"] = 148,["192"] = 148,["193"] = 148,["194"] = 148,["195"] = 148,["196"] = 150,["197"] = 150,["198"] = 150,["199"] = 150,["200"] = 150,["201"] = 150,["202"] = 150,["203"] = 150,["204"] = 150,["205"] = 150,["206"] = 150,["207"] = 150,["208"] = 160,["209"] = 161,["210"] = 161,["211"] = 161,["212"] = 161,["213"] = 161,["214"] = 161,["215"] = 161,["216"] = 161,["217"] = 163,["218"] = 165,["219"] = 150,["220"] = 150,["222"] = 107,["223"] = 107,["224"] = 170,["225"] = 172,["226"] = 173,["229"] = 173,["231"] = 173,["232"] = 173,["233"] = 174,["235"] = 34,["236"] = 178,["237"] = 178,["238"] = 178,["240"] = 179,["241"] = 179,["242"] = 179,["243"] = 179,["244"] = 180,["245"] = 185,["246"] = 185,["247"] = 185,["248"] = 185,["249"] = 185,["250"] = 185,["251"] = 185,["252"] = 185,["253"] = 185,["254"] = 186,["255"] = 186,["256"] = 186,["257"] = 186,["258"] = 186,["259"] = 186,["260"] = 186,["261"] = 186,["262"] = 186,["263"] = 187,["264"] = 178,["265"] = 190,["266"] = 191,["267"] = 191,["268"] = 191,["269"] = 191,["270"] = 192,["271"] = 197,["272"] = 197,["273"] = 197,["274"] = 197,["275"] = 197,["276"] = 197,["277"] = 197,["278"] = 197,["279"] = 197,["280"] = 198,["281"] = 190,["282"] = 6,["283"] = 6,["284"] = 6,["285"] = 5,["288"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
____exports.dazzle_shadow_wave_custom_734 = __TS__Class()
local dazzle_shadow_wave_custom_734 = ____exports.dazzle_shadow_wave_custom_734
dazzle_shadow_wave_custom_734.name = "dazzle_shadow_wave_custom_734"
__TS__ClassExtends(dazzle_shadow_wave_custom_734, CustomAbility)
function dazzle_shadow_wave_custom_734.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "dazzle_shadow_wave")
end
function dazzle_shadow_wave_custom_734.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_dazzle.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_dazzle.vsndevts")
end
function dazzle_shadow_wave_custom_734.prototype.CastFilterResultTarget(self, target)
    local caster = self:GetCaster()
    if target:IsCourier() then
        return UF_FAIL_COURIER
    end
    local ____caster_HasScepter_result_0
    if caster:HasScepter() then
        ____caster_HasScepter_result_0 = DOTA_UNIT_TARGET_TEAM_BOTH
    else
        ____caster_HasScepter_result_0 = DOTA_UNIT_TARGET_TEAM_FRIENDLY
    end
    local team = ____caster_HasScepter_result_0
    return UnitFilter(
        target,
        team,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_NONE,
        caster:GetTeamNumber()
    )
end
function dazzle_shadow_wave_custom_734.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local isEnemy = target:GetTeamNumber() ~= caster:GetTeamNumber()
    if isEnemy and target:TriggerSpellAbsorb(self) then
        return
    end
    local juju = caster:FindAbilityByName("dazzle_bad_juju_custom_734")
    local function TargetModifier(____, target)
        local ____temp_1
        if juju and juju:IsTrained() then
            ____temp_1 = juju:TargetModifier(target)
        else
            ____temp_1 = nil
        end
        return ____temp_1
    end
    local bounce_radius = self:GetSpecialValueFor("bounce_radius")
    local damage_radius = self:GetSpecialValueFor("damage_radius")
    local damage = self:GetSpecialValueFor("damage")
    local scepter_damage = damage * self:GetSpecialValueFor("scepter_heal_pct") / 100
    local max_targets = self:GetSpecialValueFor("max_targets")
    local units = {caster}
    local jumps = max_targets - 1
    local currentSource = caster
    local currentTarget = target
    while jumps >= 0 do
        local nextTarget = nil
        if currentTarget and currentTarget ~= currentSource then
            nextTarget = currentTarget
        else
            local ____caster_HasScepter_result_2
            if caster:HasScepter() then
                ____caster_HasScepter_result_2 = DOTA_UNIT_TARGET_TEAM_BOTH
            else
                ____caster_HasScepter_result_2 = DOTA_UNIT_TARGET_TEAM_FRIENDLY
            end
            local team = ____caster_HasScepter_result_2
            nextTarget = __TS__ArrayFind(
                FindUnitsInRadius(
                    caster:GetTeamNumber(),
                    currentSource:GetAbsOrigin(),
                    nil,
                    bounce_radius,
                    team,
                    bit.bor(
                        bit.bor(1, 18),
                        16
                    ),
                    64,
                    0,
                    false
                ),
                function(____, ally) return not __TS__ArrayIncludes(units, ally) end
            )
        end
        self:PlayEffects(currentSource, nextTarget)
        if nextTarget then
            units[#units + 1] = nextTarget
            currentSource = nextTarget
            currentTarget = nil
            jumps = jumps - 1
        else
            break
        end
    end
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        victim = nil,
        ability = self
    }
    local scepterDamageTable = {
        attacker = caster,
        damage = scepter_damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        victim = nil,
        ability = self
    }
    __TS__ArrayForEach(
        __TS__ArraySort(
            units,
            function(____, a, b)
                if a:IsHero() and b:IsHero() then
                    return a:GetHealth() - b:GetHealth()
                elseif a:IsCreep() and b:IsCreep() then
                    return a:GetHealth() - b:GetHealth()
                elseif a:IsHero() and b:IsCreep() then
                    return -1
                elseif a:IsCreep() and b:IsHero() then
                    return 1
                end
                return a:GetHealth() - b:GetHealth()
            end
        ),
        function(____, unit)
            TargetModifier(nil, unit)
            if unit:GetTeamNumber() == caster:GetTeamNumber() then
                unit:HealWithParams(
                    damage,
                    self,
                    false,
                    true,
                    caster,
                    false
                )
                __TS__ArrayForEach(
                    FindUnitsInRadius(
                        caster:GetTeamNumber(),
                        unit:GetAbsOrigin(),
                        nil,
                        damage_radius,
                        2,
                        bit.bor(1, 18),
                        16,
                        0,
                        false
                    ),
                    function(____, enemy)
                        TargetModifier(nil, enemy)
                        damageTable.victim = enemy
                        ApplyDamage(damageTable)
                        self:PlayEffects2(enemy)
                    end
                )
            else
                if not caster:HasScepter() then
                    return
                end
                scepterDamageTable.victim = unit
                ApplyDamage(scepterDamageTable)
                caster:PerformAttack(
                    unit,
                    false,
                    true,
                    true,
                    false,
                    true,
                    false,
                    false
                )
                __TS__ArrayForEach(
                    FindUnitsInRadius(
                        caster:GetTeamNumber(),
                        unit:GetAbsOrigin(),
                        nil,
                        damage_radius,
                        1,
                        1,
                        64,
                        0,
                        false
                    ),
                    function(____, ally)
                        ally:HealWithParams(
                            scepter_damage,
                            self,
                            false,
                            true,
                            caster,
                            false
                        )
                        TargetModifier(nil, ally)
                        self:PlayEffects2(ally)
                    end
                )
            end
        end
    )
    caster:EmitSound("Hero_Dazzle.Shadow_Wave")
    if caster:GetUnitName() == "npc_dota_hero_dazzle" then
        local ____RollVoiceLines_4 = RollVoiceLines
        local ____array_3 = __TS__SparseArrayNew(
            nil,
            __TS__Spread(range(nil, 1, 4))
        )
        __TS__SparseArrayPush(____array_3, 9, 10)
        local response = "dazzle_dazz_ability_shadowave_" .. ____RollVoiceLines_4(__TS__SparseArraySpread(____array_3))
        caster:EmitSoundOnClient(response)
    end
end
function dazzle_shadow_wave_custom_734.prototype.PlayEffects(self, source, target)
    if target == nil then
        target = source
    end
    local particle_name = ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_dazzle/dazzle_shadow_wave.vpcf",
        self:GetCaster()
    )
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, source)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        source,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        source:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        target,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        target:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
end
function dazzle_shadow_wave_custom_734.prototype.PlayEffects2(self, target)
    local particle_name = ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_dazzle/dazzle_shadow_wave_impact_damage.vpcf",
        self:GetCaster()
    )
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        target,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        target:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
end
dazzle_shadow_wave_custom_734 = __TS__Decorate(
    dazzle_shadow_wave_custom_734,
    dazzle_shadow_wave_custom_734,
    {registerAbility(nil)},
    {kind = "class", name = "dazzle_shadow_wave_custom_734"}
)
____exports.dazzle_shadow_wave_custom_734 = dazzle_shadow_wave_custom_734
return ____exports
