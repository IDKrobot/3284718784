local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 6,["14"] = 7,["15"] = 6,["16"] = 7,["17"] = 8,["18"] = 9,["19"] = 8,["20"] = 12,["21"] = 13,["22"] = 12,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 20,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 22,["42"] = 22,["43"] = 37,["44"] = 39,["45"] = 42,["47"] = 45,["48"] = 50,["49"] = 50,["50"] = 50,["51"] = 50,["52"] = 50,["53"] = 50,["54"] = 50,["55"] = 50,["56"] = 16,["57"] = 53,["58"] = 54,["59"] = 55,["60"] = 55,["61"] = 55,["62"] = 55,["63"] = 59,["64"] = 59,["65"] = 59,["66"] = 59,["67"] = 59,["68"] = 59,["69"] = 59,["70"] = 55,["71"] = 55,["73"] = 53,["74"] = 7,["75"] = 7,["76"] = 7,["77"] = 6,["80"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
LinkLuaModifier("modifier_generic_arc", "abilities/generic/modifier_generic_arc.lua", LUA_MODIFIER_MOTION_BOTH)
____exports.modifier_invoker_deafening_blast_custom_732_knockback = __TS__Class()
local modifier_invoker_deafening_blast_custom_732_knockback = ____exports.modifier_invoker_deafening_blast_custom_732_knockback
modifier_invoker_deafening_blast_custom_732_knockback.name = "modifier_invoker_deafening_blast_custom_732_knockback"
__TS__ClassExtends(modifier_invoker_deafening_blast_custom_732_knockback, BaseInvokerModifier)
function modifier_invoker_deafening_blast_custom_732_knockback.prototype.IsHidden(self)
    return false
end
function modifier_invoker_deafening_blast_custom_732_knockback.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_deafening_blast_custom_732_knockback.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    parent:AddNewModifier(
        caster,
        self:GetAbility(),
        "modifier_generic_arc",
        {
            duration = self:GetDuration(),
            distance = params.distance,
            target_x = params.point_x,
            target_y = params.point_y,
            height = 0,
            fix_end = true,
            isStun = false
        }
    )
    local particle_name = "particles/units/heroes/hero_invoker/invoker_deafening_blast_knockback_debuff.vpcf"
    if caster:HasPersona("npc_dota_hero_invoker") and caster:HasWearable("models/items/invoker_kid/dark_artistry_kid/invoker_kid_dark_artistry_back.vmdl") or caster:HasWearable("models/items/invoker/dark_artistry/dark_artistry_cape_model.vmdl") then
        particle_name = "particles/econ/items/invoker/invoker_ti6/invoker_deafening_blast_ti6_knockback_debuff.vpcf"
    end
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, parent)
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
end
function modifier_invoker_deafening_blast_custom_732_knockback.prototype.OnRefresh(self, params)
    if IsServer() then
        self:GetParent():AddNewModifier(
            self:GetCaster(),
            self:GetAbility(),
            "modifier_generic_arc",
            {
                duration = self:GetDuration(),
                target_x = params.point_x,
                target_y = params.point_y,
                height = 0,
                fix_end = true,
                isStun = false
            }
        )
    end
end
modifier_invoker_deafening_blast_custom_732_knockback = __TS__Decorate(
    modifier_invoker_deafening_blast_custom_732_knockback,
    modifier_invoker_deafening_blast_custom_732_knockback,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_deafening_blast_custom_732_knockback"}
)
____exports.modifier_invoker_deafening_blast_custom_732_knockback = modifier_invoker_deafening_blast_custom_732_knockback
return ____exports
