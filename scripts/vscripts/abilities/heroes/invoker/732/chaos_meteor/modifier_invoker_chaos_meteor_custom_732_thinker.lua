local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 6,["20"] = 6,["21"] = 7,["22"] = 8,["23"] = 9,["24"] = 16,["25"] = 17,["26"] = 5,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 33,["37"] = 34,["38"] = 35,["39"] = 37,["40"] = 39,["43"] = 41,["44"] = 43,["45"] = 44,["46"] = 45,["47"] = 47,["48"] = 47,["49"] = 47,["50"] = 47,["51"] = 47,["52"] = 47,["53"] = 47,["54"] = 55,["55"] = 57,["56"] = 58,["57"] = 60,["58"] = 61,["59"] = 29,["60"] = 64,["61"] = 65,["62"] = 67,["65"] = 69,["66"] = 69,["67"] = 69,["68"] = 69,["69"] = 69,["70"] = 69,["71"] = 69,["72"] = 70,["73"] = 72,["74"] = 73,["76"] = 64,["77"] = 77,["78"] = 78,["79"] = 79,["80"] = 80,["81"] = 81,["82"] = 82,["84"] = 84,["86"] = 77,["87"] = 88,["88"] = 89,["89"] = 90,["90"] = 92,["91"] = 92,["92"] = 92,["93"] = 92,["94"] = 92,["95"] = 92,["96"] = 92,["97"] = 92,["98"] = 92,["99"] = 92,["100"] = 92,["101"] = 92,["102"] = 102,["103"] = 103,["104"] = 104,["105"] = 106,["106"] = 106,["107"] = 106,["108"] = 106,["109"] = 106,["110"] = 106,["111"] = 92,["112"] = 92,["113"] = 88,["114"] = 117,["115"] = 118,["116"] = 120,["117"] = 121,["118"] = 122,["119"] = 124,["120"] = 125,["121"] = 126,["124"] = 117,["125"] = 131,["126"] = 132,["127"] = 133,["128"] = 135,["129"] = 140,["130"] = 140,["131"] = 140,["132"] = 140,["133"] = 140,["134"] = 141,["135"] = 141,["136"] = 141,["137"] = 141,["138"] = 141,["139"] = 142,["140"] = 142,["141"] = 142,["142"] = 142,["143"] = 142,["144"] = 143,["145"] = 145,["146"] = 145,["147"] = 145,["148"] = 145,["149"] = 145,["150"] = 146,["151"] = 131,["152"] = 149,["153"] = 150,["154"] = 151,["155"] = 153,["156"] = 153,["157"] = 153,["158"] = 153,["159"] = 153,["160"] = 153,["161"] = 153,["162"] = 153,["163"] = 153,["164"] = 153,["165"] = 153,["166"] = 153,["167"] = 153,["168"] = 166,["169"] = 168,["170"] = 168,["171"] = 168,["172"] = 168,["173"] = 168,["174"] = 149,["175"] = 6,["176"] = 6,["177"] = 6,["178"] = 5,["181"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerModifier = ____spheres.BaseInvokerModifier
local ____modifier_invoker_chaos_meteor_custom_732_burn = require("abilities.heroes.invoker.732.chaos_meteor.modifier_invoker_chaos_meteor_custom_732_burn")
local modifier_invoker_chaos_meteor_custom_732_burn = ____modifier_invoker_chaos_meteor_custom_732_burn.modifier_invoker_chaos_meteor_custom_732_burn
____exports.modifier_invoker_chaos_meteor_custom_732_thinker = __TS__Class()
local modifier_invoker_chaos_meteor_custom_732_thinker = ____exports.modifier_invoker_chaos_meteor_custom_732_thinker
modifier_invoker_chaos_meteor_custom_732_thinker.name = "modifier_invoker_chaos_meteor_custom_732_thinker"
__TS__ClassExtends(modifier_invoker_chaos_meteor_custom_732_thinker, BaseInvokerModifier)
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.____constructor(self, ...)
    BaseInvokerModifier.prototype.____constructor(self, ...)
    self.distance = 0
    self.radius = 0
    self.vision_radius = 0
    self.fallen = false
    self.move_step = 0
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.IsHidden(self)
    return true
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.IsPurgable(self)
    return false
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    self.distance = self:GetOrbSpecialValueFor("travel_distance", "wex")
    self.radius = self:GetSpecialValueFor("area_of_effect")
    self.vision_radius = self:GetSpecialValueFor("vision_distance")
    local damage = self:GetOrbSpecialValueFor("main_damage", "exort")
    if not IsServer() then
        return
    end
    self.origin = parent:GetAbsOrigin()
    self.direction = self.origin:__sub(caster:GetAbsOrigin())
    self.direction.z = 0
    self.direction = self.direction:Normalized()
    self.damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = nil,
        ability = self:GetAbility()
    }
    parent:SetMoveCapability(DOTA_UNIT_CAP_MOVE_FLY)
    self.fallen = false
    self.move_step = 0
    self:PlayEffects()
    self:StartIntervalThink(1.3)
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    AddFOWViewer(
        self:GetCaster():GetTeamNumber(),
        parent:GetAbsOrigin(),
        self.vision_radius,
        3,
        false
    )
    StopSoundOn("Hero_Invoker.ChaosMeteor.Loop", parent)
    if self.projectile then
        ProjectileManager:DestroyLinearProjectile(self.projectile)
    end
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.OnIntervalThink(self)
    if not self.fallen then
        self.fallen = true
        self:Burn()
        self:PlayEffects2()
        self:StartIntervalThink(0.5)
    else
        self:MoveBurn()
    end
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.Burn(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    __TS__ArrayForEach(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            parent:GetAbsOrigin(),
            nil,
            self.radius,
            2,
            bit.bor(1, 18),
            0,
            0,
            false
        ),
        function(____, enemy)
            self.damageTable.victim = enemy
            ApplyDamage(self.damageTable)
            modifier_invoker_chaos_meteor_custom_732_burn:apply(
                enemy,
                caster,
                self:GetAbility(),
                {duration = 3}
            )
        end
    )
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.MoveBurn(self)
    local parent = self:GetParent()
    local target = self.direction:__mul(300 * 0.5)
    parent:SetAbsOrigin(parent:GetAbsOrigin():__add(target))
    self:Burn()
    self.move_step = self.move_step + 1
    if self.move_step > 20 or parent:GetOrigin():__sub(self.origin:__add(target)):Length2D() > self.distance then
        self:Destroy()
        return
    end
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.PlayEffects(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_chaos_meteor_fly.vpcf", PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(
        particle,
        0,
        caster:GetAbsOrigin():__add(Vector(0, 0, 1500))
    )
    ParticleManager:SetParticleControl(
        particle,
        1,
        parent:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(1.3, 0, 0)
    )
    ParticleManager:ReleaseParticleIndex(particle)
    EmitSoundOnLocationWithCaster(
        caster:GetAbsOrigin(),
        "Hero_Invoker.ChaosMeteor.Cast",
        caster
    )
    parent:EmitSound("Hero_Invoker.ChaosMeteor.Loop")
