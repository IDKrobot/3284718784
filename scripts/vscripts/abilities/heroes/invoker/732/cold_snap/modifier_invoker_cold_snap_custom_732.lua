local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 10,["23"] = 5,["24"] = 12,["25"] = 13,["26"] = 12,["27"] = 16,["28"] = 17,["29"] = 16,["30"] = 20,["31"] = 21,["32"] = 20,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 28,["37"] = 29,["39"] = 24,["40"] = 32,["41"] = 33,["42"] = 32,["43"] = 36,["44"] = 37,["45"] = 36,["46"] = 42,["47"] = 43,["50"] = 44,["53"] = 45,["56"] = 46,["59"] = 48,["60"] = 42,["61"] = 51,["62"] = 52,["63"] = 54,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 56,["71"] = 63,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 69,["77"] = 70,["78"] = 70,["79"] = 65,["80"] = 65,["81"] = 74,["82"] = 76,["83"] = 76,["84"] = 76,["85"] = 77,["86"] = 76,["87"] = 76,["88"] = 51,["89"] = 81,["90"] = 82,["91"] = 84,["92"] = 89,["93"] = 89,["94"] = 89,["95"] = 89,["96"] = 89,["97"] = 89,["98"] = 89,["99"] = 89,["100"] = 89,["101"] = 90,["102"] = 90,["103"] = 90,["104"] = 90,["105"] = 90,["106"] = 91,["107"] = 93,["108"] = 81,["109"] = 96,["110"] = 97,["111"] = 96,["112"] = 100,["113"] = 101,["114"] = 100,["115"] = 6,["116"] = 6,["117"] = 6,["118"] = 5,["121"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
local ____modifier_invoker_cold_snap_custom_732_freeze = require("abilities.heroes.invoker.732.cold_snap.modifier_invoker_cold_snap_custom_732_freeze")
local modifier_invoker_cold_snap_custom_732_freeze = ____modifier_invoker_cold_snap_custom_732_freeze.modifier_invoker_cold_snap_custom_732_freeze
____exports.modifier_invoker_cold_snap_custom_732 = __TS__Class()
local modifier_invoker_cold_snap_custom_732 = ____exports.modifier_invoker_cold_snap_custom_732
modifier_invoker_cold_snap_custom_732.name = "modifier_invoker_cold_snap_custom_732"
__TS__ClassExtends(modifier_invoker_cold_snap_custom_732, BaseInvokerModifier)
function modifier_invoker_cold_snap_custom_732.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.cooldown = 0
    self.damage = 0
    self.onCooldown = false
end
function modifier_invoker_cold_snap_custom_732.prototype.IsHidden(self)
    return false
end
function modifier_invoker_cold_snap_custom_732.prototype.IsPurgable(self)
    return true
end
function modifier_invoker_cold_snap_custom_732.prototype.IsDebuff(self)
    return true
end
function modifier_invoker_cold_snap_custom_732.prototype.OnCreated(self, params)
    self.cooldown = self:GetOrbSpecialValueFor("freeze_cooldown", "quas")
    self.damage = self:GetOrbSpecialValueFor("freeze_damage", "quas")
    if IsServer() then
        self:Freeze(self:GetCaster())
    end
end
function modifier_invoker_cold_snap_custom_732.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_invoker_cold_snap_custom_732.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function modifier_invoker_cold_snap_custom_732.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    if event.unit ~= self:GetParent() then
        return
    end
    if event.damage < 10 then
        return
    end
    if self.onCooldown then
        return
    end
    self:Freeze(event.attacker)
end
function modifier_invoker_cold_snap_custom_732.prototype.Freeze(self, attacker)
    local parent = self:GetParent()
    self.onCooldown = true
    local damageTable = {
        attacker = attacker,
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = parent,
        ability = self:GetAbility()
    }
    ApplyDamage(damageTable)
    modifier_invoker_cold_snap_custom_732_freeze:apply(
        parent,
        self:GetCaster(),
        self:GetAbility(),
        {duration = parent:CalculateDuration(
            self:GetCaster(),
            0.4
        )}
    )
    self:PlayEffects(attacker)
    Timers:CreateTimer(
        self.cooldown,
        function()
            self.onCooldown = false
        end
    )
end
function modifier_invoker_cold_snap_custom_732.prototype.PlayEffects(self, attacker)
    local parent = self:GetParent()
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_cold_snap.vpcf", PATTACH_POINT_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        Vector(0, 0, 0),
        true
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        attacker:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    parent:EmitSound("Hero_Invoker.ColdSnap.Freeze")
end
function modifier_invoker_cold_snap_custom_732.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_invoker/invoker_cold_snap_status.vpcf"
end
function modifier_invoker_cold_snap_custom_732.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_invoker_cold_snap_custom_732 = __TS__Decorate(
    modifier_invoker_cold_snap_custom_732,
    modifier_invoker_cold_snap_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_cold_snap_custom_732"}
)
____exports.modifier_invoker_cold_snap_custom_732 = modifier_invoker_cold_snap_custom_732
return ____exports
