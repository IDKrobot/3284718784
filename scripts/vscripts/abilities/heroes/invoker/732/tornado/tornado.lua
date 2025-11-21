local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["22"] = 7,["23"] = 8,["24"] = 10,["25"] = 14,["26"] = 15,["27"] = 16,["28"] = 17,["29"] = 19,["30"] = 20,["32"] = 23,["33"] = 25,["34"] = 26,["35"] = 27,["36"] = 29,["37"] = 30,["38"] = 31,["39"] = 32,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 44,["50"] = 45,["51"] = 47,["52"] = 53,["53"] = 54,["55"] = 57,["56"] = 57,["57"] = 57,["58"] = 57,["59"] = 57,["60"] = 57,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 57,["65"] = 57,["66"] = 57,["67"] = 57,["68"] = 57,["69"] = 57,["70"] = 72,["71"] = 72,["72"] = 72,["73"] = 57,["74"] = 57,["75"] = 77,["76"] = 79,["77"] = 81,["78"] = 14,["79"] = 84,["80"] = 85,["83"] = 87,["84"] = 88,["85"] = 88,["87"] = 84,["88"] = 91,["89"] = 92,["90"] = 93,["91"] = 94,["94"] = 96,["95"] = 97,["96"] = 98,["97"] = 98,["98"] = 98,["99"] = 98,["100"] = 98,["101"] = 98,["102"] = 98,["105"] = 102,["106"] = 103,["107"] = 105,["108"] = 106,["109"] = 108,["110"] = 108,["111"] = 108,["112"] = 108,["113"] = 108,["114"] = 108,["115"] = 108,["116"] = 110,["118"] = 121,["119"] = 91,["120"] = 124,["121"] = 125,["122"] = 126,["125"] = 128,["128"] = 129,["131"] = 131,["132"] = 131,["133"] = 131,["134"] = 131,["135"] = 133,["136"] = 134,["137"] = 135,["139"] = 137,["140"] = 138,["142"] = 141,["143"] = 142,["144"] = 142,["145"] = 142,["146"] = 143,["147"] = 142,["148"] = 142,["149"] = 124,["150"] = 7,["151"] = 7,["152"] = 7,["153"] = 6,["156"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_invoker_tornado_custom_732 = require("abilities.heroes.invoker.732.tornado.modifier_invoker_tornado_custom_732")
local modifier_invoker_tornado_custom_732 = ____modifier_invoker_tornado_custom_732.modifier_invoker_tornado_custom_732
local ____modifier_invoker_tornado_custom_732_thinker = require("abilities.heroes.invoker.732.tornado.modifier_invoker_tornado_custom_732_thinker")
local modifier_invoker_tornado_custom_732_thinker = ____modifier_invoker_tornado_custom_732_thinker.modifier_invoker_tornado_custom_732_thinker
____exports.invoker_tornado_custom_732 = __TS__Class()
local invoker_tornado_custom_732 = ____exports.invoker_tornado_custom_732
invoker_tornado_custom_732.name = "invoker_tornado_custom_732"
__TS__ClassExtends(invoker_tornado_custom_732, BaseInvokerAbility)
function invoker_tornado_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_tornado")
    self.phraseCooldown = false
end
function invoker_tornado_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local origin = caster:GetAbsOrigin()
    local point = self:GetCursorPosition()
    if origin == point then
        point = point:__add(caster:GetForwardVector())
    end
    caster:StartGesture(ACT_DOTA_CAST_TORNADO)
    local direction = point:__sub(origin)
    direction.z = 0
    direction = direction:Normalized()
    local distance = self:GetOrbSpecialValueFor("travel_distance", "wex")
    local duration = self:GetOrbSpecialValueFor("lift_duration", "quas")
    local radius = self:GetSpecialValueFor("area_of_effect")
    local vision_radius = self:GetSpecialValueFor("vision_distance")
    local thinker = CreateModifierThinker(
        caster,
        self,
        modifier_invoker_tornado_custom_732_thinker.name,
        {},
        origin,
        caster:GetTeamNumber(),
        false
    )
    local sound = "Hero_Invoker.Tornado.Cast"
    local particle_name = "particles/units/heroes/hero_invoker/invoker_tornado.vpcf"
    if caster:HasPersona("npc_dota_hero_invoker") and caster:HasWearable("models/items/invoker_kid/dark_artistry_kid/invoker_kid_dark_artistry_back.vmdl") or caster:HasWearable("models/items/invoker/dark_artistry/dark_artistry_cape_model.vmdl") then
        sound = "Hero_Invoker.Tornado.Cast.Immortal"
        particle_name = "particles/econ/items/invoker/invoker_ti6/invoker_tornado_ti6.vpcf"
    end
    local info = {
        Ability = self,
        EffectName = particle_name,
        vSpawnOrigin = origin,
        fDistance = distance,
        fStartRadius = radius,
        fEndRadius = radius,
        Source = caster,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        vVelocity = direction:__mul(1000),
        bProvidesVision = true,
        iVisionRadius = vision_radius,
        iVisionTeamNumber = caster:GetTeamNumber(),
        fExpireTime = GameRules:GetGameTime() + 10,
        ExtraData = {
            thinker = thinker:entindex(),
            duration = duration
        }
    }
    ProjectileManager:CreateLinearProjectile(info)
    EmitSoundOnLocationWithCaster(origin, sound, caster)
    self:EmitCastResponse()
end
function invoker_tornado_custom_732.prototype.OnProjectileThink_ExtraData(self, location, extraData)
    if not extraData.thinker then
        return
    end
    local thinker = EntIndexToHScript(extraData.thinker)
    if thinker ~= nil then
        thinker:SetAbsOrigin(location)
    end
end
function invoker_tornado_custom_732.prototype.OnProjectileHit_ExtraData(self, target, location, extraData)
    local caster = self:GetCaster()
    local thinker = EntIndexToHScript(extraData.thinker)
    if not thinker then
        return
    end
    if not target then
        UTIL_Remove(thinker)
        AddFOWViewer(
            caster:GetTeamNumber(),
            location,
            self:GetSpecialValueFor("vision_distance"),
            1.75,
            false
        )
        return
    end
    if not target:IsAbilityImmune() then
        target:InterruptMotionControllers(true)
        local duration = extraData.duration
        local damage = self:GetSpecialValueFor("base_damage") + self:GetOrbSpecialValueFor("wex_damage", "wex")
        target:Purge(
            true,
            false,
            false,
            false,
            false
        )
        modifier_invoker_tornado_custom_732:apply(target, caster, self, {duration = duration, damage = damage})
    end
    return false
end
function invoker_tornado_custom_732.prototype.EmitCastResponse(self)
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
        __TS__Spread(range(nil, 1, 5))
    )
    if caster:HasPersona("npc_dota_hero_invoker") then
        local response = "invoker_kidvo_la_ability_tornado_" .. random
        caster:EmitSoundOnClient(response)
    else
        local response = "invoker_invo_ability_tornado_" .. random
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
invoker_tornado_custom_732 = __TS__Decorate(
    invoker_tornado_custom_732,
    invoker_tornado_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_tornado_custom_732"}
)
____exports.invoker_tornado_custom_732 = invoker_tornado_custom_732
return ____exports
