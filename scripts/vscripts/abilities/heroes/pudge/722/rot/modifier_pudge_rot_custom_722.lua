local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 4,["14"] = 3,["15"] = 4,["17"] = 4,["18"] = 5,["19"] = 6,["20"] = 3,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 12,["27"] = 16,["28"] = 17,["29"] = 16,["30"] = 20,["31"] = 21,["32"] = 20,["33"] = 24,["34"] = 25,["35"] = 24,["36"] = 28,["37"] = 29,["38"] = 28,["39"] = 32,["40"] = 33,["41"] = 32,["42"] = 36,["43"] = 37,["44"] = 38,["45"] = 39,["46"] = 41,["49"] = 43,["50"] = 44,["51"] = 46,["54"] = 48,["55"] = 49,["56"] = 51,["57"] = 52,["58"] = 57,["59"] = 57,["60"] = 57,["61"] = 57,["62"] = 57,["63"] = 58,["64"] = 58,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["72"] = 60,["73"] = 61,["74"] = 66,["75"] = 66,["76"] = 66,["77"] = 66,["78"] = 66,["79"] = 66,["80"] = 66,["81"] = 66,["83"] = 69,["84"] = 70,["85"] = 36,["86"] = 73,["87"] = 74,["88"] = 75,["91"] = 77,["92"] = 73,["93"] = 80,["94"] = 81,["95"] = 82,["96"] = 83,["97"] = 85,["100"] = 86,["103"] = 88,["106"] = 90,["107"] = 91,["108"] = 91,["109"] = 91,["110"] = 91,["111"] = 91,["112"] = 91,["113"] = 91,["114"] = 99,["115"] = 101,["116"] = 80,["117"] = 104,["118"] = 105,["119"] = 104,["120"] = 110,["121"] = 111,["122"] = 110,["123"] = 116,["124"] = 117,["125"] = 119,["128"] = 121,["129"] = 122,["130"] = 124,["131"] = 125,["132"] = 125,["133"] = 125,["134"] = 125,["135"] = 126,["136"] = 127,["137"] = 128,["138"] = 128,["139"] = 128,["140"] = 128,["141"] = 129,["143"] = 131,["144"] = 132,["146"] = 135,["148"] = 116,["149"] = 4,["150"] = 4,["151"] = 4,["152"] = 3,["155"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pudge_rot_custom_722 = __TS__Class()
local modifier_pudge_rot_custom_722 = ____exports.modifier_pudge_rot_custom_722
modifier_pudge_rot_custom_722.name = "modifier_pudge_rot_custom_722"
__TS__ClassExtends(modifier_pudge_rot_custom_722, BaseModifier)
function modifier_pudge_rot_custom_722.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.rot_radius = 0
    self.rot_tick = 0
end
function modifier_pudge_rot_custom_722.prototype.IsDebuff(self)
    return true
end
function modifier_pudge_rot_custom_722.prototype.IsAura(self)
    return self:GetCaster() == self:GetParent()
end
function modifier_pudge_rot_custom_722.prototype.GetModifierAura(self)
    return self:GetName()
end
function modifier_pudge_rot_custom_722.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_pudge_rot_custom_722.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC)
end
function modifier_pudge_rot_custom_722.prototype.GetAuraRadius(self)
    return self.rot_radius
end
function modifier_pudge_rot_custom_722.prototype.GetAuraDuration(self)
    return 0.5
end
function modifier_pudge_rot_custom_722.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if caster == nil or ability == nil then
        return
    end
    self.rot_radius = ability:GetSpecialValueFor("rot_radius")
    self.rot_tick = ability:GetSpecialValueFor("rot_tick")
    if not IsServer() then
        return
    end
    if caster == parent then
        caster:EmitSound(caster:HasPersona("npc_dota_hero_pudge") and "Hero_Pudge.Rot.Persona" or "Hero_Pudge.Rot")
        local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pudge/pudge_rot.vpcf", caster)
        local particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN_FOLLOW, parent)
        ParticleManager:SetParticleControl(
            particle,
            1,
            Vector(self.rot_radius, 1, self.rot_radius)
        )
        self:AddParticle(
            particle,
            false,
            false,
            -1,
            false,
            false
        )
    else
        local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pudge/pudge_rot_recipient.vpcf", caster)
        local particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN_FOLLOW, parent)
        self:AddParticle(
            particle,
            false,
            false,
            -1,
            false,
            false
        )
    end
    self:OnIntervalThink()
    self:StartIntervalThink(self.rot_tick)
end
function modifier_pudge_rot_custom_722.prototype.OnDestroy(self)
    local caster = self:GetCaster()
    if not IsServer() or caster == nil or caster ~= self:GetParent() then
        return
    end
    caster:StopSound(caster:HasPersona("npc_dota_hero_pudge") and "Hero_Pudge.Rot.Persona" or "Hero_Pudge.Rot")
end
function modifier_pudge_rot_custom_722.prototype.OnIntervalThink(self)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if caster == nil or ability == nil then
        return
    end
    if not caster:IsAlive() then
        return
    end
    if caster ~= parent and self:GetRemainingTime() < 0.4 then
        return
    end
    local damage = ability:GetSpecialValueFor("rot_damage") * self.rot_tick
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = parent,
        ability = ability
    }
    ApplyDamage(damageTable)
    self:EmitPhrase()
end
function modifier_pudge_rot_custom_722.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_pudge_rot_custom_722.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self:GetCaster() == self:GetParent() and 0 or -self:GetSpecialValueFor("rot_slow")
end
function modifier_pudge_rot_custom_722.prototype.EmitPhrase(self)
    local caster = self:GetCaster()
    if caster == nil then
        return
    end
    if not caster:IsAlive() and caster:GetUnitName() == "npc_dota_hero_pudge" then
        local soundName = ""
        if caster:HasArcana() then
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 4))
            )
            soundName = "pudge_pud_arc_rot_deny_" .. (random == "03" and "03_01" or random)
        elseif caster:HasPersona() then
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 6))
            )
            soundName = "pudge_toy_pug_rot_deny_" .. random
        else
            local random = RollVoiceLines(nil, 5, 11)
            soundName = "pudge_pud_deny_" .. random
        end
        caster:EmitSoundOnClient(soundName)
    end
end
modifier_pudge_rot_custom_722 = __TS__Decorate(
    modifier_pudge_rot_custom_722,
    modifier_pudge_rot_custom_722,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pudge_rot_custom_722"}
)
____exports.modifier_pudge_rot_custom_722 = modifier_pudge_rot_custom_722
return ____exports
