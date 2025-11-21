local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 26,["18"] = 3,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 9,["23"] = 10,["24"] = 11,["26"] = 9,["27"] = 14,["28"] = 15,["29"] = 17,["30"] = 14,["31"] = 20,["32"] = 21,["33"] = 20,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 3,["40"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_morphling_morph_agi_custom_729 = __TS__Class()
local modifier_morphling_morph_agi_custom_729 = ____exports.modifier_morphling_morph_agi_custom_729
modifier_morphling_morph_agi_custom_729.name = "modifier_morphling_morph_agi_custom_729"
__TS__ClassExtends(modifier_morphling_morph_agi_custom_729, BaseModifier)
function modifier_morphling_morph_agi_custom_729.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Agility = function() return self:GetSpecialValueFor("bonus_attributes") end
end
function modifier_morphling_morph_agi_custom_729.prototype.IsHidden(self)
    return true
end
function modifier_morphling_morph_agi_custom_729.prototype.OnCreated(self, params)
    if IsServer() then
        self:StartIntervalThink(0.03)
    end
end
function modifier_morphling_morph_agi_custom_729.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    self:SetStackCount(parent:GetAgility())
end
function modifier_morphling_morph_agi_custom_729.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_AGILITY_BONUS}
end
modifier_morphling_morph_agi_custom_729 = __TS__Decorate(
    modifier_morphling_morph_agi_custom_729,
    modifier_morphling_morph_agi_custom_729,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_morphling_morph_agi_custom_729"}
)
____exports.modifier_morphling_morph_agi_custom_729 = modifier_morphling_morph_agi_custom_729
return ____exports
