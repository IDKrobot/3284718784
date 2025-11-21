local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 6,["21"] = 11,["22"] = 12,["23"] = 11,["24"] = 5,["25"] = 5,["26"] = 5,["27"] = 4,["30"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_broodmother_incapacitating_bite_custom_728 = require("abilities.heroes.broodmother.728.incapacitating_bite.modifier_broodmother_incapacitating_bite_custom_728")
local modifier_broodmother_incapacitating_bite_custom_728 = ____modifier_broodmother_incapacitating_bite_custom_728.modifier_broodmother_incapacitating_bite_custom_728
____exports.broodmother_incapacitating_bite_custom_728 = __TS__Class()
local broodmother_incapacitating_bite_custom_728 = ____exports.broodmother_incapacitating_bite_custom_728
broodmother_incapacitating_bite_custom_728.name = "broodmother_incapacitating_bite_custom_728"
__TS__ClassExtends(broodmother_incapacitating_bite_custom_728, BaseAbility)
function broodmother_incapacitating_bite_custom_728.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_broodmother.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_broodmother.vsndevts")
end
function broodmother_incapacitating_bite_custom_728.prototype.GetIntrinsicModifierName(self)
    return modifier_broodmother_incapacitating_bite_custom_728.name
end
broodmother_incapacitating_bite_custom_728 = __TS__Decorate(
    broodmother_incapacitating_bite_custom_728,
    broodmother_incapacitating_bite_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "broodmother_incapacitating_bite_custom_728"}
)
____exports.broodmother_incapacitating_bite_custom_728 = broodmother_incapacitating_bite_custom_728
return ____exports
