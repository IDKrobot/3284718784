local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 8,["20"] = 8,["21"] = 9,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 13,["26"] = 18,["27"] = 19,["28"] = 20,["30"] = 22,["31"] = 18,["32"] = 25,["33"] = 26,["34"] = 25,["35"] = 29,["36"] = 30,["37"] = 32,["38"] = 33,["39"] = 34,["40"] = 35,["44"] = 39,["45"] = 39,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 39,["50"] = 39,["51"] = 29,["52"] = 48,["53"] = 49,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 51,["59"] = 51,["60"] = 57,["61"] = 57,["62"] = 57,["63"] = 51,["64"] = 51,["65"] = 59,["66"] = 48,["67"] = 62,["68"] = 63,["69"] = 64,["70"] = 66,["73"] = 67,["76"] = 69,["77"] = 69,["78"] = 69,["79"] = 69,["80"] = 71,["81"] = 80,["82"] = 82,["83"] = 82,["84"] = 82,["85"] = 83,["86"] = 84,["88"] = 82,["89"] = 82,["90"] = 87,["91"] = 62,["92"] = 90,["93"] = 91,["94"] = 90,["95"] = 8,["96"] = 8,["97"] = 8,["98"] = 7,["101"] = 8});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local BaseOrbAbility = ____ability_utils.BaseOrbAbility
local ____modifier_huskar_burning_spear_custom_717 = require("abilities.heroes.huskar.717.burning_spear.modifier_huskar_burning_spear_custom_717")
local modifier_huskar_burning_spear_custom_717 = ____modifier_huskar_burning_spear_custom_717.modifier_huskar_burning_spear_custom_717
LinkLuaModifier("modifier_generic_orb_effect_lua", "abilities/generic/modifier_generic_orb_effect_lua.lua", LUA_MODIFIER_MOTION_NONE)
____exports.huskar_burning_spear_custom_717 = __TS__Class()
local huskar_burning_spear_custom_717 = ____exports.huskar_burning_spear_custom_717
huskar_burning_spear_custom_717.name = "huskar_burning_spear_custom_717"
__TS__ClassExtends(huskar_burning_spear_custom_717, BaseOrbAbility)
function huskar_burning_spear_custom_717.prototype.____constructor(self)
    BaseOrbAbility.prototype.____constructor(self, "huskar_burning_spear")
end
function huskar_burning_spear_custom_717.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_huskar.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_huskar.vsndevts")
end
function huskar_burning_spear_custom_717.prototype.GetAbilityTargetFlags(self)
    if self:GetCaster():HasTalent("special_bonus_unique_huskar_717_custom_3") then
        return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
    end
    return DOTA_UNIT_TARGET_FLAG_NONE
end
function huskar_burning_spear_custom_717.prototype.GetIntrinsicModifierName(self)
    return "modifier_generic_orb_effect_lua"
end
function huskar_burning_spear_custom_717.prototype.CastFilterResultTarget(self, target)
    local caster = self:GetCaster()
    if IsServer() then
        if caster:GetTeamNumber() ~= target:GetTeamNumber() then
            if target:IsMagicImmune() and not caster:HasTalent("special_bonus_unique_huskar_717_custom_3") then
                return UF_FAIL_MAGIC_IMMUNE_ENEMY
            end
        end
    end
    return UnitFilter(
        target,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
        caster:GetTeamNumber()
    )
end
function huskar_burning_spear_custom_717.prototype.OnOrbFire(self, event)
    local caster = self:GetCaster()
    local damageTable = {
        attacker = caster,
        damage = self:GetSpecialValueFor("health_cost"),
        damage_type = DAMAGE_TYPE_PURE,
        victim = caster,
        ability = self,
        damage_flags = bit.bor(
            bit.bor(DOTA_DAMAGE_FLAG_NON_LETHAL, DOTA_DAMAGE_FLAG_HPLOSS),
            DOTA_DAMAGE_FLAG_NO_DAMAGE_MULTIPLIERS
        )
    }
    ApplyDamage(damageTable)
end
function huskar_burning_spear_custom_717.prototype.OnOrbImpact(self, event)
    local caster = self:GetCaster()
    local target = event.target
    if target:IsBuilding() then
        return
    end
    if not target:IsAlive() then
        return
    end
    local duration = target:CalculateDuration(
        caster,
        self:GetSpecialValueFor("duration")
    )
    local modifier = modifier_huskar_burning_spear_custom_717:apply(target, caster, self, {duration = duration})
    modifier:IncrementStackCount()
    Timers:CreateTimer(
        duration,
        function()
            if modifier and not modifier:IsNull() then
                modifier:DecrementStackCount()
            end
        end
    )
    caster:EmitSound("Hero_Huskar.Burning_Spear.Cast")
end
function huskar_burning_spear_custom_717.prototype.GetProjectileName(self)
    return "particles/units/heroes/hero_huskar/huskar_burning_spear.vpcf"
end
huskar_burning_spear_custom_717 = __TS__Decorate(
    huskar_burning_spear_custom_717,
    huskar_burning_spear_custom_717,
    {registerAbility(nil)},
    {kind = "class", name = "huskar_burning_spear_custom_717"}
)
____exports.huskar_burning_spear_custom_717 = huskar_burning_spear_custom_717
return ____exports
