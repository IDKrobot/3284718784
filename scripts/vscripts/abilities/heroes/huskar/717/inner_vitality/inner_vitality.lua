local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["21"] = 7,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 14,["26"] = 12,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 20,["33"] = 22,["34"] = 24,["35"] = 33,["36"] = 42,["37"] = 43,["38"] = 48,["39"] = 48,["40"] = 48,["41"] = 48,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 48,["46"] = 48,["47"] = 49,["48"] = 51,["49"] = 53,["50"] = 54,["52"] = 55,["55"] = 57,["60"] = 59,["65"] = 61,["69"] = 64,["70"] = 64,["71"] = 64,["72"] = 64,["73"] = 64,["74"] = 64,["75"] = 64,["76"] = 64,["77"] = 64,["81"] = 67,["82"] = 67,["83"] = 67,["84"] = 67,["86"] = 17,["87"] = 7,["88"] = 7,["89"] = 7,["90"] = 6,["93"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_huskar_inner_vitality_custom_717 = require("abilities.heroes.huskar.717.inner_vitality.modifier_huskar_inner_vitality_custom_717")
local modifier_huskar_inner_vitality_custom_717 = ____modifier_huskar_inner_vitality_custom_717.modifier_huskar_inner_vitality_custom_717
local ____modifier_huskar_inner_vitality_custom_717_handler = require("abilities.heroes.huskar.717.inner_vitality.modifier_huskar_inner_vitality_custom_717_handler")
local modifier_huskar_inner_vitality_custom_717_handler = ____modifier_huskar_inner_vitality_custom_717_handler.modifier_huskar_inner_vitality_custom_717_handler
____exports.huskar_inner_vitality_custom_717 = __TS__Class()
local huskar_inner_vitality_custom_717 = ____exports.huskar_inner_vitality_custom_717
huskar_inner_vitality_custom_717.name = "huskar_inner_vitality_custom_717"
__TS__ClassExtends(huskar_inner_vitality_custom_717, CustomAbility)
function huskar_inner_vitality_custom_717.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "huskar_inner_vitality")
end
function huskar_inner_vitality_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_huskar.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_huskar.vsndevts")
end
function huskar_inner_vitality_custom_717.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local duration = self:GetSpecialValueFor("duration")
    modifier_huskar_inner_vitality_custom_717_handler:apply(target, caster, self, {duration = duration})
    modifier_huskar_inner_vitality_custom_717:apply(target, caster, self, {duration = duration})
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_huskar/huskar_inner_vitality_cast.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        caster,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        Vector(0, 0, 0),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    target:EmitSound("Hero_Huskar.BerserkersBlood.Cast")
    if caster:GetUnitName() == "npc_dota_hero_huskar" then
        local response_range = {}
        repeat
            local ____switch7 = target:GetPrimaryAttribute()
            local ____cond7 = ____switch7 == DOTA_ATTRIBUTE_STRENGTH
            if ____cond7 then
                response_range = {1, 2, 3}
                break
            end
            ____cond7 = ____cond7 or ____switch7 == DOTA_ATTRIBUTE_STRENGTH
            if ____cond7 then
                response_range = {4, 5, 6}
                break
            end
            ____cond7 = ____cond7 or ____switch7 == DOTA_ATTRIBUTE_STRENGTH
            if ____cond7 then
                response_range = {7, 8, 9, 10}
                break
            end
            do
                response_range = {
                    2,
                    3,
                    5,
                    6,
                    7,
                    9,
                    10
                }
                break
            end
        until true
        caster:EmitSoundOnClient("huskar_husk_ability_innervit_" .. RollVoiceLines(
            nil,
            unpack(response_range)
        ))
    end
end
huskar_inner_vitality_custom_717 = __TS__Decorate(
    huskar_inner_vitality_custom_717,
    huskar_inner_vitality_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "huskar_inner_vitality_custom_717"}
)
____exports.huskar_inner_vitality_custom_717 = huskar_inner_vitality_custom_717
return ____exports
