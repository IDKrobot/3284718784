local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 9,["22"] = 5,["23"] = 13,["24"] = 14,["25"] = 13,["26"] = 17,["27"] = 18,["28"] = 17,["29"] = 21,["30"] = 22,["31"] = 21,["32"] = 25,["33"] = 37,["34"] = 39,["37"] = 41,["38"] = 42,["39"] = 44,["40"] = 45,["41"] = 46,["42"] = 47,["43"] = 48,["44"] = 50,["45"] = 50,["46"] = 50,["47"] = 50,["48"] = 50,["49"] = 50,["50"] = 59,["51"] = 60,["53"] = 25,["54"] = 63,["55"] = 64,["56"] = 66,["59"] = 68,["60"] = 70,["61"] = 71,["62"] = 73,["63"] = 74,["64"] = 76,["65"] = 76,["66"] = 76,["67"] = 76,["68"] = 76,["69"] = 78,["70"] = 80,["71"] = 81,["72"] = 81,["73"] = 81,["74"] = 81,["75"] = 85,["76"] = 85,["77"] = 85,["78"] = 85,["79"] = 85,["80"] = 85,["81"] = 81,["82"] = 81,["84"] = 94,["86"] = 63,["87"] = 98,["88"] = 99,["89"] = 98,["90"] = 102,["91"] = 103,["92"] = 105,["93"] = 107,["94"] = 107,["95"] = 107,["96"] = 107,["97"] = 108,["98"] = 102,["99"] = 111,["100"] = 112,["101"] = 111,["102"] = 118,["103"] = 119,["104"] = 118,["105"] = 124,["106"] = 125,["107"] = 124,["108"] = 128,["109"] = 129,["110"] = 128,["111"] = 132,["112"] = 133,["113"] = 132,["114"] = 6,["115"] = 6,["116"] = 6,["117"] = 5,["120"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifierMotionHorizontal = ____dota_ts_adapter.BaseModifierMotionHorizontal
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_pangolier_swashbuckle_custom_717_attacks = require("abilities.heroes.pangolier.717.swashbuckle.modifier_pangolier_swashbuckle_custom_717_attacks")
local modifier_pangolier_swashbuckle_custom_717_attacks = ____modifier_pangolier_swashbuckle_custom_717_attacks.modifier_pangolier_swashbuckle_custom_717_attacks
local ____modifier_pangolier_swashbuckle_custom_717_cast_stun = require("abilities.heroes.pangolier.717.swashbuckle.modifier_pangolier_swashbuckle_custom_717_cast_stun")
local modifier_pangolier_swashbuckle_custom_717_cast_stun = ____modifier_pangolier_swashbuckle_custom_717_cast_stun.modifier_pangolier_swashbuckle_custom_717_cast_stun
____exports.modifier_pangolier_swashbuckle_custom_717_dash = __TS__Class()
local modifier_pangolier_swashbuckle_custom_717_dash = ____exports.modifier_pangolier_swashbuckle_custom_717_dash
modifier_pangolier_swashbuckle_custom_717_dash.name = "modifier_pangolier_swashbuckle_custom_717_dash"
__TS__ClassExtends(modifier_pangolier_swashbuckle_custom_717_dash, BaseModifierMotionHorizontal)
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.____constructor(self, ...)
    BaseModifierMotionHorizontal.prototype.____constructor(self, ...)
    self.distance = 0
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.IsHidden(self)
    return true
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.IsDebuff(self)
    return false
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:EmitSound("Hero_Pangolier.Swashbuckle.Cast")
    parent:EmitSound("Hero_Pangolier.Swashbuckle.Layer")
    self.point = Vector(params.x, params.y, params.z)
    self.toward_point = Vector(params.toward_x, params.toward_y, 0)
    self.angle = self.point:__sub(parent:GetAbsOrigin()):Normalized()
    self.distance = params.distance / (self:GetDuration() / FrameTime())
    self.direction = Vector(params.attack_x, params.attack_y, 0):Normalized()
    modifier_pangolier_swashbuckle_custom_717_cast_stun:apply(
        parent,
        parent,
        self:GetAbility(),
        {duration = self:GetRemainingTime() + 0.1}
    )
    if self:ApplyHorizontalMotionController() == false then
        self:Destroy()
    end
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:InterruptMotionControllers(true)
    local direction = parent:GetForwardVector()
    direction.z = 0
    parent:SetForwardVector(direction)
    parent:FaceTowards(parent:GetAbsOrigin():__add(direction:__mul(10)))
    FindClearSpaceForUnit(
        parent,
        parent:GetAbsOrigin(),
        false
    )
    parent:FadeGesture(ACT_DOTA_CAST_ABILITY_1)
    if self:GetRemainingTime() < 0.1 then
        modifier_pangolier_swashbuckle_custom_717_attacks:apply(
            parent,
            parent,
            self:GetAbility(),
            {
                duration = 3,
                direction_x = self.direction.x,
                direction_y = self.direction.y,
                toward_x = self.toward_point.x,
                toward_y = self.toward_point.y
            }
        )
    else
        parent:RemoveModifierByName(modifier_pangolier_swashbuckle_custom_717_cast_stun.name)
    end
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.OnHorizontalMotionInterrupted(self)
    self:Destroy()
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.UpdateHorizontalMotion(self, me, dt)
    local parent = self:GetParent()
    local origin = parent:GetAbsOrigin()
    local next_position = GetGroundPosition(
        origin:__add(self.angle:__mul(self.distance)),
        parent
    )
    parent:SetAbsOrigin(next_position)
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_DISABLE_TURNING, MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.GetModifierDisableTurning(self)
    return 1
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_CAST_ABILITY_1
end
function modifier_pangolier_swashbuckle_custom_717_dash.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_pangolier/pangolier_swashbuckler_dash.vpcf"
end
modifier_pangolier_swashbuckle_custom_717_dash = __TS__Decorate(
    modifier_pangolier_swashbuckle_custom_717_dash,
    modifier_pangolier_swashbuckle_custom_717_dash,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_swashbuckle_custom_717_dash"}
)
____exports.modifier_pangolier_swashbuckle_custom_717_dash = modifier_pangolier_swashbuckle_custom_717_dash
return ____exports
