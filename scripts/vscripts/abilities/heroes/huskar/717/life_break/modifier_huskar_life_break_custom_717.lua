local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 12,["23"] = 4,["24"] = 14,["25"] = 15,["26"] = 14,["27"] = 18,["28"] = 19,["29"] = 18,["30"] = 22,["31"] = 23,["32"] = 22,["33"] = 26,["34"] = 27,["37"] = 29,["38"] = 31,["39"] = 32,["41"] = 26,["42"] = 35,["43"] = 36,["44"] = 38,["47"] = 40,["48"] = 42,["50"] = 42,["52"] = 44,["55"] = 46,["56"] = 47,["57"] = 49,["58"] = 49,["59"] = 49,["60"] = 49,["61"] = 49,["62"] = 49,["63"] = 49,["64"] = 49,["65"] = 57,["66"] = 59,["67"] = 60,["68"] = 61,["69"] = 62,["70"] = 64,["71"] = 64,["72"] = 64,["73"] = 64,["74"] = 68,["75"] = 69,["76"] = 69,["77"] = 64,["78"] = 64,["79"] = 73,["80"] = 75,["81"] = 76,["82"] = 81,["83"] = 81,["84"] = 81,["85"] = 81,["86"] = 81,["87"] = 82,["88"] = 84,["89"] = 85,["90"] = 35,["91"] = 88,["92"] = 89,["93"] = 88,["94"] = 92,["95"] = 93,["96"] = 95,["97"] = 97,["98"] = 98,["100"] = 100,["101"] = 101,["102"] = 102,["103"] = 103,["104"] = 105,["105"] = 106,["106"] = 107,["107"] = 108,["109"] = 110,["110"] = 111,["111"] = 113,["112"] = 92,["113"] = 116,["114"] = 117,["115"] = 116,["116"] = 123,["117"] = 124,["118"] = 125,["120"] = 127,["121"] = 123,["122"] = 5,["123"] = 5,["124"] = 5,["125"] = 4,["128"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifierMotionHorizontal = ____dota_ts_adapter.BaseModifierMotionHorizontal
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_huskar_life_break_custom_717_slow = require("abilities.heroes.huskar.717.life_break.modifier_huskar_life_break_custom_717_slow")
local modifier_huskar_life_break_custom_717_slow = ____modifier_huskar_life_break_custom_717_slow.modifier_huskar_life_break_custom_717_slow
____exports.modifier_huskar_life_break_custom_717 = __TS__Class()
local modifier_huskar_life_break_custom_717 = ____exports.modifier_huskar_life_break_custom_717
modifier_huskar_life_break_custom_717.name = "modifier_huskar_life_break_custom_717"
__TS__ClassExtends(modifier_huskar_life_break_custom_717, BaseModifierMotionHorizontal)
function modifier_huskar_life_break_custom_717.prototype.____constructor(self, ...)
    BaseModifierMotionHorizontal.prototype.____constructor(self, ...)
    self.speed = 1200
    self.close_distance = 80
    self.far_distance = 1450
    self.success = false
end
function modifier_huskar_life_break_custom_717.prototype.IsHidden(self)
    return true
end
function modifier_huskar_life_break_custom_717.prototype.IsPurgable(self)
    return false
end
function modifier_huskar_life_break_custom_717.prototype.IsDebuff(self)
    return false
end
function modifier_huskar_life_break_custom_717.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.target = EntIndexToHScript(params.target)
    if self:ApplyHorizontalMotionController() == false then
        self:Destroy()
    end
end
function modifier_huskar_life_break_custom_717.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:InterruptMotionControllers(true)
    local ____opt_0 = parent:FindModifierByName("modifier_huskar_life_break_custom_717_buff")
    if ____opt_0 ~= nil then
        ____opt_0:Destroy()
    end
    if not self.success then
        return
    end
    local damage = self.target:GetHealth() * self:GetSpecialValueFor("health_damage") / 100
    local cost = parent:GetHealth() * self:GetSpecialValueFor("health_cost_percent") / 100
    local damageTable = {
        attacker = parent,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = self.target,
        ability = self:GetAbility(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE
    }
    ApplyDamage(damageTable)
    damageTable.victim = parent
    damageTable.damage = cost
    damageTable.damage_flags = DOTA_DAMAGE_FLAG_NON_LETHAL
    ApplyDamage(damageTable)
    modifier_huskar_life_break_custom_717_slow:apply(
        self.target,
        parent,
        self:GetAbility(),
        {duration = self.target:CalculateDuration(
            parent,
            self:GetSpecialValueFor("duration")
        )}
    )
    parent:MoveToTargetToAttack(self.target)
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_huskar/huskar_life_break.vpcf", parent)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, self.target)
    ParticleManager:SetParticleControl(
        particle,
        1,
        self.target:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    parent:StartGesture(ACT_DOTA_CAST_LIFE_BREAK_END)
    self.target:EmitSound("Hero_Huskar.Life_Break.Impact")
end
function modifier_huskar_life_break_custom_717.prototype.OnHorizontalMotionInterrupted(self)
    self:Destroy()
end
function modifier_huskar_life_break_custom_717.prototype.UpdateHorizontalMotion(self, me, dt)
    local parent = self:GetParent()
    local origin = parent:GetOrigin()
    if not self.target:IsAlive() then
        self:EndCharge(false)
    end
    local direction = self.target:GetOrigin():__sub(origin)
    direction.z = 0
    local distance = direction:Length2D()
    direction = direction:Normalized()
    if distance < self.close_distance then
        self:EndCharge(true)
    elseif distance > self.far_distance then
        self:EndCharge(false)
    end
    local target = origin:__add(direction:__mul(self.speed * dt))
    parent:SetOrigin(target)
    parent:FaceTowards(self.target:GetOrigin())
end
function modifier_huskar_life_break_custom_717.prototype.CheckState(self)
    return {[MODIFIER_STATE_MAGIC_IMMUNE] = true, [MODIFIER_STATE_DISARMED] = true}
end
function modifier_huskar_life_break_custom_717.prototype.EndCharge(self, success)
    if success and not self.target:TriggerSpellAbsorb(self:GetAbility()) then
        self.success = true
    end
    self:Destroy()
end
modifier_huskar_life_break_custom_717 = __TS__Decorate(
    modifier_huskar_life_break_custom_717,
    modifier_huskar_life_break_custom_717,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_huskar_life_break_custom_717"}
)
____exports.modifier_huskar_life_break_custom_717 = modifier_huskar_life_break_custom_717
return ____exports
