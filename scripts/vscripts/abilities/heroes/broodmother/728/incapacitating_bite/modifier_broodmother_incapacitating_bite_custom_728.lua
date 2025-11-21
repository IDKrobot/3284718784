local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 20,["29"] = 21,["32"] = 22,["35"] = 23,["38"] = 24,["41"] = 25,["44"] = 27,["45"] = 27,["46"] = 27,["47"] = 27,["48"] = 27,["49"] = 27,["50"] = 16,["51"] = 5,["52"] = 5,["53"] = 5,["54"] = 4,["57"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_broodmother_incapacitating_bite_custom_728_debuff = require("abilities.heroes.broodmother.728.incapacitating_bite.modifier_broodmother_incapacitating_bite_custom_728_debuff")
local modifier_broodmother_incapacitating_bite_custom_728_debuff = ____modifier_broodmother_incapacitating_bite_custom_728_debuff.modifier_broodmother_incapacitating_bite_custom_728_debuff
____exports.modifier_broodmother_incapacitating_bite_custom_728 = __TS__Class()
local modifier_broodmother_incapacitating_bite_custom_728 = ____exports.modifier_broodmother_incapacitating_bite_custom_728
modifier_broodmother_incapacitating_bite_custom_728.name = "modifier_broodmother_incapacitating_bite_custom_728"
__TS__ClassExtends(modifier_broodmother_incapacitating_bite_custom_728, BaseModifier)
function modifier_broodmother_incapacitating_bite_custom_728.prototype.IsHidden(self)
    return true
end
function modifier_broodmother_incapacitating_bite_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end
function modifier_broodmother_incapacitating_bite_custom_728.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    if parent:PassivesDisabled() then
        return
    end
    modifier_broodmother_incapacitating_bite_custom_728_debuff:apply(
        target,
        parent,
        self:GetAbility(),
        {duration = target:CalculateDuration(parent, 2)}
    )
end
modifier_broodmother_incapacitating_bite_custom_728 = __TS__Decorate(
    modifier_broodmother_incapacitating_bite_custom_728,
    modifier_broodmother_incapacitating_bite_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_incapacitating_bite_custom_728"}
)
____exports.modifier_broodmother_incapacitating_bite_custom_728 = modifier_broodmother_incapacitating_bite_custom_728
return ____exports
