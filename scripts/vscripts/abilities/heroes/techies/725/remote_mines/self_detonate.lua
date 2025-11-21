local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 4,["21"] = 5,["22"] = 4,["23"] = 5,["24"] = 6,["25"] = 7,["26"] = 8,["27"] = 6,["28"] = 11,["29"] = 12,["30"] = 13,["31"] = 14,["34"] = 11,["35"] = 18,["36"] = 19,["37"] = 20,["38"] = 22,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 24,["44"] = 24,["45"] = 24,["46"] = 28,["47"] = 28,["49"] = 30,["50"] = 31,["51"] = 31,["52"] = 31,["53"] = 32,["56"] = 34,["57"] = 35,["58"] = 36,["60"] = 38,["61"] = 39,["62"] = 31,["63"] = 31,["64"] = 31,["65"] = 18,["66"] = 43,["67"] = 44,["68"] = 45,["69"] = 47,["72"] = 49,["73"] = 50,["74"] = 51,["75"] = 53,["76"] = 54,["77"] = 55,["78"] = 56,["79"] = 57,["80"] = 59,["81"] = 60,["82"] = 61,["83"] = 62,["84"] = 64,["86"] = 66,["87"] = 67,["88"] = 68,["90"] = 71,["91"] = 75,["92"] = 80,["93"] = 80,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 81,["98"] = 81,["99"] = 81,["100"] = 81,["101"] = 81,["102"] = 82,["103"] = 82,["104"] = 82,["105"] = 82,["106"] = 82,["107"] = 83,["108"] = 84,["109"] = 84,["110"] = 84,["111"] = 84,["112"] = 84,["113"] = 85,["114"] = 85,["115"] = 85,["116"] = 85,["117"] = 85,["119"] = 88,["120"] = 90,["121"] = 90,["122"] = 90,["123"] = 90,["124"] = 90,["125"] = 90,["126"] = 90,["127"] = 92,["128"] = 92,["129"] = 92,["130"] = 92,["131"] = 92,["132"] = 92,["133"] = 92,["134"] = 92,["135"] = 92,["136"] = 92,["137"] = 92,["138"] = 104,["139"] = 104,["140"] = 104,["141"] = 104,["142"] = 104,["143"] = 104,["144"] = 104,["145"] = 112,["146"] = 113,["147"] = 113,["148"] = 113,["149"] = 114,["150"] = 115,["151"] = 117,["152"] = 118,["153"] = 118,["154"] = 118,["155"] = 119,["156"] = 119,["158"] = 118,["159"] = 118,["161"] = 113,["162"] = 113,["163"] = 124,["164"] = 125,["165"] = 126,["166"] = 127,["168"] = 131,["169"] = 131,["170"] = 131,["171"] = 131,["172"] = 131,["176"] = 131,["180"] = 131,["182"] = 131,["183"] = 132,["184"] = 132,["185"] = 132,["186"] = 132,["187"] = 133,["189"] = 138,["190"] = 138,["191"] = 138,["192"] = 138,["193"] = 139,["195"] = 141,["196"] = 142,["198"] = 145,["199"] = 146,["200"] = 146,["201"] = 146,["202"] = 147,["203"] = 146,["204"] = 146,["207"] = 152,["208"] = 154,["209"] = 158,["210"] = 158,["211"] = 158,["212"] = 159,["213"] = 160,["214"] = 161,["216"] = 158,["217"] = 158,["218"] = 43,["219"] = 5,["220"] = 5,["221"] = 5,["222"] = 4,["225"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.techies_remote_mines_self_detonate_custom_725 = __TS__Class()
local techies_remote_mines_self_detonate_custom_725 = ____exports.techies_remote_mines_self_detonate_custom_725
techies_remote_mines_self_detonate_custom_725.name = "techies_remote_mines_self_detonate_custom_725"
__TS__ClassExtends(techies_remote_mines_self_detonate_custom_725, BaseAbility)
function techies_remote_mines_self_detonate_custom_725.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_remote_mines_self_detonate_custom_725.prototype.Spawn(self)
    if IsServer() then
        if not self:IsTrained() then
            self:SetLevel(1)
        end
    end
end
function techies_remote_mines_self_detonate_custom_725.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local owner = caster:GetOwner()
    local selected = PlayerResource:GetSelectedEntities(owner:GetPlayerOwnerID())
    local mines = __TS__ArrayFilter(
        __TS__ArrayMap(
            __TS__ObjectValues(selected),
            function(____, index) return EntIndexToHScript(index) end
        ),
        function(____, unit) return unit:GetUnitName() == caster:GetUnitName() and unit:GetTeamNumber() == owner:GetTeamNumber() and unit:GetPlayerOwnerID() == caster:GetPlayerOwnerID() and not unit:HasModifier("modifier_dummy") and unit ~= caster end
    )
    if not __TS__ArrayIncludes(mines, caster) then
        mines[#mines + 1] = caster
    end
    local i = 0
    Timers:CreateTimer(
        0.03,
        function()
            if i > #mines then
                return
            end
            local mine = mines[i + 1]
            if IsValidEntity(mine) and mine:IsAlive() then
                mine:FindAbilityByName(self:GetAbilityName()):Explode()
            end
            i = i + 1
            return 0.03
        end,
        self
    )
end
function techies_remote_mines_self_detonate_custom_725.prototype.Explode(self)
    local caster = self:GetCaster()
    local owner = caster:GetOwner()
    if not caster:IsAlive() then
        return
    end
    local damage = 0
    local radius = 0
    local vision_radius = 0
    local ability = owner:FindAbilityByName("techies_remote_mines_custom_725")
    if not ability then
        ability = owner:AddAbility("techies_remote_mines_custom_725")
        ability:SetStolen(true)
        ability:SetHidden(true)
        local level = caster:FindModifierByName("modifier_remote_mines").ability_level
        damage = ability:GetLevelSpecialValueFor("damage", level)
        radius = ability:GetLevelSpecialValueFor("radius", level)
        vision_radius = ability:GetLevelSpecialValueFor("vision_radius", level)
        owner:RemoveAbilityByHandle(ability)
    else
        damage = ability:GetSpecialValueFor("damage")
        radius = ability:GetSpecialValueFor("radius")
        vision_radius = ability:GetSpecialValueFor("vision_radius")
    end
    local particle_name = owner:HasArcana("npc_dota_hero_techies") and "particles/econ/items/techies/techies_arcana/techies_remote_mines_detonate_arcana.vpcf" or "particles/units/heroes/hero_techies/techies_remote_mines_detonate.vpcf"
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(
        particle,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(radius, 1, 1)
    )
    ParticleManager:SetParticleControl(
        particle,
        3,
        caster:GetAbsOrigin()
    )
    if owner:HasArcana("npc_dota_hero_techies") then
        ParticleManager:SetParticleControl(
            particle,
            15,
            Vector(255, 182, 0)
        )
        ParticleManager:SetParticleControl(
            particle,
            16,
            Vector(1, 0, 0)
        )
    end
    ParticleManager:ReleaseParticleIndex(particle)
    AddFOWViewer(
        owner:GetTeamNumber(),
        caster:GetAbsOrigin(),
        vision_radius,
        3,
        false
    )
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
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = ability
    }
    local enemy_killed = false
    __TS__ArrayForEach(
        enemies,
        function(____, enemy)
            damageTable.victim = enemy
            ApplyDamage(damageTable)
            if enemy:IsRealHero() then
                Timers:CreateTimer(
                    FrameTime(),
                    function()
                        if not enemy:IsAlive() then
                            enemy_killed = true
                        end
                    end
                )
            end
        end
    )
    if enemy_killed and owner:GetUnitName() == "npc_dota_hero_techies" then
        local cast_responce = nil
        if RollPercentage(15) then
            if RollPercentage(50) then
                local ____array_0 = __TS__SparseArrayNew(
                    1,
                    2,
                    4,
                    5,
                    __TS__Spread(range(nil, 7, 13))
                )
                __TS__SparseArrayPush(
                    ____array_0,
                    __TS__Spread(range(nil, 15, 17))
                )
                __TS__SparseArrayPush(
                    ____array_0,
                    __TS__Spread(range(nil, 19, 22))
                )
                local random_list = {__TS__SparseArraySpread(____array_0)}
                local random = RollVoiceLines(
                    nil,
                    unpack(random_list)
                )
                cast_responce = "techies_tech_focuseddetonate_" .. random
            else
                local random = RollVoiceLines(
                    nil,
                    RandomInt(1, 3)
                )
                cast_responce = "techies_tech_detonatekill_" .. random
            end
        elseif RollPercentage(5) then
            cast_responce = "techies_tech_focuseddetonate_" .. (RollPercentage(50) and "06" or "18")
        end
        if cast_responce ~= nil then
            Timers:CreateTimer(
                FrameTime() * 2,
                function()
                    owner:EmitSoundOnClient(cast_responce)
                end
            )
        end
    end
    caster:ForceKill(false)
    local sound_name = owner:HasArcana("npc_dota_hero_techies") and "Hero_Techies.RemoteMine.Detonate.Arcana" or "Hero_Techies.RemoteMine.Detonate"
    Timers:CreateTimer(
        RandomFloat(0.01, 0.08),
        function()
            if not self:IsNull() and IsValidEntity(caster) then
                caster:EmitSound(sound_name)
                UTIL_Remove(caster)
            end
        end
    )
end
techies_remote_mines_self_detonate_custom_725 = __TS__Decorate(
    techies_remote_mines_self_detonate_custom_725,
    techies_remote_mines_self_detonate_custom_725,
    {registerAbility(nil)},
    {kind = "class", name = "techies_remote_mines_self_detonate_custom_725"}
)
____exports.techies_remote_mines_self_detonate_custom_725 = techies_remote_mines_self_detonate_custom_725
return ____exports
