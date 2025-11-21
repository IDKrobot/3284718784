local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["20"] = 11,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 19,["25"] = 20,["28"] = 22,["29"] = 23,["30"] = 19,["31"] = 26,["32"] = 27,["33"] = 28,["35"] = 26,["36"] = 31,["37"] = 32,["38"] = 31,["39"] = 38,["40"] = 39,["41"] = 38,["42"] = 44,["43"] = 45,["44"] = 44,["45"] = 4,["46"] = 4,["47"] = 4,["48"] = 3,["51"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_rune_icon = __TS__Class()
local modifier_rune_icon = ____exports.modifier_rune_icon
modifier_rune_icon.name = "modifier_rune_icon"
__TS__ClassExtends(modifier_rune_icon, BaseModifier)
function modifier_rune_icon.prototype.IsHidden(self)
    return true
end
function modifier_rune_icon.prototype.IsPurgable(self)
    return false
end
function modifier_rune_icon.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_rune_icon.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self.rune = EntIndexToHScript(params.rune_index)
    self:StartIntervalThink(0.1)
end
function modifier_rune_icon.prototype.OnIntervalThink(self)
    if not self.rune or self.rune:IsNull() then
        UTIL_Remove(self:GetParent())
    end
end
function modifier_rune_icon.prototype.CheckState(self)
    return {[MODIFIER_STATE_INVULNERABLE] = true, [MODIFIER_STATE_NO_HEALTH_BAR] = true}
end
function modifier_rune_icon.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PROVIDES_FOW_POSITION}
end
function modifier_rune_icon.prototype.GetModifierProvidesFOWVision(self)
    return 1
end
modifier_rune_icon = __TS__Decorate(
    modifier_rune_icon,
    modifier_rune_icon,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_rune_icon"}
)
____exports.modifier_rune_icon = modifier_rune_icon
return ____exports
