local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 9,["14"] = 9,["15"] = 9,["17"] = 9,["18"] = 27,["19"] = 28,["20"] = 29,["21"] = 29,["22"] = 29,["23"] = 29,["24"] = 29,["25"] = 29,["26"] = 29,["27"] = 31,["28"] = 31,["29"] = 31,["30"] = 32,["31"] = 33,["34"] = 35,["35"] = 31,["36"] = 31,["37"] = 27,["38"] = 39,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 41,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 40,["48"] = 40,["49"] = 40,["50"] = 40,["51"] = 47,["52"] = 47,["54"] = 49,["55"] = 39,["56"] = 52,["57"] = 53,["58"] = 53,["59"] = 53,["60"] = 54,["63"] = 56,["64"] = 58,["65"] = 60,["66"] = 60,["67"] = 60,["68"] = 60,["69"] = 60,["70"] = 60,["71"] = 60,["72"] = 60,["73"] = 60,["74"] = 60,["75"] = 60,["76"] = 72,["77"] = 72,["78"] = 72,["79"] = 73,["80"] = 72,["81"] = 72,["82"] = 81,["83"] = 81,["84"] = 81,["85"] = 82,["86"] = 84,["87"] = 86,["88"] = 81,["89"] = 81,["90"] = 94,["91"] = 95,["93"] = 53,["94"] = 53,["95"] = 99,["96"] = 52,["98"] = 14,["99"] = 16,["100"] = 16,["101"] = 16,["102"] = 16,["103"] = 16,["104"] = 16,["105"] = 16,["106"] = 16,["107"] = 16,["108"] = 9});
local ____exports = {}
____exports.NeutralCamps = __TS__Class()
local NeutralCamps = ____exports.NeutralCamps
NeutralCamps.name = "NeutralCamps"
function NeutralCamps.prototype.____constructor(self)
end
function NeutralCamps.Init(self)
    local spawners = Entities:FindAllByClassname("npc_dota_neutral_spawner")
    local triggers = __TS__ArrayFilter(
        Entities:FindAllByClassname("trigger_multiple"),
        function(____, trigger) return __TS__StringIncludes(
            trigger:GetName(),
            "neutralcamp_"
        ) end
    )
    __TS__ArrayForEach(
        triggers,
        function(____, trigger, i)
            local spawner = self:FindClosestSpawner(trigger, spawners)
            if spawner == nil then
                return
            end
            self.camps[i] = {spawner, trigger}
        end
    )
end
function NeutralCamps.FindClosestSpawner(self, trigger, spawners)
    local sortedSpawners = __TS__ArraySort(
        __TS__ArrayMap(
            spawners,
            function(____, spawner)
                return {
                    spawner = spawner,
                    length = trigger:GetAbsOrigin():__sub(spawner:GetAbsOrigin()):Length2D()
                }
            end
        ),
        function(____, a, b) return a.length - b.length end
    )
    if #sortedSpawners == 0 then
        return nil
    end
    return sortedSpawners[1].spawner
end
function NeutralCamps.OnThink(self)
    __TS__ArrayForEach(
        __TS__ObjectValues(self.camps),
        function(____, camp)
            if camp == nil then
                return
            end
            local spawner, trigger = unpack(camp)
            local radius = trigger:GetBoundingMins():__sub(trigger:GetBoundingMaxs()):Length2D()
            local units = FindUnitsInRadius(
                DOTA_TEAM_NEUTRALS,
                trigger:GetAbsOrigin(),
                nil,
                radius,
                DOTA_UNIT_TARGET_TEAM_BOTH,
                DOTA_UNIT_TARGET_ALL,
                bit.bor(DOTA_UNIT_TARGET_FLAG_INVULNERABLE, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES),
                FIND_ANY_ORDER,
                false
            )
            local dota_filter = __TS__ArrayFilter(
                units,
                function(____, unit)
                    return IsValidEntity(unit) and unit:IsBaseNPC() and unit:IsAlive() and trigger:IsTouching(unit) and not unit:IsOutOfGame() and not unit:IsCourier()
                end
            )
            local custom_filter = __TS__ArrayFilter(
                dota_filter,
                function(____, unit)
                    local unitName = unit:GetUnitName()
                    local unit_info = IsValidEntity(unit) and GetUnitKeyValuesByName(unitName) or nil
                    return (unit_info == nil or unit_info.CustomData == nil or unit_info.CustomData.BlockNeutralCamps == nil or unit_info.CustomData.BlockNeutralCamps == 1) and not __TS__ArrayIncludes(self.exceptions, unitName)
                end
            )
            if #dota_filter > 0 and #custom_filter <= 0 then
                spawner:SpawnNextBatch(true)
            end
        end
    )
    return 60
end;
(function(self)
    self.camps = {}
    self.exceptions = {
        "npc_dota_templar_assassin_psionic_trap",
        "npc_dota_broodmother_web",
        "npc_dota_beastmaster_hawk",
        "npc_dota_beastmaster_hawk_2",
        "npc_dota_beastmaster_hawk_3",
        "npc_dota_beastmaster_hawk_4",
        "npc_dota_clinkz_skeleton_archer"
    }
end)(NeutralCamps)
return ____exports
