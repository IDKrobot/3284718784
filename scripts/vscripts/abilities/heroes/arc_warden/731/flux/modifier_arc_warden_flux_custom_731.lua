local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 3,["21"] = 11,["22"] = 12,["23"] = 11,["24"] = 15,["25"] = 16,["26"] = 15,["27"] = 19,["28"] = 20,["29"] = 19,["30"] = 23,["31"] = 24,["32"] = 23,["33"] = 27,["34"] = 28,["35"] = 30,["36"] = 31,["37"] = 33,["38"] = 34,["39"] = 36,["42"] = 38,["43"] = 43,["44"] = 43,["45"] = 43,["46"] = 43,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 44,["56"] = 44,["57"] = 44,["58"] = 44,["59"] = 44,["60"] = 46,["61"] = 47,["62"] = 27,["63"] = 50,["64"] = 51,["65"] = 52,["66"] = 53,["67"] = 55,["70"] = 57,["71"] = 59,["72"] = 60,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["79"] = 63,["80"] = 63,["81"] = 63,["82"] = 63,["83"] = 63,["84"] = 63,["85"] = 63,["86"] = 70,["88"] = 72,["89"] = 73,["90"] = 73,["91"] = 73,["92"] = 73,["93"] = 73,["96"] = 50,["97"] = 77,["98"] = 78,["99"] = 77,["100"] = 85,["101"] = 86,["102"] = 86,["103"] = 86,["104"] = 86,["105"] = 87,["106"] = 87,["108"] = 89,["109"] = 85,["110"] = 92,["111"] = 93,["112"] = 94,["113"] = 96,["116"] = 97,["119"] = 98,["122"] = 99,["125"] = 100,["128"] = 102,["129"] = 92,["130"] = 4,["131"] = 4,["132"] = 4,["133"] = 3,["136"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_flux_custom_731 = __TS__Class()
local modifier_arc_warden_flux_custom_731 = ____exports.modifier_arc_warden_flux_custom_731
modifier_arc_warden_flux_custom_731.name = "modifier_arc_warden_flux_custom_731"
__TS__ClassExtends(modifier_arc_warden_flux_custom_731, BaseModifier)
function modifier_arc_warden_flux_custom_731.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.damage = 0
    self.slow = 0
    self.radius = 0
end
function modifier_arc_warden_flux_custom_731.prototype.IsHidden(self)
    return false
end
function modifier_arc_warden_flux_custom_731.prototype.IsPurgable(self)
    return true
end
function modifier_arc_warden_flux_custom_731.prototype.IsDebuff(self)
    return true
end
function modifier_arc_warden_flux_custom_731.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_arc_warden_flux_custom_731.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local interval = self:GetSpecialValueFor("think_interval")
    self.damage = self:GetSpecialValueFor("damage_per_second") * interval
    self.slow = -self:GetSpecialValueFor("move_speed_slow_pct")
    self.radius = self:GetSpecialValueFor("search_radius")
    if not IsServer() then
        return
    end
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_arc_warden/arc_warden_flux_tgt.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        self.particle,
        2,
        parent,
        PATTACH_ABSORIGIN_FOLLOW,
        nil,
        parent:GetAbsOrigin(),
        true
    )
    self:AddParticle(
        self.particle,
        false,
        false,
        -1,
        false,
        false
    )
    self:OnIntervalThink()
    self:StartIntervalThink(interval)
end
function modifier_arc_warden_flux_custom_731.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    if not caster or not ability then
        return
    end
    local no_near = parent:GetModifierStackCount("modifier_arc_warden_flux_custom_731_tracker", caster) == 1
    if no_near then
        if self.particle then
            ParticleManager:SetParticleControl(
                self.particle,
                4,
                Vector(1, 0, 0)
            )
        end
        local damageTable = {
            attacker = caster,
            damage = self.damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            victim = parent,
            ability = ability
        }
        ApplyDamage(damageTable)
    else
        if self.particle then
            ParticleManager:SetParticleControl(
                self.particle,
                4,
                Vector(0, 0, 0)
            )
        end
    end
end
function modifier_arc_warden_flux_custom_731.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_EVENT_ON_DEATH}
end
function modifier_arc_warden_flux_custom_731.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    local no_near = self:GetParent():GetModifierStackCount(
        "modifier_arc_warden_flux_custom_731_tracker",
        self:GetCaster()
    ) == 1
    if no_near then
        return self.slow
    end
    return 0
end
function modifier_arc_warden_flux_custom_731.prototype.OnDeath(self, event)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if not parent:IsRealHero() then
        return
    end
    if event.unit ~= parent then
        return
    end
    if event.attacker ~= caster then
        return
    end
    if caster:GetUnitName() ~= "npc_dota_hero_arc_warden" then
        return
    end
    if not RollPercentage(5) then
        return
    end
    caster:EmitSoundOnClient("arc_warden_arcwar_flux_" .. RollVoiceLines(nil, 6, 8))
end
modifier_arc_warden_flux_custom_731 = __TS__Decorate(
    modifier_arc_warden_flux_custom_731,
    modifier_arc_warden_flux_custom_731,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_flux_custom_731"}
)
____exports.modifier_arc_warden_flux_custom_731 = modifier_arc_warden_flux_custom_731
return ____exports
