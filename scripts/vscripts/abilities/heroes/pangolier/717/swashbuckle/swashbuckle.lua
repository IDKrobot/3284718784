local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 11,["26"] = 16,["27"] = 17,["28"] = 17,["29"] = 17,["30"] = 17,["31"] = 17,["32"] = 17,["33"] = 17,["34"] = 16,["35"] = 20,["36"] = 21,["37"] = 20,["38"] = 24,["39"] = 25,["40"] = 27,["41"] = 29,["42"] = 31,["43"] = 33,["44"] = 35,["45"] = 37,["46"] = 41,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 41,["54"] = 41,["55"] = 37,["56"] = 54,["57"] = 24,["58"] = 57,["59"] = 58,["60"] = 60,["63"] = 62,["64"] = 63,["65"] = 63,["66"] = 63,["67"] = 63,["68"] = 64,["69"] = 65,["70"] = 66,["71"] = 67,["72"] = 68,["74"] = 57,["75"] = 6,["76"] = 6,["77"] = 6,["78"] = 5,["81"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_pangolier_swashbuckle_custom_717_dash = require("abilities.heroes.pangolier.717.swashbuckle.modifier_pangolier_swashbuckle_custom_717_dash")
local modifier_pangolier_swashbuckle_custom_717_dash = ____modifier_pangolier_swashbuckle_custom_717_dash.modifier_pangolier_swashbuckle_custom_717_dash
____exports.pangolier_swashbuckle_custom_717 = __TS__Class()
local pangolier_swashbuckle_custom_717 = ____exports.pangolier_swashbuckle_custom_717
pangolier_swashbuckle_custom_717.name = "pangolier_swashbuckle_custom_717"
__TS__ClassExtends(pangolier_swashbuckle_custom_717, CustomAbility)
function pangolier_swashbuckle_custom_717.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "pangolier_swashbuckle")
end
function pangolier_swashbuckle_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pangolier.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pangolier.vsndevts")
end
function pangolier_swashbuckle_custom_717.prototype.GetBehavior(self)
    return bit.bor(
        bit.bor(
            bit.bor(DOTA_ABILITY_BEHAVIOR_POINT, DOTA_ABILITY_BEHAVIOR_VECTOR_TARGETING),
            DOTA_ABILITY_BEHAVIOR_DONT_RESUME_MOVEMENT
        ),
        DOTA_ABILITY_BEHAVIOR_ROOT_DISABLES
    )
end
function pangolier_swashbuckle_custom_717.prototype.RequiresFacing(self)
    return false
end
function pangolier_swashbuckle_custom_717.prototype.OnVectorCastStart(self, point, direction)
    local caster = self:GetCaster()
    caster:RemoveModifierByName("modifier_pangolier_gyroshell_custom_717")
    local speed = self:GetSpecialValueFor("dash_speed")
    local distance = point:__sub(caster:GetAbsOrigin()):Length2D()
    local toward = caster:GetAbsOrigin():__add(point:__sub(caster:GetAbsOrigin()):__mul(50))
    caster:SetForwardVector(direction)
    modifier_pangolier_swashbuckle_custom_717_dash:apply(caster, caster, self, {
        duration = distance / speed,
        distance = distance,
        x = point.x,
        y = point.y,
        z = point.z,
        attack_x = direction.x,
        attack_y = direction.y,
        toward_x = toward.x,
        toward_y = toward.y
    })
    self:RollCastResponse()
end
function pangolier_swashbuckle_custom_717.prototype.RollCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_pangolier" then
        return
    end
    if RollPercentage(50) then
        local response = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 11))
        )
        caster:EmitSoundOnClient("pangolin_pangolin_ability1_" .. response)
    elseif RollPercentage(25) then
        caster:EmitSoundOnClient("pangolin_pangolin_ability1_12")
    elseif RollPercentage(20) then
        caster:EmitSoundOnClient("pangolin_pangolin_ability1_13")
    end
end
pangolier_swashbuckle_custom_717 = __TS__Decorate(
    pangolier_swashbuckle_custom_717,
    pangolier_swashbuckle_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "pangolier_swashbuckle_custom_717"}
)
____exports.pangolier_swashbuckle_custom_717 = pangolier_swashbuckle_custom_717
return ____exports
