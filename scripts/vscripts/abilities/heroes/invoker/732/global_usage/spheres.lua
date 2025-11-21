local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 9,["19"] = 14,["20"] = 15,["21"] = 14,["22"] = 18,["23"] = 19,["24"] = 18,["25"] = 22,["26"] = 23,["27"] = 24,["29"] = 26,["30"] = 26,["31"] = 26,["32"] = 26,["34"] = 22,["35"] = 30,["36"] = 31,["37"] = 32,["39"] = 35,["40"] = 30,["41"] = 39,["42"] = 39,["43"] = 39,["44"] = 39,["45"] = 40,["46"] = 41,["47"] = 40,["48"] = 44,["49"] = 45,["50"] = 44,["51"] = 48,["52"] = 49,["53"] = 48,["54"] = 54,["55"] = 60,["56"] = 60,["57"] = 60,["58"] = 60,["60"] = 60,["61"] = 61,["62"] = 60,["63"] = 67,["64"] = 68,["65"] = 69,["66"] = 67,["67"] = 72,["68"] = 73,["69"] = 75,["70"] = 76,["71"] = 77,["72"] = 78,["74"] = 81,["75"] = 83,["76"] = 84,["77"] = 85,["78"] = 86,["79"] = 87,["81"] = 90,["83"] = 93,["84"] = 94,["85"] = 95,["86"] = 95,["88"] = 97,["89"] = 72,["90"] = 100,["91"] = 101,["92"] = 100,["93"] = 105,["94"] = 105,["95"] = 105,["96"] = 105,["97"] = 106,["98"] = 107,["99"] = 108,["100"] = 108,["102"] = 110,["103"] = 106});
local ____exports = {}
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
____exports.BaseSphereClass = __TS__Class()
local BaseSphereClass = ____exports.BaseSphereClass
BaseSphereClass.name = "BaseSphereClass"
__TS__ClassExtends(BaseSphereClass, CustomAbility)
function BaseSphereClass.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_invoker.vsndevts")
end
function BaseSphereClass.prototype.ProcsMagicStick(self)
    return false
end
function BaseSphereClass.prototype.IsStealable(self)
    return false
end
function BaseSphereClass.prototype.OnUpgrade(self)
    if not self.invoke then
        self.invoke = self:GetCaster():FindAbilityByName("invoker_invoke_custom_732")
    else
        self.invoke:UpdateOrb(
            self.constructor.name,
            self:GetLevel()
        )
    end
end
function BaseSphereClass.prototype.GetInvoke(self)
    if not self.invoke then
        self.invoke = self:GetCaster():FindAbilityByName("invoker_invoke_custom_732")
    end
    return self.invoke
end
____exports.BaseSphereStackModifier = __TS__Class()
local BaseSphereStackModifier = ____exports.BaseSphereStackModifier
BaseSphereStackModifier.name = "BaseSphereStackModifier"
__TS__ClassExtends(BaseSphereStackModifier, BaseModifier)
function BaseSphereStackModifier.prototype.IsHidden(self)
    return false
end
function BaseSphereStackModifier.prototype.IsPurgable(self)
    return false
end
function BaseSphereStackModifier.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_PERMANENT
end
local ORB_ABILITIES = {quas = "invoker_quas_custom_732", wex = "invoker_wex_custom_732", exort = "invoker_exort_custom_732"}
____exports.BaseInvokerAbility = __TS__Class()
local BaseInvokerAbility = ____exports.BaseInvokerAbility
BaseInvokerAbility.name = "BaseInvokerAbility"
__TS__ClassExtends(BaseInvokerAbility, CustomAbility)
function BaseInvokerAbility.prototype.____constructor(self, ...)
    CustomAbility.prototype.____constructor(self, ...)
    self.__orb_level__ = {quas = 0, wex = 0, exort = 0}
end
function BaseInvokerAbility.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_invoker.vsndevts")
end
function BaseInvokerAbility.prototype.GetOrbSpecialValueFor(self, name, orb)
    local caster = self:GetCaster()
    local unitName = caster:GetUnitName()
    if unitName ~= "npc_dota_hero_invoker" and unitName ~= "npc_dota_hero_morphling" then
        local level = self.__orb_level__[orb]
        return self:GetLevelSpecialValueFor(name, level - 1)
    end
    local abilityName = ORB_ABILITIES[orb]
    local ability = caster:FindAbilityByName(abilityName)
    if not ability then
        if unitName == "npc_dota_hero_morphling" then
            local level = self.__orb_level__[orb]
            return self:GetLevelSpecialValueFor(name, level - 1)
        end
        return 0
    end
    local level = ability:GetLevel()
    self.__orb_level__[orb] = level
    if caster:HasScepter() then
        level = level + 1
    end
    return self:GetLevelSpecialValueFor(name, level - 1)
end
function BaseInvokerAbility.prototype.OnStolen(self, sourceAbility)
    self.__orb_level__ = sourceAbility.__orb_level__
end
____exports.BaseInvokerModifier = __TS__Class()
local BaseInvokerModifier = ____exports.BaseInvokerModifier
BaseInvokerModifier.name = "BaseInvokerModifier"
__TS__ClassExtends(BaseInvokerModifier, BaseModifier)
function BaseInvokerModifier.prototype.GetOrbSpecialValueFor(self, name, orb)
    local ability = self:GetAbility()
    if not ability then
        return 0
    end
    return ability:GetOrbSpecialValueFor(name, orb)
end
return ____exports
