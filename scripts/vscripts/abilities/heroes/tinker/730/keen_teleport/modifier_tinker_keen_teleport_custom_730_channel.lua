local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 7,["17"] = 6,["18"] = 10,["19"] = 11,["20"] = 10,["21"] = 16,["22"] = 17,["23"] = 17,["25"] = 19,["26"] = 20,["27"] = 21,["28"] = 21,["30"] = 23,["31"] = 24,["32"] = 26,["33"] = 27,["34"] = 26,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 44,["47"] = 47,["49"] = 50,["50"] = 50,["51"] = 50,["52"] = 50,["53"] = 50,["54"] = 50,["55"] = 50,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 50,["60"] = 61,["61"] = 61,["63"] = 63,["64"] = 16,["65"] = 66,["66"] = 67,["69"] = 68,["70"] = 69,["73"] = 71,["74"] = 71,["75"] = 71,["76"] = 71,["77"] = 75,["78"] = 66,["79"] = 5,["80"] = 5,["81"] = 5,["82"] = 4,["85"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_tinker_keen_teleport_custom_730_channel = __TS__Class()
local modifier_tinker_keen_teleport_custom_730_channel = ____exports.modifier_tinker_keen_teleport_custom_730_channel
modifier_tinker_keen_teleport_custom_730_channel.name = "modifier_tinker_keen_teleport_custom_730_channel"
__TS__ClassExtends(modifier_tinker_keen_teleport_custom_730_channel, BaseModifier)
function modifier_tinker_keen_teleport_custom_730_channel.prototype.IsHidden(self)
    return true
end
function modifier_tinker_keen_teleport_custom_730_channel.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ABILITY_EXECUTED}
end
function modifier_tinker_keen_teleport_custom_730_channel.prototype.IsTargetingOnOutpost(self, target, point)
    if target and target:GetClassname() == "npc_dota_watch_tower" then
        return true
    end
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    if caster == nil or ability == nil then
        return false
    end
    local minRadius = ability:GetSpecialValueFor("minimun_distance")
    local maxRadius = ability:GetSpecialValueFor("maximum_distance")
    local function getRadius(____, unit)
        return unit:GetClassname() == "npc_dota_watch_tower" and minRadius + 80 or maxRadius
    end
    local buildings = FindUnitsInRadius(
        caster:GetTeamNumber(),
        point,
        nil,
        maxRadius,
        DOTA_UNIT_TARGET_TEAM_FRIENDLY,
        DOTA_UNIT_TARGET_BUILDING,
        DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
        FIND_CLOSEST,
        false
    )
    if #buildings > 0 and buildings[1]:GetAbsOrigin():__sub(point):Length2D() < getRadius(nil, buildings[1]) then
        return buildings[1]:GetClassname() == "npc_dota_watch_tower"
    end
    local units = FindUnitsInRadius(
        caster:GetTeamNumber(),
        point,
        nil,
        FIND_UNITS_EVERYWHERE,
        DOTA_UNIT_TARGET_TEAM_FRIENDLY,
        ability:GetTargetType(),
        DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
        FIND_CLOSEST,
        false
    )
    if #units == 0 or not units[1]:IsBuildingType() then
        return false
    end
    return units[1]:GetClassname() == "npc_dota_watch_tower"
end
function modifier_tinker_keen_teleport_custom_730_channel.prototype.OnAbilityExecuted(self, event)
    if not IsServer() then
        return
    end
    local ability = self:GetAbility()
    if event.ability ~= ability or ability == nil then
        return
    end
    local duration = self:IsTargetingOnOutpost(
        event.target,
        ability:GetCursorPosition()
    ) and ability:GetSpecialValueFor("outpost_channel_time") or ability:GetSpecialValueFor("AbilityChannelTime")
    self:SetStackCount(duration * 100)
end
modifier_tinker_keen_teleport_custom_730_channel = __TS__Decorate(
    modifier_tinker_keen_teleport_custom_730_channel,
    modifier_tinker_keen_teleport_custom_730_channel,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_keen_teleport_custom_730_channel"}
)
____exports.modifier_tinker_keen_teleport_custom_730_channel = modifier_tinker_keen_teleport_custom_730_channel
return ____exports
