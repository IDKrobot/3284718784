local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 7,["19"] = 8,["20"] = 7,["21"] = 8,["23"] = 8,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 13,["29"] = 18,["30"] = 19,["31"] = 20,["32"] = 21,["35"] = 23,["36"] = 24,["37"] = 24,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 35,["46"] = 37,["47"] = 38,["48"] = 39,["49"] = 40,["51"] = 42,["54"] = 42,["56"] = 42,["57"] = 42,["59"] = 44,["61"] = 18,["62"] = 8,["63"] = 8,["64"] = 8,["65"] = 7,["68"] = 8});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_dazzle_shallow_grave_custom_734 = require("abilities.heroes.dazzle.734.shallow_grave.modifier_dazzle_shallow_grave_custom_734")
local modifier_dazzle_shallow_grave_custom_734 = ____modifier_dazzle_shallow_grave_custom_734.modifier_dazzle_shallow_grave_custom_734
____exports.dazzle_shallow_grave_custom_734 = __TS__Class()
local dazzle_shallow_grave_custom_734 = ____exports.dazzle_shallow_grave_custom_734
dazzle_shallow_grave_custom_734.name = "dazzle_shallow_grave_custom_734"
__TS__ClassExtends(dazzle_shallow_grave_custom_734, CustomAbility)
function dazzle_shallow_grave_custom_734.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "dazzle_shallow_grave")
end
function dazzle_shallow_grave_custom_734.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_dazzle.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_dazzle.vsndevts")
end
function dazzle_shallow_grave_custom_734.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local juju = caster:FindAbilityByName("dazzle_bad_juju_custom_734")
    if juju and juju:IsTrained() then
        juju:TargetModifier(target)
    end
    modifier_dazzle_shallow_grave_custom_734:apply(
        target,
        caster,
        self,
        {duration = self:GetSpecialValueFor("duration")}
    )
    target:EmitSound("Hero_Dazzle.Shallow_Grave")
    if caster:GetUnitName() == "npc_dota_hero_dazzle" then
        local response
        if caster == target then
            response = "dazzle_dazz_ability_shalgrave_" .. RollVoiceLines(nil, 1, 3, 10)
        else
            local ____RollVoiceLines_1 = RollVoiceLines
            local ____array_0 = __TS__SparseArrayNew(
                nil,
                __TS__Spread(range(nil, 1, 4))
            )
            __TS__SparseArrayPush(____array_0, 6, 7, 9)
            response = "dazzle_dazz_ability_shalgrave_" .. ____RollVoiceLines_1(__TS__SparseArraySpread(____array_0))
        end
        caster:EmitSoundOnClient(response)
    end
end
dazzle_shallow_grave_custom_734 = __TS__Decorate(
    dazzle_shallow_grave_custom_734,
    dazzle_shallow_grave_custom_734,
    {registerAbility(nil)},
    {kind = "class", name = "dazzle_shallow_grave_custom_734"}
)
____exports.dazzle_shallow_grave_custom_734 = dazzle_shallow_grave_custom_734
return ____exports
