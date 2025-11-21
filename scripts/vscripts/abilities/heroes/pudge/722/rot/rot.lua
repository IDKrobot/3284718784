local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 13,["27"] = 18,["28"] = 19,["29"] = 18,["30"] = 22,["31"] = 23,["32"] = 22,["33"] = 26,["34"] = 27,["35"] = 29,["36"] = 30,["37"] = 37,["38"] = 38,["40"] = 41,["42"] = 43,["44"] = 43,["47"] = 26,["48"] = 47,["49"] = 48,["50"] = 50,["51"] = 51,["52"] = 53,["53"] = 54,["54"] = 54,["55"] = 54,["56"] = 54,["57"] = 54,["58"] = 55,["59"] = 56,["60"] = 57,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 58,["66"] = 60,["67"] = 60,["68"] = 60,["69"] = 60,["70"] = 60,["71"] = 61,["73"] = 64,["74"] = 66,["75"] = 67,["76"] = 67,["77"] = 67,["78"] = 68,["79"] = 67,["80"] = 67,["82"] = 47,["83"] = 6,["84"] = 6,["85"] = 6,["86"] = 5,["89"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_pudge_rot_custom_722 = require("abilities.heroes.pudge.722.rot.modifier_pudge_rot_custom_722")
local modifier_pudge_rot_custom_722 = ____modifier_pudge_rot_custom_722.modifier_pudge_rot_custom_722
____exports.pudge_rot_custom_722 = __TS__Class()
local pudge_rot_custom_722 = ____exports.pudge_rot_custom_722
pudge_rot_custom_722.name = "pudge_rot_custom_722"
__TS__ClassExtends(pudge_rot_custom_722, CustomAbility)
function pudge_rot_custom_722.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "pudge_rot")
    self.phraseCooldown = false
end
function pudge_rot_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pudge.vsndevts")
end
function pudge_rot_custom_722.prototype.ProcsMagicStick(self)
    return false
end
function pudge_rot_custom_722.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("rot_radius")
end
function pudge_rot_custom_722.prototype.OnToggle(self)
    local caster = self:GetCaster()
    if self:GetToggleState() then
        modifier_pudge_rot_custom_722:apply(caster, caster, self, {})
        if not caster:IsChanneling() then
            caster:StartGesture(ACT_DOTA_CAST_ABILITY_ROT)
        end
        self:EmitPhrase()
    else
        local ____opt_0 = caster:FindModifierByName(modifier_pudge_rot_custom_722.name)
        if ____opt_0 ~= nil then
            ____opt_0:Destroy()
        end
    end
end
function pudge_rot_custom_722.prototype.EmitPhrase(self)
    local caster = self:GetCaster()
    if not self.phraseCooldown and caster:GetUnitName() == "npc_dota_hero_pudge" then
        local soundName = ""
        if caster:HasArcana() then
            local random = RollVoiceLines(
                nil,
                2,
                __TS__Spread(range(nil, 7, 13))
            )
            soundName = "pudge_pud_arc_ability_rot_" .. random
        elseif caster:HasPersona() then
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 10))
            )
            soundName = "pudge_toy_pug_ability_rot_" .. random
        else
            local random = RollVoiceLines(
                nil,
                2,
                __TS__Spread(range(nil, 7, 13))
            )
            soundName = "pudge_pud_ability_rot_" .. random
        end
        caster:EmitSoundOnClient(soundName)
        self.phraseCooldown = true
        Timers:CreateTimer(
            10,
            function()
                self.phraseCooldown = false
            end
        )
    end
end
pudge_rot_custom_722 = __TS__Decorate(
    pudge_rot_custom_722,
    pudge_rot_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "pudge_rot_custom_722"}
)
____exports.pudge_rot_custom_722 = pudge_rot_custom_722
return ____exports
