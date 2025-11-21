local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 17,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 3,["39"] = 4,["40"] = 28,["41"] = 29,["42"] = 30,["43"] = 36,["44"] = 28,["45"] = 44,["46"] = 44,["47"] = 44,["49"] = 44,["50"] = 44,["52"] = 45,["53"] = 45,["54"] = 45,["55"] = 45,["56"] = 45,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 46,["61"] = 48,["62"] = 44});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_dummy = __TS__Class()
local modifier_dummy = ____exports.modifier_dummy
modifier_dummy.name = "modifier_dummy"
__TS__ClassExtends(modifier_dummy, BaseModifier)
function modifier_dummy.prototype.IsHidden(self)
    return true
end
function modifier_dummy.prototype.IsPurgable(self)
    return false
end
function modifier_dummy.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_dummy.prototype.CheckState(self)
    return {
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_UNSELECTABLE] = true,
        [MODIFIER_STATE_NOT_ON_MINIMAP] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
        [MODIFIER_STATE_OUT_OF_GAME] = true
    }
end
modifier_dummy = __TS__Decorate(
    modifier_dummy,
    modifier_dummy,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_dummy"}
)
____exports.modifier_dummy = modifier_dummy
function ____exports.MakeDummy(self, unit)
    unit:AddNoDraw()
    ____exports.modifier_dummy:apply(unit, nil, nil, {})
    unit:AddNewModifier(nil, nil, "modifier_phased", {})
end
function ____exports.CreateDummy(self, origin, team)
    if origin == nil then
        origin = Vector(0, 0, 0)
    end
    if team == nil then
        team = DOTA_TEAM_NEUTRALS
    end
    local dummy = CreateUnitByName(
        "npc_dummy_unit",
        origin,
        false,
        nil,
        nil,
        team
    )
    ____exports.MakeDummy(nil, dummy)
    return dummy
end
return ____exports
