local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 8,["20"] = 10,["21"] = 3,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 16,["26"] = 17,["27"] = 18,["28"] = 20,["29"] = 22,["32"] = 24,["33"] = 26,["34"] = 27,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 35,["49"] = 37,["50"] = 37,["51"] = 37,["52"] = 37,["53"] = 37,["54"] = 37,["55"] = 37,["56"] = 39,["57"] = 12,["58"] = 42,["59"] = 43,["60"] = 43,["62"] = 42,["63"] = 46,["64"] = 47,["65"] = 48,["66"] = 49,["67"] = 51,["68"] = 51,["69"] = 51,["70"] = 51,["71"] = 51,["72"] = 51,["73"] = 51,["74"] = 53,["75"] = 53,["76"] = 53,["77"] = 53,["78"] = 53,["79"] = 53,["80"] = 53,["81"] = 53,["82"] = 53,["83"] = 53,["84"] = 53,["85"] = 65,["86"] = 66,["87"] = 68,["88"] = 69,["89"] = 69,["90"] = 69,["91"] = 69,["92"] = 69,["93"] = 69,["94"] = 69,["95"] = 69,["96"] = 69,["97"] = 69,["98"] = 69,["99"] = 69,["100"] = 69,["101"] = 69,["102"] = 86,["103"] = 88,["105"] = 91,["106"] = 46,["107"] = 4,["108"] = 4,["109"] = 4,["110"] = 3,["113"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_arc_warden_spark_wraith_custom_731_thinker = __TS__Class()
local modifier_arc_warden_spark_wraith_custom_731_thinker = ____exports.modifier_arc_warden_spark_wraith_custom_731_thinker
modifier_arc_warden_spark_wraith_custom_731_thinker.name = "modifier_arc_warden_spark_wraith_custom_731_thinker"
__TS__ClassExtends(modifier_arc_warden_spark_wraith_custom_731_thinker, BaseModifier)
function modifier_arc_warden_spark_wraith_custom_731_thinker.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.radius = 0
    self.vision_radius = 0
    self.damage = 0
    self.is_scepter = 0
end
function modifier_arc_warden_spark_wraith_custom_731_thinker.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    self.radius = self:GetSpecialValueFor("radius")
    self.vision_radius = self:GetSpecialValueFor("wraith_vision_radius")
    local activation_delay = self:GetSpecialValueFor("activation_delay")
    self.damage = self:GetSpecialValueFor("spark_damage")
    if not IsServer() then
        return
    end
    self.is_scepter = params.is_scepter
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_arc_warden/arc_warden_wraith.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        1,
        Vector(self.radius, 0, 0)
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    parent:EmitSound("Hero_ArcWarden.SparkWraith.Loop")
    AddFOWViewer(
        caster:GetTeamNumber(),
        parent:GetAbsOrigin(),
        self.vision_radius,
        activation_delay,
        false
    )
    self:StartIntervalThink(activation_delay)
end
function modifier_arc_warden_spark_wraith_custom_731_thinker.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():StopSound("Hero_ArcWarden.SparkWraith.Loop")
    end
end
function modifier_arc_warden_spark_wraith_custom_731_thinker.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local origin = parent:GetAbsOrigin()
    AddFOWViewer(
        caster:GetTeamNumber(),
        origin,
        self.vision_radius,
        0.2 + FrameTime(),
        false
    )
    local enemy = FindUnitsInRadius(
        caster:GetTeamNumber(),
        origin,
        nil,
        self.radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_CLOSEST,
        false
    )[1]
    if enemy ~= nil then
        parent:EmitSound("Hero_ArcWarden.SparkWraith.Activate")
        local effect_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_arc_warden/arc_warden_wraith_prj.vpcf", caster)
        local info = {
            Source = parent,
            Ability = self:GetAbility(),
            EffectName = effect_name,
            vSourceLoc = origin,
            Target = enemy,
            iMoveSpeed = 400,
            bDodgeable = false,
            bVisibleToEnemies = true,
            bProvidesVision = true,
            iVisionRadius = self.vision_radius,
            iVisionTeamNumber = caster:GetTeamNumber(),
            ExtraData = {damage = self.damage, is_scepter = self.is_scepter}
        }
        ProjectileManager:CreateTrackingProjectile(info)
        self:Destroy()
    end
    self:StartIntervalThink(0.2)
end
modifier_arc_warden_spark_wraith_custom_731_thinker = __TS__Decorate(
    modifier_arc_warden_spark_wraith_custom_731_thinker,
    modifier_arc_warden_spark_wraith_custom_731_thinker,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_arc_warden_spark_wraith_custom_731_thinker"}
)
____exports.modifier_arc_warden_spark_wraith_custom_731_thinker = modifier_arc_warden_spark_wraith_custom_731_thinker
return ____exports
