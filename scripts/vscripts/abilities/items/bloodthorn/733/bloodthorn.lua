local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 14,["28"] = 16,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 27,["36"] = 11,["37"] = 6,["38"] = 6,["39"] = 6,["40"] = 5,["43"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_bloodthorn_custom_733 = require("abilities.items.bloodthorn.733.modifier_item_bloodthorn_custom_733")
local modifier_item_bloodthorn_custom_733 = ____modifier_item_bloodthorn_custom_733.modifier_item_bloodthorn_custom_733
local ____modifier_item_bloodthorn_custom_733_debuff = require("abilities.items.bloodthorn.733.modifier_item_bloodthorn_custom_733_debuff")
local modifier_item_bloodthorn_custom_733_debuff = ____modifier_item_bloodthorn_custom_733_debuff.modifier_item_bloodthorn_custom_733_debuff
____exports.item_bloodthorn_custom_733 = __TS__Class()
local item_bloodthorn_custom_733 = ____exports.item_bloodthorn_custom_733
item_bloodthorn_custom_733.name = "item_bloodthorn_custom_733"
__TS__ClassExtends(item_bloodthorn_custom_733, BaseItem)
function item_bloodthorn_custom_733.prototype.GetIntrinsicModifierName(self)
    return modifier_item_bloodthorn_custom_733.name
end
function item_bloodthorn_custom_733.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local duration = self:GetSpecialValueFor("silence_duration")
    modifier_item_bloodthorn_custom_733_debuff:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, duration)}
    )
    target:EmitSound("DOTA_Item.Bloodthorn.Activate")
end
item_bloodthorn_custom_733 = __TS__Decorate(
    item_bloodthorn_custom_733,
    item_bloodthorn_custom_733,
    {registerAbility(nil)},
    {kind = "class", name = "item_bloodthorn_custom_733"}
)
____exports.item_bloodthorn_custom_733 = item_bloodthorn_custom_733
return ____exports
