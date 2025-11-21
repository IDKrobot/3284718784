local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 22,["31"] = 24,["34"] = 26,["35"] = 31,["36"] = 31,["37"] = 31,["38"] = 31,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 19,["53"] = 35,["54"] = 36,["55"] = 35,["56"] = 41,["57"] = 42,["58"] = 41,["59"] = 4,["60"] = 4,["61"] = 4,["62"] = 3,["65"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_bloodstone_custom_728_active = __TS__Class()
local modifier_item_bloodstone_custom_728_active = ____exports.modifier_item_bloodstone_custom_728_active
modifier_item_bloodstone_custom_728_active.name = "modifier_item_bloodstone_custom_728_active"
__TS__ClassExtends(modifier_item_bloodstone_custom_728_active, BaseModifier)
function modifier_item_bloodstone_custom_728_active.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.mana_cost = 0
end
function modifier_item_bloodstone_custom_728_active.prototype.IsHidden(self)
    return false
end
function modifier_item_bloodstone_custom_728_active.prototype.IsPurgable(self)
    return true
end
function modifier_item_bloodstone_custom_728_active.prototype.IsDebuff(self)
    return false
end
function modifier_item_bloodstone_custom_728_active.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.mana_cost = parent:GetMaxMana() * self:GetSpecialValueFor("mana_cost_percentage") / 100 / self:GetDuration()
    if not IsServer() then
        return
    end
    local particle = ParticleManager:CreateParticle("particles/items_fx/bloodstone_heal.vpcf", PATTACH_OVERHEAD_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        2,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
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
function modifier_item_bloodstone_custom_728_active.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT}
end
function modifier_item_bloodstone_custom_728_active.prototype.GetModifierConstantHealthRegen(self)
    return self.mana_cost
end
modifier_item_bloodstone_custom_728_active = __TS__Decorate(
    modifier_item_bloodstone_custom_728_active,
    modifier_item_bloodstone_custom_728_active,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_bloodstone_custom_728_active"}
)
____exports.modifier_item_bloodstone_custom_728_active = modifier_item_bloodstone_custom_728_active
return ____exports
