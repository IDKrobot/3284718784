local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 8,["17"] = 9,["18"] = 8,["19"] = 9,["21"] = 9,["22"] = 13,["23"] = 17,["24"] = 18,["25"] = 19,["26"] = 17,["27"] = 22,["28"] = 23,["29"] = 22,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 30,["34"] = 31,["35"] = 33,["36"] = 34,["37"] = 36,["38"] = 38,["39"] = 38,["40"] = 38,["41"] = 38,["42"] = 38,["43"] = 38,["44"] = 38,["45"] = 38,["46"] = 39,["47"] = 40,["48"] = 49,["49"] = 50,["50"] = 52,["51"] = 56,["52"] = 61,["53"] = 61,["54"] = 61,["55"] = 61,["56"] = 61,["57"] = 61,["58"] = 61,["59"] = 61,["60"] = 61,["61"] = 62,["62"] = 63,["63"] = 63,["64"] = 63,["65"] = 63,["66"] = 63,["67"] = 63,["68"] = 63,["69"] = 63,["70"] = 63,["71"] = 64,["72"] = 64,["73"] = 64,["74"] = 64,["75"] = 64,["76"] = 64,["77"] = 64,["78"] = 64,["79"] = 64,["80"] = 65,["81"] = 67,["82"] = 69,["83"] = 26,["84"] = 72,["85"] = 73,["86"] = 75,["87"] = 76,["88"] = 77,["89"] = 79,["91"] = 82,["92"] = 83,["93"] = 85,["95"] = 72,["96"] = 89,["97"] = 90,["98"] = 91,["99"] = 93,["100"] = 94,["101"] = 95,["102"] = 97,["104"] = 100,["105"] = 101,["106"] = 103,["108"] = 106,["109"] = 108,["110"] = 108,["111"] = 108,["112"] = 108,["113"] = 108,["114"] = 108,["115"] = 108,["116"] = 108,["117"] = 109,["118"] = 109,["119"] = 109,["120"] = 109,["121"] = 110,["122"] = 111,["123"] = 117,["124"] = 117,["125"] = 117,["126"] = 117,["127"] = 117,["128"] = 117,["129"] = 126,["130"] = 126,["131"] = 126,["132"] = 126,["133"] = 126,["134"] = 127,["135"] = 128,["136"] = 128,["137"] = 128,["138"] = 128,["139"] = 128,["140"] = 129,["141"] = 131,["142"] = 132,["143"] = 134,["146"] = 136,["147"] = 136,["148"] = 136,["149"] = 136,["150"] = 137,["151"] = 138,["152"] = 89,["153"] = 141,["154"] = 142,["155"] = 144,["156"] = 145,["157"] = 146,["158"] = 147,["159"] = 148,["160"] = 149,["162"] = 152,["163"] = 141,["164"] = 9,["165"] = 9,["166"] = 9,["167"] = 8,["170"] = 9});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_dummy = require("abilities.generic.modifier_dummy")
local MakeDummy = ____modifier_dummy.MakeDummy
local ____modifier_techies_remote_mines_custom_725 = require("abilities.heroes.techies.725.remote_mines.modifier_techies_remote_mines_custom_725")
local modifier_techies_remote_mines_custom_725 = ____modifier_techies_remote_mines_custom_725.modifier_techies_remote_mines_custom_725
____exports.techies_remote_mines_custom_725 = __TS__Class()
local techies_remote_mines_custom_725 = ____exports.techies_remote_mines_custom_725
techies_remote_mines_custom_725.name = "techies_remote_mines_custom_725"
__TS__ClassExtends(techies_remote_mines_custom_725, CustomAbility)
function techies_remote_mines_custom_725.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "techies_remote_mines")
end
function techies_remote_mines_custom_725.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_remote_mines_custom_725.prototype.GetAssociatedSecondaryAbilities(self)
    return "techies_focused_detonate_custom_725"
