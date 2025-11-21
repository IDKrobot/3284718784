local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 4,["21"] = 10,["22"] = 11,["23"] = 10,["24"] = 14,["25"] = 15,["26"] = 14,["27"] = 18,["28"] = 19,["29"] = 18,["30"] = 22,["31"] = 23,["32"] = 24,["33"] = 26,["34"] = 28,["35"] = 30,["38"] = 32,["39"] = 34,["40"] = 35,["42"] = 22,["43"] = 39,["44"] = 40,["45"] = 42,["48"] = 44,["49"] = 46,["50"] = 39,["51"] = 49,["52"] = 50,["53"] = 49,["54"] = 58,["55"] = 59,["56"] = 58,["57"] = 62,["58"] = 63,["59"] = 62,["60"] = 66,["61"] = 67,["62"] = 66,["63"] = 70,["64"] = 72,["65"] = 75,["67"] = 77,["68"] = 70,["69"] = 80,["70"] = 81,["71"] = 80,["72"] = 84,["73"] = 85,["74"] = 84,["75"] = 88,["76"] = 89,["77"] = 88,["78"] = 5,["79"] = 5,["80"] = 5,["81"] = 4,["84"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_broodmother_spin_web_custom_728 = require("abilities.heroes.broodmother.728.spin_web.modifier_broodmother_spin_web_custom_728")
local modifier_broodmother_spin_web_custom_728 = ____modifier_broodmother_spin_web_custom_728.modifier_broodmother_spin_web_custom_728
____exports.modifier_broodmother_spin_web_custom_728_aura = __TS__Class()
local modifier_broodmother_spin_web_custom_728_aura = ____exports.modifier_broodmother_spin_web_custom_728_aura
modifier_broodmother_spin_web_custom_728_aura.name = "modifier_broodmother_spin_web_custom_728_aura"
__TS__ClassExtends(modifier_broodmother_spin_web_custom_728_aura, BaseModifier)
function modifier_broodmother_spin_web_custom_728_aura.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.IsHidden(self)
    return true
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.IsPurgable(self)
    return false
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.IsAura(self)
    return true
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    parent.owner = caster
    self.radius = self:GetSpecialValueFor("radius")
    if not IsServer() then
        return
    end
    parent:EmitSound("Hero_Broodmother.WebLoop")
    if caster:HasWearable("models/items/broodmother/bm_2022_immortal_legs/bm_2022_immortal_legs.vmdl") then
        self:SetStackCount(1)
    end
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:StopSound("Hero_Broodmother.WebLoop")
    UTIL_Remove(parent)
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.CheckState(self)
    return {[MODIFIER_STATE_NO_HEALTH_BAR] = true, [MODIFIER_STATE_INVULNERABLE] = true, [MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_NOT_ON_MINIMAP_FOR_ENEMIES] = true}
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.GetAuraRadius(self)
    return self.radius
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.GetAuraDuration(self)
    return 0.2
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.GetModifierAura(self)
    return modifier_broodmother_spin_web_custom_728.name
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.GetAuraEntityReject(self, entity)
    if entity == self:GetCaster() or entity:GetUnitName() == "npc_dota_broodmother_728_spiderling_custom" or entity:GetUnitName() == "npc_dota_broodmother_728_spiderite_custom" then
        return false
    end
    return true
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.GetAuraSearchType(self)
    return bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC)
end
function modifier_broodmother_spin_web_custom_728_aura.prototype.GetAuraSearchFlags(self)
    return DOTA_UNIT_TARGET_FLAG_NONE
end
modifier_broodmother_spin_web_custom_728_aura = __TS__Decorate(
    modifier_broodmother_spin_web_custom_728_aura,
    modifier_broodmother_spin_web_custom_728_aura,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_spin_web_custom_728_aura"}
)
____exports.modifier_broodmother_spin_web_custom_728_aura = modifier_broodmother_spin_web_custom_728_aura
return ____exports
