local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 14,["31"] = 16,["32"] = 16,["33"] = 16,["35"] = 16,["36"] = 17,["37"] = 17,["38"] = 17,["39"] = 17,["40"] = 19,["41"] = 19,["42"] = 19,["43"] = 19,["44"] = 19,["45"] = 19,["46"] = 28,["47"] = 30,["48"] = 31,["49"] = 11,["50"] = 6,["51"] = 6,["52"] = 6,["53"] = 5,["56"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_black_king_bar_custom_728 = require("abilities.items.black_king_bar.728.modifier_item_black_king_bar_custom_728")
local modifier_item_black_king_bar_custom_728 = ____modifier_item_black_king_bar_custom_728.modifier_item_black_king_bar_custom_728
local ____modifier_item_black_king_bar_custom_728_active = require("abilities.items.black_king_bar.728.modifier_item_black_king_bar_custom_728_active")
local modifier_item_black_king_bar_custom_728_active = ____modifier_item_black_king_bar_custom_728_active.modifier_item_black_king_bar_custom_728_active
____exports.item_black_king_bar_custom_728 = __TS__Class()
local item_black_king_bar_custom_728 = ____exports.item_black_king_bar_custom_728
item_black_king_bar_custom_728.name = "item_black_king_bar_custom_728"
__TS__ClassExtends(item_black_king_bar_custom_728, BaseItem)
function item_black_king_bar_custom_728.prototype.GetIntrinsicModifierName(self)
    return modifier_item_black_king_bar_custom_728.name
end
function item_black_king_bar_custom_728.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:Purge(
        false,
        true,
        false,
        false,
        false
    )
    local ____caster_custom_data_0, ____bkb_level_1 = caster.custom_data, "bkb_level"
    if ____caster_custom_data_0[____bkb_level_1] == nil then
        ____caster_custom_data_0[____bkb_level_1] = self:GetLevel()
    end
    local caster_level = caster.custom_data.bkb_level
    local level = math.min(
        caster_level + 1,
        self:GetSpecialValueFor("max_level")
    )
    modifier_item_black_king_bar_custom_728_active:apply(
        caster,
        caster,
        self,
        {duration = self:GetLevelSpecialValueFor("duration", level - 1)}
    )
    caster:EmitSound("DOTA_Item.BlackKingBar.Activate")
    self:SetLevel(level)
    caster.custom_data.bkb_level = level
end
item_black_king_bar_custom_728 = __TS__Decorate(
    item_black_king_bar_custom_728,
    item_black_king_bar_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "item_black_king_bar_custom_728"}
)
____exports.item_black_king_bar_custom_728 = item_black_king_bar_custom_728
return ____exports
