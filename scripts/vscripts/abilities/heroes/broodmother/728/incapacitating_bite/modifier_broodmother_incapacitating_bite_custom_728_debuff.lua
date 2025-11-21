local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 36,["20"] = 37,["21"] = 3,["22"] = 8,["23"] = 9,["24"] = 8,["25"] = 12,["26"] = 13,["27"] = 12,["28"] = 16,["29"] = 17,["30"] = 16,["31"] = 20,["32"] = 21,["33"] = 22,["34"] = 20,["35"] = 25,["36"] = 26,["37"] = 25,["38"] = 29,["39"] = 30,["40"] = 29,["41"] = 39,["42"] = 40,["43"] = 39,["44"] = 43,["45"] = 44,["46"] = 43,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 3,["53"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_incapacitating_bite_custom_728_debuff = __TS__Class()
local modifier_broodmother_incapacitating_bite_custom_728_debuff = ____exports.modifier_broodmother_incapacitating_bite_custom_728_debuff
modifier_broodmother_incapacitating_bite_custom_728_debuff.name = "modifier_broodmother_incapacitating_bite_custom_728_debuff"
__TS__ClassExtends(modifier_broodmother_incapacitating_bite_custom_728_debuff, BaseModifier)
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.miss = 0
    self.move_speed = 0
    self.GetModifierMiss_Percentage = function() return self.miss end
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.move_speed end
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.IsHidden(self)
    return false
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.IsPurgable(self)
    return true
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.IsDebuff(self)
    return true
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.OnCreated(self, params)
    self.miss = self:GetSpecialValueFor("miss_chance")
    self.move_speed = self:GetSpecialValueFor("bonus_movespeed")
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.OnRefresh(self, params)
    self:OnCreated(params)
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MISS_PERCENTAGE, MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_broodmother/broodmother_incapacitatingbite_debuff.vpcf"
end
function modifier_broodmother_incapacitating_bite_custom_728_debuff.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_broodmother_incapacitating_bite_custom_728_debuff = __TS__Decorate(
    modifier_broodmother_incapacitating_bite_custom_728_debuff,
    modifier_broodmother_incapacitating_bite_custom_728_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_incapacitating_bite_custom_728_debuff"}
)
____exports.modifier_broodmother_incapacitating_bite_custom_728_debuff = modifier_broodmother_incapacitating_bite_custom_728_debuff
return ____exports
