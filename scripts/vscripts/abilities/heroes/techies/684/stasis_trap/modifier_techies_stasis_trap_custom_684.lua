local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 14,["21"] = 15,["22"] = 16,["23"] = 18,["24"] = 4,["25"] = 20,["26"] = 21,["27"] = 20,["28"] = 24,["29"] = 25,["30"] = 24,["31"] = 28,["32"] = 29,["33"] = 28,["34"] = 32,["35"] = 33,["36"] = 34,["37"] = 35,["38"] = 36,["39"] = 37,["40"] = 39,["43"] = 41,["44"] = 32,["45"] = 44,["46"] = 45,["47"] = 46,["48"] = 46,["50"] = 48,["53"] = 50,["54"] = 50,["55"] = 50,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 50,["60"] = 50,["61"] = 50,["62"] = 50,["63"] = 50,["64"] = 62,["65"] = 63,["67"] = 66,["68"] = 67,["70"] = 70,["71"] = 71,["72"] = 73,["73"] = 75,["74"] = 80,["75"] = 80,["76"] = 80,["77"] = 80,["78"] = 80,["79"] = 81,["80"] = 81,["81"] = 81,["82"] = 81,["83"] = 81,["84"] = 82,["85"] = 82,["86"] = 82,["87"] = 82,["88"] = 82,["89"] = 83,["90"] = 84,["91"] = 85,["92"] = 87,["93"] = 87,["94"] = 87,["95"] = 87,["96"] = 87,["97"] = 87,["98"] = 87,["99"] = 87,["100"] = 87,["101"] = 87,["102"] = 87,["103"] = 87,["104"] = 97,["105"] = 98,["106"] = 98,["107"] = 98,["108"] = 98,["109"] = 98,["110"] = 98,["111"] = 107,["112"] = 112,["113"] = 112,["114"] = 112,["115"] = 112,["116"] = 112,["117"] = 113,["118"] = 113,["119"] = 113,["120"] = 113,["121"] = 113,["122"] = 87,["123"] = 87,["124"] = 116,["125"] = 116,["126"] = 116,["127"] = 116,["128"] = 116,["129"] = 116,["130"] = 116,["131"] = 116,["132"] = 116,["133"] = 116,["134"] = 116,["135"] = 116,["136"] = 126,["137"] = 127,["138"] = 128,["139"] = 129,["140"] = 129,["143"] = 116,["144"] = 116,["145"] = 133,["146"] = 133,["147"] = 133,["148"] = 133,["149"] = 133,["150"] = 133,["151"] = 133,["152"] = 135,["154"] = 44,["155"] = 139,["156"] = 140,["157"] = 145,["158"] = 146,["160"] = 149,["161"] = 150,["162"] = 151,["163"] = 152,["165"] = 155,["166"] = 139,["167"] = 158,["168"] = 159,["169"] = 161,["170"] = 162,["171"] = 164,["172"] = 165,["173"] = 167,["174"] = 167,["175"] = 167,["176"] = 168,["177"] = 169,["179"] = 172,["180"] = 172,["181"] = 172,["182"] = 173,["183"] = 174,["184"] = 175,["186"] = 178,["187"] = 179,["189"] = 172,["190"] = 172,["191"] = 167,["192"] = 167,["193"] = 158,["194"] = 5,["195"] = 5,["196"] = 5,["197"] = 4,["200"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_techies_stasis_trap_custom_684_stun = require("abilities.heroes.techies.684.stasis_trap.modifier_techies_stasis_trap_custom_684_stun")
local modifier_techies_stasis_trap_custom_684_stun = ____modifier_techies_stasis_trap_custom_684_stun.modifier_techies_stasis_trap_custom_684_stun
____exports.modifier_techies_stasis_trap_custom_684 = __TS__Class()
local modifier_techies_stasis_trap_custom_684 = ____exports.modifier_techies_stasis_trap_custom_684
modifier_techies_stasis_trap_custom_684.name = "modifier_techies_stasis_trap_custom_684"
__TS__ClassExtends(modifier_techies_stasis_trap_custom_684, BaseModifier)
function modifier_techies_stasis_trap_custom_684.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.tick_interval = 0.1
    self.detonate_time = 0
    self.detonating = false
    self.died = false
end
function modifier_techies_stasis_trap_custom_684.prototype.IsHidden(self)
    return true
end
function modifier_techies_stasis_trap_custom_684.prototype.IsPurgable(self)
    return false
end
function modifier_techies_stasis_trap_custom_684.prototype.CanParentBeAutoAttacked(self)
    return false
end
function modifier_techies_stasis_trap_custom_684.prototype.OnCreated(self, params)
    self.activation_time = self:GetSpecialValueFor("activation_time")
    self.explode_delay = self:GetSpecialValueFor("explode_delay")
    self.activation_radius = self:GetSpecialValueFor("activation_radius")
    self.stun_duration = self:GetSpecialValueFor("stun_duration")
    self.stun_radius = self:GetSpecialValueFor("stun_radius")
    if not IsServer() then
        return
    end
    self:StartIntervalThink(self.tick_interval)
end
function modifier_techies_stasis_trap_custom_684.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    if not parent:IsAlive() then
        self:Destroy()
    end
    if self:GetElapsedTime() <= self.activation_time then
        return
    end
    local enemies = FindUnitsInRadius(
        parent:GetTeamNumber(),
        parent:GetAbsOrigin(),
        nil,
        self.activation_radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_NO_INVIS,
        FIND_ANY_ORDER,
        false
    )
    if #enemies > 0 then
        self.detonating = true
    end
    if self.detonating then
        self.detonate_time = self.detonate_time + self.tick_interval
    end
    if self.detonating and self.detonate_time >= self.explode_delay then
        self.detonating = false
        EmitSoundOn("Hero_Techies.StasisTrap.Stun", parent)
        local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_stasis_trap_explode.vpcf", PATTACH_WORLDORIGIN, nil)
        ParticleManager:SetParticleControl(
            particle,
            0,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleControl(
            particle,
            1,
            Vector(self.stun_radius, 1, 1)
        )
        ParticleManager:SetParticleControl(
            particle,
            3,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleShouldCheckFoW(particle, true)
        ParticleManager:SetParticleFoWProperties(particle, 0, 3, self.stun_radius)
        ParticleManager:ReleaseParticleIndex(particle)
        __TS__ArrayForEach(
            FindUnitsInRadius(
                parent:GetTeamNumber(),
                parent:GetAbsOrigin(),
                nil,
                self.stun_radius,
                2,
                1 + 18,
                0,
                0,
                false
            ),
            function(____, enemy)
                modifier_techies_stasis_trap_custom_684_stun:apply(
                    enemy,
                    parent,
                    self:GetAbility(),
                    {duration = (1 - enemy:GetStatusResistance()) * self.stun_duration}
                )
                local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_stasis_trap_beams.vpcf", PATTACH_ABSORIGIN, parent)
                ParticleManager:SetParticleControl(
                    particle,
                    0,
                    enemy:GetAbsOrigin()
                )
                ParticleManager:SetParticleControl(
                    particle,
                    1,
                    parent:GetAbsOrigin()
                )
            end
        )
        __TS__ArrayForEach(
            FindUnitsInRadius(
                parent:GetTeamNumber(),
                parent:GetAbsOrigin(),
                nil,
                self.stun_radius,
                1,
                32,
                0,
                0,
                false
            ),
            function(____, trap)
                if trap:GetUnitName() == parent:GetUnitName() and trap ~= parent then
                    local modifier = trap:FindModifierByName(____exports.modifier_techies_stasis_trap_custom_684.name)
                    if modifier ~= nil then
                        modifier:Explode()
                    end
                end
            end
        )
        AddFOWViewer(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            400,
            1,
            false
        )
        self:Explode()
    end
end
function modifier_techies_stasis_trap_custom_684.prototype.CheckState(self)
    local states = {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true}
    if self:GetElapsedTime() > self.activation_time and not self.detonating and not self.died then
        states[MODIFIER_STATE_INVISIBLE] = true
    end
    if self.died then
        states[MODIFIER_STATE_NO_HEALTH_BAR] = true
        states[MODIFIER_STATE_INVULNERABLE] = true
        states[MODIFIER_STATE_UNSELECTABLE] = true
    end
    return states
end
function modifier_techies_stasis_trap_custom_684.prototype.Explode(self)
    local parent = self:GetParent()
    self.died = true
    self:StopIntervalThink()
    parent:RemoveGesture(ACT_DOTA_IDLE)
    parent:StartGesture(ACT_DOTA_DIE)
    Timers:CreateTimer(
        2.73,
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
modifier_techies_stasis_trap_custom_684 = __TS__Decorate(
    modifier_techies_stasis_trap_custom_684,
    modifier_techies_stasis_trap_custom_684,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_stasis_trap_custom_684"}
)
____exports.modifier_techies_stasis_trap_custom_684 = modifier_techies_stasis_trap_custom_684
return ____exports
