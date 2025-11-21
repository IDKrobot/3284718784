local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 15,["30"] = 15,["31"] = 15,["32"] = 24,["33"] = 26,["34"] = 31,["35"] = 12,["36"] = 34,["37"] = 35,["38"] = 37,["41"] = 38,["44"] = 39,["47"] = 41,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 52,["55"] = 34,["56"] = 7,["57"] = 7,["58"] = 7,["59"] = 6,["62"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_silver_edge_custom_734 = require("abilities.items.silver_edge.734.modifier_item_silver_edge_custom_734")
local modifier_item_silver_edge_custom_734 = ____modifier_item_silver_edge_custom_734.modifier_item_silver_edge_custom_734
local ____modifier_item_silver_edge_custom_734_debuff = require("abilities.items.silver_edge.734.modifier_item_silver_edge_custom_734_debuff")
local modifier_item_silver_edge_custom_734_debuff = ____modifier_item_silver_edge_custom_734_debuff.modifier_item_silver_edge_custom_734_debuff
local ____modifier_item_silver_edge_custom_734_windwalk = require("abilities.items.silver_edge.734.modifier_item_silver_edge_custom_734_windwalk")
local modifier_item_silver_edge_custom_734_windwalk = ____modifier_item_silver_edge_custom_734_windwalk.modifier_item_silver_edge_custom_734_windwalk
____exports.item_silver_edge_custom_734 = __TS__Class()
local item_silver_edge_custom_734 = ____exports.item_silver_edge_custom_734
item_silver_edge_custom_734.name = "item_silver_edge_custom_734"
__TS__ClassExtends(item_silver_edge_custom_734, BaseItem)
function item_silver_edge_custom_734.prototype.GetIntrinsicModifierName(self)
    return modifier_item_silver_edge_custom_734.name
end
function item_silver_edge_custom_734.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    modifier_item_silver_edge_custom_734_windwalk:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("windwalk_duration")}
    )
    caster:EmitSound("DOTA_Item.InvisibilitySword.Activate")
    local particle = ParticleManager:CreateParticle("particles/generic_hero_status/status_invisibility_start.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:ReleaseParticleIndex(particle)
end
function item_silver_edge_custom_734.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    local break_duration = self:GetSpecialValueFor("backstab_duration")
    modifier_item_silver_edge_custom_734_debuff:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, break_duration)}
    )
    target:EmitSound("DOTA_Item.SilverEdge.Target")
end
item_silver_edge_custom_734 = __TS__Decorate(
    item_silver_edge_custom_734,
    item_silver_edge_custom_734,
    {registerAbility(nil)},
    {kind = "class", name = "item_silver_edge_custom_734"}
)
____exports.item_silver_edge_custom_734 = item_silver_edge_custom_734
return ____exports
