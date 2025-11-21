local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 7,["20"] = 7,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 12,["26"] = 25,["27"] = 26,["28"] = 27,["29"] = 25,["30"] = 30,["31"] = 31,["32"] = 30,["33"] = 34,["34"] = 35,["35"] = 36,["37"] = 38,["38"] = 40,["40"] = 40,["42"] = 41,["44"] = 41,["46"] = 42,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 42,["54"] = 40,["57"] = 34,["58"] = 46,["59"] = 47,["60"] = 49,["61"] = 49,["62"] = 50,["63"] = 50,["64"] = 51,["65"] = 51,["67"] = 53,["68"] = 55,["69"] = 55,["70"] = 55,["71"] = 55,["72"] = 55,["73"] = 55,["74"] = 55,["75"] = 46,["76"] = 64,["77"] = 65,["78"] = 67,["79"] = 64,["80"] = 70,["81"] = 71,["82"] = 73,["83"] = 75,["84"] = 75,["85"] = 75,["86"] = 75,["87"] = 75,["88"] = 75,["89"] = 75,["90"] = 75,["91"] = 75,["92"] = 75,["93"] = 75,["94"] = 75,["95"] = 75,["96"] = 75,["97"] = 87,["98"] = 87,["99"] = 87,["100"] = 87,["101"] = 87,["102"] = 87,["103"] = 87,["104"] = 87,["105"] = 87,["106"] = 87,["107"] = 87,["108"] = 87,["109"] = 87,["110"] = 87,["111"] = 99,["112"] = 100,["113"] = 101,["114"] = 103,["115"] = 104,["116"] = 106,["117"] = 107,["120"] = 110,["121"] = 111,["124"] = 114,["125"] = 114,["127"] = 116,["128"] = 117,["129"] = 119,["130"] = 120,["131"] = 122,["132"] = 70,["133"] = 125,["134"] = 126,["135"] = 127,["136"] = 129,["137"] = 130,["138"] = 132,["139"] = 133,["140"] = 133,["141"] = 133,["142"] = 133,["143"] = 133,["144"] = 133,["145"] = 133,["146"] = 133,["147"] = 133,["148"] = 133,["149"] = 133,["150"] = 145,["151"] = 145,["152"] = 145,["153"] = 145,["155"] = 148,["156"] = 149,["157"] = 149,["158"] = 149,["159"] = 149,["160"] = 149,["161"] = 149,["162"] = 149,["163"] = 149,["164"] = 149,["165"] = 149,["166"] = 149,["167"] = 149,["168"] = 149,["169"] = 149,["170"] = 161,["173"] = 163,["175"] = 166,["176"] = 168,["177"] = 169,["180"] = 171,["181"] = 173,["182"] = 175,["183"] = 184,["184"] = 185,["186"] = 193,["187"] = 194,["188"] = 194,["189"] = 194,["190"] = 194,["191"] = 194,["192"] = 194,["193"] = 194,["194"] = 194,["195"] = 195,["196"] = 196,["197"] = 197,["198"] = 199,["200"] = 202,["201"] = 203,["202"] = 204,["204"] = 206,["205"] = 207,["207"] = 210,["208"] = 212,["209"] = 213,["210"] = 214,["212"] = 216,["213"] = 216,["214"] = 216,["215"] = 217,["216"] = 218,["217"] = 219,["219"] = 216,["220"] = 216,["221"] = 223,["222"] = 223,["223"] = 223,["224"] = 224,["225"] = 224,["226"] = 224,["227"] = 224,["228"] = 224,["229"] = 225,["230"] = 223,["231"] = 223,["232"] = 228,["233"] = 228,["234"] = 228,["235"] = 228,["236"] = 228,["237"] = 228,["238"] = 228,["239"] = 229,["240"] = 229,["241"] = 229,["242"] = 229,["243"] = 229,["244"] = 229,["245"] = 229,["246"] = 229,["247"] = 125,["248"] = 232,["249"] = 233,["250"] = 235,["253"] = 238,["254"] = 244,["256"] = 232,["257"] = 248,["258"] = 249,["259"] = 251,["262"] = 253,["263"] = 254,["264"] = 256,["265"] = 258,["266"] = 258,["267"] = 258,["268"] = 258,["269"] = 258,["270"] = 258,["271"] = 258,["272"] = 258,["273"] = 260,["274"] = 262,["275"] = 263,["276"] = 264,["278"] = 266,["279"] = 267,["280"] = 269,["281"] = 270,["285"] = 275,["286"] = 277,["287"] = 278,["288"] = 280,["289"] = 248,["290"] = 283,["291"] = 284,["292"] = 286,["293"] = 287,["294"] = 287,["299"] = 287,["300"] = 291,["301"] = 292,["302"] = 297,["303"] = 297,["304"] = 297,["305"] = 297,["306"] = 297,["307"] = 298,["308"] = 298,["309"] = 298,["310"] = 298,["311"] = 298,["312"] = 300,["313"] = 301,["314"] = 306,["315"] = 306,["316"] = 306,["317"] = 306,["318"] = 306,["319"] = 306,["320"] = 306,["321"] = 306,["322"] = 306,["323"] = 307,["324"] = 307,["325"] = 307,["326"] = 307,["327"] = 307,["328"] = 307,["329"] = 307,["330"] = 307,["331"] = 307,["332"] = 308,["333"] = 308,["334"] = 308,["335"] = 308,["336"] = 308,["337"] = 308,["338"] = 308,["339"] = 308,["340"] = 308,["341"] = 309,["342"] = 309,["343"] = 309,["344"] = 309,["345"] = 309,["346"] = 310,["347"] = 310,["348"] = 310,["349"] = 310,["350"] = 310,["351"] = 310,["352"] = 310,["353"] = 310,["354"] = 310,["355"] = 283,["356"] = 313,["357"] = 314,["358"] = 315,["359"] = 316,["360"] = 318,["362"] = 321,["363"] = 322,["364"] = 323,["365"] = 325,["367"] = 313,["368"] = 12,["369"] = 12,["370"] = 12,["371"] = 11,["374"] = 12});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_tinker_keen_teleport_custom_730_channel = require("abilities.heroes.tinker.730.keen_teleport.modifier_tinker_keen_teleport_custom_730_channel")
local modifier_tinker_keen_teleport_custom_730_channel = ____modifier_tinker_keen_teleport_custom_730_channel.modifier_tinker_keen_teleport_custom_730_channel
local ____modifier_tinker_keen_teleport_custom_730_incoming = require("abilities.heroes.tinker.730.keen_teleport.modifier_tinker_keen_teleport_custom_730_incoming")
local modifier_tinker_keen_teleport_custom_730_incoming = ____modifier_tinker_keen_teleport_custom_730_incoming.modifier_tinker_keen_teleport_custom_730_incoming
local ____modifier_tinker_keen_teleport_custom_730_teleporting = require("abilities.heroes.tinker.730.keen_teleport.modifier_tinker_keen_teleport_custom_730_teleporting")
local modifier_tinker_keen_teleport_custom_730_teleporting = ____modifier_tinker_keen_teleport_custom_730_teleporting.modifier_tinker_keen_teleport_custom_730_teleporting
local function getRadius(____, unit, maxRadius)
    return unit:IsOutpost() and 240 or maxRadius
