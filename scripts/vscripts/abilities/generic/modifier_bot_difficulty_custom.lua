local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 8,["12"] = 27,["13"] = 28,["14"] = 27,["15"] = 28,["17"] = 28,["18"] = 29,["19"] = 27,["20"] = 31,["21"] = 32,["22"] = 31,["23"] = 35,["24"] = 36,["25"] = 35,["26"] = 39,["27"] = 40,["28"] = 39,["29"] = 43,["30"] = 44,["31"] = 43,["32"] = 47,["33"] = 48,["34"] = 47,["35"] = 51,["36"] = 52,["37"] = 51,["38"] = 55,["39"] = 56,["40"] = 58,["41"] = 55,["42"] = 61,["43"] = 62,["44"] = 61,["45"] = 68,["46"] = 69,["47"] = 68,["48"] = 72,["49"] = 73,["50"] = 72,["51"] = 28,["52"] = 28,["53"] = 28,["54"] = 27,["57"] = 28});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local BOT_DIFFICULTIES = {[0] = {outgoing_damage = -15, incoming_damage = 15}, [1] = {outgoing_damage = 0, incoming_damage = 0}, [2] = {outgoing_damage = 15, incoming_damage = -15}, [3] = {outgoing_damage = 30, incoming_damage = -30}}
____exports.modifier_bot_difficulty_custom = __TS__Class()
local modifier_bot_difficulty_custom = ____exports.modifier_bot_difficulty_custom
modifier_bot_difficulty_custom.name = "modifier_bot_difficulty_custom"
__TS__ClassExtends(modifier_bot_difficulty_custom, BaseModifier)
function modifier_bot_difficulty_custom.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.bonuses = BOT_DIFFICULTIES[1]
end
function modifier_bot_difficulty_custom.prototype.IsHidden(self)
    return true
end
function modifier_bot_difficulty_custom.prototype.IsPurgable(self)
    return false
end
function modifier_bot_difficulty_custom.prototype.RemoveOnDeath(self)
    return false
end
function modifier_bot_difficulty_custom.prototype.AllowIllusionDuplicate(self)
    return true
end
function modifier_bot_difficulty_custom.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_PERMANENT
end
function modifier_bot_difficulty_custom.prototype.OnCreated(self, params)
    self:StartIntervalThink(1)
end
function modifier_bot_difficulty_custom.prototype.OnIntervalThink(self)
    self.bonuses = BOT_DIFFICULTIES[self:GetStackCount()]
    self:StopIntervalThink()
end
function modifier_bot_difficulty_custom.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE, MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE}
end
function modifier_bot_difficulty_custom.prototype.GetModifierTotalDamageOutgoing_Percentage(self, event)
    return self.bonuses.outgoing_damage
end
function modifier_bot_difficulty_custom.prototype.GetModifierIncomingDamage_Percentage(self, event)
    return self.bonuses.incoming_damage
end
modifier_bot_difficulty_custom = __TS__Decorate(
    modifier_bot_difficulty_custom,
    modifier_bot_difficulty_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_bot_difficulty_custom"}
)
____exports.modifier_bot_difficulty_custom = modifier_bot_difficulty_custom
return ____exports
