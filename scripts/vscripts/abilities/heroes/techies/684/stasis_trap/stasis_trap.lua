local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 11,["24"] = 16,["25"] = 17,["26"] = 16,["27"] = 20,["28"] = 21,["29"] = 22,["30"] = 24,["31"] = 28,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 39,["42"] = 40,["43"] = 42,["44"] = 47,["45"] = 48,["46"] = 49,["47"] = 49,["48"] = 49,["49"] = 49,["50"] = 49,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 49,["55"] = 51,["56"] = 53,["57"] = 20,["58"] = 56,["59"] = 57,["60"] = 59,["61"] = 60,["62"] = 61,["63"] = 63,["65"] = 66,["66"] = 67,["67"] = 69,["69"] = 56,["70"] = 73,["71"] = 74,["72"] = 75,["73"] = 77,["74"] = 78,["75"] = 79,["76"] = 81,["78"] = 84,["79"] = 85,["80"] = 87,["82"] = 90,["83"] = 92,["84"] = 96,["85"] = 96,["86"] = 96,["87"] = 96,["88"] = 96,["89"] = 96,["90"] = 96,["91"] = 96,["92"] = 97,["93"] = 97,["94"] = 97,["95"] = 97,["96"] = 98,["97"] = 99,["98"] = 105,["99"] = 113,["100"] = 113,["101"] = 113,["102"] = 113,["103"] = 113,["104"] = 115,["105"] = 116,["106"] = 118,["107"] = 120,["110"] = 121,["113"] = 126,["114"] = 126,["115"] = 126,["116"] = 126,["117"] = 127,["118"] = 129,["119"] = 73,["120"] = 7,["121"] = 7,["122"] = 7,["123"] = 6,["126"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_techies_stasis_trap_custom_684 = require("abilities.heroes.techies.684.stasis_trap.modifier_techies_stasis_trap_custom_684")
local modifier_techies_stasis_trap_custom_684 = ____modifier_techies_stasis_trap_custom_684.modifier_techies_stasis_trap_custom_684
local ____modifier_dummy = require("abilities.generic.modifier_dummy")
local MakeDummy = ____modifier_dummy.MakeDummy
____exports.techies_stasis_trap_custom_684 = __TS__Class()
local techies_stasis_trap_custom_684 = ____exports.techies_stasis_trap_custom_684
techies_stasis_trap_custom_684.name = "techies_stasis_trap_custom_684"
__TS__ClassExtends(techies_stasis_trap_custom_684, BaseAbility)
function techies_stasis_trap_custom_684.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_stasis_trap_custom_684.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("activation_radius")
end
function techies_stasis_trap_custom_684.prototype.OnAbilityPhaseStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local model = caster:HasArcana("npc_dota_hero_techies") and "models/items/techies/bigshot/fx_bigshot_stasis.vmdl" or "models/heroes/techies/fx_techiesfx_stasis.vmdl"
    self.mine = CreateUnitByName(
        "npc_dota_techies_684_remote_mine_custom",
        point,
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    MakeDummy(nil, self.mine)
    self.mine:AddNewModifier(caster, self, "modifier_kill", {duration = 3})
    self.mine:SetOriginalModel(model)
    self.mine:SetModel(model)
    self.mine_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_stasis_trap_plant.vpcf", PATTACH_ABSORIGIN, caster)
    ParticleManager:SetParticleControl(self.mine_particle, 0, point)
    ParticleManager:SetParticleControl(self.mine_particle, 1, point)
    ParticleManager:SetParticleControlEnt(
        self.mine_particle,
        2,
        self.mine,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        self.mine:GetAbsOrigin(),
        true
    )
    caster:EmitSound("Hero_Techies.StasisTrap.Plant")
    return true
end
function techies_stasis_trap_custom_684.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():StopSound("Hero_Techies.StasisTrap.Plant")
    if self.mine_particle then
        ParticleManager:DestroyParticle(self.mine_particle, true)
        ParticleManager:ReleaseParticleIndex(self.mine_particle)
        self.mine_particle = nil
    end
    if IsValidEntity(self.mine) then
        UTIL_Remove(self.mine)
        self.mine = nil
    end
end
function techies_stasis_trap_custom_684.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    if self.mine_particle then
        ParticleManager:DestroyParticle(self.mine_particle, false)
        ParticleManager:ReleaseParticleIndex(self.mine_particle)
        self.mine_particle = nil
    end
    if IsValidEntity(self.mine) then
        UTIL_Remove(self.mine)
        self.mine = nil
    end
    local duration = self:GetSpecialValueFor("duration")
    local model = caster:HasArcana("npc_dota_hero_techies") and "models/items/techies/bigshot/fx_bigshot_stasis.vmdl" or "models/heroes/techies/fx_techiesfx_stasis.vmdl"
    local trap = CreateUnitByName(
        "npc_dota_techies_684_stasis_trap_custom",
        point,
        false,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    trap:SetControllableByPlayer(
        caster:GetPlayerOwnerID(),
        true
    )
    trap:SetOwner(caster)
    modifier_techies_stasis_trap_custom_684:apply(trap, caster, self, {})
    trap:AddNewModifier(caster, self, "modifier_kill", {duration = duration})
    FindClearSpaceForUnit(
        trap,
        trap:GetAbsOrigin(),
        true
    )
    trap:SetOriginalModel(model)
    trap:SetModel(model)
    trap:StartGesture(ACT_DOTA_IDLE)
    if caster:GetUnitName() ~= "npc_dota_hero_techies" then
        return
    end
    if not RollPercentage(75) then
        return
    end
    local random = RollVoiceLines(
        nil,
        __TS__Spread(range(nil, 1, 11))
    )
    local cast_responce = "techies_tech_settrap_" .. random
    caster:EmitSoundOnClient(cast_responce)
end
techies_stasis_trap_custom_684 = __TS__Decorate(
    techies_stasis_trap_custom_684,
    techies_stasis_trap_custom_684,
    {registerAbility(nil)},
    {kind = "class", name = "techies_stasis_trap_custom_684"}
)
____exports.techies_stasis_trap_custom_684 = techies_stasis_trap_custom_684
return ____exports
