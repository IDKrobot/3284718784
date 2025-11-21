local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 4,["16"] = 5,["17"] = 4,["18"] = 5,["20"] = 5,["21"] = 8,["22"] = 8,["23"] = 8,["24"] = 8,["25"] = 8,["26"] = 8,["27"] = 8,["28"] = 4,["29"] = 16,["30"] = 17,["31"] = 16,["32"] = 20,["33"] = 21,["34"] = 20,["35"] = 24,["36"] = 25,["37"] = 24,["38"] = 30,["39"] = 31,["40"] = 31,["42"] = 32,["43"] = 32,["45"] = 34,["46"] = 35,["47"] = 36,["48"] = 36,["50"] = 38,["51"] = 40,["52"] = 40,["53"] = 40,["54"] = 40,["55"] = 41,["57"] = 43,["58"] = 43,["59"] = 43,["60"] = 43,["61"] = 45,["62"] = 30,["63"] = 5,["64"] = 5,["65"] = 5,["66"] = 4,["69"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_invoker_invoke_custom_732 = __TS__Class()
local modifier_invoker_invoke_custom_732 = ____exports.modifier_invoker_invoke_custom_732
modifier_invoker_invoke_custom_732.name = "modifier_invoker_invoke_custom_732"
__TS__ClassExtends(modifier_invoker_invoke_custom_732, BaseModifier)
function modifier_invoker_invoke_custom_732.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.projectiles = {
        q = "particles/units/heroes/hero_invoker_kid/invoker_kid_base_attack_quas.vpcf",
        w = "particles/units/heroes/hero_invoker_kid/invoker_kid_base_attack_wex.vpcf",
        e = "particles/units/heroes/hero_invoker_kid/invoker_kid_base_attack_exort.vpcf",
        all = "particles/units/heroes/hero_invoker_kid/invoker_kid_base_attack_all.vpcf",
        default = "particles/units/heroes/hero_invoker/invoker_base_attack.vpcf"
    }
end
function modifier_invoker_invoke_custom_732.prototype.IsHidden(self)
    return true
end
function modifier_invoker_invoke_custom_732.prototype.OnCreated(self, params)
    self.ability = self:GetAbility()
end
function modifier_invoker_invoke_custom_732.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_PROJECTILE_NAME}
end
function modifier_invoker_invoke_custom_732.prototype.GetModifierProjectileName(self)
    if not IsServer() then
        return self.projectiles.default
    end
    if not self:GetParent():HasPersona("npc_dota_hero_invoker") then
        return self.projectiles.default
    end
    local orbs = self.ability:GetOrbs()
    local values = __TS__ObjectValues(orbs)
    if #values == 0 then
        return self.projectiles.all
    end
    local maxValue = math.max(unpack(values))
    if #__TS__ObjectKeys(orbs) > 1 and __TS__ArrayEvery(
        values,
        function(____, value) return value == 1 end
    ) then
        return self.projectiles.all
    end
    local key = __TS__ArrayFind(
        __TS__ObjectKeys(orbs),
        function(____, key) return orbs[key] == maxValue end
    ) or "all"
    return self.projectiles[key]
end
modifier_invoker_invoke_custom_732 = __TS__Decorate(
    modifier_invoker_invoke_custom_732,
    modifier_invoker_invoke_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_invoke_custom_732"}
)
____exports.modifier_invoker_invoke_custom_732 = modifier_invoker_invoke_custom_732
return ____exports
