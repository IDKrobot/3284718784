local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 13,["25"] = 18,["26"] = 19,["27"] = 20,["28"] = 21,["31"] = 18,["32"] = 25,["33"] = 26,["34"] = 25,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 33,["39"] = 34,["40"] = 35,["41"] = 37,["42"] = 38,["44"] = 41,["45"] = 42,["46"] = 43,["47"] = 44,["48"] = 45,["50"] = 48,["51"] = 48,["52"] = 48,["53"] = 48,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 48,["58"] = 49,["59"] = 50,["60"] = 56,["61"] = 56,["62"] = 56,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 64,["67"] = 64,["68"] = 64,["69"] = 64,["70"] = 64,["71"] = 65,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 67,["77"] = 68,["78"] = 70,["79"] = 33,["80"] = 6,["81"] = 6,["82"] = 6,["83"] = 5,["86"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_techies_minefield_sign_custom_725 = require("abilities.heroes.techies.725.minefield_sign.modifier_techies_minefield_sign_custom_725")
local modifier_techies_minefield_sign_custom_725 = ____modifier_techies_minefield_sign_custom_725.modifier_techies_minefield_sign_custom_725
____exports.techies_minefield_sign_custom_725 = __TS__Class()
local techies_minefield_sign_custom_725 = ____exports.techies_minefield_sign_custom_725
techies_minefield_sign_custom_725.name = "techies_minefield_sign_custom_725"
__TS__ClassExtends(techies_minefield_sign_custom_725, CustomAbility)
function techies_minefield_sign_custom_725.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "techies_minefield_sign")
end
function techies_minefield_sign_custom_725.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_minefield_sign_custom_725.prototype.Spawn(self)
    if IsServer() then
        if not self:IsTrained() then
            self:SetLevel(1)
        end
    end
end
function techies_minefield_sign_custom_725.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("aura_radius")
end
function techies_minefield_sign_custom_725.prototype.IsStealable(self)
    return false
end
function techies_minefield_sign_custom_725.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local position = self:GetCursorPosition()
    if self.sign and IsValidEntity(self.sign) then
        self.sign:ForceKill(false)
    end
    local model = "models/heroes/techies/techies_sign.vmdl"
    if caster:HasArcana("npc_dota_hero_techies") then
        model = "models/items/techies/bigshot/fx_bigshot_sign.vmdl"
    elseif caster:HasWearable("models/items/techies/techies_ti9_immortal_cart/techies_ti9_immortal_cart.vmdl") then
        model = "models/items/techies/techies_ti9_immortal_sign/techies_ti9_immortal_sign.vmdl"
    end
    local sign = CreateUnitByName(
        "npc_dota_techies_725_minefield_sign_custom",
        position,
        false,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    self.sign = sign
    modifier_techies_minefield_sign_custom_725:apply(sign, caster, self, {})
    sign:AddNewModifier(
        caster,
        self,
        "modifier_kill",
        {duration = self:GetSpecialValueFor("lifetime")}
    )
    FindClearSpaceForUnit(
        sign,
        sign:GetAbsOrigin(),
        true
    )
    sign:SetForwardVector(Vector(
        RandomFloat(-0.5, 0.5),
        RandomFloat(-0.5, 0.5),
        0
    ))
    sign:SetOriginalModel(model)
    sign:SetModel(model)
    caster:EmitSound("Hero_Techies.Sign")
end
techies_minefield_sign_custom_725 = __TS__Decorate(
    techies_minefield_sign_custom_725,
    techies_minefield_sign_custom_725,
    {registerAbility(nil)},
    {kind = "class", name = "techies_minefield_sign_custom_725"}
)
____exports.techies_minefield_sign_custom_725 = techies_minefield_sign_custom_725
return ____exports
