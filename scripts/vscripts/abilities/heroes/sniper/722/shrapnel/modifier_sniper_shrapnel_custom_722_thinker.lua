local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 8,["21"] = 4,["22"] = 12,["23"] = 13,["24"] = 12,["25"] = 16,["26"] = 17,["27"] = 16,["28"] = 20,["29"] = 21,["30"] = 20,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 28,["35"] = 30,["36"] = 32,["39"] = 34,["40"] = 36,["41"] = 37,["42"] = 39,["43"] = 41,["44"] = 42,["45"] = 46,["46"] = 46,["47"] = 46,["48"] = 47,["49"] = 48,["50"] = 48,["51"] = 48,["52"] = 48,["53"] = 50,["54"] = 50,["55"] = 50,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 50,["60"] = 52,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 57,["65"] = 57,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 59,["72"] = 60,["73"] = 60,["74"] = 60,["75"] = 60,["76"] = 60,["77"] = 60,["78"] = 60,["79"] = 60,["80"] = 62,["81"] = 63,["83"] = 46,["84"] = 46,["85"] = 66,["86"] = 67,["88"] = 24,["89"] = 70,["90"] = 71,["91"] = 72,["93"] = 70,["94"] = 75,["95"] = 76,["96"] = 75,["97"] = 79,["98"] = 80,["99"] = 79,["100"] = 83,["101"] = 84,["102"] = 83,["103"] = 87,["104"] = 88,["105"] = 87,["106"] = 91,["107"] = 92,["108"] = 91,["109"] = 5,["110"] = 5,["111"] = 5,["112"] = 4,["115"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_sniper_shrapnel_custom_722_damage = require("abilities.heroes.sniper.722.shrapnel.modifier_sniper_shrapnel_custom_722_damage")
local modifier_sniper_shrapnel_custom_722_damage = ____modifier_sniper_shrapnel_custom_722_damage.modifier_sniper_shrapnel_custom_722_damage
____exports.modifier_sniper_shrapnel_custom_722_thinker = __TS__Class()
local modifier_sniper_shrapnel_custom_722_thinker = ____exports.modifier_sniper_shrapnel_custom_722_thinker
modifier_sniper_shrapnel_custom_722_thinker.name = "modifier_sniper_shrapnel_custom_722_thinker"
__TS__ClassExtends(modifier_sniper_shrapnel_custom_722_thinker, BaseModifier)
function modifier_sniper_shrapnel_custom_722_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
    self.active = false
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.IsHidden(self)
    return true
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.IsAura(self)
    return self.active
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    self.radius = self:GetSpecialValueFor("radius")
    local duration = self:GetSpecialValueFor("duration")
    if not IsServer() then
        return
    end
    local hasMachineGun = caster:HasWearable("models/items/sniper/machine_gun_charlie/machine_gun_charlie.vmdl")
    local direction = parent:GetAbsOrigin():__sub(caster:GetAbsOrigin()):Normalized()
    direction.z = 0
    self.active = false
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_sniper/sniper_shrapnel.vpcf", caster)
    self.sound = hasMachineGun and "Hero_Sniper.MKG_ShrapnelShatter" or "Hero_Sniper.ShrapnelShatter"
    Timers:CreateTimer(
        1.2,
        function()
            self.active = true
            self:SetDuration(
                duration + FrameTime() * 2,
                true
            )
            AddFOWViewer(
                caster:GetTeamNumber(),
                parent:GetAbsOrigin(),
                self.radius,
                duration,
                false
            )
            local particle = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, nil)
            ParticleManager:SetParticleControl(
                particle,
                0,
                parent:GetAbsOrigin()
            )
            ParticleManager:SetParticleControl(
                particle,
                1,
                Vector(self.radius, 1, 1)
            )
            ParticleManager:SetParticleControlForward(particle, 2, direction)
            self:AddParticle(
                particle,
                false,
                false,
                -1,
                false,
                true
            )
            if hasMachineGun then
                parent:EmitSound("Hero_Sniper.MKG_ShrapnelShatter")
            end
        end
    )
    if not hasMachineGun then
        parent:EmitSound("Hero_Sniper.ShrapnelShatter")
    end
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.OnDeath(self, event)
    if IsServer() then
        self:GetParent():StopSound(self.sound)
    end
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.GetAuraDuration(self)
    return 0.5
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.GetModifierAura(self)
    return modifier_sniper_shrapnel_custom_722_damage.name
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_sniper_shrapnel_custom_722_thinker.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC)
end
modifier_sniper_shrapnel_custom_722_thinker = __TS__Decorate(
    modifier_sniper_shrapnel_custom_722_thinker,
    modifier_sniper_shrapnel_custom_722_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_shrapnel_custom_722_thinker"}
)
____exports.modifier_sniper_shrapnel_custom_722_thinker = modifier_sniper_shrapnel_custom_722_thinker
return ____exports
