local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["20"] = 11,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 18,["25"] = 20,["28"] = 22,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 30,["39"] = 30,["40"] = 30,["41"] = 15,["42"] = 40,["43"] = 41,["44"] = 42,["46"] = 40,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 3,["53"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_invoker_tornado_custom_732 = __TS__Class()
local modifier_invoker_tornado_custom_732 = ____exports.modifier_invoker_tornado_custom_732
modifier_invoker_tornado_custom_732.name = "modifier_invoker_tornado_custom_732"
__TS__ClassExtends(modifier_invoker_tornado_custom_732, BaseModifier)
function modifier_invoker_tornado_custom_732.prototype.IsHidden(self)
    return true
end
function modifier_invoker_tornado_custom_732.prototype.IsDebuff(self)
    return true
end
function modifier_invoker_tornado_custom_732.prototype.OnCreated(self, params)
    local caster = self:GetCaster()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    self.damageTable = {
        attacker = caster,
        damage = params.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = parent,
        ability = ability
    }
    parent:AddNewModifier(
        caster,
        ability,
        "modifier_invoker_tornado",
        {duration = self:GetDuration()}
    )
end
function modifier_invoker_tornado_custom_732.prototype.OnDestroy(self)
    if IsServer() then
        ApplyDamage(self.damageTable)
    end
end
modifier_invoker_tornado_custom_732 = __TS__Decorate(
    modifier_invoker_tornado_custom_732,
    modifier_invoker_tornado_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_tornado_custom_732"}
)
____exports.modifier_invoker_tornado_custom_732 = modifier_invoker_tornado_custom_732
return ____exports
