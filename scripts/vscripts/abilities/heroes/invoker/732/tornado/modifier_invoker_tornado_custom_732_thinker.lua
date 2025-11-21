local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 15,["25"] = 13,["26"] = 18,["27"] = 19,["28"] = 20,["30"] = 18,["31"] = 4,["32"] = 4,["33"] = 4,["34"] = 3,["37"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_invoker_tornado_custom_732_thinker = __TS__Class()
local modifier_invoker_tornado_custom_732_thinker = ____exports.modifier_invoker_tornado_custom_732_thinker
modifier_invoker_tornado_custom_732_thinker.name = "modifier_invoker_tornado_custom_732_thinker"
__TS__ClassExtends(modifier_invoker_tornado_custom_732_thinker, BaseModifier)
function modifier_invoker_tornado_custom_732_thinker.prototype.IsHidden(self)
    return true
end
function modifier_invoker_tornado_custom_732_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_tornado_custom_732_thinker.prototype.OnCreated(self, params)
    if IsServer() then
        self:GetParent():EmitSound("Hero_Invoker.Tornado")
    end
end
function modifier_invoker_tornado_custom_732_thinker.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():StopSound("Hero_Invoker.Tornado")
    end
end
modifier_invoker_tornado_custom_732_thinker = __TS__Decorate(
    modifier_invoker_tornado_custom_732_thinker,
    modifier_invoker_tornado_custom_732_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_tornado_custom_732_thinker"}
)
____exports.modifier_invoker_tornado_custom_732_thinker = modifier_invoker_tornado_custom_732_thinker
return ____exports
