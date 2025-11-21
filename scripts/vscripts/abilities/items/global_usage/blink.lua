local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 3,["15"] = 3,["16"] = 4,["17"] = 3,["18"] = 6,["19"] = 3,["20"] = 6,["21"] = 10,["22"] = 11,["23"] = 10,["24"] = 14,["25"] = 15,["28"] = 17,["29"] = 3,["30"] = 14,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 23,["36"] = 24,["37"] = 23,["38"] = 27,["39"] = 28,["40"] = 27,["41"] = 31,["42"] = 32,["43"] = 31,["44"] = 35,["45"] = 36,["48"] = 38,["49"] = 35,["50"] = 41,["51"] = 42,["52"] = 44,["53"] = 45,["55"] = 41,["56"] = 48,["57"] = 49,["58"] = 48,["59"] = 54,["60"] = 55,["61"] = 56,["62"] = 58,["63"] = 60,["66"] = 61,["69"] = 62,["72"] = 63,["75"] = 64,["78"] = 65,["81"] = 67,["82"] = 69,["85"] = 71,["86"] = 73,["87"] = 74,["88"] = 54});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local BaseModifier = ____dota_ts_adapter.BaseModifier
____exports.BlinkDaggerItem = __TS__Class()
local BlinkDaggerItem = ____exports.BlinkDaggerItem
BlinkDaggerItem.name = "BlinkDaggerItem"
__TS__ClassExtends(BlinkDaggerItem, BaseItem)
function BlinkDaggerItem.prototype.____constructor(self, ...)
    BaseItem.prototype.____constructor(self, ...)
    self.damageCooldown = false
end
function BlinkDaggerItem.prototype.GetCastRange(self, location, target)
    return IsServer() and 99999 or BaseItem.prototype.GetCastRange(self, location, target)
end
function BlinkDaggerItem.prototype.IsBlinkDagger(self)
    return true
end
function BlinkDaggerItem.prototype.EndCooldown(self, rearm)
    if not rearm and self.damageCooldown then
        return
    end
    self.damageCooldown = false
    BaseItem.prototype.EndCooldown(self)
end
____exports.BlinkDaggerModifier = __TS__Class()
local BlinkDaggerModifier = ____exports.BlinkDaggerModifier
BlinkDaggerModifier.name = "BlinkDaggerModifier"
__TS__ClassExtends(BlinkDaggerModifier, BaseModifier)
function BlinkDaggerModifier.prototype.IsHidden(self)
    return true
end
function BlinkDaggerModifier.prototype.IsPurgable(self)
    return false
end
function BlinkDaggerModifier.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function BlinkDaggerModifier.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self:StartIntervalThink(FrameTime())
end
function BlinkDaggerModifier.prototype.OnIntervalThink(self)
    local ability = self:GetAbility()
    if ability:IsFullyCastable() and ability.damageCooldown then
        ability.damageCooldown = false
    end
end
function BlinkDaggerModifier.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function BlinkDaggerModifier.prototype.OnTakeDamage(self, event)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local attacker = event.attacker
    if not IsServer() then
        return
    end
    if attacker == parent then
        return
    end
    if event.unit ~= parent then
        return
    end
    if event.damage <= 0 then
        return
    end
    if bit.band(event.damage_flags, DOTA_DAMAGE_FLAG_HPLOSS) == DOTA_DAMAGE_FLAG_HPLOSS then
        return
    end
    if not (attacker:IsHero() or attacker:IsRoshan() or attacker:IsFountain()) then
        return
    end
    local damageCooldown = ability:GetSpecialValueFor("blink_damage_cooldown")
    if ability:GetCooldownTime() > damageCooldown then
        return
    end
    ability.damageCooldown = true
    ability:EndCooldown()
    ability:StartCooldown(damageCooldown)
end
return ____exports
