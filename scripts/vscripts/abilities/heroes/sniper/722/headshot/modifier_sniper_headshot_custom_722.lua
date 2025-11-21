local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 20,["27"] = 20,["29"] = 21,["30"] = 21,["32"] = 22,["33"] = 22,["35"] = 24,["36"] = 25,["37"] = 25,["40"] = 28,["41"] = 29,["42"] = 31,["43"] = 33,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 38,["54"] = 38,["55"] = 38,["56"] = 38,["57"] = 34,["58"] = 34,["60"] = 51,["61"] = 51,["62"] = 51,["63"] = 51,["64"] = 51,["65"] = 51,["66"] = 60,["67"] = 16,["68"] = 5,["69"] = 5,["70"] = 5,["71"] = 4,["74"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_sniper_headshot_custom_722_slow = require("abilities.heroes.sniper.722.headshot.modifier_sniper_headshot_custom_722_slow")
local modifier_sniper_headshot_custom_722_slow = ____modifier_sniper_headshot_custom_722_slow.modifier_sniper_headshot_custom_722_slow
____exports.modifier_sniper_headshot_custom_722 = __TS__Class()
local modifier_sniper_headshot_custom_722 = ____exports.modifier_sniper_headshot_custom_722
modifier_sniper_headshot_custom_722.name = "modifier_sniper_headshot_custom_722"
__TS__ClassExtends(modifier_sniper_headshot_custom_722, BaseModifier)
function modifier_sniper_headshot_custom_722.prototype.IsHidden(self)
    return true
end
function modifier_sniper_headshot_custom_722.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL}
end
function modifier_sniper_headshot_custom_722.prototype.GetModifierProcAttack_BonusDamage_Physical(self, event)
    local parent = self:GetParent()
    local target = event.target
    if parent:PassivesDisabled() then
        return 0
    end
    if not target:IsDOTANPC() then
        return 0
    end
    if not target:IsUnit() then
        return 0
    end
    if not parent:HasModifier("modifier_sniper_assassinate_custom_722_attack") then
        if not RollPseudoRandomPercentage(40, DOTA_PSEUDO_RANDOM_SNIPER_HEADSHOT, parent) then
            return 0
        end
    end
    local damage = self:GetSpecialValueFor("bonus_damage")
    local distance = self:GetSpecialValueFor("knockback_distance")
    local center = parent:GetAbsOrigin()
    if not target:IsCurrentlyHorizontalMotionControlled() and not target:IsCurrentlyVerticalMotionControlled() then
        target:AddNewModifier(
            parent,
            self:GetAbility(),
            "modifier_knockback",
            {
                duration = 0.1,
                knockback_duration = 0.1,
                should_stun = false,
                knockback_distance = distance,
                knockback_height = 0,
                center_x = center.x,
                center_y = center.y,
                center_z = center.z
            }
        )
    end
    modifier_sniper_headshot_custom_722_slow:apply(
        target,
        parent,
        self:GetAbility(),
        {duration = target:CalculateDuration(parent, 0.5)}
    )
    return damage
end
modifier_sniper_headshot_custom_722 = __TS__Decorate(
    modifier_sniper_headshot_custom_722,
    modifier_sniper_headshot_custom_722,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_headshot_custom_722"}
)
____exports.modifier_sniper_headshot_custom_722 = modifier_sniper_headshot_custom_722
return ____exports
