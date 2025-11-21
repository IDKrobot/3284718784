local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 7,["17"] = 6,["18"] = 7,["20"] = 7,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 15,["26"] = 16,["27"] = 218,["28"] = 6,["29"] = 18,["30"] = 19,["31"] = 18,["32"] = 22,["33"] = 23,["34"] = 22,["35"] = 26,["36"] = 27,["37"] = 26,["38"] = 30,["39"] = 31,["40"] = 33,["41"] = 35,["44"] = 37,["45"] = 37,["46"] = 37,["47"] = 37,["48"] = 37,["49"] = 37,["50"] = 46,["51"] = 48,["52"] = 53,["53"] = 53,["54"] = 53,["55"] = 53,["56"] = 53,["57"] = 53,["58"] = 53,["59"] = 53,["60"] = 53,["61"] = 54,["62"] = 54,["63"] = 54,["64"] = 54,["65"] = 54,["66"] = 54,["67"] = 54,["68"] = 54,["69"] = 56,["70"] = 57,["71"] = 59,["72"] = 66,["73"] = 67,["74"] = 69,["75"] = 71,["76"] = 30,["77"] = 74,["78"] = 75,["79"] = 77,["82"] = 79,["83"] = 80,["84"] = 80,["85"] = 80,["86"] = 80,["87"] = 80,["89"] = 82,["90"] = 83,["91"] = 85,["92"] = 92,["93"] = 93,["94"] = 74,["95"] = 96,["96"] = 97,["97"] = 99,["98"] = 101,["99"] = 102,["100"] = 104,["101"] = 105,["103"] = 107,["104"] = 108,["105"] = 110,["106"] = 111,["108"] = 113,["109"] = 96,["110"] = 116,["111"] = 117,["112"] = 116,["113"] = 126,["114"] = 127,["115"] = 126,["116"] = 133,["117"] = 134,["118"] = 134,["119"] = 135,["121"] = 137,["122"] = 133,["123"] = 140,["124"] = 141,["125"] = 140,["126"] = 144,["127"] = 145,["128"] = 144,["129"] = 148,["130"] = 149,["131"] = 148,["132"] = 152,["133"] = 153,["134"] = 155,["137"] = 157,["138"] = 161,["139"] = 163,["140"] = 164,["141"] = 165,["142"] = 167,["143"] = 168,["144"] = 152,["145"] = 171,["146"] = 172,["147"] = 175,["150"] = 181,["153"] = 183,["154"] = 184,["155"] = 185,["156"] = 187,["157"] = 187,["158"] = 187,["159"] = 187,["160"] = 189,["161"] = 190,["163"] = 193,["164"] = 194,["165"] = 195,["167"] = 198,["168"] = 200,["169"] = 200,["170"] = 200,["171"] = 200,["172"] = 202,["173"] = 204,["174"] = 206,["175"] = 206,["176"] = 206,["177"] = 206,["178"] = 207,["179"] = 209,["180"] = 209,["181"] = 209,["182"] = 209,["183"] = 210,["187"] = 215,["188"] = 171,["189"] = 220,["190"] = 221,["191"] = 223,["192"] = 225,["193"] = 226,["194"] = 227,["195"] = 229,["196"] = 230,["197"] = 232,["198"] = 232,["199"] = 232,["200"] = 232,["201"] = 232,["202"] = 232,["203"] = 241,["204"] = 241,["205"] = 241,["206"] = 241,["207"] = 241,["208"] = 241,["209"] = 250,["210"] = 220,["211"] = 7,["212"] = 7,["213"] = 7,["214"] = 6,["217"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifierMotionHorizontal = ____dota_ts_adapter.BaseModifierMotionHorizontal
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_pangolier_gyroshell_custom_717_stop = require("abilities.heroes.pangolier.717.gyroshell.modifier_pangolier_gyroshell_custom_717_stop")
local modifier_pangolier_gyroshell_custom_717_stop = ____modifier_pangolier_gyroshell_custom_717_stop.modifier_pangolier_gyroshell_custom_717_stop
local ____modifier_pangolier_gyroshell_custom_717_turn_boost = require("abilities.heroes.pangolier.717.gyroshell.modifier_pangolier_gyroshell_custom_717_turn_boost")
local modifier_pangolier_gyroshell_custom_717_turn_boost = ____modifier_pangolier_gyroshell_custom_717_turn_boost.modifier_pangolier_gyroshell_custom_717_turn_boost
____exports.modifier_pangolier_gyroshell_custom_717 = __TS__Class()
local modifier_pangolier_gyroshell_custom_717 = ____exports.modifier_pangolier_gyroshell_custom_717
modifier_pangolier_gyroshell_custom_717.name = "modifier_pangolier_gyroshell_custom_717"
__TS__ClassExtends(modifier_pangolier_gyroshell_custom_717, BaseModifierMotionHorizontal)
function modifier_pangolier_gyroshell_custom_717.prototype.____constructor(self, ...)
    BaseModifierMotionHorizontal.prototype.____constructor(self, ...)
    self.acceleration = 350
    self.deceleration = 500
    self.current_speed = 0.5
    self.tree_radius = 75
    self.turn_rate_min = 0
    self.turn_rate_max = 0
    self.speedMultiplier = function() return 0.5 + 0.5 * (self.current_speed / self.max_speed) end
end
function modifier_pangolier_gyroshell_custom_717.prototype.IsHidden(self)
    return false
end
function modifier_pangolier_gyroshell_custom_717.prototype.IsPurgable(self)
    return false
end
function modifier_pangolier_gyroshell_custom_717.prototype.GetTexture(self)
    return "spell_immunity"
end
function modifier_pangolier_gyroshell_custom_717.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    self.max_speed = self:GetSpecialValueFor("forward_move_speed")
    if not IsServer() then
        return
    end
    modifier_pangolier_gyroshell_custom_717_turn_boost:apply(
        parent,
        parent,
        self:GetAbility(),
        {duration = 0.25}
    )
    parent:Stop()
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_gyroshell.vpcf", PATTACH_CUSTOMORIGIN, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        parent,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    self:AddParticle(
        particle,
        false,
        false,
        -1,
        false,
        false
    )
    parent:EmitSound("Hero_Pangolier.Gyroshell.Loop")
    parent:EmitSound("Hero_Pangolier.Gyroshell.Layer")
    parent:SwapAbilities("pangolier_gyroshell_custom_717", "pangolier_gyroshell_stop_custom_717", false, true)
    self.turn_rate_min = self:GetSpecialValueFor("turn_rate")
    self.turn_rate_max = self:GetSpecialValueFor("turn_rate")
    parent.custom_data.desired_yaw = parent:GetAnglesAsVector().y
    self:StartIntervalThink(0.01)
