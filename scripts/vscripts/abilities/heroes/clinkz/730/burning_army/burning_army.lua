local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 68,["15"] = 69,["16"] = 69,["17"] = 69,["18"] = 69,["19"] = 69,["20"] = 69,["21"] = 69,["22"] = 69,["23"] = 71,["24"] = 80,["25"] = 87,["26"] = 89,["27"] = 93,["28"] = 94,["29"] = 95,["30"] = 96,["31"] = 98,["32"] = 98,["33"] = 98,["34"] = 98,["35"] = 99,["36"] = 100,["37"] = 102,["38"] = 103,["39"] = 104,["40"] = 105,["41"] = 106,["42"] = 107,["45"] = 111,["46"] = 116,["47"] = 118,["48"] = 123,["49"] = 125,["50"] = 127,["51"] = 129,["52"] = 68,["53"] = 5,["54"] = 6,["55"] = 5,["56"] = 6,["58"] = 6,["59"] = 7,["60"] = 11,["61"] = 12,["62"] = 13,["63"] = 11,["64"] = 16,["65"] = 17,["66"] = 17,["67"] = 17,["68"] = 17,["69"] = 17,["70"] = 17,["71"] = 17,["72"] = 16,["73"] = 20,["74"] = 21,["75"] = 20,["76"] = 24,["77"] = 25,["78"] = 26,["79"] = 24,["80"] = 29,["81"] = 30,["82"] = 29,["83"] = 33,["84"] = 34,["85"] = 36,["86"] = 37,["87"] = 38,["88"] = 40,["89"] = 42,["90"] = 42,["91"] = 42,["92"] = 43,["93"] = 44,["94"] = 46,["95"] = 47,["98"] = 49,["99"] = 42,["100"] = 42,["101"] = 52,["102"] = 54,["105"] = 56,["106"] = 57,["107"] = 58,["108"] = 59,["110"] = 61,["111"] = 61,["112"] = 61,["113"] = 61,["114"] = 61,["115"] = 61,["116"] = 61,["117"] = 62,["118"] = 63,["120"] = 33,["121"] = 6,["122"] = 6,["123"] = 6,["124"] = 5,["127"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_clinkz_burning_army_custom_730_archer = require("abilities.heroes.clinkz.730.burning_army.modifier_clinkz_burning_army_custom_730_archer")
local modifier_clinkz_burning_army_custom_730_archer = ____modifier_clinkz_burning_army_custom_730_archer.modifier_clinkz_burning_army_custom_730_archer
function ____exports.createSkeletonArcher(self, caster, ability, origin)
    local archer = CreateUnitByName(
        "npc_dota_clinkz_730_skeleton_archer_custom",
        origin,
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    archer:AddNewModifier(caster, ability, "modifier_kill", {duration = 30})
    modifier_clinkz_burning_army_custom_730_archer:apply(archer, caster, ability, {})
    local damage = caster:GetAverageTrueAttackDamage(nil) * 0.3
    local model = caster:HasWearable("models/items/clinkz/clinkz_ti9_immortal_weapon/clinkz_ti9_immortal_weapon.vmdl") and "models/items/clinkz/clinkz_ti9_immortal_weapon/clinkz_ti9_immortal_army.vmdl" or "models/heroes/clinkz/clinkz_archer.vmdl"
    archer:SetOriginalModel(model)
    archer:SetModel(model)
    archer:SetBaseDamageMin(damage)
    archer:SetBaseDamageMax(damage)
    archer:SetControllableByPlayer(
        caster:GetPlayerOwnerID(),
        true
    )
    archer:SetAngles(0, 0, 0)
    archer:SetForwardVector(caster:GetForwardVector())
    local searingArrow = caster:FindAbilityByName("clinkz_searing_arrows_custom_730")
    if searingArrow then
        local archerArrow = archer:FindAbilityByName("clinkz_searing_arrows_custom_730")
        if archerArrow then
            archerArrow:SetLevel(searingArrow:GetLevel())
            archerArrow:ToggleAutoCast()
        end
    end
    local start_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_clinkz/clinkz_burning_army_start.vpcf", PATTACH_POINT_FOLLOW, archer)
    ParticleManager:ReleaseParticleIndex(start_particle)
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_clinkz/clinkz_burning_army.vpcf", PATTACH_POINT_FOLLOW, archer)
    ParticleManager:ReleaseParticleIndex(particle)
    archer:EmitSound("Hero_Clinkz.Skeleton_Archer.Spawn")
    archer:StartGesture(ACT_DOTA_IDLE)
    return archer
end
____exports.clinkz_burning_army_custom_730 = __TS__Class()
local clinkz_burning_army_custom_730 = ____exports.clinkz_burning_army_custom_730
clinkz_burning_army_custom_730.name = "clinkz_burning_army_custom_730"
__TS__ClassExtends(clinkz_burning_army_custom_730, CustomAbility)
function clinkz_burning_army_custom_730.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "clinkz_burning_army")
end
function clinkz_burning_army_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_clinkz.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_clinkz.vsndevts")
end
function clinkz_burning_army_custom_730.prototype.GetBehavior(self)
    return bit.bor(
        bit.bor(
            bit.bor(DOTA_ABILITY_BEHAVIOR_POINT, DOTA_ABILITY_BEHAVIOR_VECTOR_TARGETING),
            DOTA_ABILITY_BEHAVIOR_HIDDEN
        ),
        DOTA_ABILITY_BEHAVIOR_SHOW_IN_GUIDES
    )
end
function clinkz_burning_army_custom_730.prototype.GetVectorTargetRange(self)
    return self:GetSpecialValueFor("range")
end
function clinkz_burning_army_custom_730.prototype.OnAbilityPhaseStart(self)
    self:GetCaster():EmitSound("Hero_Clinkz.BurningArmy.Cast")
    return true
end
function clinkz_burning_army_custom_730.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():StopSound("Hero_Clinkz.BurningArmy.Cast")
end
function clinkz_burning_army_custom_730.prototype.OnVectorCastStart(self, location, direction)
    local caster = self:GetCaster()
    local spawn_count = self:GetSpecialValueFor("count")
    local spawn_distance = self:GetSpecialValueFor("range") / (spawn_count - 1)
    local spawn_interval = self:GetSpecialValueFor("spawn_interval")
    local spawn_position = location
    Timers:CreateTimer(
        0.03,
        function()
            ____exports.createSkeletonArcher(nil, caster, self, spawn_position)
            spawn_position = spawn_position:__add(direction:__mul(spawn_distance))
            spawn_count = spawn_count - 1
            if spawn_count <= 0 then
                return
            end
            return spawn_interval
        end
    )
    caster:EmitSound("Hero_Clinkz.BurningArmy.SpellStart")
    if caster:GetUnitName() ~= "npc_dota_hero_clinkz" or RollPercentage(50) then
        return
    end
    if RollPercentage(33) then
        caster:EmitSoundOnClient("clinkz_clinkz_ability_sear_01")
    elseif RollPercentage(33) then
        caster:EmitSoundOnClient("clinkz_clinkz_rival_14")
    else
        local random = RollVoiceLines(
            nil,
            1,
            3,
            5,
            6
        )
        local response = "clinkz_clinkz_ability_pact_" .. random
        caster:EmitSoundOnClient(response)
    end
end
clinkz_burning_army_custom_730 = __TS__Decorate(
    clinkz_burning_army_custom_730,
    clinkz_burning_army_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "clinkz_burning_army_custom_730"}
)
____exports.clinkz_burning_army_custom_730 = clinkz_burning_army_custom_730
return ____exports
