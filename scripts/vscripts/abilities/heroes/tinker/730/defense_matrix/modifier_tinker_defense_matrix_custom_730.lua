local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 9,["16"] = 10,["17"] = 9,["18"] = 13,["19"] = 14,["20"] = 13,["21"] = 17,["22"] = 18,["23"] = 20,["24"] = 22,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 26,["31"] = 31,["32"] = 31,["33"] = 31,["34"] = 31,["35"] = 31,["36"] = 31,["37"] = 31,["38"] = 31,["39"] = 31,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 34,["49"] = 36,["50"] = 37,["51"] = 17,["52"] = 40,["53"] = 41,["54"] = 43,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 47,["61"] = 40,["62"] = 50,["63"] = 51,["64"] = 52,["66"] = 50,["67"] = 55,["68"] = 56,["69"] = 55,["70"] = 62,["71"] = 63,["72"] = 64,["73"] = 62,["74"] = 67,["75"] = 68,["76"] = 67,["77"] = 74,["78"] = 75,["79"] = 74,["80"] = 78,["81"] = 79,["82"] = 80,["83"] = 80,["85"] = 81,["88"] = 84,["89"] = 85,["90"] = 85,["92"] = 86,["95"] = 89,["96"] = 89,["98"] = 91,["99"] = 92,["100"] = 94,["101"] = 96,["103"] = 98,["104"] = 99,["105"] = 100,["106"] = 102,["108"] = 78,["109"] = 4,["110"] = 4,["111"] = 4,["112"] = 3,["115"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_tinker_defense_matrix_custom_730 = __TS__Class()
local modifier_tinker_defense_matrix_custom_730 = ____exports.modifier_tinker_defense_matrix_custom_730
modifier_tinker_defense_matrix_custom_730.name = "modifier_tinker_defense_matrix_custom_730"
__TS__ClassExtends(modifier_tinker_defense_matrix_custom_730, BaseModifier)
function modifier_tinker_defense_matrix_custom_730.prototype.IsHidden(self)
    return false
end
function modifier_tinker_defense_matrix_custom_730.prototype.IsPurgable(self)
    return true
end
function modifier_tinker_defense_matrix_custom_730.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.status_resistance = self:GetSpecialValueFor("status_resistance")
    if not IsServer() then
        return
    end
    local ____temp_0 = self:GetSpecialValueFor("damage_absorb")
    self.max_shield = ____temp_0
    self.current_shield = ____temp_0
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_defense_matrix.vpcf", PATTACH_POINT_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    parent:EmitSound("Hero_Tinker.DefensiveMatrix.Target")
    self:SetHasCustomTransmitterData(true)
    self:SendBuffRefreshToClients()
end
function modifier_tinker_defense_matrix_custom_730.prototype.OnRefresh(self, params)
    self.status_resistance = self:GetSpecialValueFor("status_resistance")
    if not IsServer() then
        return
    end
    local ____temp_1 = self:GetSpecialValueFor("damage_absorb")
    self.max_shield = ____temp_1
    self.current_shield = ____temp_1
    self:SendBuffRefreshToClients()
end
function modifier_tinker_defense_matrix_custom_730.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():StopSound("Hero_Tinker.DefensiveMatrix.Target")
    end
end
function modifier_tinker_defense_matrix_custom_730.prototype.AddCustomTransmitterData(self)
    return {current_shield = self.current_shield, max_shield = self.max_shield}
end
function modifier_tinker_defense_matrix_custom_730.prototype.HandleCustomTransmitterData(self, data)
    self.current_shield = data.current_shield
    self.max_shield = data.max_shield
end
function modifier_tinker_defense_matrix_custom_730.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING, MODIFIER_PROPERTY_INCOMING_DAMAGE_CONSTANT}
end
function modifier_tinker_defense_matrix_custom_730.prototype.GetModifierStatusResistanceStacking(self)
    return self.status_resistance
end
function modifier_tinker_defense_matrix_custom_730.prototype.GetModifierIncomingDamageConstant(self, event)
    if self:GetParent() == event.attacker and bit.band(event.damage_flags, DOTA_DAMAGE_FLAG_HPLOSS) == DOTA_DAMAGE_FLAG_HPLOSS then
        if IsServer() then
            return 0
        else
            return self.current_shield
        end
    end
    if IsClient() then
        if event.report_max then
            return self.max_shield
        else
            return self.current_shield
        end
    end
    if not IsServer() then
        return 0
    end
    if self.current_shield > event.damage then
        self.current_shield = self.current_shield - event.damage
        self:SendBuffRefreshToClients()
        return -event.damage
    else
        local oldShield = self.current_shield
        self.current_shield = 0
        self:Destroy()
        return -oldShield
    end
end
modifier_tinker_defense_matrix_custom_730 = __TS__Decorate(
    modifier_tinker_defense_matrix_custom_730,
    modifier_tinker_defense_matrix_custom_730,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_tinker_defense_matrix_custom_730"}
)
____exports.modifier_tinker_defense_matrix_custom_730 = modifier_tinker_defense_matrix_custom_730
return ____exports
