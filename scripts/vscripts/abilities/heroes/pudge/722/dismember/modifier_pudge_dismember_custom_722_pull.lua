local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 3,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 15,["28"] = 17,["29"] = 18,["30"] = 20,["31"] = 21,["32"] = 22,["35"] = 12,["36"] = 27,["37"] = 28,["38"] = 28,["40"] = 27,["41"] = 31,["42"] = 32,["43"] = 33,["44"] = 34,["45"] = 36,["46"] = 37,["49"] = 41,["50"] = 42,["51"] = 43,["52"] = 45,["54"] = 47,["56"] = 31,["57"] = 4,["58"] = 4,["59"] = 4,["60"] = 3,["63"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifierMotionHorizontal = ____dota_ts_adapter.BaseModifierMotionHorizontal
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pudge_dismember_custom_722_pull = __TS__Class()
local modifier_pudge_dismember_custom_722_pull = ____exports.modifier_pudge_dismember_custom_722_pull
modifier_pudge_dismember_custom_722_pull.name = "modifier_pudge_dismember_custom_722_pull"
__TS__ClassExtends(modifier_pudge_dismember_custom_722_pull, BaseModifierMotionHorizontal)
function modifier_pudge_dismember_custom_722_pull.prototype.____constructor(self, ...)
    BaseModifierMotionHorizontal.prototype.____constructor(self, ...)
    self.pullDistance = 0
    self.pullDistanceSpeed = 0
end
function modifier_pudge_dismember_custom_722_pull.prototype.IsHidden(self)
    return true
end
function modifier_pudge_dismember_custom_722_pull.prototype.OnCreated(self, params)
    local ability = self:GetAbility()
    if ability == nil then
        return
    end
    self.pullDistance = ability:GetSpecialValueFor("pull_distance_limit")
    self.pullDistanceSpeed = ability:GetSpecialValueFor("pull_units_per_second")
    if IsServer() then
        if self:ApplyHorizontalMotionController() == false then
            self:Destroy()
        end
    end
end
function modifier_pudge_dismember_custom_722_pull.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():RemoveHorizontalMotionController(self)
    end
end
function modifier_pudge_dismember_custom_722_pull.prototype.UpdateHorizontalMotion(self, me, dt)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if caster == nil or ability == nil then
        self:Destroy()
        return
    end
    local distance = caster:GetAbsOrigin():__sub(me:GetAbsOrigin())
    if distance:Length2D() > self.pullDistance and parent:HasModifier("modifier_pudge_dismember_custom_722") then
        local newOrigin = me:GetOrigin():__add(distance:Normalized():__mul(self.pullDistanceSpeed * dt))
        me:SetOrigin(newOrigin)
    else
        self:Destroy()
    end
end
modifier_pudge_dismember_custom_722_pull = __TS__Decorate(
    modifier_pudge_dismember_custom_722_pull,
    modifier_pudge_dismember_custom_722_pull,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pudge_dismember_custom_722_pull"}
)
____exports.modifier_pudge_dismember_custom_722_pull = modifier_pudge_dismember_custom_722_pull
return ____exports