end
____exports.tinker_keen_teleport_custom_730 = __TS__Class()
local tinker_keen_teleport_custom_730 = ____exports.tinker_keen_teleport_custom_730
tinker_keen_teleport_custom_730.name = "tinker_keen_teleport_custom_730"
__TS__ClassExtends(tinker_keen_teleport_custom_730, BaseAbility)
function tinker_keen_teleport_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function tinker_keen_teleport_custom_730.prototype.GetIntrinsicModifierName(self)
    return modifier_tinker_keen_teleport_custom_730_channel.name
end
function tinker_keen_teleport_custom_730.prototype.GetTargetType(self)
    local creepTeleportLevel = self:GetSpecialValueFor("creep_teleport_level")
    local heroTeleportLevel = self:GetSpecialValueFor("hero_teleport_level")
    repeat
        local ____switch6 = self:GetLevel()
        local ____cond6 = ____switch6 == 1
        if ____cond6 then
            return DOTA_UNIT_TARGET_BUILDING
        end
        ____cond6 = ____cond6 or ____switch6 == creepTeleportLevel
        if ____cond6 then
            return bit.bor(DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_BASIC)
        end
        ____cond6 = ____cond6 or ____switch6 == heroTeleportLevel
        if ____cond6 then
            return bit.bor(
                bit.bor(DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_BASIC),
                DOTA_UNIT_TARGET_HERO
            )
        end
        do
            return DOTA_UNIT_TARGET_BUILDING
        end
    until true
end
function tinker_keen_teleport_custom_730.prototype.CastFilterResultTarget(self, target)
    local caster = self:GetCaster()
    if target == caster then
        return UF_SUCCESS
    elseif target:IsCourier() then
        return UF_FAIL_COURIER
    elseif target:IsWatcher() then
        return UF_FAIL_OTHER
    end
    local targetType = self:GetTargetType()
    return UnitFilter(
        target,
        DOTA_UNIT_TARGET_TEAM_FRIENDLY,
        targetType,
        DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
        caster:GetTeamNumber()
    )
