local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 7,["22"] = 9,["23"] = 10,["24"] = 4,["25"] = 12,["26"] = 13,["27"] = 12,["28"] = 16,["29"] = 17,["30"] = 16,["31"] = 20,["32"] = 21,["33"] = 20,["34"] = 24,["35"] = 25,["36"] = 27,["37"] = 28,["38"] = 29,["39"] = 30,["40"] = 32,["43"] = 34,["44"] = 34,["45"] = 34,["50"] = 34,["51"] = 35,["52"] = 24,["53"] = 38,["54"] = 39,["55"] = 40,["56"] = 40,["58"] = 42,["59"] = 42,["60"] = 42,["65"] = 42,["66"] = 44,["69"] = 46,["70"] = 46,["71"] = 46,["72"] = 46,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 46,["79"] = 46,["80"] = 58,["81"] = 59,["82"] = 61,["83"] = 66,["84"] = 66,["85"] = 66,["86"] = 66,["87"] = 66,["88"] = 67,["89"] = 67,["90"] = 67,["91"] = 67,["92"] = 67,["93"] = 68,["94"] = 68,["95"] = 68,["96"] = 68,["97"] = 68,["98"] = 69,["99"] = 70,["100"] = 71,["101"] = 73,["102"] = 73,["103"] = 73,["104"] = 73,["105"] = 73,["106"] = 73,["107"] = 73,["108"] = 73,["109"] = 73,["110"] = 73,["111"] = 73,["112"] = 73,["113"] = 83,["114"] = 84,["115"] = 84,["116"] = 84,["117"] = 84,["118"] = 84,["119"] = 84,["120"] = 93,["121"] = 98,["122"] = 98,["123"] = 98,["124"] = 98,["125"] = 98,["126"] = 99,["127"] = 99,["128"] = 99,["129"] = 99,["130"] = 99,["131"] = 73,["132"] = 73,["133"] = 102,["134"] = 102,["135"] = 102,["136"] = 102,["137"] = 102,["138"] = 102,["139"] = 102,["140"] = 102,["141"] = 102,["142"] = 102,["143"] = 102,["144"] = 102,["145"] = 112,["146"] = 113,["147"] = 114,["148"] = 115,["150"] = 102,["151"] = 102,["152"] = 119,["153"] = 119,["154"] = 119,["155"] = 119,["156"] = 119,["157"] = 119,["158"] = 119,["159"] = 121,["160"] = 122,["161"] = 123,["163"] = 38,["164"] = 127,["165"] = 128,["166"] = 127,["167"] = 133,["168"] = 134,["169"] = 139,["170"] = 140,["172"] = 143,["173"] = 133,["174"] = 146,["175"] = 147,["176"] = 146,["177"] = 5,["178"] = 5,["179"] = 5,["180"] = 4,["183"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_techies_stasis_trap_custom_725_root = require("abilities.heroes.techies.725.stasis_trap.modifier_techies_stasis_trap_custom_725_root")
local modifier_techies_stasis_trap_custom_725_root = ____modifier_techies_stasis_trap_custom_725_root.modifier_techies_stasis_trap_custom_725_root
____exports.modifier_techies_stasis_trap_custom_725 = __TS__Class()
local modifier_techies_stasis_trap_custom_725 = ____exports.modifier_techies_stasis_trap_custom_725
modifier_techies_stasis_trap_custom_725.name = "modifier_techies_stasis_trap_custom_725"
__TS__ClassExtends(modifier_techies_stasis_trap_custom_725, BaseModifier)
function modifier_techies_stasis_trap_custom_725.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.activation_time = 0
    self.activation_radius = 0
    self.root_duration = 0
    self.root_radius = 0
end
function modifier_techies_stasis_trap_custom_725.prototype.IsHidden(self)
    return true
end
function modifier_techies_stasis_trap_custom_725.prototype.IsPurgable(self)
    return false
end
function modifier_techies_stasis_trap_custom_725.prototype.CanParentBeAutoAttacked(self)
    return false
end
function modifier_techies_stasis_trap_custom_725.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.activation_time = self:GetSpecialValueFor("activation_time")
    self.activation_radius = self:GetSpecialValueFor("activation_radius")
    self.root_duration = self:GetSpecialValueFor("root_duration")
    self.root_radius = self:GetSpecialValueFor("root_radius")
    if not IsServer() then
        return
    end
    local ____parent_SetMoveCapability_1 = parent.SetMoveCapability
    local ____temp_0
    if self:GetSpecialValueFor("mines_move") == 0 then
        ____temp_0 = DOTA_UNIT_CAP_MOVE_NONE
    else
        ____temp_0 = DOTA_UNIT_CAP_MOVE_GROUND
    end
    ____parent_SetMoveCapability_1(parent, ____temp_0)
    self:StartIntervalThink(0.1)
end
function modifier_techies_stasis_trap_custom_725.prototype.OnIntervalThink(self)
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
            Vector(self.root_radius, 1, 1)
        )
        ParticleManager:SetParticleControl(
            particle,
            3,
            parent:GetAbsOrigin()
        )
        ParticleManager:SetParticleShouldCheckFoW(particle, true)
        ParticleManager:SetParticleFoWProperties(particle, 0, 3, self.root_radius)
        ParticleManager:ReleaseParticleIndex(particle)
        __TS__ArrayForEach(
            FindUnitsInRadius(
                parent:GetTeamNumber(),
                parent:GetAbsOrigin(),
                nil,
                self.root_radius,
                2,
                1 + 18,
                0,
                0,
                false
            ),
            function(____, enemy)
                modifier_techies_stasis_trap_custom_725_root:apply(
                    enemy,
                    parent,
                    self:GetAbility(),
                    {duration = (1 - enemy:GetStatusResistance()) * self.root_duration}
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
                self.root_radius,
                1,
                32,
                0,
                0,
                false
            ),
            function(____, trap)
                if trap:GetUnitName() == parent:GetUnitName() and trap ~= parent then
                    trap:AddNoDraw()
                    UTIL_Remove(trap)
                end
            end
        )
        AddFOWViewer(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            600,
            1,
            false
        )
        parent:ForceKill(false)
        UTIL_Remove(parent)
        self:Destroy()
    end
end
function modifier_techies_stasis_trap_custom_725.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE}
end
function modifier_techies_stasis_trap_custom_725.prototype.CheckState(self)
    local states = {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true}
    if self:GetElapsedTime() > self.activation_time then
        states[MODIFIER_STATE_INVISIBLE] = true
    end
    return states
end
function modifier_techies_stasis_trap_custom_725.prototype.GetModifierMoveSpeed_Absolute(self)
    return self:GetSpecialValueFor("mines_move")
end
modifier_techies_stasis_trap_custom_725 = __TS__Decorate(
    modifier_techies_stasis_trap_custom_725,
    modifier_techies_stasis_trap_custom_725,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_techies_stasis_trap_custom_725"}
)
____exports.modifier_techies_stasis_trap_custom_725 = modifier_techies_stasis_trap_custom_725
return ____exports
