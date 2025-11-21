local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 4,["16"] = 5,["17"] = 4,["18"] = 5,["20"] = 5,["21"] = 6,["22"] = 7,["23"] = 9,["24"] = 10,["25"] = 11,["26"] = 13,["27"] = 15,["28"] = 16,["29"] = 18,["30"] = 4,["31"] = 20,["32"] = 21,["33"] = 20,["34"] = 24,["35"] = 25,["36"] = 24,["37"] = 28,["38"] = 29,["39"] = 28,["40"] = 32,["41"] = 33,["42"] = 35,["43"] = 36,["44"] = 37,["45"] = 39,["46"] = 40,["47"] = 42,["50"] = 44,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 49,["55"] = 49,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 50,["60"] = 50,["61"] = 51,["62"] = 51,["63"] = 51,["64"] = 51,["65"] = 51,["66"] = 52,["67"] = 52,["68"] = 52,["69"] = 52,["70"] = 52,["71"] = 52,["72"] = 52,["73"] = 52,["74"] = 54,["75"] = 32,["76"] = 57,["77"] = 58,["78"] = 59,["79"] = 59,["81"] = 60,["84"] = 62,["85"] = 62,["86"] = 62,["87"] = 62,["88"] = 62,["89"] = 62,["90"] = 62,["91"] = 68,["92"] = 68,["93"] = 68,["94"] = 62,["95"] = 62,["96"] = 62,["97"] = 62,["98"] = 62,["99"] = 62,["100"] = 62,["101"] = 74,["102"] = 74,["103"] = 74,["104"] = 74,["105"] = 79,["106"] = 80,["107"] = 81,["108"] = 82,["111"] = 85,["112"] = 86,["113"] = 87,["114"] = 89,["117"] = 57,["118"] = 94,["119"] = 95,["120"] = 94,["121"] = 101,["122"] = 102,["123"] = 107,["124"] = 108,["126"] = 111,["127"] = 112,["128"] = 113,["129"] = 114,["131"] = 117,["132"] = 101,["133"] = 120,["134"] = 121,["135"] = 123,["138"] = 125,["139"] = 127,["140"] = 128,["143"] = 132,["144"] = 120,["145"] = 135,["146"] = 136,["147"] = 135,["148"] = 139,["149"] = 140,["150"] = 141,["151"] = 143,["152"] = 144,["153"] = 146,["154"] = 148,["155"] = 153,["156"] = 153,["157"] = 153,["158"] = 153,["159"] = 153,["160"] = 154,["161"] = 154,["162"] = 154,["163"] = 154,["164"] = 154,["165"] = 155,["166"] = 155,["167"] = 155,["168"] = 155,["169"] = 155,["170"] = 156,["171"] = 157,["172"] = 158,["173"] = 160,["174"] = 160,["175"] = 160,["176"] = 160,["177"] = 160,["178"] = 160,["179"] = 160,["180"] = 168,["181"] = 168,["182"] = 168,["183"] = 168,["184"] = 168,["185"] = 168,["186"] = 168,["187"] = 174,["188"] = 174,["189"] = 174,["190"] = 168,["191"] = 168,["192"] = 168,["193"] = 168,["194"] = 168,["195"] = 168,["196"] = 168,["197"] = 180,["198"] = 181,["199"] = 181,["200"] = 181,["201"] = 182,["202"] = 183,["203"] = 185,["204"] = 186,["205"] = 187,["207"] = 189,["208"] = 190,["210"] = 193,["211"] = 194,["213"] = 181,["214"] = 181,["215"] = 198,["216"] = 200,["217"] = 201,["218"] = 203,["219"] = 204,["220"] = 205,["221"] = 205,["222"] = 205,["223"] = 205,["224"] = 206,["226"] = 208,["227"] = 209,["228"] = 209,["229"] = 209,["230"] = 209,["231"] = 210,["233"] = 213,["234"] = 213,["235"] = 213,["236"] = 214,["237"] = 213,["238"] = 213,["240"] = 218,["241"] = 220,["242"] = 221,["243"] = 221,["244"] = 221,["245"] = 221,["246"] = 221,["247"] = 221,["248"] = 221,["249"] = 223,["250"] = 224,["251"] = 226,["252"] = 226,["253"] = 226,["254"] = 227,["255"] = 228,["257"] = 231,["258"] = 231,["259"] = 231,["260"] = 232,["261"] = 233,["262"] = 234,["264"] = 237,["265"] = 238,["267"] = 231,["268"] = 231,["269"] = 226,["270"] = 226,["271"] = 139,["272"] = 244,["273"] = 245,["274"] = 244,["275"] = 5,["276"] = 5,["277"] = 5,["278"] = 4,["281"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_techies_land_mines_custom_684_mine = __TS__Class()
local modifier_techies_land_mines_custom_684_mine = ____exports.modifier_techies_land_mines_custom_684_mine
modifier_techies_land_mines_custom_684_mine.name = "modifier_techies_land_mines_custom_684_mine"
__TS__ClassExtends(modifier_techies_land_mines_custom_684_mine, BaseModifier)
function modifier_techies_land_mines_custom_684_mine.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.activated = false
    self.explode_time = 0
    self.small_radius = 0
    self.activation_delay = 0
    self.explode_delay = 0
    self.tick_interval = 0.1
    self.health = 2
    self.max_health = 2
    self.died = false
end
function modifier_techies_land_mines_custom_684_mine.prototype.IsHidden(self)
    return true
end
function modifier_techies_land_mines_custom_684_mine.prototype.IsPurgable(self)
    return false
end
function modifier_techies_land_mines_custom_684_mine.prototype.CanParentBeAutoAttacked(self)
    return false
end
function modifier_techies_land_mines_custom_684_mine.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.small_radius = self:GetSpecialValueFor("small_radius")
    self.activation_delay = self:GetSpecialValueFor("activation_time")
    self.explode_delay = self:GetSpecialValueFor("explode_delay")
    self.activated = false
    self.explode_time = 0
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
        Vector(0, 0, self.small_radius)
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
    self:StartIntervalThink(self.tick_interval)
end
function modifier_techies_land_mines_custom_684_mine.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    if not parent:IsAlive() then
        self:Destroy()
    end
    if self:GetElapsedTime() <= self.activation_delay then
        return
    end
    local enemies = __TS__ArrayFilter(
        FindUnitsInRadius(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            nil,
            self.small_radius,
            2,
            bit.bor(
                bit.bor(1, 18),
                4
            ),
            16,
            0,
            false
        ),
        self.towerFilter
    )
    local enemy_found = __TS__ArraySome(
        enemies,
        function(____, enemy) return not enemy:HasFlyMovementCapability() or enemy:HasModifiersState(MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY) end
    )
    if not self.activated then
        if enemy_found then
            self.activated = true
            EmitSoundOn("Hero_Techies.LandMine.Priming", parent)
        end
    else
        self.explode_time = self.explode_time + self.tick_interval
        if self.explode_time >= self.explode_delay then
            self:Explode()
            self:StopIntervalThink()
        end
    end
end
function modifier_techies_land_mines_custom_684_mine.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE, MODIFIER_EVENT_ON_ATTACKED}
end
function modifier_techies_land_mines_custom_684_mine.prototype.CheckState(self)
    local states = {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true}
    if self:GetElapsedTime() > self.activation_delay + 0.15 and not self.activated and not self.died then
        states[MODIFIER_STATE_INVISIBLE] = true
    end
    if self.died then
        states[MODIFIER_STATE_NO_HEALTH_BAR] = true
        states[MODIFIER_STATE_INVULNERABLE] = true
        states[MODIFIER_STATE_UNSELECTABLE] = true
    end
    return states
