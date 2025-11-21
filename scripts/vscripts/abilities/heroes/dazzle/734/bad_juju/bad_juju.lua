local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 5,["19"] = 6,["20"] = 5,["21"] = 6,["23"] = 6,["24"] = 7,["25"] = 5,["26"] = 12,["27"] = 13,["28"] = 14,["29"] = 12,["30"] = 17,["31"] = 18,["32"] = 20,["33"] = 21,["34"] = 23,["35"] = 24,["36"] = 25,["37"] = 27,["38"] = 28,["39"] = 29,["41"] = 23,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 36,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 38,["57"] = 40,["58"] = 42,["59"] = 17,["60"] = 45,["61"] = 46,["62"] = 6,["64"] = 48,["65"] = 49,["66"] = 51,["67"] = 45,["68"] = 54,["69"] = 56,["70"] = 58,["71"] = 60,["74"] = 62,["75"] = 63,["76"] = 65,["77"] = 74,["78"] = 76,["79"] = 76,["80"] = 76,["81"] = 77,["82"] = 78,["84"] = 76,["85"] = 76,["86"] = 54,["87"] = 82,["88"] = 83,["89"] = 85,["90"] = 87,["91"] = 95,["92"] = 97,["93"] = 97,["94"] = 97,["95"] = 98,["96"] = 99,["98"] = 97,["99"] = 97,["100"] = 82,["101"] = 6,["102"] = 6,["103"] = 6,["104"] = 5,["107"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_dazzle_bad_juju_custom_734_armor = require("abilities.heroes.dazzle.734.bad_juju.modifier_dazzle_bad_juju_custom_734_armor")
local modifier_dazzle_bad_juju_custom_734_armor = ____modifier_dazzle_bad_juju_custom_734_armor.modifier_dazzle_bad_juju_custom_734_armor
local ____modifier_dazzle_bad_juju_custom_734_cost = require("abilities.heroes.dazzle.734.bad_juju.modifier_dazzle_bad_juju_custom_734_cost")
local modifier_dazzle_bad_juju_custom_734_cost = ____modifier_dazzle_bad_juju_custom_734_cost.modifier_dazzle_bad_juju_custom_734_cost
____exports.dazzle_bad_juju_custom_734 = __TS__Class()
local dazzle_bad_juju_custom_734 = ____exports.dazzle_bad_juju_custom_734
dazzle_bad_juju_custom_734.name = "dazzle_bad_juju_custom_734"
__TS__ClassExtends(dazzle_bad_juju_custom_734, BaseAbility)
function dazzle_bad_juju_custom_734.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.abilityExceptions = {"dazzle_bad_juju", "dazzle_bad_juju_custom_734"}
end
function dazzle_bad_juju_custom_734.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_dazzle.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_dazzle.vsndevts")
end
function dazzle_bad_juju_custom_734.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local abilityReduction = self:GetSpecialValueFor("cooldown_reduction")
    local itemReduction = self:GetSpecialValueFor("cooldown_reduction_items")
    local function reduceCooldown(____, entity, reduction)
        local currentCooldown = entity:GetCooldownTimeRemaining()
        local reducedCooldown = currentCooldown - reduction
        entity:EndCooldown()
        if reducedCooldown > 0 then
            entity:StartCooldown(reducedCooldown)
        end
    end
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            caster:GetAbilities(),
            function(____, ability) return not __TS__ArrayIncludes(
                self.abilityExceptions,
                ability:GetAbilityName()
            ) end
        ),
        function(____, ability) return reduceCooldown(nil, ability, abilityReduction) end
    )
    __TS__ArrayForEach(
        caster:GetItems(16),
        function(____, item) return reduceCooldown(nil, item, itemReduction) end
    )
    self:TargetModifier(caster)
    self:AddCostStack()
    caster:EmitSound("Hero_Dazzle.BadJuJu.Target")
end
function dazzle_bad_juju_custom_734.prototype.GetHealthCost(self, level)
    if self:GetLevel() == 0 then
        return BaseAbility.prototype.GetHealthCost(self, level)
    end
    local caster = self:GetCaster()
    local stack = caster:GetModifierStackCount(modifier_dazzle_bad_juju_custom_734_cost.name, caster)
    return 75 * 1.5 ^ stack
end
function dazzle_bad_juju_custom_734.prototype.TargetModifier(self, target)
    local caster = self:GetCaster()
    local isAlly = target:GetTeamNumber() == caster:GetTeamNumber()
    if not isAlly and target:IsMagicImmune() then
        return
    end
    local allyDuration = self:GetSpecialValueFor("duration")
    local duration = isAlly and allyDuration or target:CalculateDuration(caster, allyDuration)
    local modifier = modifier_dazzle_bad_juju_custom_734_armor:apply(target, caster, self, {duration = duration})
    modifier:IncrementStackCount()
    Timers:CreateTimer(
        duration,
        function()
            if modifier and not modifier:IsNull() then
                modifier:DecrementStackCount()
            end
        end
    )
end
function dazzle_bad_juju_custom_734.prototype.AddCostStack(self)
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("mana_cost_increase_duration")
    local modifier = modifier_dazzle_bad_juju_custom_734_cost:apply(caster, caster, self, {duration = duration})
    modifier:IncrementStackCount()
    Timers:CreateTimer(
        duration,
        function()
            if modifier and not modifier:IsNull() then
                modifier:DecrementStackCount()
            end
        end
    )
end
dazzle_bad_juju_custom_734 = __TS__Decorate(
    dazzle_bad_juju_custom_734,
    dazzle_bad_juju_custom_734,
    {registerAbility(nil)},
    {kind = "class", name = "dazzle_bad_juju_custom_734"}
)
____exports.dazzle_bad_juju_custom_734 = dazzle_bad_juju_custom_734
return ____exports
