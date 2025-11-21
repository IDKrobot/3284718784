local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 16,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 18,["37"] = 18,["38"] = 13,["39"] = 4,["40"] = 4,["41"] = 4,["42"] = 3,["45"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_gyroshell_custom_717_stop = __TS__Class()
local modifier_pangolier_gyroshell_custom_717_stop = ____exports.modifier_pangolier_gyroshell_custom_717_stop
modifier_pangolier_gyroshell_custom_717_stop.name = "modifier_pangolier_gyroshell_custom_717_stop"
__TS__ClassExtends(modifier_pangolier_gyroshell_custom_717_stop, BaseModifier)
function modifier_pangolier_gyroshell_custom_717_stop.prototype.IsHidden(self)
    return false
end
function modifier_pangolier_gyroshell_custom_717_stop.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_gyroshell_custom_717_stop.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:AddNewModifier(
        parent,
        self:GetAbility(),
        "modifier_generic_arc",
        {
            duration = 0.2,
            distance = 0,
            height = 50,
            fix_duration = false,
            isStun = false
        }
    )
end
modifier_pangolier_gyroshell_custom_717_stop = __TS__Decorate(
    modifier_pangolier_gyroshell_custom_717_stop,
    modifier_pangolier_gyroshell_custom_717_stop,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_gyroshell_custom_717_stop"}
)
____exports.modifier_pangolier_gyroshell_custom_717_stop = modifier_pangolier_gyroshell_custom_717_stop
return ____exports
