local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 48,["23"] = 49,["24"] = 50,["25"] = 51,["26"] = 4,["27"] = 10,["28"] = 11,["29"] = 10,["30"] = 14,["31"] = 15,["32"] = 14,["33"] = 18,["34"] = 19,["35"] = 18,["36"] = 22,["37"] = 23,["38"] = 24,["40"] = 22,["41"] = 27,["42"] = 28,["43"] = 28,["45"] = 32,["46"] = 27,["47"] = 35,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 36,["57"] = 35,["58"] = 53,["59"] = 54,["60"] = 53,["61"] = 57,["62"] = 58,["63"] = 59,["64"] = 61,["67"] = 62,["70"] = 63,["73"] = 64,["76"] = 66,["77"] = 67,["78"] = 68,["80"] = 71,["81"] = 73,["82"] = 57,["83"] = 76,["84"] = 77,["85"] = 78,["86"] = 80,["89"] = 81,["92"] = 82,["95"] = 83,["98"] = 85,["99"] = 85,["100"] = 85,["101"] = 85,["102"] = 85,["103"] = 85,["104"] = 94,["105"] = 76,["106"] = 97,["107"] = 98,["110"] = 99,["111"] = 99,["112"] = 99,["113"] = 99,["114"] = 99,["117"] = 101,["118"] = 97,["119"] = 104,["120"] = 105,["121"] = 107,["122"] = 107,["123"] = 107,["124"] = 108,["125"] = 107,["126"] = 107,["127"] = 104,["128"] = 5,["129"] = 5,["130"] = 5,["131"] = 4,["134"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_gungir_custom_735_chain = require("abilities.items.gungir.735.modifier_item_gungir_custom_735_chain")
local modifier_item_gungir_custom_735_chain = ____modifier_item_gungir_custom_735_chain.modifier_item_gungir_custom_735_chain
____exports.modifier_item_gungir_custom_735 = __TS__Class()
local modifier_item_gungir_custom_735 = ____exports.modifier_item_gungir_custom_735
modifier_item_gungir_custom_735.name = "modifier_item_gungir_custom_735"
__TS__ClassExtends(modifier_item_gungir_custom_735, BaseModifier)
function modifier_item_gungir_custom_735.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.records = {}
    self.proc = false
    self.cooldown = false
    self.GetModifierPreAttack_BonusDamage = function() return self:GetSpecialValueFor("bonus_damage") end
    self.GetModifierAttackSpeedBonus_Constant = function() return self:GetSpecialValueFor("bonus_attack_speed") end
    self.GetModifierBonusStats_Intellect = function() return self:GetSpecialValueFor("bonus_intellect") end
    self.GetModifierHealthBonus = function() return self:GetSpecialValueFor("bonus_health") end
end
function modifier_item_gungir_custom_735.prototype.IsHidden(self)
    return true
end
function modifier_item_gungir_custom_735.prototype.IsPurgable(self)
    return false
end
function modifier_item_gungir_custom_735.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_gungir_custom_735.prototype.OnCreated(self, params)
    if IsServer() then
        self:RollChain()
    end
end
function modifier_item_gungir_custom_735.prototype.CheckState(self)
    if self.proc then
        return {[MODIFIER_STATE_CANNOT_MISS] = true}
    end
    return {}
end
function modifier_item_gungir_custom_735.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_EVENT_ON_ATTACK_RECORD_DESTROY,
        MODIFIER_EVENT_ON_ATTACK,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end
function modifier_item_gungir_custom_735.prototype.OnAttackRecordDestroy(self, event)
    self.records[event.record] = nil
end
function modifier_item_gungir_custom_735.prototype.OnAttack(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if not target:IsUnit() then
        return
    end
    if target:GetTeamNumber() == parent:GetTeamNumber() then
        return
    end
    if self.proc then
        self.records[event.record] = true
        self:StartCooldown()
    end
    self.proc = false
    self:RollChain()
end
function modifier_item_gungir_custom_735.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if not target:IsUnit() then
        return
    end
    if not self.records[event.record] then
        return
    end
    modifier_item_gungir_custom_735_chain:apply(
        parent,
        parent,
        self:GetAbility(),
        {target = target:entindex()}
    )
    target:EmitSound("Item.Maelstrom.Chain_Lightning")
end
function modifier_item_gungir_custom_735.prototype.RollChain(self)
    if self.cooldown then
        return
    end
    if not RollPseudoRandomPercentage(
        30,
        DOTA_PSEUDO_RANDOM_ITEM_MAELSTROM,
        self:GetParent()
    ) then
        return
    end
    self.proc = true
end
function modifier_item_gungir_custom_735.prototype.StartCooldown(self)
    self.cooldown = true
    Timers:CreateTimer(
        0.2,
        function()
            self.cooldown = false
        end
    )
end
modifier_item_gungir_custom_735 = __TS__Decorate(
    modifier_item_gungir_custom_735,
    modifier_item_gungir_custom_735,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_gungir_custom_735"}
)
____exports.modifier_item_gungir_custom_735 = modifier_item_gungir_custom_735
return ____exports
