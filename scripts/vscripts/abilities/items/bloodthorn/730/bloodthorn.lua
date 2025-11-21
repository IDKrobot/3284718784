local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 14,["28"] = 16,["31"] = 18,["32"] = 20,["33"] = 20,["34"] = 20,["35"] = 20,["36"] = 20,["37"] = 20,["38"] = 29,["39"] = 11,["40"] = 6,["41"] = 6,["42"] = 6,["43"] = 5,["46"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_bloodthorn_custom_730 = require("abilities.items.bloodthorn.730.modifier_item_bloodthorn_custom_730")
local modifier_item_bloodthorn_custom_730 = ____modifier_item_bloodthorn_custom_730.modifier_item_bloodthorn_custom_730
local ____modifier_item_bloodthorn_custom_730_debuff = require("abilities.items.bloodthorn.730.modifier_item_bloodthorn_custom_730_debuff")
local modifier_item_bloodthorn_custom_730_debuff = ____modifier_item_bloodthorn_custom_730_debuff.modifier_item_bloodthorn_custom_730_debuff
____exports.item_bloodthorn_custom_730 = __TS__Class()
local item_bloodthorn_custom_730 = ____exports.item_bloodthorn_custom_730
item_bloodthorn_custom_730.name = "item_bloodthorn_custom_730"
__TS__ClassExtends(item_bloodthorn_custom_730, BaseItem)
function item_bloodthorn_custom_730.prototype.GetIntrinsicModifierName(self)
    return modifier_item_bloodthorn_custom_730.name
end
function item_bloodthorn_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local duration = self:GetSpecialValueFor("silence_duration")
    modifier_item_bloodthorn_custom_730_debuff:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, duration)}
    )
    target:EmitSound("DOTA_Item.Bloodthorn.Activate")
end
item_bloodthorn_custom_730 = __TS__Decorate(
    item_bloodthorn_custom_730,
    item_bloodthorn_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "item_bloodthorn_custom_730"}
)
____exports.item_bloodthorn_custom_730 = item_bloodthorn_custom_730
return ____exports
