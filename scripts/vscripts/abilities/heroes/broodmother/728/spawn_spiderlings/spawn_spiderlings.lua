local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["21"] = 7,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 12,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 20,["33"] = 22,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 23,["43"] = 23,["44"] = 33,["45"] = 35,["46"] = 17,["47"] = 38,["48"] = 39,["49"] = 41,["52"] = 42,["55"] = 44,["56"] = 44,["57"] = 44,["58"] = 44,["59"] = 44,["60"] = 44,["61"] = 53,["62"] = 53,["63"] = 53,["64"] = 53,["65"] = 53,["66"] = 53,["67"] = 53,["68"] = 60,["69"] = 62,["70"] = 38,["71"] = 65,["72"] = 66,["73"] = 68,["74"] = 68,["75"] = 68,["76"] = 68,["77"] = 68,["78"] = 68,["79"] = 68,["80"] = 68,["81"] = 69,["82"] = 69,["83"] = 69,["84"] = 69,["85"] = 70,["86"] = 72,["87"] = 73,["88"] = 73,["89"] = 73,["90"] = 73,["91"] = 75,["92"] = 79,["93"] = 80,["94"] = 82,["95"] = 83,["96"] = 85,["97"] = 86,["98"] = 87,["100"] = 90,["101"] = 91,["103"] = 99,["104"] = 100,["105"] = 102,["106"] = 65,["107"] = 7,["108"] = 7,["109"] = 7,["110"] = 6,["113"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_broodmother_spawn_spiderlings_custom_728 = require("abilities.heroes.broodmother.728.spawn_spiderlings.modifier_broodmother_spawn_spiderlings_custom_728")
local modifier_broodmother_spawn_spiderlings_custom_728 = ____modifier_broodmother_spawn_spiderlings_custom_728.modifier_broodmother_spawn_spiderlings_custom_728
local ____modifier_broodmother_spawn_spiderlings_custom_728_bonuses = require("abilities.heroes.broodmother.728.spawn_spiderlings.modifier_broodmother_spawn_spiderlings_custom_728_bonuses")
local modifier_broodmother_spawn_spiderlings_custom_728_bonuses = ____modifier_broodmother_spawn_spiderlings_custom_728_bonuses.modifier_broodmother_spawn_spiderlings_custom_728_bonuses
____exports.broodmother_spawn_spiderlings_custom_728 = __TS__Class()
local broodmother_spawn_spiderlings_custom_728 = ____exports.broodmother_spawn_spiderlings_custom_728
broodmother_spawn_spiderlings_custom_728.name = "broodmother_spawn_spiderlings_custom_728"
__TS__ClassExtends(broodmother_spawn_spiderlings_custom_728, CustomAbility)
function broodmother_spawn_spiderlings_custom_728.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "broodmother_spawn_spiderlings")
end
function broodmother_spawn_spiderlings_custom_728.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_broodmother.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_broodmother.vsndevts")
end
function broodmother_spawn_spiderlings_custom_728.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local projectile_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_broodmother/broodmother_web_cast.vpcf", caster)
    local info = {
        Ability = self,
        EffectName = projectile_name,
        Source = caster,
        Target = target,
        bDodgeable = true,
        iMoveSpeed = 1200,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
        vSourceLoc = caster:GetAbsOrigin()
    }
    ProjectileManager:CreateTrackingProjectile(info)
    caster:EmitSound("Hero_Broodmother.SpawnSpiderlingsCast")
end
function broodmother_spawn_spiderlings_custom_728.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    modifier_broodmother_spawn_spiderlings_custom_728:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, 2)}
    )
    local damageTable = {
        attacker = caster,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    target:EmitSound("Hero_Broodmother.SpawnSpiderlingsImpact")
end
function broodmother_spawn_spiderlings_custom_728.prototype.SpawnSpiderling(self, origin)
    local caster = self:GetCaster()
    local spiderling = CreateUnitByName(
        "npc_dota_broodmother_728_spiderling_custom",
        origin,
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    spiderling:SetControllableByPlayer(
        caster:GetPlayerID(),
        false
    )
    spiderling:SetOwner(caster)
    FindClearSpaceForUnit(spiderling, origin, true)
    ResolveNPCPositions(
        origin,
        spiderling:GetHullRadius()
    )
    local modelName = caster:HasWearable("models/items/broodmother/lycosidae_back/lycosidae_back.vmdl") and "models/items/broodmother/spiderling/lycosidae_spiderling/lycosidae_spiderling.vmdl" or "models/heroes/broodmother/spiderling.vmdl"
    spiderling:SetOriginalModel(modelName)
    spiderling:SetModel(modelName)
    if caster:HasTalent("special_bonus_unique_broodmother_728_custom_4") then
        local baseHealth = spiderling:GetBaseMaxHealth()
        spiderling:SetBaseMaxHealth(baseHealth + 350)
        spiderling:SetMaxHealth(baseHealth + 350)
        spiderling:SetHealth(baseHealth + 350)
    end
    if caster:HasTalent("special_bonus_unique_broodmother_728_custom_2") then
        modifier_broodmother_spawn_spiderlings_custom_728_bonuses:apply(spiderling, caster, self, {})
    end
    spiderling:FindAbilityByName("broodmother_poison_sting_custom_728"):SetLevel(1)
    spiderling:FindAbilityByName("broodmother_spawn_spiderite_custom_728"):SetLevel(1)
    spiderling:AddNewModifier(caster, self, "modifier_kill", {duration = 60})
end
broodmother_spawn_spiderlings_custom_728 = __TS__Decorate(
    broodmother_spawn_spiderlings_custom_728,
    broodmother_spawn_spiderlings_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "broodmother_spawn_spiderlings_custom_728"}
)
____exports.broodmother_spawn_spiderlings_custom_728 = broodmother_spawn_spiderlings_custom_728
return ____exports
