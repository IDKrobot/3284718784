local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 7,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 8,["23"] = 13,["24"] = 14,["25"] = 13,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 21,["30"] = 21,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 21,["35"] = 21,["36"] = 21,["37"] = 22,["38"] = 22,["39"] = 22,["40"] = 22,["41"] = 23,["42"] = 25,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 28,["48"] = 32,["49"] = 33,["50"] = 35,["51"] = 36,["52"] = 38,["53"] = 39,["54"] = 40,["56"] = 43,["57"] = 44,["59"] = 52,["60"] = 17,["61"] = 7,["62"] = 7,["63"] = 7,["64"] = 6,["67"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_broodmother_spawn_spiderite_custom_728 = require("abilities.heroes.broodmother.728.spawn_spiderite.modifier_broodmother_spawn_spiderite_custom_728")
local modifier_broodmother_spawn_spiderite_custom_728 = ____modifier_broodmother_spawn_spiderite_custom_728.modifier_broodmother_spawn_spiderite_custom_728
local ____modifier_broodmother_spawn_spiderlings_custom_728_bonuses = require("abilities.heroes.broodmother.728.spawn_spiderlings.modifier_broodmother_spawn_spiderlings_custom_728_bonuses")
local modifier_broodmother_spawn_spiderlings_custom_728_bonuses = ____modifier_broodmother_spawn_spiderlings_custom_728_bonuses.modifier_broodmother_spawn_spiderlings_custom_728_bonuses
____exports.broodmother_spawn_spiderite_custom_728 = __TS__Class()
local broodmother_spawn_spiderite_custom_728 = ____exports.broodmother_spawn_spiderite_custom_728
broodmother_spawn_spiderite_custom_728.name = "broodmother_spawn_spiderite_custom_728"
__TS__ClassExtends(broodmother_spawn_spiderite_custom_728, BaseAbility)
function broodmother_spawn_spiderite_custom_728.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_broodmother.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_broodmother.vsndevts")
end
function broodmother_spawn_spiderite_custom_728.prototype.GetIntrinsicModifierName(self)
    return modifier_broodmother_spawn_spiderite_custom_728.name
end
function broodmother_spawn_spiderite_custom_728.prototype.SpawnSpiderite(self, origin)
    local caster = self:GetCaster()
    local owner = caster:GetOwner()
    local spiderite = CreateUnitByName(
        "npc_dota_broodmother_728_spiderite_custom",
        origin,
        true,
        owner,
        owner,
        owner:GetTeamNumber()
    )
    spiderite:SetControllableByPlayer(
        owner:GetPlayerID(),
        false
    )
    spiderite:SetOwner(owner)
    FindClearSpaceForUnit(spiderite, origin, true)
    ResolveNPCPositions(
        origin,
        spiderite:GetHullRadius()
    )
    local modelName = owner:HasWearable("models/items/broodmother/lycosidae_back/lycosidae_back.vmdl") and "models/items/broodmother/spiderling/lycosidae_spiderling/lycosidae_spiderling.vmdl" or "models/heroes/broodmother/spiderling.vmdl"
    spiderite:SetOriginalModel(modelName)
    spiderite:SetModel(modelName)
    if owner:HasTalent("special_bonus_unique_broodmother_728_custom_4") then
        local baseHealth = spiderite:GetBaseMaxHealth()
        spiderite:SetBaseMaxHealth(baseHealth + 350)
        spiderite:SetMaxHealth(baseHealth + 350)
        spiderite:SetHealth(baseHealth + 350)
    end
    if owner:HasTalent("special_bonus_unique_broodmother_728_custom_2") then
        modifier_broodmother_spawn_spiderlings_custom_728_bonuses:apply(spiderite, caster, self, {})
    end
    spiderite:AddNewModifier(owner, self, "modifier_kill", {duration = 60})
end
broodmother_spawn_spiderite_custom_728 = __TS__Decorate(
    broodmother_spawn_spiderite_custom_728,
    broodmother_spawn_spiderite_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "broodmother_spawn_spiderite_custom_728"}
)
____exports.broodmother_spawn_spiderite_custom_728 = broodmother_spawn_spiderite_custom_728
return ____exports
