local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 3,["16"] = 3,["17"] = 5,["18"] = 6,["19"] = 5,["20"] = 6,["22"] = 6,["23"] = 7,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 14,["31"] = 14,["32"] = 14,["33"] = 14,["34"] = 14,["35"] = 14,["36"] = 14,["37"] = 14,["38"] = 14,["39"] = 16,["40"] = 17,["42"] = 19,["43"] = 13,["44"] = 22,["45"] = 23,["46"] = 22,["47"] = 26,["48"] = 27,["49"] = 28,["50"] = 29,["51"] = 31,["52"] = 33,["53"] = 34,["54"] = 35,["55"] = 36,["56"] = 38,["57"] = 39,["58"] = 41,["59"] = 41,["60"] = 41,["61"] = 41,["62"] = 41,["63"] = 41,["64"] = 41,["65"] = 41,["66"] = 41,["67"] = 41,["68"] = 41,["69"] = 41,["70"] = 41,["71"] = 52,["72"] = 53,["73"] = 53,["75"] = 54,["76"] = 54,["78"] = 56,["79"] = 41,["80"] = 41,["81"] = 58,["82"] = 59,["83"] = 59,["84"] = 59,["85"] = 59,["86"] = 59,["87"] = 61,["88"] = 61,["89"] = 61,["90"] = 61,["91"] = 61,["92"] = 61,["93"] = 61,["94"] = 61,["95"] = 61,["96"] = 73,["97"] = 73,["98"] = 73,["99"] = 73,["100"] = 73,["101"] = 73,["102"] = 73,["103"] = 73,["104"] = 73,["105"] = 41,["106"] = 41,["107"] = 87,["109"] = 89,["110"] = 91,["111"] = 91,["112"] = 91,["113"] = 91,["114"] = 91,["115"] = 91,["116"] = 91,["117"] = 91,["118"] = 91,["120"] = 105,["121"] = 26,["122"] = 108,["123"] = 109,["124"] = 111,["125"] = 115,["126"] = 117,["127"] = 118,["128"] = 120,["129"] = 124,["130"] = 126,["131"] = 127,["132"] = 129,["133"] = 131,["134"] = 108,["135"] = 134,["136"] = 135,["137"] = 136,["140"] = 138,["143"] = 139,["146"] = 141,["147"] = 141,["148"] = 141,["149"] = 141,["150"] = 143,["151"] = 144,["152"] = 145,["154"] = 147,["155"] = 148,["157"] = 150,["158"] = 151,["160"] = 154,["161"] = 155,["162"] = 155,["163"] = 155,["164"] = 156,["165"] = 155,["166"] = 155,["167"] = 134,["168"] = 160,["169"] = 161,["170"] = 162,["171"] = 160,["172"] = 6,["173"] = 6,["174"] = 6,["175"] = 5,["178"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_sun_strike_custom_732_thinker = require("abilities.heroes.invoker.732.sun_strike.modifier_invoker_sun_strike_custom_732_thinker")
local modifier_invoker_sun_strike_custom_732_thinker = ____modifier_invoker_sun_strike_custom_732_thinker.modifier_invoker_sun_strike_custom_732_thinker
____exports.invoker_sun_strike_custom_732 = __TS__Class()
local invoker_sun_strike_custom_732 = ____exports.invoker_sun_strike_custom_732
invoker_sun_strike_custom_732.name = "invoker_sun_strike_custom_732"
__TS__ClassExtends(invoker_sun_strike_custom_732, BaseInvokerAbility)
function invoker_sun_strike_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_sun_strike")
    self.phraseCooldown = false
end
function invoker_sun_strike_custom_732.prototype.GetBehavior(self)
    local base = bit.bor(
        bit.bor(
            bit.bor(
                bit.bor(
                    bit.bor(DOTA_ABILITY_BEHAVIOR_POINT, DOTA_ABILITY_BEHAVIOR_HIDDEN),
                    DOTA_ABILITY_BEHAVIOR_NOT_LEARNABLE
                ),
                DOTA_ABILITY_BEHAVIOR_AOE
            ),
            DOTA_ABILITY_BEHAVIOR_IGNORE_BACKSWING
        ),
        DOTA_ABILITY_BEHAVIOR_SHOW_IN_GUIDES
    )
    if self:GetCaster():HasScepter() then
        return bit.bor(base, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET)
    end
    return base
end
function invoker_sun_strike_custom_732.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("area_of_effect")
end
function invoker_sun_strike_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local point = self:GetCursorPosition()
    local delay = self:GetSpecialValueFor("delay")
    if caster:HasScepter() and caster == target then
        local cooldown = self:GetSpecialValueFor("cataclysm_cooldown")
        local min_range = self:GetSpecialValueFor("cataclysm_min_range")
        local max_range = self:GetSpecialValueFor("cataclysm_max_range")
        self:EndCooldown()
        self:StartCooldown(cooldown * caster:GetCooldownReduction())
        __TS__ArrayForEach(
            __TS__ArrayFilter(
                FindUnitsInRadius(
                    caster:GetTeamNumber(),
                    Vector(0, 0, 0),
                    nil,
                    FIND_UNITS_EVERYWHERE,
                    2,
                    1,
                    bit.bor(64, 262144),
                    0,
                    false
                ),
                function(____, enemy)
                    if enemy:IsIllusion() and not enemy:IsTempestDouble() then
                        return false
                    end
                    if enemy:IsClone() then
                        return false
                    end
                    return true
                end
            ),
            function(____, enemy)
                local vector1, vector2 = unpack(self:GetRandomPositions(
                    enemy:GetAbsOrigin(),
                    min_range,
                    max_range
                ))
                CreateModifierThinker(
                    caster,
                    self,
                    modifier_invoker_sun_strike_custom_732_thinker.name,
                    {duration = delay, cataclysm = true},
                    vector1,
                    caster:GetTeamNumber(),
                    false
                )
                CreateModifierThinker(
                    caster,
                    self,
                    modifier_invoker_sun_strike_custom_732_thinker.name,
                    {duration = delay, cataclysm = true},
                    vector2,
                    caster:GetTeamNumber(),
                    false
                )
            end
        )
        caster:Stop()
    else
        caster:StartGesture(ACT_DOTA_CAST_SUN_STRIKE)
        CreateModifierThinker(
            caster,
            self,
            modifier_invoker_sun_strike_custom_732_thinker.name,
            {duration = delay, cataclysm = false},
            point,
            caster:GetTeamNumber(),
            false
        )
    end
    self:EmitCastResponse()
end
function invoker_sun_strike_custom_732.prototype.GetRandomPositions(self, point, min, max)
    local z = GetGroundHeight(point, nil)
    local range = RandomFloat(min, max)
    local angle1 = math.random() * 2 * math.pi
    local x1 = point.x + math.cos(angle1) * range
    local y1 = point.y + math.sin(angle1) * range
    local firstVector = Vector(x1, y1, z)
    local angle2 = (angle1 + math.pi) % (2 * math.pi)
    local x2 = point.x + math.cos(angle2) * range
    local y2 = point.y + math.sin(angle2) * range
    local secondVector = Vector(x2, y2, z)
    return {firstVector, secondVector}
end
function invoker_sun_strike_custom_732.prototype.EmitCastResponse(self)
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
    local random = RollVoiceLines(
        nil,
        __TS__Spread(range(nil, 1, 4))
    )
    if caster:HasPersona("npc_dota_hero_invoker") then
        if RollPercentage(50) and (random == "01" or random == "02") then
            random = random .. "_02"
        end
        local response = "invoker_kidvo_la_ability_icewall_" .. random
        caster:EmitSoundOnClient(response)
    else
        local response = "invoker_invo_ability_sunstrike_" .. random
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
function invoker_sun_strike_custom_732.prototype.EmitKillResponse(self)
    print("lol x2, no.")
    print("check e.m.p.")
end
invoker_sun_strike_custom_732 = __TS__Decorate(
    invoker_sun_strike_custom_732,
    invoker_sun_strike_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_sun_strike_custom_732"}
)
____exports.invoker_sun_strike_custom_732 = invoker_sun_strike_custom_732
return ____exports
