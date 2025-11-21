local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 15,["25"] = 13,["26"] = 18,["27"] = 19,["28"] = 18,["29"] = 24,["30"] = 25,["31"] = 24,["32"] = 4,["33"] = 4,["34"] = 4,["35"] = 3,["38"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_tinker_keen_teleport_custom_730_teleporting = __TS__Class()
local modifier_tinker_keen_teleport_custom_730_teleporting = ____exports.modifier_tinker_keen_teleport_custom_730_teleporting
modifier_tinker_keen_teleport_custom_730_teleporting.name = "modifier_tinker_keen_teleport_custom_730_teleporting"
__TS__ClassExtends(modifier_tinker_keen_teleport_custom_730_teleporting, BaseModifier)
function modifier_tinker_keen_teleport_custom_730_teleporting.prototype.IsHidden(self)
    return false
end
function modifier_tinker_keen_teleport_custom_730_teleporting.prototype.IsPurgable(self)
    return false
end
function modifier_tinker_keen_teleport_custom_730_teleporting.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():RemoveGesture(ACT_DOTA_TELEPORT)
    end
end
function modifier_tinker_keen_teleport_custom_730_teleporting.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ANIMATION}
end
function modifier_tinker_keen_teleport_custom_730_teleporting.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_TELEPORT
end
modifier_tinker_keen_teleport_custom_730_teleporting = __TS__Decorate(
    modifier_tinker_keen_teleport_custom_730_teleporting,
    modifier_tinker_keen_teleport_custom_730_teleporting,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_keen_teleport_custom_730_teleporting"}
)
____exports.modifier_tinker_keen_teleport_custom_730_teleporting = modifier_tinker_keen_teleport_custom_730_teleporting
return ____exports
