local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 4,["22"] = 12,["23"] = 13,["24"] = 12,["25"] = 16,["26"] = 17,["27"] = 16,["28"] = 20,["29"] = 21,["30"] = 20,["31"] = 24,["32"] = 25,["33"] = 24,["34"] = 28,["35"] = 29,["36"] = 28,["37"] = 32,["38"] = 33,["39"] = 32,["40"] = 36,["41"] = 37,["42"] = 36,["43"] = 40,["44"] = 41,["45"] = 40,["46"] = 44,["47"] = 45,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 44,["52"] = 48,["53"] = 49,["54"] = 48,["55"] = 52,["56"] = 53,["57"] = 53,["58"] = 53,["59"] = 53,["60"] = 53,["61"] = 53,["62"] = 53,["63"] = 52,["64"] = 5,["65"] = 5,["66"] = 5,["67"] = 4,["70"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_techies_minefield_sign_custom_725_aura = require("abilities.heroes.techies.725.minefield_sign.modifier_techies_minefield_sign_custom_725_aura")
local modifier_techies_minefield_sign_custom_725_aura = ____modifier_techies_minefield_sign_custom_725_aura.modifier_techies_minefield_sign_custom_725_aura
____exports.modifier_techies_minefield_sign_custom_725 = __TS__Class()
local modifier_techies_minefield_sign_custom_725 = ____exports.modifier_techies_minefield_sign_custom_725
modifier_techies_minefield_sign_custom_725.name = "modifier_techies_minefield_sign_custom_725"
__TS__ClassExtends(modifier_techies_minefield_sign_custom_725, BaseModifier)
function modifier_techies_minefield_sign_custom_725.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.techies_mines = {"npc_dota_techies_725_land_mine_custom", "npc_dota_techies_725_stasis_trap_custom", "npc_dota_techies_725_remote_mine_custom"}
end
function modifier_techies_minefield_sign_custom_725.prototype.IsHidden(self)
    return false
end
function modifier_techies_minefield_sign_custom_725.prototype.IsPurgable(self)
    return false
end
function modifier_techies_minefield_sign_custom_725.prototype.IsAura(self)
    return self:GetCaster():HasScepter()
end
function modifier_techies_minefield_sign_custom_725.prototype.GetAuraRadius(self)
    return self:GetSpecialValueFor("aura_radius")
end
function modifier_techies_minefield_sign_custom_725.prototype.GetAuraDuration(self)
    return 0.1
end
function modifier_techies_minefield_sign_custom_725.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end
function modifier_techies_minefield_sign_custom_725.prototype.GetAuraSearchType(self)
    return DOTA_UNIT_TARGET_OTHER
end
function modifier_techies_minefield_sign_custom_725.prototype.GetAuraSearchFlags(self)
    return DOTA_UNIT_TARGET_FLAG_NONE
end
function modifier_techies_minefield_sign_custom_725.prototype.GetAuraEntityReject(self, entity)
    return not __TS__ArrayIncludes(
        self.techies_mines,
        entity:GetUnitName()
    )
end
function modifier_techies_minefield_sign_custom_725.prototype.GetModifierAura(self)
    return modifier_techies_minefield_sign_custom_725_aura.name
end
function modifier_techies_minefield_sign_custom_725.prototype.CheckState(self)
    return {
        [MODIFIER_STATE_NO_UNIT_COLLISION] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_UNSELECTABLE] = true,
        [MODIFIER_STATE_STUNNED] = true
    }
end
modifier_techies_minefield_sign_custom_725 = __TS__Decorate(
    modifier_techies_minefield_sign_custom_725,
    modifier_techies_minefield_sign_custom_725,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_minefield_sign_custom_725"}
)
____exports.modifier_techies_minefield_sign_custom_725 = modifier_techies_minefield_sign_custom_725
return ____exports
