local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 3,["20"] = 8,["21"] = 9,["22"] = 8,["23"] = 12,["24"] = 13,["25"] = 12,["26"] = 16,["27"] = 17,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 21,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 28,["50"] = 28,["51"] = 28,["52"] = 28,["53"] = 28,["54"] = 28,["55"] = 29,["56"] = 29,["57"] = 29,["58"] = 29,["59"] = 29,["60"] = 29,["61"] = 29,["62"] = 29,["63"] = 31,["64"] = 32,["66"] = 16,["67"] = 35,["68"] = 36,["69"] = 35,["70"] = 41,["71"] = 42,["72"] = 41,["73"] = 45,["74"] = 46,["75"] = 45,["76"] = 51,["77"] = 52,["78"] = 54,["79"] = 55,["80"] = 55,["82"] = 56,["85"] = 59,["86"] = 60,["87"] = 60,["89"] = 61,["92"] = 64,["93"] = 64,["95"] = 66,["96"] = 67,["97"] = 69,["98"] = 71,["99"] = 73,["101"] = 75,["102"] = 76,["103"] = 77,["104"] = 79,["105"] = 81,["107"] = 51,["108"] = 4,["109"] = 4,["110"] = 4,["111"] = 3,["114"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_eternal_shroud_custom_732_barrier = __TS__Class()
local modifier_item_eternal_shroud_custom_732_barrier = ____exports.modifier_item_eternal_shroud_custom_732_barrier
modifier_item_eternal_shroud_custom_732_barrier.name = "modifier_item_eternal_shroud_custom_732_barrier"
__TS__ClassExtends(modifier_item_eternal_shroud_custom_732_barrier, BaseModifier)
function modifier_item_eternal_shroud_custom_732_barrier.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.max_shield = 0
    self.current_shield = 0
end
function modifier_item_eternal_shroud_custom_732_barrier.prototype.IsHidden(self)
    return false
end
function modifier_item_eternal_shroud_custom_732_barrier.prototype.IsPurgable(self)
    return true
end
function modifier_item_eternal_shroud_custom_732_barrier.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local ____temp_0 = self:GetSpecialValueFor("barrier_block")
    self.max_shield = ____temp_0
    self.current_shield = ____temp_0
    local particle = ParticleManager:CreateParticle("particles/items2_fx/eternal_shroud.vpcf", PATTACH_OVERHEAD_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_origin",
        parent:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(
            parent:GetModelRadius() * 1.085,
            0,
            0
        )
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    if IsServer() then
        self:SetHasCustomTransmitterData(true)
    end
end
function modifier_item_eternal_shroud_custom_732_barrier.prototype.AddCustomTransmitterData(self)
    return {current_shield = self.current_shield}
end
function modifier_item_eternal_shroud_custom_732_barrier.prototype.HandleCustomTransmitterData(self, data)
    self.current_shield = data.current_shield
end
function modifier_item_eternal_shroud_custom_732_barrier.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_INCOMING_SPELL_DAMAGE_CONSTANT}
end
function modifier_item_eternal_shroud_custom_732_barrier.prototype.GetModifierIncomingSpellDamageConstant(self, event)
    local parent = self:GetParent()
    if parent == event.attacker and bit.band(event.damage_flags, DOTA_DAMAGE_FLAG_HPLOSS) == DOTA_DAMAGE_FLAG_HPLOSS then
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
        parent:GiveMana(event.damage)
        self:SendBuffRefreshToClients()
        return -event.damage
    else
        local old_shield = self.current_shield
        self.current_shield = 0
        self:Destroy()
        parent:GiveMana(old_shield)
        return -old_shield
    end
end
modifier_item_eternal_shroud_custom_732_barrier = __TS__Decorate(
    modifier_item_eternal_shroud_custom_732_barrier,
    modifier_item_eternal_shroud_custom_732_barrier,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_eternal_shroud_custom_732_barrier"}
)
____exports.modifier_item_eternal_shroud_custom_732_barrier = modifier_item_eternal_shroud_custom_732_barrier
return ____exports
