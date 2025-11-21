local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 8,["21"] = 9,["22"] = 10,["23"] = 61,["24"] = 62,["25"] = 4,["26"] = 12,["27"] = 13,["28"] = 12,["29"] = 16,["30"] = 17,["31"] = 16,["32"] = 20,["33"] = 21,["34"] = 20,["35"] = 24,["36"] = 25,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 24,["41"] = 32,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 32,["53"] = 47,["54"] = 48,["55"] = 48,["57"] = 50,["58"] = 47,["59"] = 57,["60"] = 58,["61"] = 58,["62"] = 58,["63"] = 58,["64"] = 57,["65"] = 64,["66"] = 65,["67"] = 66,["69"] = 68,["70"] = 64,["71"] = 71,["72"] = 72,["73"] = 71,["74"] = 75,["75"] = 76,["78"] = 78,["79"] = 79,["80"] = 79,["83"] = 75,["84"] = 82,["85"] = 83,["86"] = 84,["87"] = 86,["90"] = 88,["93"] = 89,["96"] = 91,["99"] = 93,["100"] = 95,["103"] = 96,["106"] = 98,["107"] = 98,["108"] = 98,["109"] = 98,["110"] = 98,["111"] = 98,["112"] = 98,["113"] = 98,["114"] = 98,["115"] = 98,["116"] = 108,["117"] = 82,["118"] = 111,["119"] = 112,["120"] = 113,["121"] = 115,["124"] = 116,["127"] = 118,["128"] = 120,["131"] = 121,["134"] = 123,["135"] = 125,["136"] = 125,["137"] = 125,["138"] = 125,["139"] = 125,["140"] = 125,["141"] = 134,["142"] = 111,["143"] = 5,["144"] = 5,["145"] = 5,["146"] = 4,["149"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_silver_edge_custom_734_debuff = require("abilities.items.silver_edge.734.modifier_item_silver_edge_custom_734_debuff")
local modifier_item_silver_edge_custom_734_debuff = ____modifier_item_silver_edge_custom_734_debuff.modifier_item_silver_edge_custom_734_debuff
____exports.modifier_item_silver_edge_custom_734_windwalk = __TS__Class()
local modifier_item_silver_edge_custom_734_windwalk = ____exports.modifier_item_silver_edge_custom_734_windwalk
modifier_item_silver_edge_custom_734_windwalk.name = "modifier_item_silver_edge_custom_734_windwalk"
__TS__ClassExtends(modifier_item_silver_edge_custom_734_windwalk, BaseModifier)
function modifier_item_silver_edge_custom_734_windwalk.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.fade_delay = 0
    self.movement_speed = 0
    self.crit_multiplier = 0
    self.bonus_damage = 0
    self.GetModifierMoveSpeedBonus_Percentage = function() return self.movement_speed end
    self.GetModifierPreAttack_CriticalStrike = function() return self.crit_multiplier end
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.IsHidden(self)
    return false
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.IsPurgable(self)
    return false
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.IsDebuff(self)
    return false
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.OnCreated(self, params)
    self.fade_delay = self:GetSpecialValueFor("windwalk_fade_time")
    self.movement_speed = self:GetSpecialValueFor("windwalk_movement_speed")
    self.bonus_damage = self:GetSpecialValueFor("windwalk_bonus_damage")
    self.crit_multiplier = self:GetSpecialValueFor("backstab_crit_multiplier")
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
        MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL,
        MODIFIER_PROPERTY_TOOLTIP,
        MODIFIER_EVENT_ON_ABILITY_EXECUTED,
        MODIFIER_EVENT_ON_ATTACK,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.CheckState(self)
    if self:GetElapsedTime() < self.fade_delay then
        return {}
    end
    return {[MODIFIER_STATE_NO_UNIT_COLLISION] = true, [MODIFIER_STATE_CANNOT_MISS] = true, [MODIFIER_STATE_INVISIBLE] = true}
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.GetModifierInvisibilityLevel(self)
    return math.min(
        1,
        self:GetElapsedTime() / self.fade_delay
    )
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.GetModifierProcAttack_BonusDamage_Physical(self, event)
    if IsClient() and not event.target:IsBuilding() then
        return self.bonus_damage
    end
    return 0
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.OnTooltip(self)
    return self.bonus_damage
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.OnAbilityExecuted(self, event)
    if self:GetElapsedTime() < self.fade_delay then
        return
    end
    if IsServer() then
        if event.unit == self:GetParent() then
            self:Destroy()
        end
    end
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.OnAttack(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    if parent == target then
        return
    end
    if not parent:IsRangedAttacker() then
        return
    end
    self:Destroy()
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    local info = {
        Source = parent,
        Target = target,
        vSourceLoc = parent:GetAbsOrigin(),
        Ability = self:GetAbility(),
        bDodgeable = true,
        bIsAttack = true,
        flExpireTime = GameRules:GetGameTime() + 20,
        iMoveSpeed = parent:GetProjectileSpeed()
    }
    ProjectileManager:CreateTrackingProjectile(info)
end
function modifier_item_silver_edge_custom_734_windwalk.prototype.OnAttackLanded(self, event)
    local parent = self:GetParent()
    local target = event.target
    if not IsServer() then
        return
    end
    if parent ~= event.attacker then
        return
    end
    self:Destroy()
    if not target:IsDOTANPC() then
        return
    end
    if not target:IsUnit() then
        return
    end
    local break_duration = self:GetSpecialValueFor("backstab_duration")
    modifier_item_silver_edge_custom_734_debuff:apply(
        target,
        parent,
        self:GetAbility(),
        {duration = target:CalculateDuration(parent, break_duration)}
    )
    target:EmitSound("DOTA_Item.SilverEdge.Target")
end
modifier_item_silver_edge_custom_734_windwalk = __TS__Decorate(
    modifier_item_silver_edge_custom_734_windwalk,
    modifier_item_silver_edge_custom_734_windwalk,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_silver_edge_custom_734_windwalk"}
)
____exports.modifier_item_silver_edge_custom_734_windwalk = modifier_item_silver_edge_custom_734_windwalk
return ____exports
