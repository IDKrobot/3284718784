local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 33,["19"] = 3,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 27,["36"] = 28,["37"] = 27,["38"] = 4,["39"] = 4,["40"] = 4,["41"] = 3,["44"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_revenants_brooch_custom_734_reduction = __TS__Class()
local modifier_item_revenants_brooch_custom_734_reduction = ____exports.modifier_item_revenants_brooch_custom_734_reduction
modifier_item_revenants_brooch_custom_734_reduction.name = "modifier_item_revenants_brooch_custom_734_reduction"
__TS__ClassExtends(modifier_item_revenants_brooch_custom_734_reduction, BaseModifier)
function modifier_item_revenants_brooch_custom_734_reduction.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.mres = 0
    self.GetModifierMagicalResistanceBonus = function() return self.mres end
end
function modifier_item_revenants_brooch_custom_734_reduction.prototype.IsHidden(self)
    return false
end
function modifier_item_revenants_brooch_custom_734_reduction.prototype.IsPurgable(self)
    return true
end
function modifier_item_revenants_brooch_custom_734_reduction.prototype.IsDebuff(self)
    return true
end
function modifier_item_revenants_brooch_custom_734_reduction.prototype.OnCreated(self, params)
    self.mres = -self:GetSpecialValueFor("mres_reduction")
end
function modifier_item_revenants_brooch_custom_734_reduction.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_item_revenants_brooch_custom_734_reduction.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS}
end
modifier_item_revenants_brooch_custom_734_reduction = __TS__Decorate(
    modifier_item_revenants_brooch_custom_734_reduction,
    modifier_item_revenants_brooch_custom_734_reduction,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_revenants_brooch_custom_734_reduction"}
)
____exports.modifier_item_revenants_brooch_custom_734_reduction = modifier_item_revenants_brooch_custom_734_reduction
return ____exports
