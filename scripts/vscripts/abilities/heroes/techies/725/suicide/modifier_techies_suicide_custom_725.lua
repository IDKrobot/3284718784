local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["15"] = 18,["16"] = 19,["17"] = 18,["18"] = 22,["19"] = 23,["20"] = 22,["21"] = 26,["22"] = 27,["23"] = 26,["24"] = 30,["25"] = 31,["26"] = 33,["29"] = 35,["30"] = 36,["33"] = 40,["34"] = 42,["35"] = 42,["36"] = 42,["37"] = 42,["38"] = 43,["39"] = 44,["40"] = 45,["41"] = 47,["42"] = 48,["43"] = 50,["44"] = 51,["45"] = 53,["46"] = 54,["47"] = 56,["48"] = 58,["49"] = 59,["50"] = 61,["51"] = 63,["52"] = 64,["53"] = 66,["54"] = 71,["55"] = 71,["56"] = 71,["57"] = 71,["58"] = 71,["59"] = 71,["60"] = 71,["61"] = 71,["62"] = 71,["63"] = 72,["64"] = 72,["65"] = 72,["66"] = 72,["67"] = 72,["68"] = 72,["69"] = 72,["70"] = 72,["71"] = 30,["72"] = 75,["73"] = 76,["74"] = 78,["77"] = 80,["78"] = 81,["79"] = 75,["80"] = 84,["81"] = 85,["82"] = 87,["83"] = 89,["84"] = 90,["85"] = 91,["86"] = 93,["87"] = 94,["88"] = 95,["89"] = 97,["90"] = 99,["91"] = 84,["92"] = 102,["93"] = 103,["94"] = 105,["95"] = 107,["96"] = 109,["97"] = 110,["98"] = 112,["99"] = 114,["100"] = 115,["101"] = 116,["102"] = 117,["104"] = 120,["105"] = 122,["106"] = 123,["107"] = 124,["108"] = 125,["109"] = 125,["112"] = 128,["113"] = 129,["114"] = 131,["116"] = 102,["117"] = 135,["118"] = 136,["119"] = 135,["120"] = 139,["121"] = 140,["122"] = 139,["123"] = 143,["124"] = 144,["125"] = 143,["126"] = 149,["127"] = 150,["128"] = 149,["129"] = 155,["130"] = 156,["131"] = 155,["132"] = 6,["133"] = 6,["134"] = 6,["135"] = 5,["138"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifierMotionBoth = ____dota_ts_adapter.BaseModifierMotionBoth
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_suicide_custom_725 = __TS__Class()
local modifier_techies_suicide_custom_725 = ____exports.modifier_techies_suicide_custom_725
modifier_techies_suicide_custom_725.name = "modifier_techies_suicide_custom_725"
__TS__ClassExtends(modifier_techies_suicide_custom_725, BaseModifierMotionBoth)
function modifier_techies_suicide_custom_725.prototype.IsHidden(self)
    return true
end
function modifier_techies_suicide_custom_725.prototype.IsPurgable(self)
    return false
end
function modifier_techies_suicide_custom_725.prototype.RemoveOnDeath(self)
    return false
end
function modifier_techies_suicide_custom_725.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    if self:ApplyHorizontalMotionController() == false or self:ApplyVerticalMotionController() == false then
        self:Destroy()
        return
    end
    self.horizontal_motion_interrupted = false
    self.start_position = GetGroundPosition(
        parent:GetOrigin(),
        parent
    )
    self.current_time_horizontal = 0
    self.current_time_vertical = 0
    self.last_known_pos = Vector(params.x, params.y, params.z)
    local accelerationZ = 4000
    local desired_height = 500 * self:GetSpecialValueFor("duration") ^ 2
    local lowZ = math.min(self.last_known_pos.z, self.start_position.z)
    local highZ = math.max(self.last_known_pos.z, self.start_position.z)
    local arc_topZ = math.max(lowZ + desired_height, highZ + 100)
    local arc_deltaZ = arc_topZ - self.start_position.z
    self.initial_velocityZ = math.sqrt(2 * arc_deltaZ * accelerationZ)
    local deltaZ = self.last_known_pos.z - self.start_position.z
    local sqrt_det = math.sqrt(math.max(0, self.initial_velocityZ ^ 2) - 2 * accelerationZ * deltaZ)
    self.predicted_total_time = math.max((self.initial_velocityZ + sqrt_det) / accelerationZ, (self.initial_velocityZ - sqrt_det) / accelerationZ)
    self.horizontal_velocity = self.last_known_pos:__sub(self.start_position):__mul(1 / self.predicted_total_time)
    self.horizontal_velocity.z = 0
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_blast_off_trail.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        parent:GetOrigin(),
        true
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_techies_suicide_custom_725.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:RemoveHorizontalMotionController(self)
    parent:RemoveVerticalMotionController(self)
end
function modifier_techies_suicide_custom_725.prototype.UpdateHorizontalMotion(self, me, dt)
    self.current_time_horizontal = math.min(self.current_time_horizontal + dt, self.predicted_total_time)
    local time = self.current_time_horizontal / self.predicted_total_time
    local old_pos = me:GetOrigin()
    local to_desired = self.start_position:__add(self.last_known_pos:__sub(self.start_position):__mul(time)):__sub(old_pos)
    to_desired.z = 0
    local vel_dif = to_desired:__mul(1 / dt):__sub(self.horizontal_velocity)
    local vel_dif_length = vel_dif:Length2D()
    vel_dif = vel_dif:Normalized()
    self.horizontal_velocity = self.horizontal_velocity:__add(vel_dif:__mul(math.min(vel_dif_length, 3000)):__mul(dt))
    me:SetOrigin(old_pos:__add(self.horizontal_velocity:__mul(dt)))
end
function modifier_techies_suicide_custom_725.prototype.UpdateVerticalMotion(self, me, dt)
    local parent = self:GetParent()
    local accelerationZ = 4000
    self.current_time_vertical = self.current_time_vertical + dt
    local new_pos = me:GetOrigin()
    new_pos.z = self.start_position.z + (-0.5 * accelerationZ * self.current_time_vertical ^ 2 + self.initial_velocityZ * self.current_time_vertical)
    local ground_height = GetGroundHeight(new_pos, parent)
    local landed = false
    if new_pos.z < ground_height and -accelerationZ * self.current_time_vertical + self.initial_velocityZ < 0 then
        new_pos.z = ground_height
        landed = true
    end
    me:SetOrigin(new_pos)
    if landed then
        if self.horizontal_motion_interrupted == false then
            local ability = self:GetAbility()
            if ability then
                ability:BlastOff()
            end
        end
        parent:RemoveHorizontalMotionController(self)
        parent:RemoveVerticalMotionController(self)
        self:SetDuration(0.15, true)
    end
end
function modifier_techies_suicide_custom_725.prototype.OnHorizontalMotionInterrupted(self)
    self.horizontal_motion_interrupted = true
end
function modifier_techies_suicide_custom_725.prototype.OnVerticalMotionInterrupted(self)
    self:Destroy()
end
function modifier_techies_suicide_custom_725.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_techies_suicide_custom_725.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
function modifier_techies_suicide_custom_725.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_OVERRIDE_ABILITY_2
end
modifier_techies_suicide_custom_725 = __TS__Decorate(
    modifier_techies_suicide_custom_725,
    modifier_techies_suicide_custom_725,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_suicide_custom_725"}
)
____exports.modifier_techies_suicide_custom_725 = modifier_techies_suicide_custom_725
return ____exports
