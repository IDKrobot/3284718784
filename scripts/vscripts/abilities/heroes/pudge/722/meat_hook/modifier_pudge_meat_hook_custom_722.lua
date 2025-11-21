local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 6,["18"] = 10,["19"] = 11,["20"] = 11,["21"] = 10,["22"] = 14,["23"] = 15,["24"] = 14,["25"] = 18,["26"] = 19,["27"] = 20,["28"] = 21,["31"] = 18,["32"] = 26,["33"] = 27,["34"] = 26,["35"] = 32,["36"] = 33,["37"] = 32,["38"] = 36,["39"] = 37,["40"] = 38,["41"] = 40,["42"] = 41,["43"] = 42,["44"] = 43,["48"] = 50,["49"] = 36,["50"] = 53,["51"] = 54,["52"] = 55,["53"] = 56,["54"] = 58,["57"] = 60,["58"] = 61,["59"] = 62,["60"] = 64,["61"] = 65,["62"] = 67,["63"] = 67,["64"] = 67,["65"] = 67,["66"] = 67,["67"] = 67,["68"] = 67,["69"] = 67,["70"] = 67,["71"] = 68,["72"] = 68,["73"] = 68,["74"] = 68,["75"] = 68,["79"] = 53,["80"] = 74,["81"] = 75,["82"] = 76,["83"] = 77,["84"] = 79,["87"] = 81,["88"] = 82,["89"] = 82,["90"] = 82,["91"] = 82,["92"] = 82,["93"] = 82,["94"] = 82,["95"] = 82,["96"] = 82,["97"] = 83,["100"] = 74,["101"] = 5,["102"] = 5,["103"] = 5,["104"] = 4,["107"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifierMotionHorizontal = ____dota_ts_adapter.BaseModifierMotionHorizontal
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pudge_meat_hook_custom_722 = __TS__Class()
local modifier_pudge_meat_hook_custom_722 = ____exports.modifier_pudge_meat_hook_custom_722
modifier_pudge_meat_hook_custom_722.name = "modifier_pudge_meat_hook_custom_722"
__TS__ClassExtends(modifier_pudge_meat_hook_custom_722, BaseModifierMotionHorizontal)
function modifier_pudge_meat_hook_custom_722.prototype.IsDebuff(self)
    return true
end
function modifier_pudge_meat_hook_custom_722.prototype.IsStunDebuff(self)
    local ____opt_0 = self:GetCaster()
    return (____opt_0 and ____opt_0:GetTeamNumber()) == self:GetParent():GetTeamNumber()
end
function modifier_pudge_meat_hook_custom_722.prototype.RemoveOnDeath(self)
    return false
end
function modifier_pudge_meat_hook_custom_722.prototype.OnCreated(self, params)
    if IsServer() then
        if self:ApplyHorizontalMotionController() == false then
            self:Destroy()
        end
    end
end
function modifier_pudge_meat_hook_custom_722.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_pudge_meat_hook_custom_722.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_FLAIL
end
function modifier_pudge_meat_hook_custom_722.prototype.CheckState(self)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    if IsServer() then
        if caster ~= nil then
            if caster:GetTeamNumber() ~= parent:GetTeamNumber() then
                return {[MODIFIER_STATE_STUNNED] = true}
            end
        end
    end
    return {}
end
function modifier_pudge_meat_hook_custom_722.prototype.UpdateHorizontalMotion(self, me, dt)
    if IsServer() then
        local caster = self:GetCaster()
        local ability = self:GetAbility()
        if caster == nil or ability == nil then
            return
        end
        if ability.victim ~= nil and ability.chainParticle ~= nil then
            ability.victim:SetOrigin(ability.projectileLocation)
            local distance = ability.startPosition:__sub(caster:GetOrigin()):Length2D()
            if ability.chainAttached == false and distance > 128 then
                ability.chainAttached = true
                ParticleManager:SetParticleControlEnt(
                    ability.chainParticle,
                    0,
                    caster,
                    PATTACH_CUSTOMORIGIN,
                    "attach_hitloc",
                    caster:GetOrigin(),
                    true
                )
                ParticleManager:SetParticleControl(
                    ability.chainParticle,
                    0,
                    ability.startPosition:__add(ability.hookOffset)
                )
            end
        end
    end
end
function modifier_pudge_meat_hook_custom_722.prototype.OnHorizontalMotionInterrupted(self)
    if IsServer() then
        local caster = self:GetCaster()
        local ability = self:GetAbility()
        if caster == nil or ability == nil then
            return
        end
        if ability.victim ~= nil and ability.chainParticle ~= nil then
            ParticleManager:SetParticleControlEnt(
                ability.chainParticle,
                1,
                caster,
                PATTACH_POINT_FOLLOW,
                "attach_weapon_chain_rt",
                caster:GetAbsOrigin():__add(ability.hookOffset),
                true
            )
            self:Destroy()
        end
    end
end
modifier_pudge_meat_hook_custom_722 = __TS__Decorate(
    modifier_pudge_meat_hook_custom_722,
    modifier_pudge_meat_hook_custom_722,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pudge_meat_hook_custom_722"}
)
____exports.modifier_pudge_meat_hook_custom_722 = modifier_pudge_meat_hook_custom_722
return ____exports
