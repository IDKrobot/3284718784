local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["25"] = 16,["26"] = 18,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 24,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 13,["41"] = 27,["42"] = 28,["43"] = 27,["44"] = 33,["45"] = 34,["46"] = 33,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 3,["53"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_silver_edge_custom_734_debuff = __TS__Class()
local modifier_item_silver_edge_custom_734_debuff = ____exports.modifier_item_silver_edge_custom_734_debuff
modifier_item_silver_edge_custom_734_debuff.name = "modifier_item_silver_edge_custom_734_debuff"
__TS__ClassExtends(modifier_item_silver_edge_custom_734_debuff, BaseModifier)
function modifier_item_silver_edge_custom_734_debuff.prototype.IsHidden(self)
    return false
end
function modifier_item_silver_edge_custom_734_debuff.prototype.IsPurgable(self)
    return false
end
function modifier_item_silver_edge_custom_734_debuff.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local particle = ParticleManager:CreateParticle("particles/generic_gameplay/generic_break.vpcf", PATTACH_OVERHEAD_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        1,
        parent:GetAbsOrigin()
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_item_silver_edge_custom_734_debuff.prototype.CheckState(self)
    return {[MODIFIER_STATE_PASSIVES_DISABLED] = true}
end
function modifier_item_silver_edge_custom_734_debuff.prototype.GetEffectName(self)
    return "particles/items3_fx/silver_edge.vpcf"
end
modifier_item_silver_edge_custom_734_debuff = __TS__Decorate(
    modifier_item_silver_edge_custom_734_debuff,
    modifier_item_silver_edge_custom_734_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_silver_edge_custom_734_debuff"}
)
____exports.modifier_item_silver_edge_custom_734_debuff = modifier_item_silver_edge_custom_734_debuff
return ____exports
