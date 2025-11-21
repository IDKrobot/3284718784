local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 7,["22"] = 8,["23"] = 9,["24"] = 4,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 17,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 25,["35"] = 26,["36"] = 27,["37"] = 28,["38"] = 30,["41"] = 32,["42"] = 37,["43"] = 37,["44"] = 37,["45"] = 37,["46"] = 37,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 39,["53"] = 39,["54"] = 39,["55"] = 39,["56"] = 39,["57"] = 39,["58"] = 39,["59"] = 39,["60"] = 41,["61"] = 21,["62"] = 44,["63"] = 45,["64"] = 46,["65"] = 48,["68"] = 50,["69"] = 50,["70"] = 50,["71"] = 50,["72"] = 50,["73"] = 50,["74"] = 50,["75"] = 58,["76"] = 58,["77"] = 58,["78"] = 58,["79"] = 58,["80"] = 58,["81"] = 58,["82"] = 58,["83"] = 58,["84"] = 58,["85"] = 58,["86"] = 58,["87"] = 58,["88"] = 68,["89"] = 69,["90"] = 69,["91"] = 69,["92"] = 69,["93"] = 70,["94"] = 70,["95"] = 70,["96"] = 70,["97"] = 72,["98"] = 73,["99"] = 74,["100"] = 76,["101"] = 58,["102"] = 58,["103"] = 58,["104"] = 58,["105"] = 58,["106"] = 79,["107"] = 81,["108"] = 82,["109"] = 83,["111"] = 86,["112"] = 88,["113"] = 44,["114"] = 5,["115"] = 5,["116"] = 5,["117"] = 4,["120"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
____exports.modifier_invoker_emp_custom_732 = __TS__Class()
local modifier_invoker_emp_custom_732 = ____exports.modifier_invoker_emp_custom_732
modifier_invoker_emp_custom_732.name = "modifier_invoker_emp_custom_732"
__TS__ClassExtends(modifier_invoker_emp_custom_732, BaseInvokerModifier)
function modifier_invoker_emp_custom_732.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.mana_burn = 0
    self.damage_pct = 0
    self.mana_heal_pct = 0
    self.radius = 0
end
function modifier_invoker_emp_custom_732.prototype.IsHidden(self)
    return true
end
function modifier_invoker_emp_custom_732.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_emp_custom_732.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    self.mana_burn = self:GetOrbSpecialValueFor("mana_burned", "wex")
    self.damage_pct = self:GetSpecialValueFor("damage_per_mana_pct")
    self.mana_heal_pct = self:GetSpecialValueFor("self_mana_restore_pct")
    self.radius = self:GetSpecialValueFor("area_of_effect")
    if not IsServer() then
        return
    end
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_emp.vpcf", PATTACH_WORLDORIGIN, caster)
    ParticleManager:SetParticleControl(
        self.particle,
        0,
        parent:GetOrigin()
    )
    ParticleManager:SetParticleControl(
        self.particle,
        1,
        Vector(self.radius, 0, 0)
    )
    self:AddParticle(
        self.particle,
        false,
        false,
        -1,
        false,
        true
    )
    parent:EmitSound("Hero_Invoker.EMP.Charge")
end
function modifier_invoker_emp_custom_732.prototype.OnDestroy(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    if not IsServer() then
        return
    end
    local damageTable = {
        attacker = caster,
        damage = 0,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = self:GetAbility()
    }
    local burned = __TS__ArrayReduce(
        __TS__ArrayMap(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                parent:GetOrigin(),
                nil,
                self.radius,
                2,
                bit.bor(1, 18),
                32768,
                0,
                false
            ),
            function(____, enemy)
                local mana_burn = math.min(
                    enemy:GetMana(),
                    self.mana_burn
                )
                enemy:Script_ReduceMana(
                    mana_burn,
                    self:GetAbility()
                )
                damageTable.victim = enemy
                damageTable.damage = mana_burn * self.damage_pct / 100
                ApplyDamage(damageTable)
                return mana_burn
            end
        ),
        function(____, a, b) return a + b end,
        0
    )
    caster:GiveMana(burned * self.mana_heal_pct / 100)
    if self.particle then
        ParticleManager:DestroyParticle(self.particle, false)
        ParticleManager:ReleaseParticleIndex(self.particle)
    end
    parent:EmitSound("Hero_Invoker.EMP.Discharge")
    UTIL_Remove(parent)
end
modifier_invoker_emp_custom_732 = __TS__Decorate(
    modifier_invoker_emp_custom_732,
    modifier_invoker_emp_custom_732,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_emp_custom_732"}
)
____exports.modifier_invoker_emp_custom_732 = modifier_invoker_emp_custom_732
return ____exports
