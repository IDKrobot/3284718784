local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 25,["33"] = 26,["36"] = 28,["37"] = 30,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 36,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 32,["52"] = 32,["53"] = 21,["54"] = 49,["55"] = 50,["56"] = 49,["57"] = 55,["58"] = 56,["59"] = 55,["60"] = 61,["61"] = 62,["62"] = 61,["63"] = 65,["64"] = 66,["65"] = 65,["66"] = 69,["67"] = 70,["68"] = 69,["69"] = 73,["70"] = 74,["71"] = 73,["72"] = 4,["73"] = 4,["74"] = 4,["75"] = 3,["78"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_morphling_adaptive_strike_str_custom_729 = __TS__Class()
local modifier_morphling_adaptive_strike_str_custom_729 = ____exports.modifier_morphling_adaptive_strike_str_custom_729
modifier_morphling_adaptive_strike_str_custom_729.name = "modifier_morphling_adaptive_strike_str_custom_729"
__TS__ClassExtends(modifier_morphling_adaptive_strike_str_custom_729, BaseModifier)
function modifier_morphling_adaptive_strike_str_custom_729.prototype.IsHidden(self)
    return false
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.IsPurgable(self)
    return true
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.IsDebuff(self)
    return true
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.IsStunDebuff(self)
    return true
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    if not caster then
        return
    end
    local origin = caster:GetAbsOrigin()
    local knockback_duration = params.distance / 1000
    parent:AddNewModifier(
        caster,
        self:GetAbility(),
        "modifier_knockback",
        {
            duration = knockback_duration,
            knockback_duration = knockback_duration,
            should_stun = false,
            knockback_distance = params.distance,
            knockback_height = 0,
            center_x = origin.x,
            center_y = origin.y,
            center_z = origin.z
        }
    )
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.CheckState(self)
    return {[MODIFIER_STATE_STUNNED] = true}
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_DISABLED
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.GetEffectName(self)
    return "particles/generic_gameplay/generic_stunned.vpcf"
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
function modifier_morphling_adaptive_strike_str_custom_729.prototype.GetTexture(self)
    return "morphling_adaptive_strike_str"
end
modifier_morphling_adaptive_strike_str_custom_729 = __TS__Decorate(
    modifier_morphling_adaptive_strike_str_custom_729,
    modifier_morphling_adaptive_strike_str_custom_729,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_morphling_adaptive_strike_str_custom_729"}
)
____exports.modifier_morphling_adaptive_strike_str_custom_729 = modifier_morphling_adaptive_strike_str_custom_729
return ____exports
