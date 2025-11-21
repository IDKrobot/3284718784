local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["20"] = 11,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 19,["25"] = 20,["26"] = 19,["27"] = 25,["28"] = 26,["29"] = 28,["32"] = 30,["33"] = 25,["34"] = 6,["35"] = 6,["36"] = 6,["37"] = 5,["40"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_spawn_spiderite_custom_728_debuff = __TS__Class()
local modifier_broodmother_spawn_spiderite_custom_728_debuff = ____exports.modifier_broodmother_spawn_spiderite_custom_728_debuff
modifier_broodmother_spawn_spiderite_custom_728_debuff.name = "modifier_broodmother_spawn_spiderite_custom_728_debuff"
__TS__ClassExtends(modifier_broodmother_spawn_spiderite_custom_728_debuff, BaseModifier)
function modifier_broodmother_spawn_spiderite_custom_728_debuff.prototype.IsHidden(self)
    return false
end
function modifier_broodmother_spawn_spiderite_custom_728_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_broodmother_spawn_spiderite_custom_728_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_broodmother_spawn_spiderite_custom_728_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_DEATH}
end
function modifier_broodmother_spawn_spiderite_custom_728_debuff.prototype.OnDeath(self, event)
    local parent = self:GetParent()
    if event.unit ~= parent then
        return
    end
    self:GetAbility():SpawnSpiderite(parent:GetAbsOrigin())
end
modifier_broodmother_spawn_spiderite_custom_728_debuff = __TS__Decorate(
    modifier_broodmother_spawn_spiderite_custom_728_debuff,
    modifier_broodmother_spawn_spiderite_custom_728_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_spawn_spiderite_custom_728_debuff"}
)
____exports.modifier_broodmother_spawn_spiderite_custom_728_debuff = modifier_broodmother_spawn_spiderite_custom_728_debuff
return ____exports
