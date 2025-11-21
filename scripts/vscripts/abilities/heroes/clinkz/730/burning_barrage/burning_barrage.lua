local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 6,["18"] = 7,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 9,["23"] = 10,["24"] = 8,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 19,["31"] = 21,["32"] = 17,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 28,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 28,["46"] = 28,["47"] = 24,["48"] = 42,["49"] = 43,["50"] = 45,["51"] = 42,["52"] = 48,["53"] = 49,["54"] = 51,["57"] = 53,["58"] = 54,["59"] = 55,["60"] = 56,["61"] = 56,["62"] = 56,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 64,["69"] = 67,["70"] = 74,["71"] = 74,["72"] = 74,["73"] = 74,["74"] = 74,["75"] = 74,["76"] = 74,["77"] = 74,["78"] = 74,["79"] = 74,["80"] = 76,["81"] = 78,["82"] = 48,["83"] = 7,["84"] = 7,["85"] = 7,["86"] = 6,["89"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_clinkz_burning_barrage_custom_730 = require("abilities.heroes.clinkz.730.burning_barrage.modifier_clinkz_burning_barrage_custom_730")
local modifier_clinkz_burning_barrage_custom_730 = ____modifier_clinkz_burning_barrage_custom_730.modifier_clinkz_burning_barrage_custom_730
local ____modifier_clinkz_burning_barrage_custom_730_damage = require("abilities.heroes.clinkz.730.burning_barrage.modifier_clinkz_burning_barrage_custom_730_damage")
local modifier_clinkz_burning_barrage_custom_730_damage = ____modifier_clinkz_burning_barrage_custom_730_damage.modifier_clinkz_burning_barrage_custom_730_damage
local ____modifier_clinkz_burning_barrage_custom_730_tracker = require("abilities.heroes.clinkz.730.burning_barrage.modifier_clinkz_burning_barrage_custom_730_tracker")
local modifier_clinkz_burning_barrage_custom_730_tracker = ____modifier_clinkz_burning_barrage_custom_730_tracker.modifier_clinkz_burning_barrage_custom_730_tracker
____exports.clinkz_burning_barrage_custom_730 = __TS__Class()
local clinkz_burning_barrage_custom_730 = ____exports.clinkz_burning_barrage_custom_730
clinkz_burning_barrage_custom_730.name = "clinkz_burning_barrage_custom_730"
__TS__ClassExtends(clinkz_burning_barrage_custom_730, BaseAbility)
function clinkz_burning_barrage_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_clinkz.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_clinkz.vsndevts")
end
function clinkz_burning_barrage_custom_730.prototype.GetIntrinsicModifierName(self)
    return modifier_clinkz_burning_barrage_custom_730_tracker.name
end
function clinkz_burning_barrage_custom_730.prototype.GetAOERadius(self)
    local caster = self:GetCaster()
    local bonus = caster:GetModifierStackCount(modifier_clinkz_burning_barrage_custom_730_tracker.name, caster)
    return self:GetSpecialValueFor("range") + bonus
end
function clinkz_burning_barrage_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    modifier_clinkz_burning_barrage_custom_730:apply(
        caster,
        caster,
        self,
        {
            duration = self:GetChannelTime(),
            x = point.x,
            y = point.y,
            z = point.z
        }
    )
end
function clinkz_burning_barrage_custom_730.prototype.OnChannelFinish(self, interrupted)
    local caster = self:GetCaster()
    caster:RemoveModifierByName(modifier_clinkz_burning_barrage_custom_730.name)
end
function clinkz_burning_barrage_custom_730.prototype.OnProjectileHit(self, target, location)
    local caster = self:GetCaster()
    if not target then
        return
    end
    local searingArrow = caster:FindAbilityByName("clinkz_searing_arrows_custom_730")
    if searingArrow then
        local damage = searingArrow:GetSpecialValueFor("bonus_damage")
        local damageTable = {
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_PHYSICAL,
            victim = target,
            ability = self
        }
        ApplyDamage(damageTable)
    end
    local damage_reduction = modifier_clinkz_burning_barrage_custom_730_damage:apply(caster, caster, self, {})
    caster:PerformAttack(
        target,
        true,
        true,
        true,
        true,
        false,
        false,
        true
    )
    damage_reduction:Destroy()
    target:EmitSound("Hero_Clinkz.SearingArrows.Impact")
end
clinkz_burning_barrage_custom_730 = __TS__Decorate(
    clinkz_burning_barrage_custom_730,
    clinkz_burning_barrage_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "clinkz_burning_barrage_custom_730"}
)
____exports.clinkz_burning_barrage_custom_730 = clinkz_burning_barrage_custom_730
return ____exports
