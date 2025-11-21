local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 36,["20"] = 3,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 12,["27"] = 16,["28"] = 17,["29"] = 16,["30"] = 20,["31"] = 21,["32"] = 23,["33"] = 20,["34"] = 26,["35"] = 27,["36"] = 26,["37"] = 30,["38"] = 31,["39"] = 30,["40"] = 38,["41"] = 39,["42"] = 38,["43"] = 44,["44"] = 45,["45"] = 44,["46"] = 4,["47"] = 4,["48"] = 4,["49"] = 3,["52"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_dazzle_bad_juju_custom_734_armor = __TS__Class()
local modifier_dazzle_bad_juju_custom_734_armor = ____exports.modifier_dazzle_bad_juju_custom_734_armor
modifier_dazzle_bad_juju_custom_734_armor.name = "modifier_dazzle_bad_juju_custom_734_armor"
__TS__ClassExtends(modifier_dazzle_bad_juju_custom_734_armor, BaseModifier)
function modifier_dazzle_bad_juju_custom_734_armor.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.isAlly = false
    self.armor = 0
    self.GetModifierPhysicalArmorBonus = function() return self.armor * self:GetStackCount() end
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.IsHidden(self)
    return false
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.IsPurgable(self)
    return false
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.IsDebuff(self)
    return not self.isAlly
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.OnCreated(self, params)
    self.isAlly = self:GetParent():GetTeamNumber() == self:GetCaster():GetTeamNumber()
    self.armor = self:GetSpecialValueFor("armor_reduction") * (self.isAlly and 1 or -1)
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS}
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.GetEffectName(self)
    return self.isAlly and "particles/units/heroes/hero_dazzle/dazzle_armor_friend.vpcf" or "particles/units/heroes/hero_dazzle/dazzle_armor_enemy.vpcf"
end
function modifier_dazzle_bad_juju_custom_734_armor.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_dazzle_bad_juju_custom_734_armor = __TS__Decorate(
    modifier_dazzle_bad_juju_custom_734_armor,
    modifier_dazzle_bad_juju_custom_734_armor,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_dazzle_bad_juju_custom_734_armor"}
)
____exports.modifier_dazzle_bad_juju_custom_734_armor = modifier_dazzle_bad_juju_custom_734_armor
return ____exports
