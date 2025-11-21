local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 6,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 18,["28"] = 15,["29"] = 21,["30"] = 22,["31"] = 21,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 29,["36"] = 33,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 35,["49"] = 36,["50"] = 42,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 44,["56"] = 45,["57"] = 47,["58"] = 47,["59"] = 47,["60"] = 48,["63"] = 50,["64"] = 47,["65"] = 47,["66"] = 53,["69"] = 54,["72"] = 59,["73"] = 59,["74"] = 59,["75"] = 59,["76"] = 60,["77"] = 62,["78"] = 25,["79"] = 5,["80"] = 5,["81"] = 5,["82"] = 4,["85"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_techies_stasis_trap_custom_725 = require("abilities.heroes.techies.725.stasis_trap.modifier_techies_stasis_trap_custom_725")
local modifier_techies_stasis_trap_custom_725 = ____modifier_techies_stasis_trap_custom_725.modifier_techies_stasis_trap_custom_725
____exports.techies_stasis_trap_custom_725 = __TS__Class()
local techies_stasis_trap_custom_725 = ____exports.techies_stasis_trap_custom_725
techies_stasis_trap_custom_725.name = "techies_stasis_trap_custom_725"
__TS__ClassExtends(techies_stasis_trap_custom_725, BaseAbility)
function techies_stasis_trap_custom_725.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_stasis_trap_custom_725.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("activation_radius")
end
function techies_stasis_trap_custom_725.prototype.OnAbilityPhaseStart(self)
    self:GetCaster():EmitSound("Hero_Techies.StasisTrap.Plant")
    return true
end
function techies_stasis_trap_custom_725.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():StopSound("Hero_Techies.StasisTrap.Plant")
end
function techies_stasis_trap_custom_725.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local model = caster:HasArcana("npc_dota_hero_techies") and "models/items/techies/bigshot/fx_bigshot_stasis.vmdl" or "models/heroes/techies/fx_techiesfx_stasis.vmdl"
    local trap = CreateUnitByName(
        "npc_dota_techies_725_stasis_trap_custom",
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
    modifier_techies_stasis_trap_custom_725:apply(trap, caster, self, {})
    FindClearSpaceForUnit(
        trap,
        trap:GetAbsOrigin(),
        true
    )
    trap:SetOriginalModel(model)
    trap:SetModel(model)
    Timers:CreateTimer(
        1.13,
        function()
            if not IsValidEntity(trap) then
                return
            end
            trap:StartGesture(ACT_DOTA_IDLE)
        end
    )
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
techies_stasis_trap_custom_725 = __TS__Decorate(
    techies_stasis_trap_custom_725,
    techies_stasis_trap_custom_725,
    {registerAbility(nil)},
    {kind = "class", name = "techies_stasis_trap_custom_725"}
)
____exports.techies_stasis_trap_custom_725 = techies_stasis_trap_custom_725
return ____exports
