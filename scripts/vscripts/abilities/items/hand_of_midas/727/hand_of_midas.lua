local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 11,["25"] = 15,["26"] = 16,["27"] = 16,["28"] = 16,["29"] = 16,["30"] = 17,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 15,["40"] = 28,["41"] = 29,["42"] = 30,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 32,["49"] = 34,["50"] = 28,["51"] = 37,["52"] = 38,["53"] = 39,["54"] = 40,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 46,["63"] = 49,["64"] = 50,["65"] = 51,["66"] = 53,["67"] = 55,["68"] = 56,["69"] = 58,["70"] = 37,["71"] = 61,["72"] = 62,["73"] = 63,["74"] = 65,["75"] = 66,["76"] = 71,["77"] = 71,["78"] = 71,["79"] = 71,["80"] = 71,["81"] = 71,["82"] = 71,["83"] = 71,["84"] = 71,["85"] = 72,["86"] = 74,["87"] = 75,["88"] = 75,["89"] = 75,["90"] = 75,["91"] = 75,["92"] = 75,["93"] = 81,["94"] = 81,["95"] = 81,["96"] = 81,["97"] = 81,["98"] = 82,["99"] = 84,["100"] = 84,["101"] = 84,["102"] = 84,["103"] = 84,["104"] = 84,["105"] = 84,["106"] = 92,["107"] = 61,["108"] = 6,["109"] = 6,["110"] = 6,["111"] = 5,["114"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomItem = ____ability_utils.CustomItem
local ____modifier_item_hand_of_midas_custom_727 = require("abilities.items.hand_of_midas.727.modifier_item_hand_of_midas_custom_727")
local modifier_item_hand_of_midas_custom_727 = ____modifier_item_hand_of_midas_custom_727.modifier_item_hand_of_midas_custom_727
____exports.item_hand_of_midas_custom_727 = __TS__Class()
local item_hand_of_midas_custom_727 = ____exports.item_hand_of_midas_custom_727
item_hand_of_midas_custom_727.name = "item_hand_of_midas_custom_727"
__TS__ClassExtends(item_hand_of_midas_custom_727, CustomItem)
function item_hand_of_midas_custom_727.prototype.____constructor(self)
    CustomItem.prototype.____constructor(self, "hand_of_midas_727")
end
function item_hand_of_midas_custom_727.prototype.GetIntrinsicModifierName(self)
    return modifier_item_hand_of_midas_custom_727.name
end
function item_hand_of_midas_custom_727.prototype.CastFilterResultTarget(self, target)
    if target:IsOther() or __TS__StringIncludes(
        target:GetUnitName(),
        "necronomicon"
    ) then
        return UF_FAIL_CUSTOM
    end
    return UnitFilter(
        target,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_CREEP,
        bit.bor(DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES),
        self:GetCaster():GetTeamNumber()
    )
end
function item_hand_of_midas_custom_727.prototype.GetCustomCastErrorTarget(self, target)
    if target:IsOther() then
        return "#dota_hud_error_cant_use_on_wards"
    elseif __TS__StringIncludes(
        target:GetUnitName(),
        "necronomicon"
    ) then
        return "#dota_hud_error_cant_use_on_necrobook"
    end
    return ""
end
function item_hand_of_midas_custom_727.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local bonus_gold = self:GetSpecialValueFor("bonus_gold")
    local bonus_xp = target:GetDeathXP() * self:GetSpecialValueFor("xp_multiplier")
    if GameRules:IsTurboMode() then
        bonus_gold = bonus_gold * 2
        bonus_xp = bonus_xp * 2
    end
    target:SetDeathXP(0)
    target:SetMinimumGoldBounty(0)
    target:SetMaximumGoldBounty(0)
    target:Kill(self, caster)
    caster:AddExperience(bonus_xp, DOTA_ModifyXP_Unspecified, false, false)
    caster:ModifyGoldFiltered(bonus_gold, true, DOTA_ModifyGold_Unspecified)
    self:PlayEffects(target, bonus_gold)
end
function item_hand_of_midas_custom_727.prototype.PlayEffects(self, target, gold)
    local caster = self:GetCaster()
    local controller = caster:GetPlayerOwner()
    local particle_name = ParticleManager:GetParticleReplacement("particles/items2_fx/hand_of_midas.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, target)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        caster:GetAbsOrigin(),
        false
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local particle_gold_name = ParticleManager:GetParticleReplacement("particles/generic_gameplay/lasthit_coins.vpcf", caster)
    local particle_gold = ParticleManager:CreateParticleForPlayer(
        particle_gold_name,
        PATTACH_WORLDORIGIN,
        nil,
        caster:GetPlayerOwner()
    )
    ParticleManager:SetParticleControl(
        particle_gold,
        1,
        target:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    SendOverheadEventMessage(
        controller,
        OVERHEAD_ALERT_GOLD,
        target,
        gold,
        nil
    )
    caster:EmitSound("DOTA_Item.Hand_Of_Midas")
end
item_hand_of_midas_custom_727 = __TS__Decorate(
    item_hand_of_midas_custom_727,
    item_hand_of_midas_custom_727,
    {registerAbility(nil)},
    {kind = "class", name = "item_hand_of_midas_custom_727"}
)
____exports.item_hand_of_midas_custom_727 = item_hand_of_midas_custom_727
return ____exports
