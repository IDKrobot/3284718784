local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 18,["28"] = 19,["30"] = 21,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 33,["41"] = 34,["42"] = 36,["43"] = 37,["44"] = 39,["45"] = 41,["46"] = 42,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 44,["51"] = 44,["52"] = 50,["53"] = 50,["54"] = 50,["55"] = 50,["56"] = 50,["57"] = 56,["58"] = 56,["59"] = 56,["60"] = 56,["61"] = 56,["62"] = 56,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 65,["67"] = 65,["68"] = 65,["69"] = 65,["70"] = 65,["71"] = 65,["72"] = 65,["73"] = 65,["74"] = 65,["76"] = 76,["77"] = 13,["78"] = 79,["79"] = 80,["80"] = 81,["83"] = 83,["86"] = 85,["87"] = 87,["88"] = 88,["89"] = 88,["90"] = 88,["91"] = 88,["92"] = 89,["93"] = 90,["94"] = 91,["96"] = 93,["97"] = 94,["99"] = 97,["100"] = 98,["101"] = 99,["102"] = 100,["104"] = 102,["106"] = 105,["108"] = 108,["109"] = 109,["110"] = 110,["111"] = 110,["112"] = 110,["113"] = 111,["114"] = 110,["115"] = 110,["117"] = 79,["118"] = 6,["119"] = 6,["120"] = 6,["121"] = 5,["124"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_chaos_meteor_custom_732_thinker = require("abilities.heroes.invoker.732.chaos_meteor.modifier_invoker_chaos_meteor_custom_732_thinker")
local modifier_invoker_chaos_meteor_custom_732_thinker = ____modifier_invoker_chaos_meteor_custom_732_thinker.modifier_invoker_chaos_meteor_custom_732_thinker
____exports.invoker_chaos_meteor_custom_732 = __TS__Class()
local invoker_chaos_meteor_custom_732 = ____exports.invoker_chaos_meteor_custom_732
invoker_chaos_meteor_custom_732.name = "invoker_chaos_meteor_custom_732"
__TS__ClassExtends(invoker_chaos_meteor_custom_732, BaseInvokerAbility)
function invoker_chaos_meteor_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_chaos_meteor")
    self.phraseCooldown = false
end
function invoker_chaos_meteor_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local point = self:GetCursorPosition()
    if point == origin then
        point = point:__add(caster:GetForwardVector())
    end
    caster:StartGesture(ACT_DOTA_CAST_CHAOS_METEOR)
    CreateModifierThinker(
        caster,
        self,
        modifier_invoker_chaos_meteor_custom_732_thinker.name,
        {},
        point,
        caster:GetTeamNumber(),
        false
    )
    if caster:HasShard() then
        local angleOffset = 30 * math.pi / 180
        local direction = point:__sub(origin)
        local baseAngle = math.atan2(direction.y, direction.x)
        local length = direction:Length()
        local leftAngle = baseAngle + angleOffset
        local rightAngle = baseAngle - angleOffset
        local leftVector = Vector(
            origin.x + math.cos(leftAngle) * length,
            origin.y + math.sin(leftAngle) * length,
            origin.z
        )
        local rightVector = Vector(
            origin.x + math.cos(rightAngle) * length,
            origin.y + math.sin(rightAngle) * length,
            origin.z
        )
        CreateModifierThinker(
            caster,
            self,
            modifier_invoker_chaos_meteor_custom_732_thinker.name,
            {},
            leftVector,
            caster:GetTeamNumber(),
            false
        )
        CreateModifierThinker(
            caster,
            self,
            modifier_invoker_chaos_meteor_custom_732_thinker.name,
            {},
            rightVector,
            caster:GetTeamNumber(),
            false
        )
    end
    self:EmitCastResponse()
end
function invoker_chaos_meteor_custom_732.prototype.EmitCastResponse(self)
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
            __TS__Spread(range(nil, 1, 6))
        )
        if caster:HasPersona("npc_dota_hero_invoker") then
            local response = "invoker_kidvo_la_ability_chaosmeteor_" .. random
            caster:EmitSoundOnClient(response)
        else
            local response = "invoker_invo_ability_chaosmeteor_" .. random
            caster:EmitSoundOnClient(response)
        end
        roll = true
    elseif RollPercentage(5) then
        if caster:HasPersona("npc_dota_hero_invoker") then
            caster:EmitSoundOnClient("invoker_kidvo_la_ability_chaosmeteor_07")
        else
            caster:EmitSoundOnClient("invoker_invo_ability_chaosmeteor_07")
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
invoker_chaos_meteor_custom_732 = __TS__Decorate(
    invoker_chaos_meteor_custom_732,
    invoker_chaos_meteor_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_chaos_meteor_custom_732"}
)
____exports.invoker_chaos_meteor_custom_732 = invoker_chaos_meteor_custom_732
return ____exports
