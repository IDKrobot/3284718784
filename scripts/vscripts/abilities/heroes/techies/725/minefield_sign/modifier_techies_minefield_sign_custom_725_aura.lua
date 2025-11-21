local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 22,["25"] = 23,["26"] = 22,["27"] = 26,["28"] = 27,["29"] = 26,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 3,["36"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_minefield_sign_custom_725_aura = __TS__Class()
local modifier_techies_minefield_sign_custom_725_aura = ____exports.modifier_techies_minefield_sign_custom_725_aura
modifier_techies_minefield_sign_custom_725_aura.name = "modifier_techies_minefield_sign_custom_725_aura"
__TS__ClassExtends(modifier_techies_minefield_sign_custom_725_aura, BaseModifier)
function modifier_techies_minefield_sign_custom_725_aura.prototype.IsHidden(self)
    return false
end
function modifier_techies_minefield_sign_custom_725_aura.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_INVISIBILITY_LEVEL}
end
function modifier_techies_minefield_sign_custom_725_aura.prototype.CheckState(self)
    return {[MODIFIER_STATE_INVISIBLE] = true, [MODIFIER_STATE_TRUESIGHT_IMMUNE] = true}
end
function modifier_techies_minefield_sign_custom_725_aura.prototype.GetModifierInvisibilityLevel(self)
    return 1
end
function modifier_techies_minefield_sign_custom_725_aura.prototype.GetPriority(self)
    return 9999
end
modifier_techies_minefield_sign_custom_725_aura = __TS__Decorate(
    modifier_techies_minefield_sign_custom_725_aura,
    modifier_techies_minefield_sign_custom_725_aura,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_minefield_sign_custom_725_aura"}
)
____exports.modifier_techies_minefield_sign_custom_725_aura = modifier_techies_minefield_sign_custom_725_aura
return ____exports
