local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 43,["19"] = 3,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 22,["32"] = 24,["35"] = 26,["36"] = 27,["38"] = 29,["40"] = 19,["41"] = 32,["42"] = 33,["43"] = 32,["44"] = 36,["45"] = 37,["46"] = 36,["47"] = 45,["48"] = 46,["49"] = 45,["50"] = 49,["51"] = 50,["52"] = 49,["53"] = 53,["54"] = 54,["55"] = 53,["56"] = 4,["57"] = 4,["58"] = 4,["59"] = 3,["62"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_heartpiercer_custom_717_debuff = __TS__Class()
local modifier_pangolier_heartpiercer_custom_717_debuff = ____exports.modifier_pangolier_heartpiercer_custom_717_debuff
modifier_pangolier_heartpiercer_custom_717_debuff.name = "modifier_pangolier_heartpiercer_custom_717_debuff"
__TS__ClassExtends(modifier_pangolier_heartpiercer_custom_717_debuff, BaseModifier)
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.slow = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.slow end
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.IsHidden(self)
    return false
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.slow = self:GetSpecialValueFor("slow_pct")
    if not IsServer() then
        return
    end
    if parent:IsCreep() then
        parent:EmitSound("Hero_Pangolier.LuckyShot.Proc.Creep")
    else
        parent:EmitSound("Hero_Pangolier.LuckyShot.Proc")
    end
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_IGNORE_PHYSICAL_ARMOR}
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.GetModifierIgnorePhysicalArmor(self, event)
    return 1
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_pangolier/pangolier_heartpiercer_debuff.vpcf"
end
function modifier_pangolier_heartpiercer_custom_717_debuff.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_pangolier_heartpiercer_custom_717_debuff = __TS__Decorate(
    modifier_pangolier_heartpiercer_custom_717_debuff,
    modifier_pangolier_heartpiercer_custom_717_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_heartpiercer_custom_717_debuff"}
)
____exports.modifier_pangolier_heartpiercer_custom_717_debuff = modifier_pangolier_heartpiercer_custom_717_debuff
return ____exports
