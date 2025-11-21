local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 4,["22"] = 13,["23"] = 14,["24"] = 13,["25"] = 17,["26"] = 18,["27"] = 17,["28"] = 21,["29"] = 22,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 25,["36"] = 27,["37"] = 24,["38"] = 24,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 31,["45"] = 32,["48"] = 34,["49"] = 30,["50"] = 30,["51"] = 37,["52"] = 38,["53"] = 38,["55"] = 40,["56"] = 41,["57"] = 41,["59"] = 43,["60"] = 21,["61"] = 46,["62"] = 47,["63"] = 49,["64"] = 50,["65"] = 55,["66"] = 55,["67"] = 55,["68"] = 55,["69"] = 55,["70"] = 55,["71"] = 55,["72"] = 55,["73"] = 55,["74"] = 56,["75"] = 58,["76"] = 46,["77"] = 5,["78"] = 5,["79"] = 5,["80"] = 4,["83"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_refresher_custom = require("abilities.items.refresher.modifier_item_refresher_custom")
local modifier_item_refresher_custom = ____modifier_item_refresher_custom.modifier_item_refresher_custom
____exports.item_refresher_custom = __TS__Class()
local item_refresher_custom = ____exports.item_refresher_custom
item_refresher_custom.name = "item_refresher_custom"
__TS__ClassExtends(item_refresher_custom, BaseItem)
function item_refresher_custom.prototype.____constructor(self, ...)
    BaseItem.prototype.____constructor(self, ...)
    self.itemExceptions = {item_refresher = true, item_refresher_custom = true, item_refresher_shard = true, item_tranquil_boots = true}
end
function item_refresher_custom.prototype.IsItemException(self, item)
    return not not self.itemExceptions[item:GetName()]
end
function item_refresher_custom.prototype.GetIntrinsicModifierName(self)
    return modifier_item_refresher_custom.name
end
function item_refresher_custom.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    __TS__ArrayForEach(
        caster:GetAbilities(),
        function(____, ability)
            if ability:GetAbilityType() == ABILITY_TYPE_ATTRIBUTES then
                return
            end
            ability:EndCooldown()
        end
    )
    __TS__ArrayForEach(
        caster:GetItems(8),
        function(____, item)
            if item:GetPurchaser() ~= caster then
                return
            end
            if self:IsItemException(item) then
                return
            end
            item:EndCooldown()
        end
    )
    local tpScroll = caster:GetItemInSlot(DOTA_ITEM_TP_SCROLL)
    if tpScroll and not self:IsItemException(tpScroll) then
        tpScroll:EndCooldown()
    end
    local neutralItem = caster:GetItemInSlot(16)
    if neutralItem and not self:IsItemException(neutralItem) then
        neutralItem:EndCooldown()
    end
    self:PlayEffects()
end
function item_refresher_custom.prototype.PlayEffects(self)
    local caster = self:GetCaster()
    local particleName = ParticleManager:GetParticleReplacement("particles/items2_fx/refresher.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_CUSTOMORIGIN, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("DOTA_Item.Refresher.Activate")
end
item_refresher_custom = __TS__Decorate(
    item_refresher_custom,
    item_refresher_custom,
    {registerAbility(nil)},
    {kind = "class", name = "item_refresher_custom"}
)
____exports.item_refresher_custom = item_refresher_custom
return ____exports
