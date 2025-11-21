local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 99,["20"] = 4,["21"] = 6,["22"] = 7,["23"] = 6,["24"] = 10,["25"] = 11,["26"] = 10,["27"] = 14,["28"] = 15,["29"] = 14,["30"] = 18,["31"] = 19,["32"] = 18,["33"] = 22,["34"] = 23,["35"] = 25,["36"] = 27,["39"] = 29,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 35,["45"] = 35,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 31,["53"] = 31,["54"] = 46,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 51,["59"] = 51,["60"] = 52,["61"] = 52,["62"] = 52,["63"] = 52,["64"] = 52,["65"] = 53,["66"] = 53,["67"] = 53,["68"] = 53,["69"] = 53,["70"] = 54,["71"] = 56,["72"] = 61,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["78"] = 61,["79"] = 61,["80"] = 61,["81"] = 62,["82"] = 62,["83"] = 62,["84"] = 62,["85"] = 62,["86"] = 62,["87"] = 62,["88"] = 62,["89"] = 62,["90"] = 64,["91"] = 64,["92"] = 64,["93"] = 64,["94"] = 64,["95"] = 64,["96"] = 64,["97"] = 64,["98"] = 66,["99"] = 22,["100"] = 69,["101"] = 70,["102"] = 71,["103"] = 73,["104"] = 75,["105"] = 75,["106"] = 75,["107"] = 75,["108"] = 75,["109"] = 75,["110"] = 84,["111"] = 69,["112"] = 87,["113"] = 88,["114"] = 87,["115"] = 93,["116"] = 94,["117"] = 93,["118"] = 101,["119"] = 102,["120"] = 101,["121"] = 105,["122"] = 106,["123"] = 105,["124"] = 5,["125"] = 5,["126"] = 5,["127"] = 4,["130"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_pangolier_gyroshell_custom_717_stun = require("abilities.heroes.pangolier.717.gyroshell.modifier_pangolier_gyroshell_custom_717_stun")
local modifier_pangolier_gyroshell_custom_717_stun = ____modifier_pangolier_gyroshell_custom_717_stun.modifier_pangolier_gyroshell_custom_717_stun
____exports.modifier_pangolier_gyroshell_custom_717_stun_knockback = __TS__Class()
local modifier_pangolier_gyroshell_custom_717_stun_knockback = ____exports.modifier_pangolier_gyroshell_custom_717_stun_knockback
modifier_pangolier_gyroshell_custom_717_stun_knockback.name = "modifier_pangolier_gyroshell_custom_717_stun_knockback"
__TS__ClassExtends(modifier_pangolier_gyroshell_custom_717_stun_knockback, BaseModifier)
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetOverrideAnimation = function() return ACT_DOTA_FLAIL end
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.IsHidden(self)
    return true
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.IsDebuff(self)
    return true
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.IsStunDebuff(self)
    return true
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local bounce_duration = self:GetSpecialValueFor("bounce_duration")
    if not IsServer() then
        return
    end
    local direction = parent:GetAbsOrigin():__sub(self:GetCaster():GetAbsOrigin()):Normalized()
    local modifier = parent:AddNewModifier(
        self:GetCaster(),
        self:GetAbility(),
        "modifier_generic_knockback",
        {
            duration = 0.5,
            direction_x = direction.x,
            direction_y = direction.y,
            height = 150,
            distance = self:GetSpecialValueFor("knockback_radius"),
            IsStun = false,
            IsFlail = true
        }
    )
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_centaur/centaur_warstomp.vpcf", PATTACH_ABSORIGIN, parent)
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(300, 1, 1)
    )
    ParticleManager:SetParticleControl(
        particle,
        2,
        parent:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local particle_trail = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_blast_off_cast_trail.vpcf", PATTACH_CUSTOMORIGIN, parent)
    ParticleManager:SetParticleControlEnt(
        particle_trail,
        0,
        parent,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle_trail,
        1,
        parent,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    modifier:AddParticle(
        particle_trail,
        false,
        false,
        -1,
        false,
        false
    )
    self:StartIntervalThink(bounce_duration)
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local stun_duration = self:GetSpecialValueFor("stun_duration")
    modifier_pangolier_gyroshell_custom_717_stun:apply(
        parent,
        caster,
        self:GetAbility(),
        {duration = parent:CalculateDuration(caster, stun_duration)}
    )
    self:Destroy()
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.GetEffectName(self)
    return "particles/generic_gameplay/generic_stunned.vpcf"
end
function modifier_pangolier_gyroshell_custom_717_stun_knockback.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_pangolier_gyroshell_custom_717_stun_knockback = __TS__Decorate(
    modifier_pangolier_gyroshell_custom_717_stun_knockback,
    modifier_pangolier_gyroshell_custom_717_stun_knockback,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_gyroshell_custom_717_stun_knockback"}
)
____exports.modifier_pangolier_gyroshell_custom_717_stun_knockback = modifier_pangolier_gyroshell_custom_717_stun_knockback
return ____exports