end
function modifier_techies_land_mines_custom_684_mine.prototype.OnAttacked(self, event)
    local parent = self:GetParent()
    if event.target ~= parent then
        return
    end
    self.health = math.max(self.health - 1, 0)
    if self.health == 0 then
        self:Explode()
        return
    end
    parent:SetHealth(parent:GetMaxHealth() * self.health / self.max_health)
end
function modifier_techies_land_mines_custom_684_mine.prototype.GetModifierIncomingDamage_Percentage(self, event)
    return -200
end
function modifier_techies_land_mines_custom_684_mine.prototype.Explode(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local big_radius = ability:GetSpecialValueFor("big_radius")
    local damage = ability:GetSpecialValueFor("damage")
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
        Vector(1, 1, self.small_radius)
    )
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(1, 1, self.small_radius)
    )
    ParticleManager:SetParticleShouldCheckFoW(particle, true)
    ParticleManager:SetParticleFoWProperties(particle, 0, 2, self.small_radius)
    ParticleManager:ReleaseParticleIndex(particle)
    local damageTable = {
        victim = nil,
        attacker = parent,
        damage = damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        ability = ability
    }
    local enemies = __TS__ArrayFilter(
        FindUnitsInRadius(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            nil,
            big_radius,
            2,
            bit.bor(
                bit.bor(1, 18),
                4
            ),
            16,
            0,
            false
        ),
        function(____, enemy) return self:towerFilter(enemy) end
    )
    local enemy_killed = false
    __TS__ArrayForEach(
        enemies,
        function(____, enemy)
            damageTable.damage = damage
            damageTable.victim = enemy
            local distance = parent:GetAbsOrigin():__sub(enemy:GetAbsOrigin()):Length2D()
            if distance <= self.small_radius then
                ApplyDamage(damageTable)
            else
                damageTable.damage = damage / 2
                ApplyDamage(damageTable)
            end
            if not enemy_killed and enemy:IsRealHero() and not enemy:IsAlive() then
                enemy_killed = true
            end
        end
    )
    local owner = parent:GetOwner()
    if enemy_killed and owner:GetUnitName() == "npc_dota_hero_techies" and RollPercentage(25) then
        local cast_response
        if RollPercentage(50) then
            local random_list = {__TS__Spread(range(nil, 1, 9))}
            local random = RollVoiceLines(
                nil,
                unpack(random_list)
            )
            cast_response = "techies_tech_mineblowsup_" .. random
        else
            local random_list = {__TS__Spread(range(nil, 1, 3))}
            local random = RollVoiceLines(
                nil,
                unpack(random_list)
            )
            cast_response = "techies_tech_minekill_" .. random
        end
        Timers:CreateTimer(
            FrameTime() * 2,
            function()
                owner:EmitSoundOnClient(cast_response)
            end
        )
    end
    ability:RemoveStack()
    self.died = true
    AddFOWViewer(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        300,
        1,
        false
    )
    parent:RemoveGesture(ACT_DOTA_IDLE)
    parent:StartGesture(ACT_DOTA_DIE)
    Timers:CreateTimer(
        0.67,
        function()
            if parent and not parent:IsNull() and IsValidEntity(parent) then
                parent:AddNoDraw()
            end
            Timers:CreateTimer(
                0.03,
                function()
                    if parent and not parent:IsNull() and IsValidEntity(parent) then
                        parent:ForceKill(false)
                        UTIL_Remove(parent)
                    end
                    if self and not self:IsNull() then
                        self:Destroy()
                    end
                end
            )
        end
    )
end
function modifier_techies_land_mines_custom_684_mine.prototype.towerFilter(self, unit)
    return not (unit:IsOutpost() or unit:IsWatcher() or unit:IsLotusPool() or unit:IsTwinGate())
end
modifier_techies_land_mines_custom_684_mine = __TS__Decorate(
    modifier_techies_land_mines_custom_684_mine,
    modifier_techies_land_mines_custom_684_mine,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_land_mines_custom_684_mine"}
)
____exports.modifier_techies_land_mines_custom_684_mine = modifier_techies_land_mines_custom_684_mine
return ____exports
