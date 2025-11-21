local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 6,["19"] = 7,["21"] = 7,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 19,["29"] = 26,["30"] = 16,["31"] = 7,["32"] = 7,["33"] = 7,["34"] = 6,["37"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseSphereClass = ____spheres.BaseSphereClass
local ____modifier_invoker_exort_custom_732 = require("abilities.heroes.invoker.732.exort.modifier_invoker_exort_custom_732")
local modifier_invoker_exort_custom_732 = ____modifier_invoker_exort_custom_732.modifier_invoker_exort_custom_732
local ____modifier_invoker_exort_custom_732_stack = require("abilities.heroes.invoker.732.exort.modifier_invoker_exort_custom_732_stack")
local modifier_invoker_exort_custom_732_stack = ____modifier_invoker_exort_custom_732_stack.modifier_invoker_exort_custom_732_stack
____exports.invoker_exort_custom_732 = __TS__Class()
local invoker_exort_custom_732 = ____exports.invoker_exort_custom_732
invoker_exort_custom_732.name = "invoker_exort_custom_732"
__TS__ClassExtends(invoker_exort_custom_732, BaseSphereClass)
function invoker_exort_custom_732.prototype.____constructor(self)
    BaseSphereClass.prototype.____constructor(self, "invoker_exort")
end
function invoker_exort_custom_732.prototype.GetIntrinsicModifierName(self)
    return modifier_invoker_exort_custom_732.name
end
function invoker_exort_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local modifier = modifier_invoker_exort_custom_732_stack:apply(caster, caster, self, {})
    self:GetInvoke():AddOrb(modifier)
end
invoker_exort_custom_732 = __TS__Decorate(
    invoker_exort_custom_732,
    invoker_exort_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_exort_custom_732"}
)
____exports.invoker_exort_custom_732 = invoker_exort_custom_732
return ____exports
