local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 16,["18"] = 17,["19"] = 3,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 9,["24"] = 10,["25"] = 9,["26"] = 19,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 4,["36"] = 4,["37"] = 4,["38"] = 3,["41"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_sniper_headshot_custom_722_slow = __TS__Class()
local modifier_sniper_headshot_custom_722_slow = ____exports.modifier_sniper_headshot_custom_722_slow
modifier_sniper_headshot_custom_722_slow.name = "modifier_sniper_headshot_custom_722_slow"
__TS__ClassExtends(modifier_sniper_headshot_custom_722_slow, BaseModifier)
function modifier_sniper_headshot_custom_722_slow.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierMoveSpeedBonus_Percentage = function() return -100 end
    self.GetModifierAttackSpeedBonus_Constant = function() return -100 end
end
function modifier_sniper_headshot_custom_722_slow.prototype.IsHidden(self)
    return false
end
function modifier_sniper_headshot_custom_722_slow.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE, MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT}
end
function modifier_sniper_headshot_custom_722_slow.prototype.GetEffectName(self)
    return ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_sniper/sniper_headshot_slow.vpcf",
        self:GetCaster()
    )
end
function modifier_sniper_headshot_custom_722_slow.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_sniper_headshot_custom_722_slow = __TS__Decorate(
    modifier_sniper_headshot_custom_722_slow,
    modifier_sniper_headshot_custom_722_slow,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_headshot_custom_722_slow"}
)
____exports.modifier_sniper_headshot_custom_722_slow = modifier_sniper_headshot_custom_722_slow
return ____exports
