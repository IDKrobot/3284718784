local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 19,["31"] = 23,["32"] = 24,["33"] = 23,["34"] = 29,["35"] = 30,["36"] = 30,["38"] = 32,["39"] = 29,["40"] = 4,["41"] = 4,["42"] = 4,["43"] = 3,["46"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_clinkz_burning_barrage_custom_730_damage = __TS__Class()
local modifier_clinkz_burning_barrage_custom_730_damage = ____exports.modifier_clinkz_burning_barrage_custom_730_damage
modifier_clinkz_burning_barrage_custom_730_damage.name = "modifier_clinkz_burning_barrage_custom_730_damage"
__TS__ClassExtends(modifier_clinkz_burning_barrage_custom_730_damage, BaseModifier)
function modifier_clinkz_burning_barrage_custom_730_damage.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.damage = 0
end
function modifier_clinkz_burning_barrage_custom_730_damage.prototype.IsHidden(self)
    return true
end
function modifier_clinkz_burning_barrage_custom_730_damage.prototype.IsPurgable(self)
    return false
end
function modifier_clinkz_burning_barrage_custom_730_damage.prototype.RemoveOnDeath(self)
    return false
end
function modifier_clinkz_burning_barrage_custom_730_damage.prototype.OnCreated(self, params)
    self.damage = -(100 - self:GetSpecialValueFor("damage_pct"))
end
function modifier_clinkz_burning_barrage_custom_730_damage.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE}
end
function modifier_clinkz_burning_barrage_custom_730_damage.prototype.GetModifierDamageOutgoing_Percentage(self, event)
    if not IsServer() then
        return 0
    end
    return self.damage
end
modifier_clinkz_burning_barrage_custom_730_damage = __TS__Decorate(
    modifier_clinkz_burning_barrage_custom_730_damage,
    modifier_clinkz_burning_barrage_custom_730_damage,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_clinkz_burning_barrage_custom_730_damage"}
)
____exports.modifier_clinkz_burning_barrage_custom_730_damage = modifier_clinkz_burning_barrage_custom_730_damage
return ____exports
