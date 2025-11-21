local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 6,["18"] = 5,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 17,["29"] = 19,["30"] = 21,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 21,["35"] = 21,["36"] = 21,["37"] = 21,["38"] = 21,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 31,["48"] = 31,["49"] = 31,["50"] = 31,["51"] = 41,["52"] = 42,["53"] = 43,["54"] = 31,["55"] = 31,["56"] = 46,["57"] = 15,["58"] = 49,["59"] = 50,["60"] = 51,["63"] = 53,["64"] = 54,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 56,["71"] = 56,["72"] = 63,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 74,["80"] = 49,["81"] = 6,["82"] = 6,["83"] = 6,["84"] = 5,["87"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_item_gungir_custom_735 = require("abilities.items.gungir.735.modifier_item_gungir_custom_735")
local modifier_item_gungir_custom_735 = ____modifier_item_gungir_custom_735.modifier_item_gungir_custom_735
local ____modifier_item_gungir_custom_735_root = require("abilities.items.gungir.735.modifier_item_gungir_custom_735_root")
local modifier_item_gungir_custom_735_root = ____modifier_item_gungir_custom_735_root.modifier_item_gungir_custom_735_root
____exports.item_gungir_custom_735 = __TS__Class()
local item_gungir_custom_735 = ____exports.item_gungir_custom_735
item_gungir_custom_735.name = "item_gungir_custom_735"
__TS__ClassExtends(item_gungir_custom_735, BaseItem)
function item_gungir_custom_735.prototype.GetIntrinsicModifierName(self)
    return modifier_item_gungir_custom_735.name
end
function item_gungir_custom_735.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function item_gungir_custom_735.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")
    local info = {
        Source = caster,
        Ability = self,
        EffectName = "particles/items3_fx/gleipnir_projectile.vpcf",
        iMoveSpeed = 1900,
        bReplaceExisting = false,
        bDodgeable = true,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
    }
    __TS__ArrayForEach(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            point,
            nil,
            radius,
            2,
            bit.bor(1, 18),
            0,
            1,
            false
        ),
        function(____, enemy)
            info.Target = enemy
            ProjectileManager:CreateTrackingProjectile(info)
        end
    )
    caster:EmitSound("Item.Gleipnir.Cast")
end
function item_gungir_custom_735.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    local damage = self:GetSpecialValueFor("active_damage")
    local duration = self:GetSpecialValueFor("duration")
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = self
    }
    ApplyDamage(damageTable)
    modifier_item_gungir_custom_735_root:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, duration)}
    )
    target:EmitSound("Item.Gleipnir.Target")
end
item_gungir_custom_735 = __TS__Decorate(
    item_gungir_custom_735,
    item_gungir_custom_735,
    {registerAbility(nil)},
    {kind = "class", name = "item_gungir_custom_735"}
)
____exports.item_gungir_custom_735 = item_gungir_custom_735
return ____exports