end
function modifier_pangolier_gyroshell_custom_717.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    if not parent:HasModifier("modifier_generic_arc") then
        FindClearSpaceForUnit(
            parent,
            parent:GetAbsOrigin(),
            true
        )
    end
    parent:StartGesture(ACT_DOTA_CAST_ABILITY_4_END)
    parent:EmitSound("Hero_Pangolier.Gyroshell.Stop")
    parent:SwapAbilities("pangolier_gyroshell_stop_custom_717", "pangolier_gyroshell_custom_717", false, true)
    parent:StopSound("Hero_Pangolier.Gyroshell.Loop")
    parent:StopSound("Hero_Pangolier.Gyroshell.Layer")
end
function modifier_pangolier_gyroshell_custom_717.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    self.current_speed = self.max_speed
    self.turn_rate_min = self:GetSpecialValueFor("turn_rate")
    self.turn_rate_max = self.turn_rate_min
    if parent:HasModifier(modifier_pangolier_gyroshell_custom_717_turn_boost.name) then
        self.turn_rate_min = self:GetSpecialValueFor("turn_rate_boosted")
    end
    parent:SetForceAttackTarget(nil)
    parent:Stop()
    if not parent:HasModifier("modifier_generic_arc") then
        self:GetAbility():RollUpEnemies()
    end
    self:UpdateHorizontalMotionCustom(parent, 0.01)
end
function modifier_pangolier_gyroshell_custom_717.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MODEL_CHANGE, MODIFIER_PROPERTY_OVERRIDE_ANIMATION, MODIFIER_PROPERTY_DISABLE_TURNING, MODIFIER_PROPERTY_MOVESPEED_LIMIT}
end
function modifier_pangolier_gyroshell_custom_717.prototype.CheckState(self)
    return {[MODIFIER_STATE_DISARMED] = true, [MODIFIER_STATE_MAGIC_IMMUNE] = true}
