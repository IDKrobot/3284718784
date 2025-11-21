local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 13,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 21,["30"] = 23,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 37,["41"] = 39,["42"] = 17,["43"] = 42,["44"] = 43,["45"] = 44,["48"] = 46,["51"] = 48,["52"] = 50,["53"] = 51,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 52,["58"] = 53,["59"] = 54,["61"] = 56,["62"] = 57,["64"] = 60,["65"] = 61,["66"] = 62,["67"] = 63,["69"] = 65,["71"] = 68,["73"] = 71,["74"] = 72,["75"] = 73,["76"] = 73,["77"] = 73,["78"] = 74,["79"] = 73,["80"] = 73,["82"] = 42,["83"] = 79,["84"] = 80,["85"] = 81,["86"] = 79,["87"] = 6,["88"] = 6,["89"] = 6,["90"] = 5,["93"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_emp_custom_732 = require("abilities.heroes.invoker.732.emp.modifier_invoker_emp_custom_732")
local modifier_invoker_emp_custom_732 = ____modifier_invoker_emp_custom_732.modifier_invoker_emp_custom_732
____exports.invoker_emp_custom_732 = __TS__Class()
local invoker_emp_custom_732 = ____exports.invoker_emp_custom_732
invoker_emp_custom_732.name = "invoker_emp_custom_732"
__TS__ClassExtends(invoker_emp_custom_732, BaseInvokerAbility)
function invoker_emp_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_emp")
    self.phraseCooldown = false
end
function invoker_emp_custom_732.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("area_of_effect")
end
function invoker_emp_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    caster:StartGesture(ACT_DOTA_CAST_EMP)
    local delay = self:GetSpecialValueFor("delay")
    CreateModifierThinker(
        caster,
        self,
        modifier_invoker_emp_custom_732.name,
        {duration = delay},
        point,
        caster:GetTeamNumber(),
        false
    )
    caster:EmitSound("Hero_Invoker.EMP.Cast")
    self:EmitCastResponse()
end
function invoker_emp_custom_732.prototype.EmitCastResponse(self)
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
            __TS__Spread(range(nil, 2, 6))
        )
        if caster:HasPersona("npc_dota_hero_invoker") then
            local response = "invoker_kidvo_la_ability_emp_" .. random
            caster:EmitSoundOnClient(response)
        else
            local response = "invoker_invo_ability_emp_" .. random
            caster:EmitSoundOnClient(response)
        end
        roll = true
    elseif RollPercentage(10) then
        if caster:HasPersona("npc_dota_hero_invoker") then
            caster:EmitSoundOnClient("invoker_kidvo_la_ability_emp_01")
        else
            caster:EmitSoundOnClient("invoker_invo_ability_emp_01")
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
function invoker_emp_custom_732.prototype.EmitKillResponse(self)
    print("lol, no.")
    print("I'm too lazy to do this shi.")
end
invoker_emp_custom_732 = __TS__Decorate(
    invoker_emp_custom_732,
    invoker_emp_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_emp_custom_732"}
)
____exports.invoker_emp_custom_732 = invoker_emp_custom_732
return ____exports
