local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 5,["13"] = 6,["14"] = 5,["15"] = 6,["17"] = 6,["18"] = 11,["19"] = 12,["20"] = 14,["21"] = 15,["22"] = 111,["23"] = 5,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 25,["31"] = 33,["32"] = 35,["33"] = 37,["34"] = 38,["35"] = 40,["38"] = 42,["39"] = 43,["40"] = 44,["41"] = 46,["42"] = 48,["43"] = 50,["44"] = 51,["45"] = 25,["46"] = 54,["47"] = 55,["48"] = 56,["50"] = 54,["51"] = 59,["52"] = 60,["53"] = 62,["54"] = 63,["57"] = 67,["58"] = 68,["59"] = 69,["62"] = 73,["63"] = 75,["64"] = 77,["65"] = 77,["66"] = 77,["67"] = 77,["68"] = 77,["69"] = 77,["70"] = 77,["71"] = 77,["72"] = 77,["73"] = 77,["74"] = 77,["75"] = 86,["76"] = 87,["77"] = 88,["79"] = 90,["80"] = 90,["81"] = 90,["82"] = 90,["83"] = 90,["84"] = 90,["85"] = 90,["86"] = 90,["87"] = 90,["88"] = 90,["89"] = 92,["90"] = 77,["91"] = 77,["92"] = 95,["93"] = 59,["94"] = 98,["95"] = 99,["96"] = 98,["97"] = 104,["98"] = 105,["99"] = 104,["100"] = 113,["101"] = 114,["102"] = 113,["103"] = 117,["104"] = 118,["105"] = 120,["106"] = 122,["107"] = 123,["108"] = 123,["110"] = 125,["111"] = 127,["112"] = 128,["113"] = 133,["114"] = 133,["115"] = 133,["116"] = 133,["117"] = 133,["118"] = 134,["119"] = 135,["120"] = 136,["121"] = 137,["122"] = 137,["123"] = 137,["124"] = 137,["125"] = 137,["126"] = 137,["127"] = 137,["128"] = 137,["129"] = 139,["130"] = 139,["131"] = 139,["132"] = 140,["133"] = 141,["134"] = 142,["136"] = 139,["137"] = 139,["138"] = 146,["139"] = 150,["140"] = 117,["141"] = 6,["142"] = 6,["143"] = 6,["144"] = 5,["147"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_pangolier_swashbuckle_custom_717_attacks = __TS__Class()
local modifier_pangolier_swashbuckle_custom_717_attacks = ____exports.modifier_pangolier_swashbuckle_custom_717_attacks
modifier_pangolier_swashbuckle_custom_717_attacks.name = "modifier_pangolier_swashbuckle_custom_717_attacks"
__TS__ClassExtends(modifier_pangolier_swashbuckle_custom_717_attacks, BaseModifier)
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.count = 0
    self.strikes = 4
    self.radius = 0
    self.damage = 0
    self.GetModifierOverrideAttackDamage = function() return self.damage end
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.IsHidden(self)
    return true
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    local range = self:GetSpecialValueFor("range")
    self.radius = self:GetSpecialValueFor("radius")
    self.damage = self:GetSpecialValueFor("damage")
    if not IsServer() then
        return
    end
    self.direction = Vector(params.direction_x, params.direction_y, 0)
    self.toward_point = Vector(params.toward_x, params.toward_y, 0)
    self.target = parent:GetAbsOrigin():__add(self.direction:__mul(range))
    parent:StartGesture(ACT_DOTA_CAST_ABILITY_1_END)
    self.count = 0
    self:OnIntervalThink()
    self:StartIntervalThink(0.1)
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.OnDestroy(self)
    if IsServer() then
        self:GetParent():FaceTowards(self.toward_point)
    end
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    if parent:IsHexed() then
        self:Destroy()
        return
    end
    self.count = self.count + 1
    if self.count > self.strikes then
        self:Destroy()
        return
    end
    parent:EmitSound("Hero_Pangolier.Swashbuckle")
    local heartpiercer = parent:FindAbilityByName("pangolier_heartpiercer_custom_717")
    __TS__ArrayForEach(
        FindUnitsInLine(
            parent:GetTeamNumber(),
            parent:GetAbsOrigin(),
            self.target,
            nil,
            self.radius,
            2,
            bit.bor(1, 18),
            0
        ),
        function(____, enemy)
            if heartpiercer and heartpiercer:IsTrained() then
                heartpiercer:ProcPassive(enemy)
            end
            parent:PerformAttack(
                enemy,
                true,
                true,
                true,
                false,
                false,
                false,
                true
            )
            enemy:EmitSound("Hero_Pangolier.Swashbuckle.Damage")
        end
    )
    self:PlayEffects()
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_OVERRIDE_ATTACK_DAMAGE}
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.CheckState(self)
    return {[MODIFIER_STATE_COMMAND_RESTRICTED] = true, [MODIFIER_STATE_DISARMED] = true}
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_pangolier/pangolier_swashbuckler_dash.vpcf"
end
function modifier_pangolier_swashbuckle_custom_717_attacks.prototype.PlayEffects(self)
    local parent = self:GetParent()
    local hasMusket = parent:HasWearable("models/items/pangolier/pangolier_immortal_musket/pangolier_immortal_musket.vmdl")
    local range = self:GetSpecialValueFor("range")
    if hasMusket then
        range = range * 2
    end
    local distance = self.direction:__mul(range)
    local particle_name = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_pangolier/pangolier_swashbuckler.vpcf", parent)
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_POINT_FOLLOW, parent)
    ParticleManager:SetParticleControl(
        particle,
        0,
        parent:GetOrigin()
    )
    ParticleManager:SetParticleControlForward(particle, 0, self.direction)
    ParticleManager:SetParticleControl(particle, 1, distance)
    ParticleManager:SetParticleControl(particle, 3, distance)
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    Timers:CreateTimer(
        0.2,
        function()
            if particle ~= nil then
                ParticleManager:DestroyParticle(particle, false)
                ParticleManager:ReleaseParticleIndex(particle)
            end
        end
    )
    local sound_name = hasMusket and "Hero_Pangolier.Swashbuckle.Musket" or "Hero_Pangolier.Swashbuckle.Attack"
    parent:EmitSound(sound_name)
end
modifier_pangolier_swashbuckle_custom_717_attacks = __TS__Decorate(
    modifier_pangolier_swashbuckle_custom_717_attacks,
    modifier_pangolier_swashbuckle_custom_717_attacks,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_swashbuckle_custom_717_attacks"}
)
____exports.modifier_pangolier_swashbuckle_custom_717_attacks = modifier_pangolier_swashbuckle_custom_717_attacks
return ____exports
