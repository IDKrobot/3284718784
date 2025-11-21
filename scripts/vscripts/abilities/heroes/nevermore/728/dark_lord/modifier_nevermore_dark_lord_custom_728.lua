local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 14,["24"] = 15,["25"] = 14,["26"] = 18,["27"] = 19,["28"] = 18,["29"] = 22,["30"] = 23,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 24,["36"] = 26,["37"] = 22,["38"] = 29,["39"] = 30,["40"] = 29,["41"] = 33,["42"] = 34,["43"] = 33,["44"] = 37,["45"] = 38,["46"] = 37,["47"] = 5,["48"] = 5,["49"] = 5,["50"] = 4,["53"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_nevermore_dark_lord_custom_728_aura = require("abilities.heroes.nevermore.728.dark_lord.modifier_nevermore_dark_lord_custom_728_aura")
local modifier_nevermore_dark_lord_custom_728 = ____modifier_nevermore_dark_lord_custom_728_aura.modifier_nevermore_dark_lord_custom_728
____exports.modifier_nevermore_dark_lord_custom_728_aura = __TS__Class()
local modifier_nevermore_dark_lord_custom_728_aura = ____exports.modifier_nevermore_dark_lord_custom_728_aura
modifier_nevermore_dark_lord_custom_728_aura.name = "modifier_nevermore_dark_lord_custom_728_aura"
__TS__ClassExtends(modifier_nevermore_dark_lord_custom_728_aura, BaseModifier)
function modifier_nevermore_dark_lord_custom_728_aura.prototype.IsHidden(self)
    return true
end
function modifier_nevermore_dark_lord_custom_728_aura.prototype.IsAura(self)
    return not self:GetParent():PassivesDisabled()
end
function modifier_nevermore_dark_lord_custom_728_aura.prototype.GetModifierAura(self)
    return modifier_nevermore_dark_lord_custom_728.name
end
function modifier_nevermore_dark_lord_custom_728_aura.prototype.GetAuraRadius(self)
    return self:GetSpecialValueFor("radius")
end
function modifier_nevermore_dark_lord_custom_728_aura.prototype.GetAuraSearchType(self)
    if self:GetParent():HasTalent("special_bonus_unique_nevermore_728_custom") then
        return bit.bor(
            bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
            DOTA_UNIT_TARGET_BUILDING
        )
    end
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC)
end
function modifier_nevermore_dark_lord_custom_728_aura.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_nevermore_dark_lord_custom_728_aura.prototype.GetAuraSearchFlags(self)
    return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
end
function modifier_nevermore_dark_lord_custom_728_aura.prototype.GetAuraEntityReject(self, entity)
    return not entity:CanEntityBeSeenByMyTeam(self:GetParent())
end
modifier_nevermore_dark_lord_custom_728_aura = __TS__Decorate(
    modifier_nevermore_dark_lord_custom_728_aura,
    modifier_nevermore_dark_lord_custom_728_aura,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_nevermore_dark_lord_custom_728_aura"}
)
____exports.modifier_nevermore_dark_lord_custom_728_aura = modifier_nevermore_dark_lord_custom_728_aura
return ____exports
