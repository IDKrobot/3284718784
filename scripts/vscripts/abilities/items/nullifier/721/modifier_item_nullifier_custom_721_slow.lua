local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 31,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 9,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 18,["32"] = 17,["33"] = 21,["34"] = 22,["35"] = 21,["36"] = 25,["37"] = 26,["38"] = 25,["39"] = 33,["40"] = 34,["41"] = 33,["42"] = 4,["43"] = 4,["44"] = 4,["45"] = 3,["48"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_nullifier_custom_721_slow = __TS__Class()
local modifier_item_nullifier_custom_721_slow = ____exports.modifier_item_nullifier_custom_721_slow
modifier_item_nullifier_custom_721_slow.name = "modifier_item_nullifier_custom_721_slow"
__TS__ClassExtends(modifier_item_nullifier_custom_721_slow, BaseModifier)
function modifier_item_nullifier_custom_721_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierMoveSpeedBonus_Percentage = function() return -100 end
end
function modifier_item_nullifier_custom_721_slow.prototype.IsHidden(self)
    return false
end
function modifier_item_nullifier_custom_721_slow.prototype.IsPurgable(self)
    return true
end
function modifier_item_nullifier_custom_721_slow.prototype.IsDebuff(self)
    return true
end
function modifier_item_nullifier_custom_721_slow.prototype.OnCreated(self, params)
    if IsServer() then
        self:GetParent():EmitSound("DOTA_Item.Nullifier.Slow")
    end
end
function modifier_item_nullifier_custom_721_slow.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_item_nullifier_custom_721_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_item_nullifier_custom_721_slow.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_nullifier_slow.vpcf"
end
modifier_item_nullifier_custom_721_slow = __TS__Decorate(
    modifier_item_nullifier_custom_721_slow,
    modifier_item_nullifier_custom_721_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_nullifier_custom_721_slow"}
)
____exports.modifier_item_nullifier_custom_721_slow = modifier_item_nullifier_custom_721_slow
return ____exports
