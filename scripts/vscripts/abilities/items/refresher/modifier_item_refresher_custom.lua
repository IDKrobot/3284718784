local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 25,["28"] = 26,["29"] = 25,["30"] = 29,["31"] = 30,["32"] = 29,["33"] = 33,["34"] = 34,["35"] = 33,["36"] = 4,["37"] = 4,["38"] = 4,["39"] = 3,["42"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_refresher_custom = __TS__Class()
local modifier_item_refresher_custom = ____exports.modifier_item_refresher_custom
modifier_item_refresher_custom.name = "modifier_item_refresher_custom"
__TS__ClassExtends(modifier_item_refresher_custom, BaseModifier)
function modifier_item_refresher_custom.prototype.IsHidden(self)
    return true
end
function modifier_item_refresher_custom.prototype.IsPurgable(self)
    return false
end
function modifier_item_refresher_custom.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_refresher_custom.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT, MODIFIER_PROPERTY_MANA_REGEN_CONSTANT, MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE}
end
function modifier_item_refresher_custom.prototype.GetModifierConstantHealthRegen(self)
    return self:GetSpecialValueFor("bonus_health_regen") or 0
end
function modifier_item_refresher_custom.prototype.GetModifierConstantManaRegen(self)
    return self:GetSpecialValueFor("bonus_mana_regen") or 0
end
function modifier_item_refresher_custom.prototype.GetModifierPreAttack_BonusDamage(self)
    return self:GetSpecialValueFor("bonus_damage") or 0
end
modifier_item_refresher_custom = __TS__Decorate(
    modifier_item_refresher_custom,
    modifier_item_refresher_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_refresher_custom"}
)
____exports.modifier_item_refresher_custom = modifier_item_refresher_custom
return ____exports
