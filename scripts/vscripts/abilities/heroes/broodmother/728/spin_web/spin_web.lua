local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 13,["27"] = 18,["28"] = 19,["29"] = 6,["31"] = 21,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 23,["43"] = 23,["44"] = 23,["45"] = 23,["46"] = 35,["47"] = 35,["49"] = 6,["50"] = 18,["51"] = 40,["52"] = 41,["53"] = 40,["54"] = 44,["55"] = 45,["56"] = 46,["57"] = 48,["58"] = 49,["59"] = 51,["60"] = 51,["61"] = 51,["62"] = 51,["63"] = 51,["64"] = 51,["65"] = 51,["66"] = 51,["67"] = 52,["68"] = 52,["69"] = 52,["70"] = 52,["71"] = 53,["72"] = 55,["73"] = 62,["75"] = 62,["77"] = 64,["78"] = 64,["79"] = 66,["80"] = 67,["81"] = 68,["82"] = 69,["84"] = 72,["85"] = 73,["86"] = 78,["87"] = 78,["88"] = 78,["89"] = 78,["90"] = 78,["91"] = 79,["92"] = 80,["93"] = 80,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 81,["98"] = 82,["99"] = 84,["100"] = 44,["101"] = 6,["102"] = 6,["103"] = 6,["104"] = 5,["107"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_broodmother_spin_web_custom_728_aura = require("abilities.heroes.broodmother.728.spin_web.modifier_broodmother_spin_web_custom_728_aura")
local modifier_broodmother_spin_web_custom_728_aura = ____modifier_broodmother_spin_web_custom_728_aura.modifier_broodmother_spin_web_custom_728_aura
____exports.broodmother_spin_web_custom_728 = __TS__Class()
local broodmother_spin_web_custom_728 = ____exports.broodmother_spin_web_custom_728
broodmother_spin_web_custom_728.name = "broodmother_spin_web_custom_728"
__TS__ClassExtends(broodmother_spin_web_custom_728, CustomAbility)
function broodmother_spin_web_custom_728.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "broodmother_spin_web")
    self.webs = {}
end
function broodmother_spin_web_custom_728.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_broodmother.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_broodmother.vsndevts")
end
function broodmother_spin_web_custom_728.prototype.GetCastRange(self, location, target)
    if not IsServer() then
        return CustomAbility.prototype.GetCastRange(self, location, target)
    end
    local caster = self:GetCaster()
    local webs = __TS__ArrayFilter(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            location,
            nil,
            self:GetSpecialValueFor("radius") * 2,
            1,
            32,
            64,
            0,
            false
        ),
        function(____, unit) return unit:GetOwner() == caster and unit:GetUnitName() == "npc_dota_broodmother_728_web_custom" end
    )
    if #webs > 0 then
        return 99999
    end
    return CustomAbility.prototype.GetCastRange(self, location, target)
end
function broodmother_spin_web_custom_728.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function broodmother_spin_web_custom_728.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")
    local max_webs = self:GetSpecialValueFor("count")
    local web = CreateUnitByName(
        "npc_dota_broodmother_728_web_custom",
        point,
        false,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    web:SetControllableByPlayer(
        caster:GetPlayerID(),
        true
    )
    web:SetOwner(caster)
    modifier_broodmother_spin_web_custom_728_aura:apply(web, caster, self, {})
    local ____opt_0 = web:AddAbility("broodmother_spin_web_destroy_custom_728")
    if ____opt_0 ~= nil then
        ____opt_0:SetLevel(1)
    end
    local ____self_webs_2 = self.webs
    ____self_webs_2[#____self_webs_2 + 1] = web
    if #self.webs > max_webs then
        local removed_web = table.remove(self.webs, 1)
        removed_web:ForceKill(false)
        removed_web:RemoveModifierByName(modifier_broodmother_spin_web_custom_728_aura.name)
    end
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_broodmother/broodmother_spin_web_cast.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControl(
        particle,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(particle, 1, point)
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(radius, radius, radius)
    )
    ParticleManager:SetParticleControl(particle, 3, point)
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("Hero_Broodmother.SpinWebCast")
end
broodmother_spin_web_custom_728 = __TS__Decorate(
    broodmother_spin_web_custom_728,
    broodmother_spin_web_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "broodmother_spin_web_custom_728"}
)
____exports.broodmother_spin_web_custom_728 = broodmother_spin_web_custom_728
return ____exports
