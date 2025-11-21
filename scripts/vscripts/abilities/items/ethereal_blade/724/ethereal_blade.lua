local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["30"] = 17,["31"] = 19,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 19,["40"] = 19,["41"] = 19,["42"] = 19,["43"] = 19,["44"] = 19,["45"] = 19,["46"] = 19,["47"] = 35,["48"] = 37,["49"] = 12,["50"] = 40,["51"] = 41,["52"] = 42,["55"] = 44,["56"] = 46,["57"] = 47,["61"] = 50,["62"] = 51,["63"] = 51,["65"] = 53,["66"] = 62,["67"] = 63,["68"] = 64,["69"] = 65,["70"] = 67,["71"] = 71,["72"] = 73,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 73,["77"] = 73,["78"] = 73,["79"] = 81,["80"] = 83,["82"] = 93,["83"] = 40,["84"] = 7,["85"] = 7,["86"] = 7,["87"] = 6,["90"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_ethereal_blade_custom_724 = require("abilities.items.ethereal_blade.724.modifier_item_ethereal_blade_custom_724")
local modifier_item_ethereal_blade_custom_724 = ____modifier_item_ethereal_blade_custom_724.modifier_item_ethereal_blade_custom_724
local ____modifier_item_ethereal_blade_custom_724_slow = require("abilities.items.ethereal_blade.724.modifier_item_ethereal_blade_custom_724_slow")
local modifier_item_ethereal_blade_custom_724_slow = ____modifier_item_ethereal_blade_custom_724_slow.modifier_item_ethereal_blade_custom_724_slow
local ____modifier_item_ethereal_blade_custom_724_ethereal = require("abilities.items.ethereal_blade.724.modifier_item_ethereal_blade_custom_724_ethereal")
local modifier_item_ethereal_blade_custom_724_ethereal = ____modifier_item_ethereal_blade_custom_724_ethereal.modifier_item_ethereal_blade_custom_724_ethereal
____exports.item_ethereal_blade_custom_724 = __TS__Class()
local item_ethereal_blade_custom_724 = ____exports.item_ethereal_blade_custom_724
item_ethereal_blade_custom_724.name = "item_ethereal_blade_custom_724"
__TS__ClassExtends(item_ethereal_blade_custom_724, BaseItem)
function item_ethereal_blade_custom_724.prototype.GetIntrinsicModifierName(self)
    return modifier_item_ethereal_blade_custom_724.name
end
function item_ethereal_blade_custom_724.prototype.OnSpellStart(self)
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
        EffectName = "particles/items_fx/ethereal_blade.vpcf",
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
        iMoveSpeed = projectile_speed,
        vSourceLoc = caster:GetAbsOrigin(),
        bDrawsOnMinimap = false,
        bDodgeable = true,
        bIsAttack = false,
        bVisibleToEnemies = true,
        bReplaceExisting = false,
        flExpireTime = GameRules:GetGameTime() + 20,
        bProvidesVision = false
    }
    ProjectileManager:CreateTrackingProjectile(info)
    caster:EmitSound("DOTA_Item.EtherealBlade.Activate")
end
function item_ethereal_blade_custom_724.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    local isAlly = target:GetTeamNumber() == caster:GetTeamNumber()
    if not isAlly then
        if target:TriggerSpellAbsorb(self) then
            return
        end
    end
    local duration = self:GetSpecialValueFor("duration")
    if not isAlly then
        duration = target:CalculateDuration(caster, duration)
    end
    modifier_item_ethereal_blade_custom_724_ethereal:apply(target, caster, self, {duration = duration})
    if not isAlly then
        local damage_base = self:GetSpecialValueFor("blast_damage_base")
        local damage_multiplier = self:GetSpecialValueFor("blast_attribute_multiplier")
        local all_attribute_pct = self:GetSpecialValueFor("blast_all_attribute_pct")
        local attribute = caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_ALL and caster:GetAllAttributes() * all_attribute_pct / 100 or caster:GetPrimaryStatValue()
        local damage = damage_base + attribute * damage_multiplier
        local damageTable = {
            attacker = caster,
            victim = target,
            damage = damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self
        }
        ApplyDamage(damageTable)
        modifier_item_ethereal_blade_custom_724_slow:apply(target, caster, self, {duration = duration})
    end
    target:EmitSound("DOTA_Item.EtherealBlade.Target")
end
item_ethereal_blade_custom_724 = __TS__Decorate(
    item_ethereal_blade_custom_724,
    item_ethereal_blade_custom_724,
    {registerAbility(nil)},
    {kind = "class", name = "item_ethereal_blade_custom_724"}
)
____exports.item_ethereal_blade_custom_724 = item_ethereal_blade_custom_724
return ____exports
