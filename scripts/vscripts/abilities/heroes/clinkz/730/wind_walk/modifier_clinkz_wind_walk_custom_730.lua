local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 8,["22"] = 10,["23"] = 76,["24"] = 4,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 19,["31"] = 23,["32"] = 24,["33"] = 26,["34"] = 23,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 33,["39"] = 34,["40"] = 36,["43"] = 38,["46"] = 40,["47"] = 42,["48"] = 43,["49"] = 45,["50"] = 46,["51"] = 48,["52"] = 48,["53"] = 48,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 49,["58"] = 49,["59"] = 49,["60"] = 49,["61"] = 49,["62"] = 49,["63"] = 33,["64"] = 52,["65"] = 53,["66"] = 52,["67"] = 63,["68"] = 64,["69"] = 64,["71"] = 66,["72"] = 63,["73"] = 72,["74"] = 73,["75"] = 73,["76"] = 73,["77"] = 73,["78"] = 72,["79"] = 78,["80"] = 79,["83"] = 81,["86"] = 82,["89"] = 83,["90"] = 83,["91"] = 83,["92"] = 83,["95"] = 85,["96"] = 78,["97"] = 88,["98"] = 89,["101"] = 91,["102"] = 92,["103"] = 92,["106"] = 88,["107"] = 5,["108"] = 5,["109"] = 5,["110"] = 4,["113"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____burning_army = require("abilities.heroes.clinkz.730.burning_army.burning_army")
local createSkeletonArcher = ____burning_army.createSkeletonArcher
____exports.modifier_clinkz_wind_walk_custom_730 = __TS__Class()
local modifier_clinkz_wind_walk_custom_730 = ____exports.modifier_clinkz_wind_walk_custom_730
modifier_clinkz_wind_walk_custom_730.name = "modifier_clinkz_wind_walk_custom_730"
__TS__ClassExtends(modifier_clinkz_wind_walk_custom_730, BaseModifier)
function modifier_clinkz_wind_walk_custom_730.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.movement_speed = 0
    self.fade_delay = 0
    self.abilitiesException = {"clinkz_death_pact_custom_730", "clinkz_burning_army_custom_730"}
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.movement_speed end
end
function modifier_clinkz_wind_walk_custom_730.prototype.IsHidden(self)
    return false
end
function modifier_clinkz_wind_walk_custom_730.prototype.IsPurgable(self)
    return false
end
function modifier_clinkz_wind_walk_custom_730.prototype.OnCreated(self, params)
    self.fade_delay = self:GetSpecialValueFor("fade_time")
    self.movement_speed = self:GetSpecialValueFor("bonus_movespeed")
end
function modifier_clinkz_wind_walk_custom_730.prototype.OnRefresh(self, params)
    self.movement_speed = self:GetSpecialValueFor("bonus_movespeed")
end
function modifier_clinkz_wind_walk_custom_730.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    if not parent:HasShard() then
        return
    end
    local position = parent:GetAbsOrigin()
    local vectorLeft = parent:GetForwardVector():Normalized():Cross(Vector(0, 0, 1))
    local vectorRight = vectorLeft:__unm()
    local leftSpawnPosition = position:__add(vectorLeft:__mul(225))
    local rightSpawnPosition = position:__add(vectorRight:__mul(225))
    createSkeletonArcher(
        nil,
        parent,
        self:GetAbility(),
        leftSpawnPosition
    )
    createSkeletonArcher(
        nil,
        parent,
        self:GetAbility(),
        rightSpawnPosition
    )
end
function modifier_clinkz_wind_walk_custom_730.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_INVISIBILITY_LEVEL, MODIFIER_EVENT_ON_ABILITY_EXECUTED, MODIFIER_EVENT_ON_ATTACK}
end
function modifier_clinkz_wind_walk_custom_730.prototype.CheckState(self)
    if self:GetElapsedTime() < self.fade_delay then
        return {}
    end
    return {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_INVISIBLE] = true}
end
function modifier_clinkz_wind_walk_custom_730.prototype.GetModifierInvisibilityLevel(self)
    return math.min(
        1,
        self:GetElapsedTime() / self.fade_delay
    )
end
function modifier_clinkz_wind_walk_custom_730.prototype.OnAbilityExecuted(self, event)
    if self:GetElapsedTime() < self.fade_delay then
        return
    end
    if not IsServer() then
        return
    end
    if event.unit ~= self:GetParent() then
        return
    end
    if __TS__ArrayIncludes(
        self.abilitiesException,
        event.ability:GetAbilityName()
    ) then
        return
    end
    self:Destroy()
end
function modifier_clinkz_wind_walk_custom_730.prototype.OnAttack(self, event)
    if self:GetElapsedTime() < self.fade_delay then
        return
    end
    if IsServer() then
        if event.attacker == self:GetParent() then
            self:Destroy()
        end
    end
end
modifier_clinkz_wind_walk_custom_730 = __TS__Decorate(
    modifier_clinkz_wind_walk_custom_730,
    modifier_clinkz_wind_walk_custom_730,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_clinkz_wind_walk_custom_730"}
)
____exports.modifier_clinkz_wind_walk_custom_730 = modifier_clinkz_wind_walk_custom_730
return ____exports
