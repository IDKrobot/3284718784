local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 4,["17"] = 7,["18"] = 4,["19"] = 10,["20"] = 10,["21"] = 10,["22"] = 10,["23"] = 7,["24"] = 13,["25"] = 14,["26"] = 13,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 21,["32"] = 18,["33"] = 21,["34"] = 21,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["42"] = 30,["43"] = 25,["44"] = 42,["45"] = 42,["46"] = 42,["47"] = 42,["48"] = 46,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 47,["55"] = 51,["56"] = 52,["57"] = 51,["58"] = 55,["59"] = 56,["60"] = 55,["61"] = 59,["62"] = 60,["63"] = 59,["64"] = 63,["65"] = 64,["68"] = 66,["69"] = 63,["70"] = 69,["71"] = 70,["72"] = 71,["74"] = 69,["75"] = 74,["76"] = 75,["77"] = 76,["78"] = 77,["79"] = 74,["80"] = 80,["81"] = 81,["82"] = 80,["83"] = 86,["84"] = 87,["87"] = 88,["90"] = 90,["91"] = 92,["92"] = 93,["93"] = 94,["94"] = 95,["96"] = 86,["97"] = 99,["98"] = 100,["99"] = 101,["100"] = 99,["101"] = 104,["102"] = 105,["103"] = 106,["104"] = 104,["105"] = 109,["106"] = 110,["107"] = 112,["108"] = 113,["109"] = 109,["110"] = 116,["111"] = 117,["112"] = 119,["113"] = 121,["114"] = 122,["115"] = 123,["118"] = 128,["119"] = 130,["120"] = 131,["122"] = 116,["123"] = 135,["124"] = 136,["125"] = 137,["126"] = 135,["127"] = 140,["128"] = 141,["129"] = 140,["130"] = 144,["131"] = 145,["132"] = 144});
local ____exports = {}
local ____ability_textures = require("lib.ability_textures")
local AbilityTextureManager = ____ability_textures.AbilityTextureManager
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseItem = ____dota_ts_adapter.BaseItem
local BaseModifier = ____dota_ts_adapter.BaseModifier
____exports.CustomAbility = __TS__Class()
local CustomAbility = ____exports.CustomAbility
CustomAbility.name = "CustomAbility"
__TS__ClassExtends(CustomAbility, BaseAbility)
function CustomAbility.prototype.____constructor(self, abilityName)
    BaseAbility.prototype.____constructor(self)
    self.textureName = AbilityTextureManager:GetAbilityTexture(
        self:GetCaster(),
        abilityName
    )
end
function CustomAbility.prototype.GetAbilityTextureName(self)
    return self.textureName
end
____exports.CustomItem = __TS__Class()
local CustomItem = ____exports.CustomItem
CustomItem.name = "CustomItem"
__TS__ClassExtends(CustomItem, BaseItem)
function CustomItem.prototype.____constructor(self, abilityName)
    BaseItem.prototype.____constructor(self)
    self.abilityName = abilityName
end
function CustomItem.prototype.GetAbilityTextureName(self)
    if self.textureName == nil then
        self.textureName = AbilityTextureManager:GetAbilityTexture(
            self:GetCaster(),
            self.abilityName
        )
    end
    return self.textureName
end
____exports.BaseOrbAbility = __TS__Class()
local BaseOrbAbility = ____exports.BaseOrbAbility
BaseOrbAbility.name = "BaseOrbAbility"
__TS__ClassExtends(BaseOrbAbility, ____exports.CustomAbility)
____exports.BaseModifierCharges = __TS__Class()
local BaseModifierCharges = ____exports.BaseModifierCharges
BaseModifierCharges.name = "BaseModifierCharges"
__TS__ClassExtends(BaseModifierCharges, BaseModifier)
function BaseModifierCharges.prototype.IsHidden(self)
    return false
end
function BaseModifierCharges.prototype.IsPurgable(self)
    return false
end
function BaseModifierCharges.prototype.IsDebuff(self)
    return false
end
function BaseModifierCharges.prototype.DestroyOnExpire(self)
    return false
end
function BaseModifierCharges.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self:SetStackCount(self:GetMaxCharges())
end
function BaseModifierCharges.prototype.OnRefresh(self, params)
    if IsServer() then
        self:CalculateCharge()
    end
end
function BaseModifierCharges.prototype.OnIntervalThink(self)
    self:IncrementStackCount()
    self:StopIntervalThink()
    self:CalculateCharge()
end
function BaseModifierCharges.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_ABILITY_FULLY_CAST}
end
function BaseModifierCharges.prototype.OnAbilityFullyCast(self, event)
    if not IsServer() then
        return
    end
    if self:GetParent() ~= event.unit then
        return
    end
    local abilityName = event.ability:GetName()
    if self:GetAbility() == event.ability then
        self:RemoveCharge()
    elseif abilityName == "item_refresher" or abilityName == "item_refresher_shard" then
        self:RefreshCharges()
    end
end
function BaseModifierCharges.prototype.AddCharge(self)
    self:IncrementStackCount()
    self:CalculateCharge()
end
function BaseModifierCharges.prototype.RemoveCharge(self)
    self:DecrementStackCount()
    self:CalculateCharge()
end
function BaseModifierCharges.prototype.ResetCooldown(self)
    local chargeTime = self:GetReplenishTime() * self:GetParent():GetCooldownReduction()
    self:StartIntervalThink(chargeTime)
    self:SetDuration(chargeTime, true)
end
function BaseModifierCharges.prototype.CalculateCharge(self)
    local ability = self:GetAbility()
    ability:EndCooldown()
    if self:GetStackCount() >= self:GetMaxCharges() then
        self:SetDuration(-1, false)
        self:StopIntervalThink()
        return
    end
    self:ResetCooldown()
    if self:GetStackCount() == 0 then
        ability:StartCooldown(self:GetRemainingTime())
    end
end
function BaseModifierCharges.prototype.RefreshCharges(self)
    self:SetStackCount(self:GetMaxCharges())
    self:CalculateCharge()
end
function BaseModifierCharges.prototype.GetReplenishTime(self)
    return 0
end
function BaseModifierCharges.prototype.GetMaxCharges(self)
    return 1
end
return ____exports
