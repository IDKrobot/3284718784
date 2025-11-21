local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 4,["14"] = 3,["15"] = 4,["17"] = 4,["18"] = 28,["19"] = 3,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 9,["24"] = 10,["25"] = 12,["28"] = 14,["29"] = 15,["30"] = 15,["31"] = 15,["32"] = 16,["33"] = 17,["35"] = 15,["36"] = 15,["37"] = 9,["38"] = 22,["39"] = 23,["40"] = 22,["41"] = 4,["42"] = 4,["43"] = 4,["44"] = 3,["47"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_invoker_quas_custom_732 = __TS__Class()
local modifier_invoker_quas_custom_732 = ____exports.modifier_invoker_quas_custom_732
modifier_invoker_quas_custom_732.name = "modifier_invoker_quas_custom_732"
__TS__ClassExtends(modifier_invoker_quas_custom_732, BaseModifier)
function modifier_invoker_quas_custom_732.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierBonusStats_Strength = function() return self:GetAbilityLevel() * 2 end
end
function modifier_invoker_quas_custom_732.prototype.IsHidden(self)
    return true
end
function modifier_invoker_quas_custom_732.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    local quas = parent:FindAllModifiersByName("modifier_invoker_quas_custom_732_stack")
    __TS__ArrayForEach(
        quas,
        function(____, modifier)
            if modifier and not modifier:IsNull() then
                modifier:Destroy()
            end
        end
    )
end
function modifier_invoker_quas_custom_732.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATS_STRENGTH_BONUS}
end
modifier_invoker_quas_custom_732 = __TS__Decorate(
    modifier_invoker_quas_custom_732,
    modifier_invoker_quas_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_quas_custom_732"}
)
____exports.modifier_invoker_quas_custom_732 = modifier_invoker_quas_custom_732
return ____exports
