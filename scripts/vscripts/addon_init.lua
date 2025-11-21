local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 2,["6"] = 3,["7"] = 5,["8"] = 6,["10"] = 9});
LinkLuaModifier("modifier_generic_knockback", "abilities/generic/modifier_generic_knockback.lua", LUA_MODIFIER_MOTION_BOTH)
LinkLuaModifier("modifier_generic_arc", "abilities/generic/modifier_generic_arc.lua", LUA_MODIFIER_MOTION_BOTH)
LinkLuaModifier("modifier_generic_orb_effect_lua", "abilities/generic/modifier_generic_orb_effect_lua.lua", LUA_MODIFIER_MOTION_NONE)
if IsClient() then
    require("lib.dota_utils_client")
end
SendToConsole("dota_player_teleport_requires_halt " .. tostring(Convars:GetInt("dota_player_teleport_requires_halt")))
