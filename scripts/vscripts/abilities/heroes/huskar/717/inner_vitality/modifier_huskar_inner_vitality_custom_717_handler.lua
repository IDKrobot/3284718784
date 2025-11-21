local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 3,["22"] = 10,["23"] = 11,["24"] = 10,["25"] = 14,["26"] = 15,["27"] = 14,["28"] = 18,["29"] = 19,["30"] = 18,["31"] = 22,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 28,["37"] = 29,["39"] = 22,["40"] = 32,["41"] = 33,["42"] = 35,["43"] = 36,["44"] = 37,["45"] = 38,["47"] = 40,["48"] = 32,["49"] = 4,["50"] = 4,["51"] = 4,["52"] = 3,["55"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_huskar_inner_vitality_custom_717_handler = __TS__Class()
local modifier_huskar_inner_vitality_custom_717_handler = ____exports.modifier_huskar_inner_vitality_custom_717_handler
modifier_huskar_inner_vitality_custom_717_handler.name = "modifier_huskar_inner_vitality_custom_717_handler"
__TS__ClassExtends(modifier_huskar_inner_vitality_custom_717_handler, BaseModifier)
function modifier_huskar_inner_vitality_custom_717_handler.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.base_health = 0
    self.attribute_bonus = 0
    self.hurt_bonus = 0
    self.hurt_threshold = 0
end
function modifier_huskar_inner_vitality_custom_717_handler.prototype.IsHidden(self)
    return true
end
function modifier_huskar_inner_vitality_custom_717_handler.prototype.IsPurgable(self)
    return true
end
function modifier_huskar_inner_vitality_custom_717_handler.prototype.IsDebuff(self)
    return false
end
function modifier_huskar_inner_vitality_custom_717_handler.prototype.OnCreated(self, params)
    self.base_health = self:GetSpecialValueFor("heal")
    self.attribute_bonus = self:GetSpecialValueFor("attribute_bonus") / 100
    self.hurt_bonus = self:GetSpecialValueFor("hurt_attribute_bonus") / 100
    self.hurt_threshold = self:GetSpecialValueFor("hurt_percent")
    if IsServer() then
        self:StartIntervalThink(FrameTime())
    end
end
function modifier_huskar_inner_vitality_custom_717_handler.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local attribute = parent:GetPrimaryStatValue()
    local heal = self.base_health + self.attribute_bonus * attribute
    if parent:GetHealthPercent() < self.hurt_threshold then
        heal = self.base_health + self.hurt_bonus * attribute
    end
    self:SetStackCount(heal)
end
modifier_huskar_inner_vitality_custom_717_handler = __TS__Decorate(
    modifier_huskar_inner_vitality_custom_717_handler,
    modifier_huskar_inner_vitality_custom_717_handler,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_huskar_inner_vitality_custom_717_handler"}
)
____exports.modifier_huskar_inner_vitality_custom_717_handler = modifier_huskar_inner_vitality_custom_717_handler
return ____exports
