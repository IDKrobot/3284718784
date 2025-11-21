local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 14,["26"] = 14,["28"] = 16,["29"] = 16,["30"] = 16,["31"] = 16,["32"] = 16,["33"] = 16,["34"] = 16,["35"] = 11,["36"] = 25,["37"] = 26,["38"] = 25,["39"] = 29,["40"] = 30,["41"] = 31,["42"] = 32,["45"] = 34,["46"] = 36,["47"] = 38,["48"] = 47,["49"] = 48,["51"] = 57,["52"] = 57,["53"] = 57,["54"] = 57,["55"] = 57,["56"] = 57,["58"] = 66,["59"] = 29,["60"] = 70,["61"] = 71,["62"] = 70,["63"] = 71,["64"] = 71,["65"] = 71,["66"] = 71,["67"] = 70,["70"] = 71,["71"] = 73,["72"] = 74,["73"] = 73,["74"] = 74,["75"] = 74,["76"] = 74,["77"] = 74,["78"] = 73,["81"] = 74});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_solar_crest_custom_733 = require("abilities.items.solar_crest.733.modifier_item_solar_crest_custom_733")
local modifier_item_solar_crest_custom_733 = ____modifier_item_solar_crest_custom_733.modifier_item_solar_crest_custom_733
local ____modifier_item_solar_crest_custom_733_addition = require("abilities.items.solar_crest.733.modifier_item_solar_crest_custom_733_addition")
local modifier_item_solar_crest_custom_733_addition = ____modifier_item_solar_crest_custom_733_addition.modifier_item_solar_crest_custom_733_addition
local ____modifier_item_solar_crest_custom_733_reduction = require("abilities.items.solar_crest.733.modifier_item_solar_crest_custom_733_reduction")
local modifier_item_solar_crest_custom_733_reduction = ____modifier_item_solar_crest_custom_733_reduction.modifier_item_solar_crest_custom_733_reduction
local ItemSolarCrest733 = __TS__Class()
ItemSolarCrest733.name = "ItemSolarCrest733"
__TS__ClassExtends(ItemSolarCrest733, BaseItem)
function ItemSolarCrest733.prototype.GetIntrinsicModifierName(self)
    return modifier_item_solar_crest_custom_733.name
end
function ItemSolarCrest733.prototype.CastFilterResultTarget(self, target)
    local caster = self:GetCaster()
    if caster == target then
        return UF_FAIL_CUSTOM
    end
    return UnitFilter(
        target,
        DOTA_UNIT_TARGET_TEAM_BOTH,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_NONE,
        caster:GetTeamNumber()
    )
end
function ItemSolarCrest733.prototype.GetCustomCastErrorTarget(self, target)
    return "dota_hud_error_cant_cast_on_self"
end
function ItemSolarCrest733.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local isAlly = caster:GetTeamNumber() == target:GetTeamNumber()
    local duration = self:GetSpecialValueFor("duration")
    modifier_item_solar_crest_custom_733_reduction:apply(caster, caster, self, {duration = duration})
    if isAlly then
        modifier_item_solar_crest_custom_733_addition:apply(target, caster, self, {duration = duration})
    else
        modifier_item_solar_crest_custom_733_reduction:apply(
            target,
            caster,
            self,
            {duration = target:CalculateDuration(caster, duration)}
        )
    end
    target:EmitSound("DOTA_Item.MedallionOfCourage.Activate")
end
____exports.item_solar_crest_custom_733 = __TS__Class()
local item_solar_crest_custom_733 = ____exports.item_solar_crest_custom_733
item_solar_crest_custom_733.name = "item_solar_crest_custom_733"
__TS__ClassExtends(item_solar_crest_custom_733, ItemSolarCrest733)
item_solar_crest_custom_733 = __TS__Decorate(
    item_solar_crest_custom_733,
    item_solar_crest_custom_733,
    {registerAbility(nil)},
    {kind = "class", name = "item_solar_crest_custom_733"}
)
____exports.item_solar_crest_custom_733 = item_solar_crest_custom_733
____exports.item_solar_crest_custom_733_purchased = __TS__Class()
local item_solar_crest_custom_733_purchased = ____exports.item_solar_crest_custom_733_purchased
item_solar_crest_custom_733_purchased.name = "item_solar_crest_custom_733_purchased"
__TS__ClassExtends(item_solar_crest_custom_733_purchased, ItemSolarCrest733)
item_solar_crest_custom_733_purchased = __TS__Decorate(
    item_solar_crest_custom_733_purchased,
    item_solar_crest_custom_733_purchased,
    {registerAbility(nil)},
    {kind = "class", name = "item_solar_crest_custom_733_purchased"}
)
____exports.item_solar_crest_custom_733_purchased = item_solar_crest_custom_733_purchased
return ____exports
