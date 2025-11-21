local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 6,["18"] = 5,["19"] = 6,["21"] = 6,["22"] = 7,["23"] = 8,["24"] = 14,["25"] = 5,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 20,["30"] = 21,["31"] = 20,["32"] = 24,["33"] = 25,["34"] = 24,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 31,["39"] = 33,["42"] = 35,["43"] = 35,["44"] = 35,["45"] = 35,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 43,["50"] = 45,["51"] = 46,["52"] = 28,["53"] = 49,["54"] = 50,["55"] = 52,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 52,["61"] = 52,["62"] = 52,["63"] = 52,["64"] = 52,["65"] = 52,["66"] = 52,["67"] = 52,["68"] = 52,["69"] = 52,["70"] = 64,["71"] = 65,["72"] = 66,["73"] = 52,["74"] = 52,["75"] = 49,["76"] = 70,["77"] = 71,["78"] = 70,["79"] = 74,["80"] = 75,["81"] = 74,["82"] = 78,["83"] = 79,["84"] = 78,["85"] = 82,["86"] = 83,["87"] = 82,["88"] = 86,["89"] = 87,["90"] = 86,["91"] = 90,["92"] = 91,["93"] = 90,["94"] = 94,["95"] = 95,["96"] = 96,["97"] = 97,["98"] = 98,["99"] = 98,["100"] = 98,["101"] = 98,["102"] = 100,["103"] = 101,["104"] = 103,["105"] = 108,["106"] = 109,["107"] = 110,["108"] = 110,["109"] = 110,["110"] = 110,["111"] = 110,["112"] = 110,["113"] = 110,["114"] = 110,["115"] = 112,["116"] = 117,["117"] = 118,["118"] = 119,["119"] = 119,["120"] = 119,["121"] = 119,["122"] = 119,["123"] = 119,["124"] = 119,["125"] = 119,["126"] = 94,["127"] = 122,["128"] = 123,["129"] = 125,["130"] = 126,["131"] = 127,["132"] = 128,["133"] = 130,["134"] = 131,["135"] = 132,["136"] = 133,["137"] = 134,["139"] = 136,["141"] = 138,["142"] = 140,["143"] = 122,["144"] = 6,["145"] = 6,["146"] = 6,["147"] = 5,["150"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
local ____modifier_invoker_ice_wall_custom_732_slow = require("abilities.heroes.invoker.732.ice_wall.modifier_invoker_ice_wall_custom_732_slow")
local modifier_invoker_ice_wall_custom_732_slow = ____modifier_invoker_ice_wall_custom_732_slow.modifier_invoker_ice_wall_custom_732_slow
____exports.modifier_invoker_ice_wall_custom_732_thinker = __TS__Class()
local modifier_invoker_ice_wall_custom_732_thinker = ____exports.modifier_invoker_ice_wall_custom_732_thinker
modifier_invoker_ice_wall_custom_732_thinker.name = "modifier_invoker_ice_wall_custom_732_thinker"
__TS__ClassExtends(modifier_invoker_ice_wall_custom_732_thinker, BaseInvokerModifier)
function modifier_invoker_ice_wall_custom_732_thinker.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.search_aoe = 0
    self.search_radius = 0
    self.wall_length = 80 * 15
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.IsHidden(self)
    return true
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.IsAura(self)
    return true
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.OnCreated(self, params)
    local damage = self:GetOrbSpecialValueFor("damage_per_second", "exort")
    self.search_aoe = 35 + (self:GetSpecialValueFor("wall_element_radius") - 105)
    self.search_radius = self.wall_length + self.search_aoe * 2
    if not IsServer() then
        return
    end
    self.damageTable = {
        attacker = self:GetCaster(),
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = self:GetAbility()
    }
    self:CreateWall()
    self:OnIntervalThink()
    self:StartIntervalThink(1)
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.OnIntervalThink(self)
    local caster = self:GetCaster()
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                self:GetParent():GetAbsOrigin(),
                nil,
                self.search_radius,
                2,
                bit.bor(1, 18),
                0,
                0,
                false
            ),
            function(____, enemy) return self:IsUnitInWall(enemy) end
        ),
        function(____, enemy)
            self.damageTable.victim = enemy
            ApplyDamage(self.damageTable)
        end
    )
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.GetAuraDuration(self)
    return 2
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.GetModifierAura(self)
    return modifier_invoker_ice_wall_custom_732_slow.name
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.GetAuraEntityReject(self, entity)
    return not self:IsUnitInWall(entity)
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.GetAuraRadius(self)
    return self.search_radius
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC)
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.CreateWall(self)
    local direction = self:GetCaster():GetForwardVector()
    local cast_direction = Vector(-direction.y, direction.x, direction.z)
    local end_point = cast_direction:__mul(self.wall_length):__mul(0.5)
    local point = GetGroundPosition(
        self:GetParent():GetAbsOrigin(),
        nil
    )
    self.wall_start = point:__sub(end_point)
    self.wall_end = point:__add(end_point)
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_ice_wall.vpcf", PATTACH_CUSTOMORIGIN, nil)
    ParticleManager:SetParticleControl(particle, 0, self.wall_start)
    ParticleManager:SetParticleControl(particle, 1, self.wall_end)
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        true
    )
    local spikes = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_ice_wall_b.vpcf", PATTACH_CUSTOMORIGIN, nil)
    ParticleManager:SetParticleControl(spikes, 0, self.wall_start)
    ParticleManager:SetParticleControl(spikes, 1, self.wall_end)
    self:AddParticle(
        spikes,
        false,
        false,
        -1,
        false,
        true
    )
end
function modifier_invoker_ice_wall_custom_732_thinker.prototype.IsUnitInWall(self, unit)
    local targetOrigin = unit:GetAbsOrigin()
    local wall = self.wall_end:__sub(self.wall_start)
    local target_vector = targetOrigin:__sub(self.wall_start)
    local wall_normalized = wall:Normalized()
    local wall_dot = target_vector:Dot(wall_normalized)
    local search_point
    if wall_dot <= 0 then
        search_point = self.wall_start
    elseif wall_dot >= wall:Length2D() then
        search_point = self.wall_end
    else
        search_point = self.wall_start:__add(wall_normalized:__mul(wall_dot))
    end
    local distance = targetOrigin:__sub(search_point)
    return distance:Length2D() <= self.search_aoe * 3
end
modifier_invoker_ice_wall_custom_732_thinker = __TS__Decorate(
    modifier_invoker_ice_wall_custom_732_thinker,
    modifier_invoker_ice_wall_custom_732_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_ice_wall_custom_732_thinker"}
)
____exports.modifier_invoker_ice_wall_custom_732_thinker = modifier_invoker_ice_wall_custom_732_thinker
return ____exports
