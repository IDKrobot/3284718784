local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 2,["19"] = 4,["20"] = 4,["21"] = 6,["22"] = 7,["23"] = 6,["24"] = 7,["26"] = 7,["27"] = 8,["28"] = 10,["29"] = 12,["30"] = 16,["31"] = 17,["32"] = 16,["33"] = 20,["34"] = 21,["35"] = 22,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 27,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 29,["48"] = 20,["49"] = 33,["50"] = 34,["51"] = 35,["52"] = 36,["55"] = 38,["57"] = 33,["58"] = 45,["59"] = 46,["60"] = 47,["61"] = 47,["62"] = 47,["63"] = 47,["64"] = 49,["65"] = 50,["67"] = 45,["68"] = 59,["69"] = 60,["70"] = 61,["71"] = 62,["72"] = 63,["73"] = 64,["74"] = 65,["76"] = 60,["77"] = 69,["78"] = 70,["79"] = 71,["80"] = 73,["81"] = 77,["82"] = 77,["83"] = 77,["84"] = 78,["85"] = 78,["86"] = 78,["87"] = 78,["88"] = 80,["89"] = 82,["90"] = 83,["92"] = 85,["93"] = 86,["95"] = 88,["96"] = 89,["98"] = 92,["99"] = 77,["100"] = 77,["101"] = 59,["102"] = 96,["103"] = 97,["104"] = 99,["105"] = 101,["106"] = 101,["107"] = 101,["108"] = 101,["109"] = 101,["110"] = 102,["111"] = 96,["112"] = 107,["113"] = 108,["114"] = 110,["115"] = 110,["116"] = 110,["117"] = 111,["118"] = 113,["119"] = 110,["120"] = 110,["121"] = 107,["122"] = 117,["123"] = 118,["124"] = 119,["125"] = 121,["126"] = 123,["127"] = 125,["128"] = 125,["129"] = 125,["130"] = 125,["131"] = 125,["132"] = 125,["133"] = 126,["134"] = 128,["135"] = 128,["136"] = 128,["137"] = 128,["138"] = 128,["139"] = 128,["140"] = 129,["141"] = 131,["142"] = 132,["144"] = 128,["145"] = 128,["146"] = 136,["147"] = 125,["148"] = 125,["149"] = 142,["150"] = 142,["151"] = 142,["152"] = 143,["153"] = 143,["154"] = 143,["155"] = 143,["156"] = 143,["157"] = 143,["158"] = 149,["159"] = 142,["160"] = 142,["161"] = 117,["162"] = 6,["163"] = 7});
local ____exports = {}
local ____tstl_2Dutils = require("lib.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____map_settings = require("lib.map_settings")
local MapSettings = ____map_settings.MapSettings
local RuneSpawner = ____map_settings.RuneSpawner
local ____modifier_old_magic_resistance = require("abilities.generic.modifier_old_magic_resistance")
local modifier_old_magic_resistance = ____modifier_old_magic_resistance.modifier_old_magic_resistance
____exports.Dota728Map = __TS__Class()
local Dota728Map = ____exports.Dota728Map
Dota728Map.name = "Dota728Map"
__TS__ClassExtends(Dota728Map, MapSettings)
function Dota728Map.prototype.____constructor(self)
    MapSettings.prototype.____constructor(self, "dota_728")
    self.runeSpawner = __TS__New(RuneSpawner)
    self.roshanKills = 0
end
function Dota728Map.prototype.StartGame(self)
    self:StartOutpostCycle()
end
function Dota728Map.prototype.OnNpcSpawned(self, event)
    local unit = EntIndexToHScript(event.entindex)
    if not unit then
        return
    end
    if unit:IsHero() then
        self:InitHero(unit, event.is_respawn == 1)
    elseif unit:IsRoshan() then
        self:InitRoshan(unit)
    elseif __TS__StringIncludes(
        unit:GetUnitName(),
        "flagbearer"
    ) then
        self:InitFlagbearer(unit)
    end
end
function Dota728Map.prototype.OnEntityKilled(self, event)
    local killed = EntIndexToHScript(event.entindex_killed)
    local killer = EntIndexToHScript(event.entindex_attacker)
    if not killed or not killer then
        return
    end
    if killed:IsNeutralUnitType() or killed:IsAncient() then
    end
end
function Dota728Map.prototype.InitHero(self, hero, is_respawn)
    hero:RemoveModifierByName("modifier_fountain_invulnerability")
    Timers:CreateTimer(
        FrameTime(),
        function() return hero:RemoveModifierByName("modifier_fountain_invulnerability") end
    )
    if not is_respawn then
        modifier_old_magic_resistance:apply(hero, hero, nil, {})
    end
end
function Dota728Map.prototype.InitRoshan(self, roshan)
    local function disableAbility(____, abilityName)
        local ability = roshan:FindAbilityByName(abilityName)
        if ability then
            ability:SetFrozenCooldown(true)
            ability:StartCooldown(1)
            ability:SetHidden(true)
        end
    end
    disableAbility(nil, "roshan_revengeroar")
    disableAbility(nil, "roshan_teleport")
    disableAbility(nil, "roshan_grab_and_throw")
    roshan:SetPhysicalArmorBaseValue(20)
    Timers:CreateTimer(
        0.1,
        function()
            __TS__ArrayForEach(
                roshan:GetItems(5),
                function(____, item) return UTIL_Remove(item) end
            )
            roshan:AddItemByName("item_aegis")
            if self.roshanKills >= 2 then
                roshan:AddItemByName("item_cheese")
            end
            if self.roshanKills >= 4 then
                roshan:AddItemByName("item_refresher_shard")
            end
            if self.roshanKills >= 3 then
                roshan:AddItemByName("item_ultimate_scepter_2")
            end
            self.roshanKills = self.roshanKills + 1
        end
    )
end
function Dota728Map.prototype.InitFlagbearer(self, flagbearer)
    flagbearer:RemoveAbility("flagbearer_creep_aura_effect")
    flagbearer:SetBaseMagicalResistanceValue(0)
    local unit_name = __TS__StringReplace(
        flagbearer:GetUnitName(),
        "flagbearer",
        "melee"
    )
    flagbearer:SetUnitName(unit_name)
end
function Dota728Map.prototype.StartOutpostCycle(self)
    local interval = 10 * 60
    Timers:CreateTimer(
        interval - 0.2,
        function()
            self:GiveOutpostXP()
            return interval
        end
    )
end
function Dota728Map.prototype.GiveOutpostXP(self)
    local minutes = math.floor(GameRules:GetDOTATime(false, false) / 60)
    local bonusXP = 20 * minutes - 50
    local outposts = Entities:FindAllByClassname("npc_dota_watch_tower")
    local heroes = {}
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            outposts,
            function(____, outpost) return outpost ~= nil end
        ),
        function(____, outpost)
            local team = outpost:GetTeamNumber()
            __TS__ArrayForEach(
                __TS__ArrayFilter(
                    HeroList:GetAllHeroes(),
                    function(____, hero) return hero:IsFullyRealHero() and hero:GetTeamNumber() == team end
                ),
                function(____, hero)
                    hero:AddExperience(bonusXP, DOTA_ModifyXP_Outpost, false, false)
                    if hero:IsAlive() and not __TS__ArrayIncludes(heroes, hero) then
                        heroes[#heroes + 1] = hero
                    end
                end
            )
            CustomGameEventManager:Send_ServerToAllClients("outpost_combat_event", {team = team, xp = bonusXP})
        end
    )
    __TS__ArrayForEach(
        heroes,
        function(____, hero)
            local particle = ParticleManager:CreateParticleForTeam(
                "particles/generic_gameplay/outpost_reward.vpcf",
                PATTACH_ABSORIGIN_FOLLOW,
                hero,
                hero:GetTeamNumber()
            )
            ParticleManager:ReleaseParticleIndex(particle)
        end
    )
end
Dota728Map = __TS__Decorate(Dota728Map, Dota728Map, {reloadable}, {kind = "class", name = "Dota728Map"})
____exports.Dota728Map = Dota728Map
return ____exports
