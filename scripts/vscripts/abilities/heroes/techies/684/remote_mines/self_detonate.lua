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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 6,["24"] = 7,["25"] = 8,["26"] = 9,["27"] = 7,["28"] = 12,["29"] = 13,["30"] = 14,["31"] = 15,["34"] = 12,["35"] = 19,["36"] = 20,["37"] = 21,["38"] = 23,["39"] = 25,["40"] = 25,["41"] = 25,["42"] = 25,["43"] = 25,["44"] = 25,["45"] = 25,["46"] = 29,["47"] = 29,["49"] = 31,["50"] = 32,["51"] = 32,["52"] = 32,["53"] = 33,["56"] = 35,["57"] = 36,["58"] = 37,["60"] = 39,["61"] = 40,["62"] = 32,["63"] = 32,["64"] = 32,["65"] = 19,["66"] = 44,["67"] = 45,["68"] = 46,["69"] = 48,["72"] = 50,["73"] = 51,["74"] = 52,["75"] = 54,["76"] = 55,["77"] = 56,["78"] = 57,["79"] = 58,["80"] = 60,["81"] = 62,["82"] = 63,["83"] = 64,["84"] = 66,["86"] = 68,["87"] = 69,["88"] = 70,["90"] = 73,["91"] = 77,["92"] = 82,["93"] = 82,["94"] = 82,["95"] = 82,["96"] = 82,["97"] = 83,["98"] = 83,["99"] = 83,["100"] = 83,["101"] = 83,["102"] = 84,["103"] = 84,["104"] = 84,["105"] = 84,["106"] = 84,["107"] = 85,["108"] = 86,["109"] = 86,["110"] = 86,["111"] = 86,["112"] = 86,["113"] = 87,["114"] = 87,["115"] = 87,["116"] = 87,["117"] = 87,["119"] = 90,["120"] = 92,["121"] = 92,["122"] = 92,["123"] = 92,["124"] = 92,["125"] = 92,["126"] = 92,["127"] = 94,["128"] = 94,["129"] = 94,["130"] = 94,["131"] = 94,["132"] = 94,["133"] = 94,["134"] = 94,["135"] = 94,["136"] = 94,["137"] = 94,["138"] = 106,["139"] = 106,["140"] = 106,["141"] = 106,["142"] = 106,["143"] = 106,["144"] = 106,["145"] = 114,["146"] = 115,["147"] = 115,["148"] = 115,["149"] = 116,["150"] = 117,["151"] = 119,["152"] = 120,["153"] = 120,["154"] = 120,["155"] = 121,["156"] = 121,["158"] = 120,["159"] = 120,["161"] = 115,["162"] = 115,["163"] = 126,["164"] = 127,["165"] = 128,["166"] = 129,["168"] = 133,["169"] = 133,["170"] = 133,["171"] = 133,["172"] = 133,["176"] = 133,["180"] = 133,["182"] = 133,["183"] = 134,["184"] = 134,["185"] = 134,["186"] = 134,["187"] = 135,["189"] = 140,["190"] = 140,["191"] = 140,["192"] = 140,["193"] = 141,["195"] = 143,["196"] = 144,["198"] = 147,["199"] = 148,["200"] = 148,["201"] = 148,["202"] = 149,["203"] = 148,["204"] = 148,["207"] = 154,["208"] = 156,["209"] = 160,["210"] = 160,["211"] = 160,["212"] = 161,["213"] = 162,["214"] = 163,["216"] = 160,["217"] = 160,["218"] = 44,["219"] = 6,["220"] = 6,["221"] = 6,["222"] = 5,["225"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.techies_remote_mines_self_detonate_custom_684 = __TS__Class()
local techies_remote_mines_self_detonate_custom_684 = ____exports.techies_remote_mines_self_detonate_custom_684
techies_remote_mines_self_detonate_custom_684.name = "techies_remote_mines_self_detonate_custom_684"
__TS__ClassExtends(techies_remote_mines_self_detonate_custom_684, BaseAbility)
function techies_remote_mines_self_detonate_custom_684.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_remote_mines_self_detonate_custom_684.prototype.Spawn(self)
    if IsServer() then
        if not self:IsTrained() then
            self:SetLevel(1)
        end
    end
end
function techies_remote_mines_self_detonate_custom_684.prototype.OnSpellStart(self)
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
function techies_remote_mines_self_detonate_custom_684.prototype.Explode(self)
    local caster = self:GetCaster()
    local owner = caster:GetOwner()
    if not caster:IsAlive() then
        return
    end
    local damage = 0
    local radius = 0
    local vision_radius = 0
    local ability = owner:FindAbilityByName("techies_remote_mines_custom_684")
    if not ability then
        ability = owner:AddAbility("techies_remote_mines_custom_684")
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
techies_remote_mines_self_detonate_custom_684 = __TS__Decorate(
    techies_remote_mines_self_detonate_custom_684,
    techies_remote_mines_self_detonate_custom_684,
    {registerAbility(nil)},
    {kind = "class", name = "techies_remote_mines_self_detonate_custom_684"}
)
____exports.techies_remote_mines_self_detonate_custom_684 = techies_remote_mines_self_detonate_custom_684
return ____exports
