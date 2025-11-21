local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 31,["19"] = 3,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 25,["33"] = 26,["34"] = 25,["35"] = 33,["36"] = 34,["37"] = 33,["38"] = 37,["39"] = 38,["40"] = 37,["41"] = 41,["42"] = 42,["43"] = 41,["44"] = 45,["45"] = 46,["46"] = 45,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 3,["53"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_black_king_bar_custom_728_active = __TS__Class()
local modifier_item_black_king_bar_custom_728_active = ____exports.modifier_item_black_king_bar_custom_728_active
modifier_item_black_king_bar_custom_728_active.name = "modifier_item_black_king_bar_custom_728_active"
__TS__ClassExtends(modifier_item_black_king_bar_custom_728_active, BaseModifier)
function modifier_item_black_king_bar_custom_728_active.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.model_scale = 0
    self.GetModifierModelScale = function() return self.model_scale end
end
function modifier_item_black_king_bar_custom_728_active.prototype.IsHidden(self)
    return false
end
function modifier_item_black_king_bar_custom_728_active.prototype.IsPurgable(self)
    return false
end
function modifier_item_black_king_bar_custom_728_active.prototype.OnCreated(self, params)
    self.model_scale = self:GetSpecialValueFor("model_scale")
end
function modifier_item_black_king_bar_custom_728_active.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MODEL_SCALE}
end
function modifier_item_black_king_bar_custom_728_active.prototype.CheckState(self)
    return {[MODIFIER_STATE_MAGIC_IMMUNE] = true}
end
function modifier_item_black_king_bar_custom_728_active.prototype.GetEffectName(self)
    return "particles/items_fx/black_king_bar_avatar.vpcf"
end
function modifier_item_black_king_bar_custom_728_active.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
function modifier_item_black_king_bar_custom_728_active.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_avatar.vpcf"
end
function modifier_item_black_king_bar_custom_728_active.prototype.StatusEffectPriority(self)
    return 99998
end
modifier_item_black_king_bar_custom_728_active = __TS__Decorate(
    modifier_item_black_king_bar_custom_728_active,
    modifier_item_black_king_bar_custom_728_active,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_black_king_bar_custom_728_active"}
)
____exports.modifier_item_black_king_bar_custom_728_active = modifier_item_black_king_bar_custom_728_active
return ____exports
