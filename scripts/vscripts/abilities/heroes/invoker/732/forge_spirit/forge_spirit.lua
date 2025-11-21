local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 6,["18"] = 5,["19"] = 6,["21"] = 6,["22"] = 7,["23"] = 9,["24"] = 11,["25"] = 15,["26"] = 6,["27"] = 18,["28"] = 15,["29"] = 21,["30"] = 22,["31"] = 24,["32"] = 26,["33"] = 27,["34"] = 29,["35"] = 30,["36"] = 31,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 34,["42"] = 35,["44"] = 33,["45"] = 33,["46"] = 38,["48"] = 40,["49"] = 40,["50"] = 41,["51"] = 40,["54"] = 43,["55"] = 21,["56"] = 46,["57"] = 47,["58"] = 49,["59"] = 50,["60"] = 51,["61"] = 52,["62"] = 54,["63"] = 54,["64"] = 54,["65"] = 54,["66"] = 54,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 55,["71"] = 63,["72"] = 70,["73"] = 71,["74"] = 72,["75"] = 73,["77"] = 75,["79"] = 78,["81"] = 81,["82"] = 82,["83"] = 84,["84"] = 86,["85"] = 87,["86"] = 88,["87"] = 89,["88"] = 89,["90"] = 91,["92"] = 94,["93"] = 96,["94"] = 96,["95"] = 96,["96"] = 96,["97"] = 97,["98"] = 98,["99"] = 99,["100"] = 100,["101"] = 101,["102"] = 102,["103"] = 104,["104"] = 104,["105"] = 104,["106"] = 104,["107"] = 104,["108"] = 105,["109"] = 106,["110"] = 108,["111"] = 108,["112"] = 46,["113"] = 111,["114"] = 112,["115"] = 113,["118"] = 115,["121"] = 116,["124"] = 118,["125"] = 118,["126"] = 118,["127"] = 118,["128"] = 120,["129"] = 121,["130"] = 121,["132"] = 122,["133"] = 123,["135"] = 125,["136"] = 126,["138"] = 129,["139"] = 130,["140"] = 130,["141"] = 130,["142"] = 131,["143"] = 130,["144"] = 130,["145"] = 111,["146"] = 6,["147"] = 6,["148"] = 6,["149"] = 5,["152"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____spheres = require("abilities.heroes.invoker.732.global_usage.spheres")
local BaseInvokerAbility = ____spheres.BaseInvokerAbility
local ____modifier_forge_spirit_custom_732_bonuses = require("abilities.heroes.invoker.732.forge_spirit.modifier_forge_spirit_custom_732_bonuses")
local modifier_forge_spirit_custom_732_bonuses = ____modifier_forge_spirit_custom_732_bonuses.modifier_forge_spirit_custom_732_bonuses
____exports.invoker_forge_spirit_custom_732 = __TS__Class()
local invoker_forge_spirit_custom_732 = ____exports.invoker_forge_spirit_custom_732
invoker_forge_spirit_custom_732.name = "invoker_forge_spirit_custom_732"
__TS__ClassExtends(invoker_forge_spirit_custom_732, BaseInvokerAbility)
function invoker_forge_spirit_custom_732.prototype.____constructor(self)
    BaseInvokerAbility.prototype.____constructor(self, "invoker_forge_spirit")
    self.phraseCooldown = false
    self.forged_spirits = {}
end
function invoker_forge_spirit_custom_732.prototype.Precache(self, context)
    BaseInvokerAbility.prototype.Precache(self, context)
    context:AddResource("particles/units/heroes/hero_invoker_kid/invoker_kid_forge_spirit_ambient.vpcf")
end
function invoker_forge_spirit_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:StartGesture(ACT_DOTA_CAST_FORGE_SPIRIT)
    local quas_bonus = self:GetOrbSpecialValueFor("extra_spirit_count_quas", "quas")
    local exort_bonus = self:GetOrbSpecialValueFor("extra_spirit_count_exort", "exort")
    local count = 1
    if quas_bonus == 1 and exort_bonus == 1 then
        count = 2
    end
    __TS__ArrayForEach(
        self.forged_spirits,
        function(____, forged)
            if forged and not forged:IsNull() and forged:IsAlive() then
                forged:Kill(nil, nil)
            end
        end
    )
    self.forged_spirits = {}
    do
        local i = 0
        while i < count do
            self:CreateForgedSpirit()
            i = i + 1
        end
    end
    self:EmitCastResponse()
end
function invoker_forge_spirit_custom_732.prototype.CreateForgedSpirit(self)
    local caster = self:GetCaster()
    local duration = self:GetOrbSpecialValueFor("spirit_duration", "quas")
    local health = self:GetOrbSpecialValueFor("spirit_hp", "quas")
    local damage = self:GetOrbSpecialValueFor("spirit_damage", "exort")
    local armor = self:GetOrbSpecialValueFor("spirit_armor", "exort")
    local forged_spirit = CreateUnitByName(
        "npc_dota_invoker_732_forged_spirit_custom",
        caster:GetAbsOrigin():__add(RandomVector(100)),
        false,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    forged_spirit:AddNewModifier(caster, self, "modifier_kill", {duration = duration})
    modifier_forge_spirit_custom_732_bonuses:apply(forged_spirit, caster, self, {})
    local forge_model = "models/heroes/invoker/forge_spirit.vmdl"
    if caster:HasPersona("npc_dota_hero_invoker") then
        if caster:HasWearable("models/items/invoker_kid/continuum_echoes_head/continuum_echoes_head.vmdl") then
            forge_model = "models/items/invoker_kid/continuum_echoes_forge_spirit/continuum_echoes_forge_spirit.vmdl"
        else
            forge_model = "models/heroes/invoker_kid/invoker_kid_trainer_dragon.vmdl"
        end
        forged_spirit:SetRangedProjectileName("particles/units/heroes/hero_invoker_kid/invoker_kid_forged_spirit_projectile.vpcf")
    end
    forged_spirit:SetOriginalModel(forge_model)
    forged_spirit:SetModel(forge_model)
    local exort = caster:FindAbilityByName("invoker_exort_custom_732")
    local melt_strike = forged_spirit:FindAbilityByName("forged_spirit_melting_strike_custom_732")
    if melt_strike then
        local level = exort:GetLevel()
        if caster:HasAbility("invoker_invoke_custom_732") and caster:HasScepter() then
            level = level + 1
        end
        melt_strike:SetLevel(level)
    end
    forged_spirit.owner = caster
    forged_spirit:SetControllableByPlayer(
        caster:GetPlayerID(),
        true
    )
    forged_spirit:SetBaseMaxHealth(health)
    forged_spirit:SetMaxHealth(health)
    forged_spirit:SetHealth(health)
    forged_spirit:SetBaseDamageMin(damage)
    forged_spirit:SetBaseDamageMax(damage)
    forged_spirit:SetPhysicalArmorBaseValue(armor)
    FindClearSpaceForUnit(
        forged_spirit,
        forged_spirit:GetOrigin(),
        false
    )
    forged_spirit:SetAngles(0, 0, 0)
    forged_spirit:SetForwardVector(caster:GetForwardVector())
    local ____self_forged_spirits_0 = self.forged_spirits
    ____self_forged_spirits_0[#____self_forged_spirits_0 + 1] = forged_spirit
end
function invoker_forge_spirit_custom_732.prototype.EmitCastResponse(self)
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_invoker" then
        return
    end
    if self.phraseCooldown then
        return
    end
    if not RollPercentage(75) then
        return
    end
    local random = RollVoiceLines(
        nil,
        __TS__Spread(range(nil, 1, 6))
    )
    if caster:HasPersona("npc_dota_hero_invoker") then
        if random == "06" then
            random = random .. "_02"
        end
        local response = "invoker_kidvo_la_ability_forgespirit_" .. random
        caster:EmitSoundOnClient(response)
    else
        local response = "invoker_invo_ability_forgespirit_" .. random
        caster:EmitSoundOnClient(response)
    end
    self.phraseCooldown = true
    Timers:CreateTimer(
        60,
        function()
            self.phraseCooldown = false
        end
    )
end
invoker_forge_spirit_custom_732 = __TS__Decorate(
    invoker_forge_spirit_custom_732,
    invoker_forge_spirit_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_forge_spirit_custom_732"}
)
____exports.invoker_forge_spirit_custom_732 = invoker_forge_spirit_custom_732
return ____exports
