local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 7,["16"] = 6,["17"] = 7,["19"] = 7,["20"] = 10,["21"] = 14,["22"] = 15,["23"] = 16,["24"] = 14,["25"] = 19,["26"] = 20,["27"] = 21,["28"] = 22,["31"] = 19,["32"] = 26,["33"] = 27,["34"] = 26,["35"] = 30,["36"] = 31,["37"] = 30,["38"] = 34,["39"] = 35,["40"] = 36,["41"] = 38,["42"] = 39,["44"] = 42,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 46,["50"] = 49,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 49,["55"] = 49,["56"] = 49,["57"] = 49,["58"] = 50,["59"] = 51,["60"] = 57,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 57,["65"] = 57,["66"] = 65,["67"] = 65,["68"] = 65,["69"] = 65,["70"] = 65,["71"] = 66,["72"] = 66,["73"] = 66,["74"] = 66,["75"] = 66,["76"] = 68,["77"] = 69,["78"] = 71,["79"] = 34,["80"] = 7,["81"] = 7,["82"] = 7,["83"] = 6,["86"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_techies_minefield_sign_custom_684 = require("abilities.heroes.techies.684.minefield_sign.modifier_techies_minefield_sign_custom_684")
local modifier_techies_minefield_sign_custom_684 = ____modifier_techies_minefield_sign_custom_684.modifier_techies_minefield_sign_custom_684
____exports.techies_minefield_sign_custom_684 = __TS__Class()
local techies_minefield_sign_custom_684 = ____exports.techies_minefield_sign_custom_684
techies_minefield_sign_custom_684.name = "techies_minefield_sign_custom_684"
__TS__ClassExtends(techies_minefield_sign_custom_684, CustomAbility)
function techies_minefield_sign_custom_684.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "techies_minefield_sign")
end
function techies_minefield_sign_custom_684.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_minefield_sign_custom_684.prototype.Spawn(self)
    if IsServer() then
        if not self:IsTrained() then
            self:SetLevel(1)
        end
    end
end
function techies_minefield_sign_custom_684.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("aura_radius")
end
function techies_minefield_sign_custom_684.prototype.IsStealable(self)
    return false
end
function techies_minefield_sign_custom_684.prototype.OnSpellStart(self)
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
        "npc_dota_techies_684_minefield_sign_custom",
        position,
        false,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    self.sign = sign
    modifier_techies_minefield_sign_custom_684:apply(sign, caster, self, {})
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
techies_minefield_sign_custom_684 = __TS__Decorate(
    techies_minefield_sign_custom_684,
    techies_minefield_sign_custom_684,
    {registerAbility(nil)},
    {kind = "class", name = "techies_minefield_sign_custom_684"}
)
____exports.techies_minefield_sign_custom_684 = techies_minefield_sign_custom_684
return ____exports
