local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 3,["17"] = 4,["18"] = 3,["19"] = 4,["21"] = 4,["22"] = 5,["23"] = 6,["24"] = 7,["25"] = 9,["26"] = 11,["27"] = 12,["28"] = 13,["29"] = 3,["30"] = 15,["31"] = 16,["32"] = 15,["33"] = 19,["34"] = 20,["35"] = 19,["36"] = 23,["37"] = 24,["38"] = 23,["39"] = 27,["40"] = 28,["41"] = 30,["42"] = 31,["43"] = 32,["44"] = 34,["45"] = 35,["46"] = 37,["49"] = 39,["50"] = 44,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 45,["56"] = 45,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 46,["61"] = 46,["62"] = 46,["63"] = 46,["64"] = 46,["65"] = 47,["66"] = 47,["67"] = 47,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 47,["72"] = 47,["73"] = 49,["74"] = 49,["75"] = 49,["80"] = 49,["81"] = 50,["82"] = 27,["83"] = 53,["84"] = 54,["85"] = 55,["86"] = 55,["88"] = 57,["89"] = 57,["90"] = 57,["95"] = 57,["96"] = 59,["99"] = 61,["100"] = 61,["101"] = 61,["102"] = 61,["103"] = 61,["104"] = 61,["105"] = 61,["106"] = 67,["107"] = 67,["108"] = 67,["109"] = 67,["110"] = 67,["111"] = 67,["112"] = 61,["113"] = 61,["114"] = 61,["115"] = 61,["116"] = 61,["117"] = 61,["118"] = 61,["119"] = 73,["120"] = 73,["121"] = 73,["122"] = 73,["123"] = 74,["124"] = 74,["125"] = 74,["126"] = 74,["127"] = 76,["128"] = 77,["129"] = 78,["130"] = 79,["131"] = 81,["134"] = 84,["135"] = 85,["136"] = 86,["138"] = 88,["139"] = 89,["140"] = 91,["141"] = 93,["142"] = 98,["143"] = 98,["144"] = 98,["145"] = 98,["146"] = 98,["147"] = 99,["148"] = 99,["149"] = 99,["150"] = 99,["151"] = 99,["152"] = 100,["153"] = 100,["154"] = 100,["155"] = 100,["156"] = 100,["157"] = 101,["158"] = 102,["159"] = 103,["160"] = 105,["161"] = 106,["162"] = 107,["163"] = 107,["164"] = 107,["165"] = 107,["166"] = 107,["167"] = 107,["168"] = 107,["169"] = 115,["170"] = 116,["171"] = 116,["172"] = 116,["173"] = 117,["174"] = 118,["175"] = 119,["176"] = 120,["177"] = 122,["179"] = 125,["180"] = 126,["181"] = 126,["182"] = 126,["183"] = 127,["184"] = 127,["186"] = 126,["187"] = 126,["190"] = 116,["191"] = 116,["192"] = 133,["193"] = 135,["194"] = 136,["195"] = 138,["196"] = 139,["197"] = 140,["198"] = 140,["199"] = 140,["200"] = 140,["201"] = 141,["203"] = 143,["204"] = 144,["205"] = 144,["206"] = 144,["207"] = 144,["208"] = 145,["210"] = 148,["211"] = 148,["212"] = 148,["213"] = 149,["214"] = 148,["215"] = 148,["217"] = 153,["218"] = 153,["219"] = 153,["220"] = 153,["221"] = 153,["222"] = 153,["223"] = 153,["224"] = 154,["225"] = 155,["226"] = 156,["229"] = 159,["230"] = 160,["233"] = 53,["234"] = 165,["235"] = 166,["236"] = 165,["237"] = 171,["238"] = 172,["239"] = 177,["240"] = 178,["241"] = 179,["243"] = 182,["244"] = 171,["245"] = 185,["246"] = 186,["247"] = 185,["248"] = 189,["249"] = 190,["250"] = 189,["251"] = 4,["252"] = 4,["253"] = 4,["254"] = 3,["257"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_land_mines_custom_725 = __TS__Class()
local modifier_techies_land_mines_custom_725 = ____exports.modifier_techies_land_mines_custom_725
modifier_techies_land_mines_custom_725.name = "modifier_techies_land_mines_custom_725"
__TS__ClassExtends(modifier_techies_land_mines_custom_725, BaseModifier)
function modifier_techies_land_mines_custom_725.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.triggered = false
    self.trigger_time = 0
    self.tick_interval = 0.03
    self.exploded = false
    self.activation_delay = 0
    self.radius = 0
    self.proximity_threshold = 0
end
function modifier_techies_land_mines_custom_725.prototype.IsHidden(self)
    return true
end
function modifier_techies_land_mines_custom_725.prototype.IsPurgable(self)
    return false
end
function modifier_techies_land_mines_custom_725.prototype.CanParentBeAutoAttacked(self)
    return false
end
function modifier_techies_land_mines_custom_725.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.activation_delay = self:GetSpecialValueFor("activation_delay")
    self.radius = self:GetSpecialValueFor("radius")
    self.proximity_threshold = self:GetSpecialValueFor("proximity_threshold")
    self.triggered = false
    self.trigger_time = 0
    if not IsServer() then
        return
    end
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/pre_731/techies_land_mine.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(0, 0, self.radius)
    )
    ParticleManager:SetParticleControl(
        particle,
        3,
        parent:GetAbsOrigin()
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    local ____parent_SetMoveCapability_1 = parent.SetMoveCapability
    local ____temp_0
    if self:GetSpecialValueFor("mines_move") == 0 then
        ____temp_0 = DOTA_UNIT_CAP_MOVE_NONE
    else
        ____temp_0 = DOTA_UNIT_CAP_MOVE_GROUND
    end
    ____parent_SetMoveCapability_1(parent, ____temp_0)
    self:StartIntervalThink(self.tick_interval)
end
function modifier_techies_land_mines_custom_725.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    if not parent:IsAlive() then
        self:Destroy()
    end
    local ____parent_SetMoveCapability_3 = parent.SetMoveCapability
    local ____temp_2
    if self:GetSpecialValueFor("mines_move") == 0 then
        ____temp_2 = DOTA_UNIT_CAP_MOVE_NONE
    else
        ____temp_2 = DOTA_UNIT_CAP_MOVE_GROUND
    end
    ____parent_SetMoveCapability_3(parent, ____temp_2)
    if self:GetElapsedTime() <= self.activation_delay or self.exploded then
        return
    end
    local enemies = __TS__ArrayFilter(
        FindUnitsInRadius(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            nil,
            self.radius,
            2,
            bit.bor(
                bit.bor(
                    bit.bor(1, 18),
                    4
                ),
                16
            ),
            16,
            0,
            false
        ),
        function(____, enemy) return self:towerFilter(enemy) end
    )
    local enemyFound = __TS__ArraySome(
        enemies,
        function(____, enemy) return not enemy:HasFlyMovementCapability() or enemy:HasModifiersState(MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY) end
    )
    local isAllImmune = __TS__ArrayEvery(
        enemies,
        function(____, enemy) return enemy:IsMagicImmune() end
    )
    if not self.triggered then
        if enemyFound then
            self.triggered = true
            self.trigger_time = 0
            EmitSoundOn("Hero_Techies.LandMine.Priming", parent)
        end
    else
        if enemyFound then
            if not isAllImmune then
                self.trigger_time = self.trigger_time + self.tick_interval
            end
            if self.trigger_time >= self.proximity_threshold then
                self.exploded = true
                EmitSoundOn("Hero_Techies.LandMine.Detonate", parent)
                local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/pre_731/techies_land_mine_explode.vpcf", PATTACH_WORLDORIGIN, nil)
                ParticleManager:SetParticleControl(
                    particle,
                    0,
                    parent:GetAbsOrigin()
                )
                ParticleManager:SetParticleControl(
                    particle,
                    1,
                    Vector(1, 1, self.radius)
                )
                ParticleManager:SetParticleControl(
                    particle,
                    2,
                    Vector(1, 1, self.radius)
                )
                ParticleManager:SetParticleShouldCheckFoW(particle, true)
                ParticleManager:SetParticleFoWProperties(particle, 0, 2, self.radius)
                ParticleManager:ReleaseParticleIndex(particle)
                local damage = self:GetSpecialValueFor("damage")
                local building_damage = damage / 100 * self:GetSpecialValueFor("building_damage_pct")
                local damageTable = {
                    attacker = parent,
                    damage = damage,
                    damage_type = DAMAGE_TYPE_MAGICAL,
                    victim = nil,
                    ability = self:GetAbility()
                }
                local enemy_killed = false
                __TS__ArrayForEach(
                    enemies,
                    function(____, enemy)
                        if not enemy:HasFlyMovementCapability() or enemy:HasModifiersState(MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY) then
                            if not enemy:IsInvulnerable() and not enemy:IsCourier() and not enemy:IsMagicImmune() then
                                damageTable.victim = enemy
                                damageTable.damage = enemy:IsBuilding() and building_damage or damage
                                ApplyDamage(damageTable)
                            end
                            if enemy:IsRealHero() then
                                Timers:CreateTimer(
                                    FrameTime(),
                                    function()
                                        if not enemy:IsAlive() then
                                            enemy_killed = true
                                        end
                                    end
                                )
                            end
                        end
                    end
                )
                local owner = parent:GetOwner()
                if enemy_killed and owner:GetUnitName() == "npc_dota_hero_techies" and RollPercentage(25) then
                    local cast_responce
                    if RollPercentage(50) then
                        local random_list = {__TS__Spread(range(nil, 1, 9))}
                        local random = RollVoiceLines(
                            nil,
                            unpack(random_list)
                        )
                        cast_responce = "techies_tech_mineblowsup_" .. random
                    else
                        local random_list = {__TS__Spread(range(nil, 1, 3))}
                        local random = RollVoiceLines(
                            nil,
                            unpack(random_list)
                        )
                        cast_responce = "techies_tech_minekill_" .. random
                    end
                    Timers:CreateTimer(
                        FrameTime() * 2,
                        function()
                            owner:EmitSoundOnClient(cast_responce)
                        end
                    )
                end
                AddFOWViewer(
                    parent:GetTeamNumber(),
                    parent:GetAbsOrigin(),
                    300,
                    1,
                    false
                )
                parent:ForceKill(false)
                UTIL_Remove(parent)
                self:Destroy()
            end
        else
            self.triggered = false
            self.trigger_time = 0
        end
    end
end
function modifier_techies_land_mines_custom_725.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE}
end
function modifier_techies_land_mines_custom_725.prototype.CheckState(self)
    local states = {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true}
    if self:GetElapsedTime() > self.activation_delay + 0.15 and not self.triggered then
        states[MODIFIER_STATE_INVISIBLE] = true
        states[MODIFIER_STATE_TRUESIGHT_IMMUNE] = true
    end
    return states
end
function modifier_techies_land_mines_custom_725.prototype.GetModifierMoveSpeed_Absolute(self)
    return self:GetSpecialValueFor("mines_move")
end
function modifier_techies_land_mines_custom_725.prototype.towerFilter(self, unit)
    return not (unit:IsOutpost() or unit:IsWatcher() or unit:IsLotusPool() or unit:IsTwinGate())
end
modifier_techies_land_mines_custom_725 = __TS__Decorate(
    modifier_techies_land_mines_custom_725,
    modifier_techies_land_mines_custom_725,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_land_mines_custom_725"}
)
____exports.modifier_techies_land_mines_custom_725 = modifier_techies_land_mines_custom_725
return ____exports
