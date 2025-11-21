local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 23,["28"] = 24,["29"] = 23,["30"] = 27,["31"] = 28,["32"] = 27,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 3,["39"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_gungir_custom_735_root = __TS__Class()
local modifier_item_gungir_custom_735_root = ____exports.modifier_item_gungir_custom_735_root
modifier_item_gungir_custom_735_root.name = "modifier_item_gungir_custom_735_root"
__TS__ClassExtends(modifier_item_gungir_custom_735_root, BaseModifier)
function modifier_item_gungir_custom_735_root.prototype.IsHidden(self)
    return false
end
function modifier_item_gungir_custom_735_root.prototype.IsPurgable(self)
    return true
end
function modifier_item_gungir_custom_735_root.prototype.IsDebuff(self)
    return true
end
function modifier_item_gungir_custom_735_root.prototype.CheckState(self)
    return {[MODIFIER_STATE_ROOTED] = true}
end
function modifier_item_gungir_custom_735_root.prototype.GetEffectName(self)
    return "particles/items3_fx/gleipnir_root.vpcf"
end
function modifier_item_gungir_custom_735_root.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN
end
modifier_item_gungir_custom_735_root = __TS__Decorate(
    modifier_item_gungir_custom_735_root,
    modifier_item_gungir_custom_735_root,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_gungir_custom_735_root"}
)
____exports.modifier_item_gungir_custom_735_root = modifier_item_gungir_custom_735_root
return ____exports
