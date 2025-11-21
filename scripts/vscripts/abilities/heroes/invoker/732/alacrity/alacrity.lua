local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 9,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 16,["28"] = 18,["29"] = 20,["30"] = 22,["31"] = 31,["32"] = 33,["33"] = 13,["34"] = 36,["35"] = 37,["36"] = 38,["39"] = 40,["42"] = 42,["43"] = 44,["44"] = 45,["45"] = 45,["46"] = 45,["47"] = 45,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 46,["53"] = 47,["54"] = 48,["56"] = 50,["57"] = 51,["59"] = 54,["60"] = 55,["61"] = 56,["62"] = 57,["64"] = 59,["66"] = 62,["68"] = 65,["69"] = 66,["70"] = 67,["71"] = 67,["72"] = 67,["73"] = 68,["74"] = 67,["75"] = 67,["77"] = 36,["78"] = 6,["79"] = 6,["80"] = 6,["81"] = 5,["84"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_alacrity_custom_732 = require("abilities.heroes.invoker.732.alacrity.modifier_invoker_alacrity_custom_732")
local modifier_invoker_alacrity_custom_732 = ____modifier_invoker_alacrity_custom_732.modifier_invoker_alacrity_custom_732
____exports.invoker_alacrity_custom_732 = __TS__Class()
local invoker_alacrity_custom_732 = ____exports.invoker_alacrity_custom_732
invoker_alacrity_custom_732.name = "invoker_alacrity_custom_732"
__TS__ClassExtends(invoker_alacrity_custom_732, BaseInvokerAbility)
function invoker_alacrity_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_alacrity")
    self.phraseCooldown = false
end
function invoker_alacrity_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    caster:StartGesture(ACT_DOTA_CAST_ALACRITY)
    local duration = self:GetSpecialValueFor("duration")
    modifier_invoker_alacrity_custom_732:apply(target, caster, self, {duration = duration})
    target:EmitSound("Hero_Invoker.Alacrity")
    self:EmitCastResponse()
end
function invoker_alacrity_custom_732.prototype.EmitCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_invoker" then
        return
    end
    if self.phraseCooldown then
        return
    end
    local roll = false
    if RollPercentage(75) then
        local random = RollVoiceLines(
            nil,
            1,
            2,
            3,
            5,
            6
        )
        if caster:HasPersona("npc_dota_hero_invoker") then
            local response = "invoker_kidvo_la_ability_alacrity_" .. random
            caster:EmitSoundOnClient(response)
        else
            local response = "invoker_invo_ability_alacrity_" .. random
            caster:EmitSoundOnClient(response)
        end
        roll = true
    elseif RollPercentage(10) then
        if caster:HasPersona("npc_dota_hero_invoker") then
            caster:EmitSoundOnClient("invoker_kidvo_la_ability_alacrity_04")
        else
            caster:EmitSoundOnClient("invoker_invo_ability_alacrity_04")
        end
        roll = true
    end
    if roll then
        self.phraseCooldown = true
        Timers:CreateTimer(
            60,
            function()
                self.phraseCooldown = false
            end
        )
    end
end
invoker_alacrity_custom_732 = __TS__Decorate(
    invoker_alacrity_custom_732,
    invoker_alacrity_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_alacrity_custom_732"}
)
____exports.invoker_alacrity_custom_732 = invoker_alacrity_custom_732
return ____exports
