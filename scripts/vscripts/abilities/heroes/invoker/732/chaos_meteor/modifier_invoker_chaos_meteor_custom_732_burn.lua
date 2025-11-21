local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["15"] = 5,["17"] = 5,["18"] = 6,["19"] = 4,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 20,["30"] = 21,["31"] = 20,["32"] = 24,["33"] = 25,["34"] = 27,["35"] = 28,["37"] = 24,["38"] = 31,["39"] = 32,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 41,["48"] = 43,["49"] = 31,["50"] = 46,["51"] = 47,["52"] = 46,["53"] = 50,["54"] = 51,["55"] = 50,["56"] = 54,["57"] = 55,["58"] = 54,["59"] = 5,["60"] = 5,["61"] = 5,["62"] = 4,["65"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
____exports.modifier_invoker_chaos_meteor_custom_732_burn = __TS__Class()
local modifier_invoker_chaos_meteor_custom_732_burn = ____exports.modifier_invoker_chaos_meteor_custom_732_burn
modifier_invoker_chaos_meteor_custom_732_burn.name = "modifier_invoker_chaos_meteor_custom_732_burn"
__TS__ClassExtends(modifier_invoker_chaos_meteor_custom_732_burn, BaseInvokerModifier)
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.damage = 0
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.IsHidden(self)
    return false
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.IsPurgable(self)
    return true
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.IsDebuff(self)
    return true
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.OnCreated(self, params)
    self.damage = self:GetOrbSpecialValueFor("burn_dps", "exort")
    if IsServer() then
        self:StartIntervalThink(1 - FrameTime())
    end
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local damageTable = {
        attacker = self:GetCaster(),
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = parent,
        ability = self:GetAbility()
    }
    ApplyDamage(damageTable)
    parent:EmitSound("Hero_Invoker.ChaosMeteor.Damage")
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_invoker/invoker_chaos_meteor_burn_debuff.vpcf"
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.GetStatusEffectName(self)
    return "particles/status_fx/status_effect_burn.vpcf"
end
function modifier_invoker_chaos_meteor_custom_732_burn.prototype.StatusEffectPriority(self)
    return 99999
end
modifier_invoker_chaos_meteor_custom_732_burn = __TS__Decorate(
    modifier_invoker_chaos_meteor_custom_732_burn,
    modifier_invoker_chaos_meteor_custom_732_burn,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_chaos_meteor_custom_732_burn"}
)
____exports.modifier_invoker_chaos_meteor_custom_732_burn = modifier_invoker_chaos_meteor_custom_732_burn
return ____exports
