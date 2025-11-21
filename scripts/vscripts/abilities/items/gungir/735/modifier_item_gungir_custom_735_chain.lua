local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 3,["14"] = 4,["15"] = 3,["16"] = 4,["18"] = 4,["19"] = 10,["20"] = 3,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 19,["25"] = 20,["26"] = 19,["27"] = 23,["28"] = 24,["29"] = 23,["30"] = 27,["31"] = 28,["32"] = 30,["35"] = 32,["36"] = 33,["37"] = 34,["38"] = 34,["40"] = 37,["41"] = 38,["42"] = 39,["43"] = 41,["44"] = 43,["45"] = 43,["46"] = 43,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 51,["52"] = 52,["53"] = 27,["54"] = 55,["55"] = 56,["56"] = 58,["57"] = 62,["58"] = 62,["59"] = 62,["60"] = 62,["61"] = 62,["62"] = 62,["63"] = 62,["64"] = 62,["65"] = 62,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 72,["70"] = 72,["71"] = 72,["72"] = 62,["73"] = 62,["74"] = 74,["75"] = 75,["78"] = 79,["79"] = 80,["80"] = 80,["81"] = 82,["82"] = 83,["83"] = 84,["84"] = 86,["85"] = 87,["86"] = 88,["87"] = 93,["88"] = 93,["89"] = 93,["90"] = 93,["91"] = 93,["92"] = 93,["93"] = 93,["94"] = 93,["95"] = 93,["96"] = 94,["97"] = 94,["98"] = 94,["99"] = 94,["100"] = 94,["101"] = 94,["102"] = 94,["103"] = 94,["104"] = 94,["105"] = 95,["107"] = 98,["108"] = 100,["109"] = 101,["110"] = 102,["113"] = 106,["114"] = 55,["115"] = 4,["116"] = 4,["117"] = 4,["118"] = 3,["121"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_item_gungir_custom_735_chain = __TS__Class()
local modifier_item_gungir_custom_735_chain = ____exports.modifier_item_gungir_custom_735_chain
modifier_item_gungir_custom_735_chain.name = "modifier_item_gungir_custom_735_chain"
__TS__ClassExtends(modifier_item_gungir_custom_735_chain, BaseModifier)
function modifier_item_gungir_custom_735_chain.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.targets = {}
end
function modifier_item_gungir_custom_735_chain.prototype.IsHidden(self)
    return true
end
function modifier_item_gungir_custom_735_chain.prototype.IsPurgable(self)
    return false
end
function modifier_item_gungir_custom_735_chain.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_gungir_custom_735_chain.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    self.target = EntIndexToHScript(params.target)
    if self.target then
        local ____self_targets_0 = self.targets
        ____self_targets_0[#____self_targets_0 + 1] = params.target
    end
    self.damage = self:GetSpecialValueFor("chain_damage")
    self.illusion_damage = self.damage * self:GetSpecialValueFor("illusion_multiplier_pct") / 100
    self.radius = self:GetSpecialValueFor("chain_radius")
    self.count = self:GetSpecialValueFor("chain_strikes")
    self.damageTable = {
        attacker = parent,
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = self:GetAbility()
    }
    self:OnIntervalThink()
    self:StartIntervalThink(0.25)
end
function modifier_item_gungir_custom_735_chain.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local pos = self.target and self.target:GetAbsOrigin() or parent:GetAbsOrigin()
    local units = __TS__ArrayFilter(
        FindUnitsInRadius(
            parent:GetTeamNumber(),
            pos,
            nil,
            self.radius,
            2,
            bit.bor(1, 18),
            bit.bor(128, 256),
            1,
            false
        ),
        function(____, unit) return not __TS__ArrayIncludes(
            self.targets,
            unit:entindex()
        ) end
    )
    if #units == 0 then
        self:Destroy()
        return
    end
    local unit = units[1]
    local ____self_targets_1 = self.targets
    ____self_targets_1[#____self_targets_1 + 1] = unit:entindex()
    self.damageTable.victim = unit
    self.damageTable.damage = unit:IsIllusion() and self.illusion_damage or self.damage
    ApplyDamage(self.damageTable)
    if self.target and not self.target:IsNull() then
        local particle_name = ParticleManager:GetParticleReplacement("particles/items_fx/chain_lightning.vpcf", parent)
        local particle = ParticleManager:CreateParticle(particle_name, PATTACH_POINT_FOLLOW, self.target)
        ParticleManager:SetParticleControlEnt(
            particle,
            0,
            self.target,
            PATTACH_POINT_FOLLOW,
            "attach_hitloc",
            self.target:GetAbsOrigin(),
            true
        )
        ParticleManager:SetParticleControlEnt(
            particle,
            1,
            unit,
            PATTACH_POINT_FOLLOW,
            "attach_hitloc",
            unit:GetAbsOrigin(),
            true
        )
        ParticleManager:ReleaseParticleIndex(particle)
    end
    unit:EmitSound("Item.Maelstrom.Chain_Lightning.Jump")
    self.count = self.count - 1
    if self.count <= 0 then
        self:Destroy()
        return
    end
    self.target = unit
end
modifier_item_gungir_custom_735_chain = __TS__Decorate(
    modifier_item_gungir_custom_735_chain,
    modifier_item_gungir_custom_735_chain,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_gungir_custom_735_chain"}
)
____exports.modifier_item_gungir_custom_735_chain = modifier_item_gungir_custom_735_chain
return ____exports
