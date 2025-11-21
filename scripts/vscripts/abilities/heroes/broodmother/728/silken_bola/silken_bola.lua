local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 6,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["27"] = 16,["28"] = 17,["31"] = 19,["32"] = 20,["35"] = 22,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 24,["44"] = 24,["45"] = 24,["46"] = 34,["47"] = 36,["48"] = 11,["49"] = 39,["50"] = 40,["51"] = 42,["54"] = 44,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 46,["62"] = 46,["63"] = 55,["64"] = 39,["65"] = 5,["66"] = 5,["67"] = 5,["68"] = 4,["71"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_broodmother_silken_bola_custom_728 = require("abilities.heroes.broodmother.728.silken_bola.modifier_broodmother_silken_bola_custom_728")
local modifier_broodmother_silken_bola_custom_728 = ____modifier_broodmother_silken_bola_custom_728.modifier_broodmother_silken_bola_custom_728
____exports.broodmother_silken_bola_custom_728 = __TS__Class()
local broodmother_silken_bola_custom_728 = ____exports.broodmother_silken_bola_custom_728
broodmother_silken_bola_custom_728.name = "broodmother_silken_bola_custom_728"
__TS__ClassExtends(broodmother_silken_bola_custom_728, BaseAbility)
function broodmother_silken_bola_custom_728.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_broodmother.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_broodmother.vsndevts")
end
function broodmother_silken_bola_custom_728.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    local spin_web = caster:FindAbilityByName("broodmother_spin_web_custom_728")
    if not spin_web then
        return
    end
    local charges = spin_web:GetCurrentAbilityCharges()
    if charges == 0 then
        return
    end
    spin_web:SetCurrentAbilityCharges(charges - 1)
    local info = {
        Ability = self,
        EffectName = "particles/units/heroes/hero_broodmother/broodmother_silken_bola_projectile.vpcf",
        Source = caster,
        Target = target,
        bDodgeable = true,
        iMoveSpeed = 1200,
        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
        vSourceLoc = caster:GetAbsOrigin()
    }
    ProjectileManager:CreateTrackingProjectile(info)
    caster:EmitSound("Hero_Broodmother.SilkenBola.Cast")
end
function broodmother_silken_bola_custom_728.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    modifier_broodmother_silken_bola_custom_728:apply(
        target,
        caster,
        self,
        {duration = target:CalculateDuration(caster, 2)}
    )
    target:EmitSound("Hero_Broodmother.SilkenBola.Target")
end
broodmother_silken_bola_custom_728 = __TS__Decorate(
    broodmother_silken_bola_custom_728,
    broodmother_silken_bola_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "broodmother_silken_bola_custom_728"}
)
____exports.broodmother_silken_bola_custom_728 = broodmother_silken_bola_custom_728
return ____exports
