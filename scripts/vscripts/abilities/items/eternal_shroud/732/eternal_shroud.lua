local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 6,["21"] = 10,["22"] = 11,["23"] = 13,["25"] = 13,["27"] = 15,["28"] = 15,["29"] = 15,["30"] = 15,["31"] = 15,["32"] = 15,["33"] = 24,["34"] = 29,["35"] = 31,["36"] = 10,["37"] = 35,["38"] = 36,["39"] = 35,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 36,["44"] = 35,["47"] = 36,["48"] = 38,["49"] = 39,["50"] = 38,["51"] = 39,["52"] = 39,["53"] = 39,["54"] = 39,["55"] = 38,["58"] = 39});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_eternal_shroud_custom_732 = require("abilities.items.eternal_shroud.732.modifier_item_eternal_shroud_custom_732")
local modifier_item_eternal_shroud_custom_732 = ____modifier_item_eternal_shroud_custom_732.modifier_item_eternal_shroud_custom_732
local ____modifier_item_eternal_shroud_custom_732_barrier = require("abilities.items.eternal_shroud.732.modifier_item_eternal_shroud_custom_732_barrier")
local modifier_item_eternal_shroud_custom_732_barrier = ____modifier_item_eternal_shroud_custom_732_barrier.modifier_item_eternal_shroud_custom_732_barrier
local ItemEternalShroud732 = __TS__Class()
ItemEternalShroud732.name = "ItemEternalShroud732"
__TS__ClassExtends(ItemEternalShroud732, BaseItem)
function ItemEternalShroud732.prototype.GetIntrinsicModifierName(self)
    return modifier_item_eternal_shroud_custom_732.name
end
function ItemEternalShroud732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local ____opt_0 = caster:FindModifierByNameAndCaster(modifier_item_eternal_shroud_custom_732_barrier.name, caster)
    if ____opt_0 ~= nil then
        ____opt_0:Destroy()
    end
    modifier_item_eternal_shroud_custom_732_barrier:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("barrier_duration")}
    )
    local particle = ParticleManager:CreateParticle("particles/items2_fx/eternal_shroud_launch.vpcf", PATTACH_ABSORIGIN, caster)
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("DOTA_Item.Pipe.Activate")
end
____exports.item_eternal_shroud_custom_732 = __TS__Class()
local item_eternal_shroud_custom_732 = ____exports.item_eternal_shroud_custom_732
item_eternal_shroud_custom_732.name = "item_eternal_shroud_custom_732"
__TS__ClassExtends(item_eternal_shroud_custom_732, ItemEternalShroud732)
item_eternal_shroud_custom_732 = __TS__Decorate(
    item_eternal_shroud_custom_732,
    item_eternal_shroud_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "item_eternal_shroud_custom_732"}
)
____exports.item_eternal_shroud_custom_732 = item_eternal_shroud_custom_732
____exports.item_eternal_shroud_custom_732_purchased = __TS__Class()
local item_eternal_shroud_custom_732_purchased = ____exports.item_eternal_shroud_custom_732_purchased
item_eternal_shroud_custom_732_purchased.name = "item_eternal_shroud_custom_732_purchased"
__TS__ClassExtends(item_eternal_shroud_custom_732_purchased, ItemEternalShroud732)
item_eternal_shroud_custom_732_purchased = __TS__Decorate(
    item_eternal_shroud_custom_732_purchased,
    item_eternal_shroud_custom_732_purchased,
    {registerAbility(nil)},
    {kind = "class", name = "item_eternal_shroud_custom_732_purchased"}
)
____exports.item_eternal_shroud_custom_732_purchased = item_eternal_shroud_custom_732_purchased
return ____exports
