local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 18,["30"] = 20,["31"] = 22,["32"] = 23,["33"] = 15,["34"] = 26,["35"] = 27,["36"] = 26,["37"] = 30,["38"] = 31,["39"] = 30,["40"] = 34,["41"] = 35,["42"] = 34,["43"] = 38,["44"] = 39,["45"] = 38,["46"] = 42,["47"] = 43,["48"] = 42,["49"] = 4,["50"] = 4,["51"] = 4,["52"] = 3,["55"] = 4,["56"] = 47,["57"] = 48,["58"] = 47,["59"] = 48,["60"] = 49,["61"] = 50,["62"] = 49,["63"] = 53,["64"] = 54,["65"] = 53,["66"] = 57,["67"] = 58,["68"] = 57,["69"] = 63,["70"] = 64,["71"] = 63,["72"] = 48,["73"] = 48,["74"] = 48,["75"] = 47,["78"] = 48});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_outpost_aura_custom = __TS__Class()
local modifier_outpost_aura_custom = ____exports.modifier_outpost_aura_custom
modifier_outpost_aura_custom.name = "modifier_outpost_aura_custom"
__TS__ClassExtends(modifier_outpost_aura_custom, BaseModifier)
function modifier_outpost_aura_custom.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
end
function modifier_outpost_aura_custom.prototype.IsHidden(self)
    return true
end
function modifier_outpost_aura_custom.prototype.IsAura(self)
    return true
end
function modifier_outpost_aura_custom.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    self.radius = params.radius
    parent:SetNightTimeVisionRange(self.radius)
    parent:SetDayTimeVisionRange(self.radius)
end
function modifier_outpost_aura_custom.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_outpost_aura_custom.prototype.GetModifierAura(self)
    return ____exports.modifier_outpost_aura_custom_true_sight.name
end
function modifier_outpost_aura_custom.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_outpost_aura_custom.prototype.GetAuraSearchType(self)
    return DOTA_UNIT_TARGET_ALL
end
function modifier_outpost_aura_custom.prototype.GetAuraSearchFlags(self)
    return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
end
modifier_outpost_aura_custom = __TS__Decorate(
    modifier_outpost_aura_custom,
    modifier_outpost_aura_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_outpost_aura_custom"}
)
____exports.modifier_outpost_aura_custom = modifier_outpost_aura_custom
____exports.modifier_outpost_aura_custom_true_sight = __TS__Class()
local modifier_outpost_aura_custom_true_sight = ____exports.modifier_outpost_aura_custom_true_sight
modifier_outpost_aura_custom_true_sight.name = "modifier_outpost_aura_custom_true_sight"
__TS__ClassExtends(modifier_outpost_aura_custom_true_sight, BaseModifier)
function modifier_outpost_aura_custom_true_sight.prototype.IsHidden(self)
    return true
end
function modifier_outpost_aura_custom_true_sight.prototype.IsPurgable(self)
    return false
end
function modifier_outpost_aura_custom_true_sight.prototype.CheckState(self)
    return {[MODIFIER_STATE_INVISIBLE] = false}
end
function modifier_outpost_aura_custom_true_sight.prototype.GetPriority(self)
    return 99999
end
modifier_outpost_aura_custom_true_sight = __TS__Decorate(
    modifier_outpost_aura_custom_true_sight,
    modifier_outpost_aura_custom_true_sight,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_outpost_aura_custom_true_sight"}
)
____exports.modifier_outpost_aura_custom_true_sight = modifier_outpost_aura_custom_true_sight
return ____exports