end
function tinker_keen_teleport_custom_730.prototype.GetChannelTime(self)
    local caster = self:GetCaster()
    return caster:GetModifierStackCount(modifier_tinker_keen_teleport_custom_730_channel.name, caster) / 100
end
function tinker_keen_teleport_custom_730.prototype.FindPositionToTeleport(self, point)
    local caster = self:GetCaster()
    local maxRadius = self:GetSpecialValueFor("maximum_distance")
    local units = __TS__ArrayFilter(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            point,
            nil,
            FIND_UNITS_EVERYWHERE,
            1,
            self:GetTargetType(),
            64,
            1,
            false
        ),
        function(____, unit) return not unit:IsWatcher() end
    )
    local buildings = __TS__ArrayFilter(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            point,
            nil,
            maxRadius,
            1,
            4,
            64,
            1,
            false
        ),
        function(____, building) return not building:IsWatcher() end
    )
    if #buildings > 0 then
        local building = buildings[1]
        local buildingRadius = getRadius(nil, building, maxRadius)
        if #units > 0 then
            local unit = units[1]
            if not unit:IsBuildingType() and unit:GetAbsOrigin():__sub(point):Length2D() < buildingRadius then
                return nil
            end
        end
        if building:GetAbsOrigin():__sub(point):Length2D() < buildingRadius then
            return point
        end
    end
    if #units == 0 or not units[1]:IsBuildingType() then
        return nil
    end
    local unit = units[1]
    local unitOrigin = unit:GetAbsOrigin()
    local vector = point:__sub(unitOrigin)
    local unitVector = vector:__mul(1 / vector:Length2D())
    return unitOrigin:__add(unitVector:__mul(getRadius(nil, unit, maxRadius)))
end
function tinker_keen_teleport_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local cursorPosition = self:GetCursorPosition()
    local point = self:FindPositionToTeleport(cursorPosition)
    if target and target == caster then
        local buildings = FindUnitsInRadius(
            caster:GetTeamNumber(),
            Vector(0, 0, 0),
            nil,
            FIND_UNITS_EVERYWHERE,
            DOTA_UNIT_TARGET_TEAM_FRIENDLY,
            DOTA_UNIT_TARGET_BUILDING,
            DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
            FIND_CLOSEST,
            false
        )
        target = __TS__ArrayFind(
            buildings,
            function(____, building) return building:IsFountain() end
        )
    end
    if not target and not point then
        local units = __TS__ArrayFilter(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                cursorPosition,
                nil,
                FIND_UNITS_EVERYWHERE,
                1,
                self:GetTargetType(),
                64,
                1,
                false
            ),
            function(____, target) return target ~= caster and not target:IsCourier() and not target:IsWatcher() end
        )
        if #units == 0 then
            return
        end
        target = units[1]
    end
    self.target = target
    local companionPoint = target and target:GetAbsOrigin() or point
    if companionPoint == nil then
        return
    end
    caster:FaceTowards(companionPoint)
    local teleportDuration = self:GetChannelTime()
    modifier_tinker_keen_teleport_custom_730_teleporting:apply(caster, caster, self, {duration = teleportDuration})
    if target and not target:IsBuildingType() then
        modifier_tinker_keen_teleport_custom_730_incoming:apply(target, caster, self, {})
    end
    if not target or target:IsBuildingType() then
        self.companion = CreateUnitByName(
            "npc_dota_companion",
            companionPoint,
            false,
            nil,
            nil,
            DOTA_TEAM_NEUTRALS
        )
        self.companion:AddNewModifier(self.companion, nil, "modifier_phased", {})
        self.companion:AddNewModifier(self.companion, nil, "modifier_invulnerable", {})
        self.companion:SetAbsOrigin(companionPoint)
        FindClearSpaceForUnit(self.companion, companionPoint, true)
    end
    if target and not target:IsBuildingType() then
        self.finalTarget = target
        self:PlayEffects(self.finalTarget, false)
    else
        self.finalTarget = self.companion
        self:PlayEffects(self.finalTarget, true)
    end
    local finalPoint = self.finalTarget:GetAbsOrigin()
    self.tpSound = "Portal.Loop_Appear"
    if self.tpSound == "Portal.Loop_Appear" and caster:HasWearable("models/items/tinker/boots_of_travel.vmdl") then
        self.tpSound = "Hero_Tinker.MechaBoots.Loop"
    end
    Timers:CreateTimer(
        0.1,
        function()
            if self.finalTarget and not self.finalTarget:IsNull() then
                caster:EmitSound(self.tpSound)
                self.finalTarget:EmitSound(self.tpSound)
            end
        end
    )
    self.teleportTimer = Timers:CreateTimer(
        teleportDuration - 0.25,
        function()
            EmitSoundOnLocationWithCaster(
                self.finalTarget:GetAbsOrigin(),
                "Portal.Hero_Disappear",
                caster
            )
            caster:EmitSound("Portal.Hero_Disappear")
        end
    )
    AddFOWViewer(
        caster:GetTeamNumber(),
        finalPoint,
        self:GetSpecialValueFor("vision_radius"),
        teleportDuration,
        true
    )
    MinimapEvent(
        caster:GetTeamNumber(),
        caster,
        finalPoint.x,
        finalPoint.y,
        DOTA_MINIMAP_EVENT_TEAMMATE_TELEPORTING,
        teleportDuration
    )
