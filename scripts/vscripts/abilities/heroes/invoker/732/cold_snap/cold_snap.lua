local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 13,["27"] = 18,["28"] = 19,["29"] = 18,["30"] = 22,["31"] = 23,["32"] = 24,["33"] = 25,["36"] = 27,["39"] = 29,["40"] = 31,["41"] = 33,["42"] = 42,["43"] = 44,["44"] = 22,["45"] = 47,["46"] = 48,["47"] = 49,["50"] = 51,["53"] = 52,["56"] = 54,["57"] = 55,["58"] = 55,["59"] = 55,["60"] = 55,["61"] = 56,["62"] = 56,["64"] = 57,["65"] = 58,["67"] = 60,["68"] = 60,["69"] = 60,["70"] = 60,["71"] = 61,["72"] = 62,["74"] = 65,["75"] = 66,["76"] = 66,["77"] = 66,["78"] = 67,["79"] = 66,["80"] = 66,["81"] = 47,["82"] = 6,["83"] = 6,["84"] = 6,["85"] = 5,["88"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_cold_snap_custom_732 = require("abilities.heroes.invoker.732.cold_snap.modifier_invoker_cold_snap_custom_732")
local modifier_invoker_cold_snap_custom_732 = ____modifier_invoker_cold_snap_custom_732.modifier_invoker_cold_snap_custom_732
____exports.invoker_cold_snap_custom_732 = __TS__Class()
local invoker_cold_snap_custom_732 = ____exports.invoker_cold_snap_custom_732
invoker_cold_snap_custom_732.name = "invoker_cold_snap_custom_732"
__TS__ClassExtends(invoker_cold_snap_custom_732, BaseInvokerAbility)
function invoker_cold_snap_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_cold_snap")
    self.phraseCooldown = false
end
function invoker_cold_snap_custom_732.prototype.OnAbilityPhaseStart(self)
    self:GetCaster():StartGesture(ACT_DOTA_CAST_COLD_SNAP)
    return true
end
function invoker_cold_snap_custom_732.prototype.OnAbilityPhaseInterrupted(self)
    self:GetCaster():FadeGesture(ACT_DOTA_CAST_COLD_SNAP)
end
function invoker_cold_snap_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    caster:EmitSound("Hero_Invoker.ColdSnap.Cast")
    local duration = self:GetOrbSpecialValueFor("duration", "quas")
    modifier_invoker_cold_snap_custom_732:apply(target, caster, self, {duration = duration})
    target:EmitSound("Hero_Invoker.ColdSnap")
    self:EmitCastResponse()
end
function invoker_cold_snap_custom_732.prototype.EmitCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_invoker" then
        return
    end
    if self.phraseCooldown then
        return
    end
    if not RollPercentage(75) then
        return
    end
    if caster:HasPersona("npc_dota_hero_invoker") then
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 5))
        )
        if RollPercentage(50) and random == "02" then
            random = random .. "_02"
        end
        local response = "invoker_kidvo_la_ability_coldsnap_" .. random
        caster:EmitSoundOnClient(response)
    else
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 5))
        )
        local response = "invoker_invo_ability_coldsnap_" .. random
        caster:EmitSoundOnClient(response)
    end
    self.phraseCooldown = true
    Timers:CreateTimer(
        60,
        function()
            self.phraseCooldown = false
        end
    )
end
invoker_cold_snap_custom_732 = __TS__Decorate(
    invoker_cold_snap_custom_732,
    invoker_cold_snap_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_cold_snap_custom_732"}
)
____exports.invoker_cold_snap_custom_732 = invoker_cold_snap_custom_732
return ____exports