end
function techies_remote_mines_custom_725.prototype.OnAbilityPhaseStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local castPoint = caster:GetCastPoint(false)
    local rate = 1.125 / castPoint
    caster:RemoveGesture(ACT_DOTA_CAST_ABILITY_6)
    caster:StartGestureWithPlaybackRate(ACT_DOTA_CAST_ABILITY_6, rate)
    local modelName = self:getModelName()
    self.mine = CreateUnitByName(
        "npc_dota_techies_725_remote_mine_custom",
        caster:GetAbsOrigin(),
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    MakeDummy(nil, self.mine)
    self.mine:AddNewModifier(caster, self, "modifier_kill", {duration = 3})
    self.mine:SetOriginalModel(modelName)
    self.mine:SetModel(modelName)
    local particle_name = caster:HasArcana("npc_dota_hero_techies") and "particles/econ/items/techies/techies_arcana/techies_remote_mine_plant_arcana.vpcf" or "particles/units/heroes/hero_techies/pre_731/techies_remote_mine_plant.vpcf"
    self.mine_particle = ParticleManager:CreateParticle(particle_name, PATTACH_CUSTOMORIGIN, caster)
    ParticleManager:SetParticleControlEnt(
        self.mine_particle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_remote",
        caster:GetAbsOrigin(),
        true
    )
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
    ParticleManager:SetParticleControlEnt(
        self.mine_particle,
        3,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_remote",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControl(self.mine_particle, 4, point)
    caster:EmitSound("Hero_Techies.RemoteMine.Toss")
    return true
end
function techies_remote_mines_custom_725.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():FadeGesture(ACT_DOTA_CAST_ABILITY_6)
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
function techies_remote_mines_custom_725.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    if self.mine_particle then
        ParticleManager:DestroyParticle(self.mine_particle, true)
        ParticleManager:ReleaseParticleIndex(self.mine_particle)
        self.mine_particle = nil
    end
    if IsValidEntity(self.mine) then
        UTIL_Remove(self.mine)
        self.mine = nil
    end
    local modelName = self:getModelName()
    local mine = CreateUnitByName(
        "npc_dota_techies_725_remote_mine_custom",
        point,
        false,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    mine:SetControllableByPlayer(
        caster:GetPlayerID(),
        true
    )
    mine:SetOwner(caster)
    modifier_techies_remote_mines_custom_725:apply(mine, caster, self, {})
    mine:AddNewModifier(
        caster,
        self,
        "modifier_kill",
        {duration = self:GetSpecialValueFor("duration")}
    )
    FindClearSpaceForUnit(
        mine,
        mine:GetAbsOrigin(),
        true
    )
    mine:SetForwardVector(caster:GetForwardVector())
    mine:SetAngles(
        RandomFloat(10, 15) * (RollPercentage(50) and 1 or -1),
        0,
        0
    )
    mine:EmitSound("Hero_Techies.RemoteMine.Plant")
    mine:SetOriginalModel(modelName)
    mine:SetModel(modelName)
    if caster:GetUnitName() ~= "npc_dota_hero_techies" then
        return
    end
    local cast_response = "techies_tech_remotemines_" .. RollVoiceLines(
        nil,
        RandomInt(2, 30)
    )
    local sound = RollPercentage(1) and "techies_tech_remotemines_01" or cast_response
    caster:EmitSoundOnClient(sound)
end
function techies_remote_mines_custom_725.prototype.getModelName(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() == "npc_dota_hero_rubick" then
        return "models/heroes/techies/fx_techies_remotebomb_rubick.vmdl"
    elseif caster:HasArcana("npc_dota_hero_techies") then
        return "models/items/techies/bigshot/bigshot_remotebomb.vmdl"
    elseif caster:HasWearable("models/items/techies/techies_ti9_immortal_cart/techies_ti9_immortal_cart.vmdl") then
        return "models/items/techies/techies_ti9_immortal_remote_mine/techies_ti9_immortal_remote_mine.vmdl"
    end
    return "models/heroes/techies/fx_techies_remotebomb.vmdl"
end
techies_remote_mines_custom_725 = __TS__Decorate(
    techies_remote_mines_custom_725,
    techies_remote_mines_custom_725,
    {registerAbility(nil)},
    {kind = "class", name = "techies_remote_mines_custom_725"}
)
____exports.techies_remote_mines_custom_725 = techies_remote_mines_custom_725
return ____exports
