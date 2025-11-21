local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 8,["16"] = 9,["17"] = 8,["18"] = 12,["19"] = 13,["20"] = 12,["21"] = 16,["22"] = 17,["23"] = 19,["26"] = 21,["27"] = 23,["28"] = 25,["29"] = 27,["30"] = 28,["32"] = 16,["33"] = 32,["34"] = 33,["35"] = 35,["38"] = 37,["39"] = 38,["41"] = 41,["42"] = 45,["43"] = 46,["44"] = 32,["45"] = 49,["46"] = 50,["47"] = 49,["48"] = 53,["49"] = 54,["50"] = 55,["51"] = 56,["52"] = 57,["53"] = 59,["54"] = 60,["57"] = 64,["58"] = 65,["59"] = 53,["60"] = 68,["61"] = 69,["62"] = 68,["63"] = 74,["64"] = 75,["65"] = 74,["66"] = 81,["67"] = 82,["68"] = 81,["69"] = 4,["70"] = 4,["71"] = 4,["72"] = 3,["75"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifierMotionHorizontal = ____dota_ts_adapter.BaseModifierMotionHorizontal
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_morphling_waveform_custom_729 = __TS__Class()
local modifier_morphling_waveform_custom_729 = ____exports.modifier_morphling_waveform_custom_729
modifier_morphling_waveform_custom_729.name = "modifier_morphling_waveform_custom_729"
__TS__ClassExtends(modifier_morphling_waveform_custom_729, BaseModifierMotionHorizontal)
function modifier_morphling_waveform_custom_729.prototype.IsHidden(self)
    return true
end
function modifier_morphling_waveform_custom_729.prototype.IsPurgable(self)
    return false
end
function modifier_morphling_waveform_custom_729.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    self.projectile = params.projectile
    self.target = Vector(params.x, params.y, params.z)
    parent:AddNoDraw()
    if not self:ApplyHorizontalMotionController() then
        self:Destroy()
    end
end
function modifier_morphling_waveform_custom_729.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    if self.projectile and ProjectileManager:IsValidProjectile(self.projectile) then
        ProjectileManager:DestroyLinearProjectile(self.projectile)
    end
    parent:RemoveHorizontalMotionController(self)
    parent:StartGesture(ACT_WAVEFORM_END)
    parent:RemoveNoDraw()
end
function modifier_morphling_waveform_custom_729.prototype.OnHorizontalMotionInterrupted(self)
    self:Destroy()
end
function modifier_morphling_waveform_custom_729.prototype.UpdateHorizontalMotion(self, me, dt)
    local direction = self.target:__sub(me:GetAbsOrigin())
    direction.z = 0
    local distance = direction:Length2D()
    direction = direction:Normalized()
    if distance < 64 then
        self:Destroy()
        return
    end
    local nextPos = me:GetOrigin():__add(direction:__mul(1250 * dt))
    me:SetOrigin(nextPos)
end
function modifier_morphling_waveform_custom_729.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_IGNORE_CAST_ANGLE}
end
function modifier_morphling_waveform_custom_729.prototype.CheckState(self)
    return {[MODIFIER_STATE_INVULNERABLE] = true, [MODIFIER_STATE_NO_UNIT_COLLISION] = true}
end
function modifier_morphling_waveform_custom_729.prototype.GetModifierIgnoreCastAngle(self)
    return 1
end
modifier_morphling_waveform_custom_729 = __TS__Decorate(
    modifier_morphling_waveform_custom_729,
    modifier_morphling_waveform_custom_729,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_morphling_waveform_custom_729"}
)
____exports.modifier_morphling_waveform_custom_729 = modifier_morphling_waveform_custom_729
return ____exports