end
function modifier_invoker_chaos_meteor_custom_732_thinker.prototype.PlayEffects2(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local info = {
        Ability = self:GetAbility(),
        EffectName = "particles/units/heroes/hero_invoker/invoker_chaos_meteor.vpcf",
        vSpawnOrigin = parent:GetAbsOrigin(),
        fDistance = self.distance,
        fStartRadius = self.radius,
        fEndRadius = self.radius,
        Source = caster,
        vVelocity = self.direction:__mul(300),
        bProvidesVision = true,
        iVisionRadius = self.vision_radius,
        iVisionTeamNumber = caster:GetTeamNumber()
    }
    self.projectile = ProjectileManager:CreateLinearProjectile(info)
    EmitSoundOnLocationWithCaster(
        parent:GetAbsOrigin(),
        "Hero_Invoker.ChaosMeteor.Impact",
        caster
    )
end
modifier_invoker_chaos_meteor_custom_732_thinker = __TS__Decorate(
    modifier_invoker_chaos_meteor_custom_732_thinker,
    modifier_invoker_chaos_meteor_custom_732_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_invoker_chaos_meteor_custom_732_thinker"}
)
____exports.modifier_invoker_chaos_meteor_custom_732_thinker = modifier_invoker_chaos_meteor_custom_732_thinker
return ____exports
