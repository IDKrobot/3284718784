local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 14,["18"] = 14,["19"] = 14,["21"] = 15,["22"] = 17,["23"] = 18,["24"] = 20,["25"] = 22,["26"] = 22,["27"] = 22,["28"] = 23,["29"] = 25,["30"] = 22,["31"] = 22,["32"] = 17,["33"] = 29,["34"] = 30,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 34,["42"] = 35,["43"] = 37,["44"] = 37,["45"] = 37,["46"] = 37,["47"] = 37,["48"] = 37,["49"] = 37,["50"] = 37,["51"] = 38,["52"] = 38,["53"] = 38,["54"] = 38,["55"] = 38,["56"] = 38,["57"] = 33,["58"] = 33,["59"] = 29,["60"] = 49,["61"] = 50,["62"] = 52,["63"] = 54,["64"] = 56,["65"] = 57,["66"] = 57,["67"] = 57,["68"] = 57,["69"] = 58,["70"] = 60,["71"] = 56,["72"] = 63,["73"] = 63,["75"] = 65,["76"] = 66,["77"] = 67,["78"] = 68,["80"] = 70,["81"] = 70,["82"] = 71,["83"] = 71,["84"] = 71,["85"] = 71,["86"] = 71,["87"] = 76,["88"] = 78,["89"] = 79,["91"] = 70,["94"] = 82,["95"] = 83,["97"] = 86,["99"] = 49});
local ____exports = {}
local ____modifier_rune_icon = require("abilities.generic.modifier_rune_icon")
local modifier_rune_icon = ____modifier_rune_icon.modifier_rune_icon
____exports.MapSettings = __TS__Class()
local MapSettings = ____exports.MapSettings
MapSettings.name = "MapSettings"
function MapSettings.prototype.____constructor(self, name)
    self.name = name
end
____exports.RuneSpawner = __TS__Class()
local RuneSpawner = ____exports.RuneSpawner
RuneSpawner.name = "RuneSpawner"
function RuneSpawner.prototype.____constructor(self)
end
function RuneSpawner.prototype.StartCycle(self)
    self:SpawnBounty()
    local delay = 180
    Timers:CreateTimer(
        delay - FrameTime() - 0.2,
        function()
            self:SpawnBounty()
            return delay
        end
    )
end
function RuneSpawner.prototype.SpawnBounty(self)
    local positions = __TS__ArrayMap(
        Entities:FindAllByName("dota_item_rune_spawner_bounty"),
        function(____, spawner) return spawner:GetAbsOrigin() end
    )
    __TS__ArrayForEach(
        positions,
        function(____, point)
            local spawnPoint = self:FindRunePosition(point)
            local realRune = CreateRune(spawnPoint, DOTA_RUNE_BOUNTY)
            local runeIcon = CreateUnitByName(
                "npc_rune_icon",
                point,
                false,
                nil,
                nil,
                DOTA_TEAM_NEUTRALS
            )
            modifier_rune_icon:apply(
                runeIcon,
                runeIcon,
                nil,
                {rune_index = realRune:entindex()}
            )
        end
    )
end
function RuneSpawner.prototype.FindRunePosition(self, point)
    local runeRadius = 80
    local ANGLE_STEP = 10 * (math.pi / 180)
    local runes = Entities:FindAllByClassname("dota_item_rune")
    local function isValidPosition(____, target)
        local isFree = __TS__ArrayEvery(
            runes,
            function(____, rune) return rune:GetAbsOrigin():__sub(target):Length() >= runeRadius end
        )
        local isPathValid = GridNav:CanFindPath(point, target)
        return isFree and isPathValid
    end
    if isValidPosition(nil, point) then
        return point
    end
    local n = 1
    while true do
        local radius = runeRadius * n
        local candidates = {}
        do
            local angle = 0
            while angle < 2 * math.pi do
                local candidate = Vector(
                    point.x + radius * math.cos(angle),
                    point.y + radius * math.sin(angle),
                    point.z
                )
                candidate.z = GetGroundHeight(candidate, nil)
                if isValidPosition(nil, candidate) then
                    candidates[#candidates + 1] = candidate
                end
                angle = angle + ANGLE_STEP
            end
        end
        if #candidates > 0 then
            return candidates[RandomInt(0, #candidates - 1) + 1]
        end
        n = n + 1
    end
end
return ____exports
