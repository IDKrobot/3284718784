local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 24,["28"] = 25,["29"] = 24,["30"] = 30,["31"] = 31,["32"] = 30,["33"] = 34,["34"] = 35,["35"] = 34,["36"] = 38,["37"] = 39,["38"] = 38,["39"] = 42,["40"] = 43,["41"] = 42,["42"] = 4,["43"] = 4,["44"] = 4,["45"] = 3,["48"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_swift_blink_custom_buff = __TS__Class()
local modifier_item_swift_blink_custom_buff = ____exports.modifier_item_swift_blink_custom_buff
modifier_item_swift_blink_custom_buff.name = "modifier_item_swift_blink_custom_buff"
__TS__ClassExtends(modifier_item_swift_blink_custom_buff, BaseModifier)
function modifier_item_swift_blink_custom_buff.prototype.IsHidden(self)
    return false
end
function modifier_item_swift_blink_custom_buff.prototype.IsPurgable(self)
    return true
end
function modifier_item_swift_blink_custom_buff.prototype.IsDebuff(self)
    return false
end
function modifier_item_swift_blink_custom_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_STATS_AGILITY_BONUS}
end
function modifier_item_swift_blink_custom_buff.prototype.CheckState(self)
    return {[MODIFIER_STATE_NO_UNIT_COLLISION] = true}
end
function modifier_item_swift_blink_custom_buff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return self:GetSpecialValueFor("bonus_movement") or 0
end
function modifier_item_swift_blink_custom_buff.prototype.GetModifierBonusStats_Agility(self)
    return self:GetSpecialValueFor("bonus_agi_active") or 0
end
function modifier_item_swift_blink_custom_buff.prototype.GetEffectName(self)
    return "particles/items3_fx/blink_swift_buff.vpcf"
end
function modifier_item_swift_blink_custom_buff.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_swift_blink_custom_buff = __TS__Decorate(
    modifier_item_swift_blink_custom_buff,
    modifier_item_swift_blink_custom_buff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_swift_blink_custom_buff"}
)
____exports.modifier_item_swift_blink_custom_buff = modifier_item_swift_blink_custom_buff
return ____exports
