local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 14,["28"] = 16,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 18,["38"] = 18,["39"] = 18,["40"] = 18,["41"] = 18,["42"] = 18,["43"] = 32,["44"] = 34,["45"] = 11,["46"] = 37,["47"] = 38,["48"] = 40,["51"] = 41,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 43,["59"] = 43,["60"] = 43,["61"] = 45,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 47,["66"] = 47,["67"] = 47,["68"] = 56,["69"] = 37,["70"] = 6,["71"] = 6,["72"] = 6,["73"] = 5,["76"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_nullifier_custom_721 = require("abilities.items.nullifier.721.modifier_item_nullifier_custom_721")
local modifier_item_nullifier_custom_721 = ____modifier_item_nullifier_custom_721.modifier_item_nullifier_custom_721
local ____modifier_item_nullifier_custom_721_mute = require("abilities.items.nullifier.721.modifier_item_nullifier_custom_721_mute")
local modifier_item_nullifier_custom_721_mute = ____modifier_item_nullifier_custom_721_mute.modifier_item_nullifier_custom_721_mute
____exports.item_nullifier_custom_721 = __TS__Class()
local item_nullifier_custom_721 = ____exports.item_nullifier_custom_721
item_nullifier_custom_721.name = "item_nullifier_custom_721"
__TS__ClassExtends(item_nullifier_custom_721, BaseItem)
function item_nullifier_custom_721.prototype.GetIntrinsicModifierName(self)
    return modifier_item_nullifier_custom_721.name
end
function item_nullifier_custom_721.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local projectile_speed = self:GetSpecialValueFor("projectile_speed")
    local info = {
        Target = target,
        Source = caster,
        Ability = self,
        EffectName = "particles/items4_fx/nullifier_proj.vpcf",
        iMoveSpeed = projectile_speed,
        vSourceLoc = caster:GetAbsOrigin(),
        bDodgeable = true,
        bDrawsOnMinimap = false,
        bIsAttack = false,
        bVisibleToEnemies = true,
        flExpireTime = GameRules:GetGameTime() + 20,
        bProvidesVision = false
    }
    ProjectileManager:CreateTrackingProjectile(info)
    caster:EmitSound("DOTA_Item.Nullifier.Cast")
end
function item_nullifier_custom_721.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    target:Purge(
        true,
        false,
        false,
        false,
        false
    )
    local duration = self:GetSpecialValueFor("mute_duration")
    modifier_item_nullifier_custom_721_mute:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, duration)}
    )
    target:EmitSound("DOTA_Item.Nullifier.Target")
end
item_nullifier_custom_721 = __TS__Decorate(
    item_nullifier_custom_721,
    item_nullifier_custom_721,
    {registerAbility(nil)},
    {kind = "class", name = "item_nullifier_custom_721"}
)
____exports.item_nullifier_custom_721 = item_nullifier_custom_721
return ____exports
