local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 23,["32"] = 25,["33"] = 27,["34"] = 21,["35"] = 30,["36"] = 31,["37"] = 32,["39"] = 30,["40"] = 35,["41"] = 36,["42"] = 37,["43"] = 38,["46"] = 40,["47"] = 41,["48"] = 42,["51"] = 44,["52"] = 45,["53"] = 47,["54"] = 49,["55"] = 50,["56"] = 51,["57"] = 53,["58"] = 54,["59"] = 54,["60"] = 54,["61"] = 54,["62"] = 58,["63"] = 58,["64"] = 58,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 54,["69"] = 54,["71"] = 66,["72"] = 35,["73"] = 69,["74"] = 70,["75"] = 69,["76"] = 4,["77"] = 4,["78"] = 4,["79"] = 3,["82"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_morphling_morph_agi_custom_729_morph = __TS__Class()
local modifier_morphling_morph_agi_custom_729_morph = ____exports.modifier_morphling_morph_agi_custom_729_morph
modifier_morphling_morph_agi_custom_729_morph.name = "modifier_morphling_morph_agi_custom_729_morph"
__TS__ClassExtends(modifier_morphling_morph_agi_custom_729_morph, BaseModifier)
function modifier_morphling_morph_agi_custom_729_morph.prototype.IsHidden(self)
    return false
end
function modifier_morphling_morph_agi_custom_729_morph.prototype.IsPurgable(self)
    return false
end
function modifier_morphling_morph_agi_custom_729_morph.prototype.IsPurgeException(self)
    return false
end
function modifier_morphling_morph_agi_custom_729_morph.prototype.IsDebuff(self)
    return false
end
function modifier_morphling_morph_agi_custom_729_morph.prototype.OnCreated(self, params)
    local interval = self:GetSpecialValueFor("morph_cooldown")
    if not IsServer() then
        return
    end
    self:GetParent():EmitSound("Hero_Morphling.MorphAgility")
    self:StartIntervalThink(interval)
end
function modifier_morphling_morph_agi_custom_729_morph.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():StopSound("Hero_Morphling.MorphAgility")
    end
end
function modifier_morphling_morph_agi_custom_729_morph.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local ability = self:GetAbility()
    if not ability then
        return
    end
    local interval = self:GetSpecialValueFor("morph_cooldown")
    local manaCost = self:GetSpecialValueFor("mana_cost") * interval
    if parent:GetMana() < manaCost then
        return
    end
    if math.floor(parent:GetBaseStrength()) > 0 then
        parent:SpendMana(manaCost, ability)
        local health = parent:GetHealth()
        parent:ModifyStrength(-1)
        parent:ModifyAgility(1)
        parent:CalculateStatBonus(true)
        health = health - parent:GetHealth()
        parent:ModifyHealth(
            parent:GetHealth() - (22 - health),
            ability,
            false,
            bit.bor(
                bit.bor(
                    bit.bor(DOTA_DAMAGE_FLAG_NON_LETHAL, DOTA_DAMAGE_FLAG_HPLOSS),
                    DOTA_DAMAGE_FLAG_NO_DAMAGE_MULTIPLIERS
                ),
                DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION
            )
        )
    end
    self:StartIntervalThink(interval)
end
function modifier_morphling_morph_agi_custom_729_morph.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_morphling/morphling_morph_agi.vpcf"
end
modifier_morphling_morph_agi_custom_729_morph = __TS__Decorate(
    modifier_morphling_morph_agi_custom_729_morph,
    modifier_morphling_morph_agi_custom_729_morph,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_morphling_morph_agi_custom_729_morph"}
)
____exports.modifier_morphling_morph_agi_custom_729_morph = modifier_morphling_morph_agi_custom_729_morph
return ____exports
