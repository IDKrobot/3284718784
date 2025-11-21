local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 3,["16"] = 3,["17"] = 4,["18"] = 6,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 11,["23"] = 12,["24"] = 12});
local ____exports = {}
local ____map_settings = require("lib.map_settings")
local MapSettings = ____map_settings.MapSettings
local RuneSpawner = ____map_settings.RuneSpawner
____exports.DotaMap = __TS__Class()
local DotaMap = ____exports.DotaMap
DotaMap.name = "DotaMap"
__TS__ClassExtends(DotaMap, MapSettings)
function DotaMap.prototype.____constructor(self)
    MapSettings.prototype.____constructor(self, "dota")
    self.runeSpawner = __TS__New(RuneSpawner)
end
function DotaMap.prototype.OnNpcSpawned(self, event)
end
function DotaMap.prototype.OnEntityKilled(self, event)
end
function DotaMap.prototype.StartGame(self)
end
return ____exports