end
function tinker_keen_teleport_custom_730.prototype.OnChannelThink(self, interval)
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    if not caster:CanTeleport() or self.target and (self.target:IsCourier() or not self.target:IsAlive()) then
        caster:InterruptChannel()
    end
end
function tinker_keen_teleport_custom_730.prototype.OnChannelFinish(self, interrupted)
    local caster = self:GetCaster()
    if not self.finalTarget or self.finalTarget:IsNull() then
        return
    end
    caster:StopSound(self.tpSound)
    self.finalTarget:StopSound(self.tpSound)
    local point = self.finalTarget:GetAbsOrigin()
    MinimapEvent(
        caster:GetTeamNumber(),
        caster,
        point.x,
        point.y,
        DOTA_MINIMAP_EVENT_CANCEL_TELEPORTING,
        0
    )
    UTIL_Remove(self.companion)
    caster:RemoveModifierByName(modifier_tinker_keen_teleport_custom_730_teleporting.name)
    if self.target ~= nil then
        self.target:RemoveModifierByName(modifier_tinker_keen_teleport_custom_730_incoming.name)
    end
    if interrupted then
        self:DestroyEffects(true)
        if self.teleportTimer then
            Timers:RemoveTimer(self.teleportTimer)
        end
        return
    end
    self:DestroyEffects(false)
    caster:SetAbsOrigin(point)
    FindClearSpaceForUnit(caster, point, true)
    caster:StartGesture(ACT_DOTA_TELEPORT_END)
end
function tinker_keen_teleport_custom_730.prototype.PlayEffects(self, target, companion)
    local caster = self:GetCaster()
    local targetOrigin = target:GetAbsOrigin()
    local ____companion_2
    if companion then
        ____companion_2 = PATTACH_POINT_FOLLOW
    else
        ____companion_2 = PATTACH_ROOTBONE_FOLLOW
    end
    local attach = ____companion_2
    local particleFromName = ParticleManager:GetParticleReplacement("particles/items2_fx/teleport_start.vpcf", caster)
    self.particleFrom = ParticleManager:CreateParticle(particleFromName, PATTACH_WORLDORIGIN, caster)
    ParticleManager:SetParticleControl(
        self.particleFrom,
        0,
        caster:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        self.particleFrom,
        2,
        Vector(255, 255, 255)
    )
    local particleToName = ParticleManager:GetParticleReplacement("particles/items2_fx/teleport_end.vpcf", caster)
    self.particleTo = ParticleManager:CreateParticle(particleToName, PATTACH_POINT_FOLLOW, target)
    ParticleManager:SetParticleControlEnt(
        self.particleTo,
        0,
        target,
        PATTACH_POINT_FOLLOW,
        "",
        targetOrigin,
        true
    )
    ParticleManager:SetParticleControlEnt(
        self.particleTo,
        1,
        target,
        PATTACH_POINT_FOLLOW,
        "",
        targetOrigin,
        true
    )
    ParticleManager:SetParticleControlEnt(
        self.particleTo,
        3,
        caster,
        PATTACH_POINT_FOLLOW,
        "",
        targetOrigin,
        true
    )
    ParticleManager:SetParticleControl(
        self.particleTo,
        4,
        Vector(1, 0, 0)
    )
    ParticleManager:SetParticleControlEnt(
        self.particleTo,
        5,
        target,
        attach,
        "",
        targetOrigin,
        true
    )
end
function tinker_keen_teleport_custom_730.prototype.DestroyEffects(self, immediate)
    if self.particleFrom then
        ParticleManager:DestroyParticle(self.particleFrom, immediate)
        ParticleManager:ReleaseParticleIndex(self.particleFrom)
        self.particleFrom = nil
    end
    if self.particleTo then
        ParticleManager:DestroyParticle(self.particleTo, immediate)
        ParticleManager:ReleaseParticleIndex(self.particleTo)
        self.particleTo = nil
    end
end
tinker_keen_teleport_custom_730 = __TS__Decorate(
    tinker_keen_teleport_custom_730,
    tinker_keen_teleport_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_keen_teleport_custom_730"}
)
____exports.tinker_keen_teleport_custom_730 = tinker_keen_teleport_custom_730
return ____exports
