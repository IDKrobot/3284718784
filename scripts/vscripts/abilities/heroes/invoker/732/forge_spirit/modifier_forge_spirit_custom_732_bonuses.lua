local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["16"] = 6,["17"] = 7,["18"] = 8,["19"] = 9,["20"] = 58,["21"] = 59,["22"] = 60,["23"] = 5,["24"] = 11,["25"] = 12,["26"] = 11,["27"] = 15,["28"] = 16,["29"] = 15,["30"] = 19,["31"] = 20,["32"] = 19,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 27,["37"] = 31,["38"] = 33,["39"] = 34,["40"] = 36,["43"] = 38,["44"] = 39,["45"] = 44,["46"] = 44,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 44,["51"] = 44,["52"] = 44,["54"] = 47,["55"] = 47,["56"] = 47,["57"] = 47,["58"] = 23,["59"] = 50,["60"] = 51,["61"] = 50,["62"] = 6,["63"] = 6,["64"] = 6,["65"] = 5,["68"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_forge_spirit_custom_732_bonuses = __TS__Class()
local modifier_forge_spirit_custom_732_bonuses = ____exports.modifier_forge_spirit_custom_732_bonuses
modifier_forge_spirit_custom_732_bonuses.name = "modifier_forge_spirit_custom_732_bonuses"
__TS__ClassExtends(modifier_forge_spirit_custom_732_bonuses, BaseModifier)
function modifier_forge_spirit_custom_732_bonuses.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.attack_speed = 0
    self.attack_range = 0
    self.mana = 0
    self.GetModifierAttackSpeedBonus_Constant = function() return self.attack_speed end
    self.GetModifierAttackRangeBonus = function() return self.attack_range end
    self.GetModifierManaBonus = function() return self.mana end
end
function modifier_forge_spirit_custom_732_bonuses.prototype.IsHidden(self)
    return true
end
function modifier_forge_spirit_custom_732_bonuses.prototype.IsPurgable(self)
    return false
end
function modifier_forge_spirit_custom_732_bonuses.prototype.RemoveOnDeath(self)
    return false
end
function modifier_forge_spirit_custom_732_bonuses.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    self.attack_speed = caster:HasTalent("special_bonus_unique_invoker_732_custom_3") and 50 or 0
    local forge_spirit = caster:FindAbilityByName("invoker_forge_spirit_custom_732")
    self.attack_range = forge_spirit:GetOrbSpecialValueFor("spirit_attack_range", "quas")
    self.mana = forge_spirit:GetOrbSpecialValueFor("spirit_mana", "exort")
    if not IsServer() then
        return
    end
    if caster:HasPersona("npc_dota_hero_invoker") then
        local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker_kid/invoker_kid_forge_spirit_ambient.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
        self:AddParticle(
            particle,
            false,
            false,
            -1,
            false,
            false
        )
    end
    Timers:CreateTimer(
        FrameTime(),
        function() return parent:GiveMana(self.mana) end
    )
end
function modifier_forge_spirit_custom_732_bonuses.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT, MODIFIER_PROPERTY_ATTACK_RANGE_BONUS, MODIFIER_PROPERTY_MANA_BONUS}
end
modifier_forge_spirit_custom_732_bonuses = __TS__Decorate(
    modifier_forge_spirit_custom_732_bonuses,
    modifier_forge_spirit_custom_732_bonuses,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_forge_spirit_custom_732_bonuses"}
)
____exports.modifier_forge_spirit_custom_732_bonuses = modifier_forge_spirit_custom_732_bonuses
return ____exports