end
function modifier_pangolier_gyroshell_custom_717.prototype.GetModifierModelChange(self)
    local ____opt_0 = self:GetCaster()
    if (____opt_0 and ____opt_0:GetUnitName()) == "npc_dota_hero_rubick" then
        return "models/heroes/pangolier/pangolier_gyroshell2_rubick.vmdl"
    end
    return "models/heroes/pangolier/pangolier_gyroshell2.vmdl"
end
function modifier_pangolier_gyroshell_custom_717.prototype.GetOverrideAnimation(self)
    return ACT_DOTA_RUN
end
function modifier_pangolier_gyroshell_custom_717.prototype.GetModifierDisableTurning(self)
    return 1
end
function modifier_pangolier_gyroshell_custom_717.prototype.GetModifierMoveSpeed_Limit(self)
    return 0
end
function modifier_pangolier_gyroshell_custom_717.prototype.OnOrderCustom(self, new_pos, target)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    local targetPos = target ~= nil and not target:IsNull() and target:GetAbsOrigin() or new_pos
    local origin = parent:GetOrigin()
    local direction = targetPos:__sub(origin)
    direction.z = 0
    direction = direction:Normalized()
    local angles = VectorAngles(direction)
    parent.custom_data.desired_yaw = angles.y
end
function modifier_pangolier_gyroshell_custom_717.prototype.UpdateHorizontalMotionCustom(self, me, dt)
    local parent = self:GetParent()
    if parent:IsCurrentlyHorizontalMotionControlled() or parent:IsCurrentlyVerticalMotionControlled() or parent:IsStunned() or parent:IsRooted() then
        return
    end
    if parent:HasModifier(modifier_pangolier_gyroshell_custom_717_stop.name) then
        return
    end
    local currentAngles = parent:GetAnglesAsVector()
    local angleDiff = AngleDiff(parent.custom_data.desired_yaw, currentAngles.y) or 0
    local turnAmount = dt * (self.turn_rate_min + self:speedMultiplier() * (self.turn_rate_max - self.turn_rate_min))
    turnAmount = math.min(
        turnAmount,
        math.abs(angleDiff)
    )
    if angleDiff < 0 then
        turnAmount = turnAmount * -1
    end
    if angleDiff ~= 0 then
        currentAngles.y = currentAngles.y + turnAmount
        me:SetAbsAngles(currentAngles.x, currentAngles.y, currentAngles.z)
    end
    local acceleration = self.acceleration or -self.deceleration
    self.current_speed = math.max(
        math.min(self.current_speed + dt * acceleration, self.max_speed),
        0
    )
    local newPos = parent:GetOrigin():__add(parent:GetForwardVector():__mul(dt * self.current_speed))
    local checkPos = newPos:__add(parent:GetForwardVector())
    if not GridNav:CanFindPath(
        me:GetOrigin(),
        checkPos
    ) then
        GridNav:DestroyTreesAroundPoint(checkPos, self.tree_radius, true)
        if not GridNav:CanFindPath(
            me:GetOrigin(),
            checkPos
        ) then
            self:Crash()
            return
        end
    end
    me:SetOrigin(GetGroundPosition(newPos, me))
end
function modifier_pangolier_gyroshell_custom_717.prototype.Crash(self)
    local parent = self:GetParent()
    local oldVector = parent:GetForwardVector()
    parent:FaceTowards(parent:GetAbsOrigin():__sub(oldVector))
    parent:SetForwardVector(oldVector:__unm())
    parent.custom_data.desired_yaw = parent:GetAnglesAsVector().y
    parent:EmitSound("Hero_Pangolier.Gyroshell.Carom")
    parent:EmitSound("Hero_Pangolier.Carom.Layer")
    modifier_pangolier_gyroshell_custom_717_stop:apply(
        parent,
        parent,
        self:GetAbility(),
        {duration = 0.2}
    )
    modifier_pangolier_gyroshell_custom_717_turn_boost:apply(
        parent,
        parent,
        self:GetAbility(),
        {duration = 0.25}
    )
    self:GetAbility():RollCrashResponse()
end
modifier_pangolier_gyroshell_custom_717 = __TS__Decorate(
    modifier_pangolier_gyroshell_custom_717,
    modifier_pangolier_gyroshell_custom_717,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_pangolier_gyroshell_custom_717"}
)
____exports.modifier_pangolier_gyroshell_custom_717 = modifier_pangolier_gyroshell_custom_717
return ____exports
