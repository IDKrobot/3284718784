local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 22,["33"] = 24,["34"] = 25,["35"] = 19,["36"] = 28,["37"] = 29,["38"] = 28,["39"] = 34,["40"] = 35,["41"] = 37,["42"] = 38,["44"] = 34,["45"] = 4,["46"] = 4,["47"] = 4,["48"] = 3,["51"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_sniper_take_aim_custom_722_bonus = __TS__Class()
local modifier_sniper_take_aim_custom_722_bonus = ____exports.modifier_sniper_take_aim_custom_722_bonus
modifier_sniper_take_aim_custom_722_bonus.name = "modifier_sniper_take_aim_custom_722_bonus"
__TS__ClassExtends(modifier_sniper_take_aim_custom_722_bonus, BaseModifier)
function modifier_sniper_take_aim_custom_722_bonus.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.attack_range = 0
end
function modifier_sniper_take_aim_custom_722_bonus.prototype.IsHidden(self)
    return false
end
function modifier_sniper_take_aim_custom_722_bonus.prototype.IsPurgable(self)
    return true
end
function modifier_sniper_take_aim_custom_722_bonus.prototype.OnCreated(self, params)
    self.attack_range = self:GetSpecialValueFor("bonus_attack_range")
end
function modifier_sniper_take_aim_custom_722_bonus.prototype.OnDestroy(self)
    local ability = self:GetAbility()
    if not IsServer() then
        return
    end
    ability:SetActivated(true)
    ability:UseResources(false, false, false, true)
end
function modifier_sniper_take_aim_custom_722_bonus.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ATTACK}
end
function modifier_sniper_take_aim_custom_722_bonus.prototype.OnAttack(self, event)
    local parent = self:GetParent()
    if event.attacker == parent then
        self:Destroy()
    end
end
modifier_sniper_take_aim_custom_722_bonus = __TS__Decorate(
    modifier_sniper_take_aim_custom_722_bonus,
    modifier_sniper_take_aim_custom_722_bonus,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_sniper_take_aim_custom_722_bonus"}
)
____exports.modifier_sniper_take_aim_custom_722_bonus = modifier_sniper_take_aim_custom_722_bonus
return ____exports
