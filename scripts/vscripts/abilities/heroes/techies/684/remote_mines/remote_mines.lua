local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 8,["17"] = 9,["18"] = 8,["19"] = 9,["21"] = 9,["22"] = 13,["23"] = 17,["24"] = 18,["25"] = 19,["26"] = 17,["27"] = 22,["28"] = 23,["29"] = 22,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 30,["34"] = 31,["35"] = 33,["36"] = 34,["37"] = 36,["38"] = 37,["39"] = 38,["40"] = 39,["41"] = 40,["42"] = 41,["43"] = 42,["45"] = 45,["46"] = 45,["47"] = 45,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 45,["53"] = 46,["54"] = 47,["55"] = 56,["56"] = 57,["57"] = 59,["58"] = 63,["59"] = 63,["60"] = 63,["61"] = 64,["64"] = 66,["65"] = 71,["66"] = 71,["67"] = 71,["68"] = 71,["69"] = 71,["70"] = 71,["71"] = 71,["72"] = 71,["73"] = 71,["74"] = 72,["75"] = 73,["76"] = 73,["77"] = 73,["78"] = 73,["79"] = 73,["80"] = 73,["81"] = 73,["82"] = 73,["83"] = 73,["84"] = 74,["85"] = 74,["86"] = 74,["87"] = 74,["88"] = 74,["89"] = 74,["90"] = 74,["91"] = 74,["92"] = 74,["93"] = 75,["94"] = 63,["95"] = 63,["96"] = 78,["97"] = 80,["98"] = 26,["99"] = 83,["100"] = 84,["101"] = 86,["102"] = 87,["103"] = 88,["104"] = 90,["106"] = 93,["107"] = 94,["108"] = 96,["110"] = 83,["111"] = 100,["112"] = 101,["113"] = 102,["114"] = 104,["115"] = 105,["116"] = 106,["117"] = 108,["119"] = 111,["120"] = 112,["121"] = 114,["123"] = 117,["124"] = 118,["125"] = 119,["126"] = 120,["127"] = 121,["128"] = 122,["129"] = 123,["131"] = 126,["132"] = 126,["133"] = 126,["134"] = 126,["135"] = 126,["136"] = 126,["137"] = 126,["138"] = 126,["139"] = 127,["140"] = 127,["141"] = 127,["142"] = 127,["143"] = 128,["144"] = 129,["145"] = 135,["146"] = 135,["147"] = 135,["148"] = 135,["149"] = 135,["150"] = 135,["151"] = 144,["152"] = 144,["153"] = 144,["154"] = 144,["155"] = 144,["156"] = 145,["157"] = 146,["158"] = 146,["159"] = 146,["160"] = 146,["161"] = 146,["162"] = 147,["163"] = 149,["164"] = 150,["165"] = 152,["168"] = 154,["169"] = 154,["170"] = 154,["171"] = 154,["172"] = 155,["173"] = 156,["174"] = 100,["175"] = 9,["176"] = 9,["177"] = 9,["178"] = 8,["181"] = 9});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_dummy = require("abilities.generic.modifier_dummy")
local MakeDummy = ____modifier_dummy.MakeDummy
local ____modifier_techies_remote_mines_custom_684 = require("abilities.heroes.techies.684.remote_mines.modifier_techies_remote_mines_custom_684")
local modifier_techies_remote_mines_custom_684 = ____modifier_techies_remote_mines_custom_684.modifier_techies_remote_mines_custom_684
____exports.techies_remote_mines_custom_684 = __TS__Class()
local techies_remote_mines_custom_684 = ____exports.techies_remote_mines_custom_684
techies_remote_mines_custom_684.name = "techies_remote_mines_custom_684"
__TS__ClassExtends(techies_remote_mines_custom_684, CustomAbility)
function techies_remote_mines_custom_684.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "techies_remote_mines")
end
function techies_remote_mines_custom_684.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_remote_mines_custom_684.prototype.GetAssociatedSecondaryAbilities(self)
    return "techies_focused_detonate_custom_684"
end
function techies_remote_mines_custom_684.prototype.OnAbilityPhaseStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local castPoint = caster:GetCastPoint(false)
    local rate = 1.125 / castPoint
    caster:RemoveGesture(ACT_DOTA_CAST_ABILITY_6)
    caster:StartGestureWithPlaybackRate(ACT_DOTA_CAST_ABILITY_6, rate)
    local model = "models/heroes/techies/fx_techies_remotebomb.vmdl"
    if caster:GetUnitName() == "npc_dota_hero_rubick" then
        model = "models/heroes/techies/fx_techies_remotebomb_rubick.vmdl"
    elseif caster:HasArcana("npc_dota_hero_techies") then
        model = "models/items/techies/bigshot/bigshot_remotebomb.vmdl"
    elseif caster:HasWearable("models/items/techies/techies_ti9_immortal_cart/techies_ti9_immortal_cart.vmdl") then
        model = "models/items/techies/techies_ti9_immortal_remote_mine/techies_ti9_immortal_remote_mine.vmdl"
    end
    self.mine = CreateUnitByName(
        "npc_dota_techies_684_remote_mine_custom",
        caster:GetAbsOrigin(),
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    MakeDummy(nil, self.mine)
    self.mine:AddNewModifier(caster, self, "modifier_kill", {duration = 3})
    self.mine:SetOriginalModel(model)
    self.mine:SetModel(model)
    local particle_name = caster:HasArcana("npc_dota_hero_techies") and "particles/econ/items/techies/techies_arcana/techies_remote_mine_plant_arcana.vpcf" or "particles/units/heroes/hero_techies/pre_731/techies_remote_mine_plant.vpcf"
    Timers:CreateTimer(
        castPoint / 3,
        function()
            if not self.mine then
                return
            end
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
        end
    )
    caster:EmitSound("Hero_Techies.RemoteMine.Toss")
    return true
end
function techies_remote_mines_custom_684.prototype.OnAbilityPhaseInterrupted(self)
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
function techies_remote_mines_custom_684.prototype.OnSpellStart(self)
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
    local model = "models/heroes/techies/fx_techies_remotebomb.vmdl"
    if caster:GetUnitName() == "npc_dota_hero_rubick" then
        model = "models/heroes/techies/fx_techies_remotebomb_rubick.vmdl"
    elseif caster:HasArcana("npc_dota_hero_techies") then
        model = "models/items/techies/bigshot/bigshot_remotebomb.vmdl"
    elseif caster:HasWearable("models/items/techies/techies_ti9_immortal_cart/techies_ti9_immortal_cart.vmdl") then
        model = "models/items/techies/techies_ti9_immortal_remote_mine/techies_ti9_immortal_remote_mine.vmdl"
    end
    local mine = CreateUnitByName(
        "npc_dota_techies_684_remote_mine_custom",
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
    modifier_techies_remote_mines_custom_684:apply(mine, caster, self, {})
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
    mine:SetOriginalModel(model)
    mine:SetModel(model)
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
techies_remote_mines_custom_684 = __TS__Decorate(
    techies_remote_mines_custom_684,
    techies_remote_mines_custom_684,
    {registerAbility(nil)},
    {kind = "class", name = "techies_remote_mines_custom_684"}
)
____exports.techies_remote_mines_custom_684 = techies_remote_mines_custom_684
return ____exports
