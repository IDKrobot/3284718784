local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 7,["21"] = 4,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 19,["31"] = 21,["32"] = 22,["33"] = 24,["34"] = 25,["35"] = 27,["38"] = 29,["39"] = 31,["40"] = 32,["41"] = 34,["42"] = 37,["43"] = 38,["45"] = 41,["46"] = 42,["47"] = 43,["48"] = 49,["50"] = 51,["51"] = 51,["52"] = 51,["53"] = 51,["54"] = 51,["55"] = 51,["56"] = 58,["57"] = 58,["58"] = 58,["59"] = 58,["60"] = 58,["62"] = 61,["63"] = 61,["64"] = 61,["65"] = 61,["66"] = 61,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 62,["72"] = 63,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 65,["80"] = 17,["81"] = 68,["82"] = 69,["83"] = 70,["84"] = 72,["87"] = 74,["88"] = 74,["89"] = 74,["90"] = 74,["91"] = 74,["92"] = 74,["93"] = 74,["94"] = 74,["95"] = 74,["96"] = 74,["97"] = 74,["98"] = 86,["99"] = 87,["100"] = 87,["101"] = 87,["102"] = 87,["103"] = 87,["104"] = 87,["105"] = 87,["106"] = 94,["107"] = 94,["108"] = 94,["109"] = 95,["110"] = 96,["111"] = 94,["112"] = 94,["113"] = 99,["114"] = 100,["115"] = 102,["116"] = 105,["117"] = 106,["119"] = 109,["120"] = 114,["121"] = 114,["122"] = 114,["123"] = 114,["124"] = 114,["125"] = 115,["126"] = 115,["127"] = 115,["128"] = 115,["129"] = 115,["130"] = 116,["131"] = 118,["132"] = 120,["133"] = 68,["134"] = 5,["135"] = 5,["136"] = 5,["137"] = 4,["140"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
____exports.modifier_invoker_sun_strike_custom_732_thinker = __TS__Class()
local modifier_invoker_sun_strike_custom_732_thinker = ____exports.modifier_invoker_sun_strike_custom_732_thinker
modifier_invoker_sun_strike_custom_732_thinker.name = "modifier_invoker_sun_strike_custom_732_thinker"
__TS__ClassExtends(modifier_invoker_sun_strike_custom_732_thinker, BaseInvokerModifier)
function modifier_invoker_sun_strike_custom_732_thinker.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.radius = 0
    self.damage = 0
end
function modifier_invoker_sun_strike_custom_732_thinker.prototype.IsHidden(self)
    return true
end
function modifier_invoker_sun_strike_custom_732_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_sun_strike_custom_732_thinker.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    self.radius = self:GetSpecialValueFor("area_of_effect")
    self.damage = self:GetOrbSpecialValueFor("damage", "exort")
    local vision_radius = self:GetSpecialValueFor("vision_distance")
    local vision_duration = self:GetSpecialValueFor("vision_duration")
    if not IsServer() then
        return
    end
    local isCataclysm = params.cataclysm == 1
    local sound = "Hero_Invoker.SunStrike.Charge"
    local particle_name = "particles/units/heroes/hero_invoker/invoker_sun_strike_team.vpcf"
    if caster:HasPersona("npc_dota_hero_invoker") and caster:HasWearable("models/items/invoker_kid/dark_artistry_kid/magus_apex_kid.vmdl") or caster:HasWearable("models/items/invoker/magus_apex/magus_apex.vmdl") then
        sound = "Hero_Invoker.SunStrike.Charge.Apex"
        particle_name = "particles/econ/items/invoker/invoker_apex/invoker_sun_strike_team_immortal1.vpcf"
    end
    local particle
    if isCataclysm then
        particle = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, caster)
        parent:EmitSound(sound)
    else
        particle = ParticleManager:CreateParticleForTeam(
            particle_name,
            PATTACH_WORLDORIGIN,
            caster,
            caster:GetTeamNumber()
        )
        EmitSoundOnLocationForAllies(
            parent:GetAbsOrigin(),
            sound,
            parent
        )
    end
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(40, 0, 0)
    )
    ParticleManager:ReleaseParticleIndex(particle)
    AddFOWViewer(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        vision_radius,
        vision_duration,
        false
    )
end
function modifier_invoker_sun_strike_custom_732_thinker.prototype.OnDestroy(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        self.radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
        FIND_ANY_ORDER,
        false
    )
    local damage = self.damage / #enemies
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_PURE,
        victim = nil,
        ability = self:GetAbility()
    }
    __TS__ArrayForEach(
        enemies,
        function(____, enemy)
            damageTable.victim = enemy
            ApplyDamage(damageTable)
        end
    )
    local sound = "Hero_Invoker.SunStrike.Ignite"
    local particle_name = "particles/units/heroes/hero_invoker/invoker_sun_strike.vpcf"
    if caster:HasPersona("npc_dota_hero_invoker") and caster:HasWearable("models/items/invoker_kid/dark_artistry_kid/magus_apex_kid.vmdl") or caster:HasWearable("models/items/invoker/magus_apex/magus_apex.vmdl") then
        sound = "Hero_Invoker.SunStrike.Ignite.Apex"
        particle_name = "particles/econ/items/invoker/invoker_apex/invoker_sun_strike_immortal1.vpcf"
    end
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, caster)
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(self.radius, 0, 0)
    )
    ParticleManager:ReleaseParticleIndex(particle)
    parent:EmitSound(sound)
    UTIL_Remove(parent)
end
modifier_invoker_sun_strike_custom_732_thinker = __TS__Decorate(
    modifier_invoker_sun_strike_custom_732_thinker,
    modifier_invoker_sun_strike_custom_732_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_sun_strike_custom_732_thinker"}
)
____exports.modifier_invoker_sun_strike_custom_732_thinker = modifier_invoker_sun_strike_custom_732_thinker
return ____exports
