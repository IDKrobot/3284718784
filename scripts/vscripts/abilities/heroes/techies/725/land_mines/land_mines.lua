local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 4,["19"] = 5,["20"] = 4,["21"] = 5,["22"] = 6,["23"] = 7,["24"] = 8,["25"] = 6,["26"] = 11,["27"] = 12,["28"] = 11,["29"] = 15,["30"] = 16,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 19,["40"] = 19,["41"] = 19,["42"] = 19,["43"] = 19,["44"] = 19,["45"] = 19,["46"] = 31,["47"] = 31,["50"] = 34,["51"] = 15,["52"] = 37,["53"] = 38,["54"] = 37,["55"] = 41,["56"] = 42,["57"] = 43,["58"] = 45,["59"] = 46,["60"] = 47,["61"] = 48,["62"] = 49,["64"] = 52,["65"] = 52,["66"] = 52,["67"] = 52,["68"] = 52,["69"] = 52,["70"] = 52,["71"] = 52,["72"] = 53,["73"] = 53,["74"] = 53,["75"] = 53,["76"] = 54,["77"] = 55,["78"] = 61,["79"] = 61,["80"] = 61,["81"] = 61,["82"] = 61,["83"] = 63,["84"] = 64,["85"] = 66,["86"] = 68,["90"] = 73,["91"] = 73,["92"] = 73,["96"] = 73,["97"] = 73,["98"] = 73,["102"] = 73,["106"] = 73,["110"] = 73,["114"] = 73,["116"] = 73,["117"] = 73,["118"] = 74,["119"] = 74,["120"] = 74,["121"] = 74,["122"] = 75,["123"] = 77,["124"] = 41,["125"] = 5,["126"] = 5,["127"] = 5,["128"] = 4,["131"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_techies_land_mines_custom_725 = require("abilities.heroes.techies.725.land_mines.modifier_techies_land_mines_custom_725")
local modifier_techies_land_mines_custom_725 = ____modifier_techies_land_mines_custom_725.modifier_techies_land_mines_custom_725
____exports.techies_land_mines_custom_725 = __TS__Class()
local techies_land_mines_custom_725 = ____exports.techies_land_mines_custom_725
techies_land_mines_custom_725.name = "techies_land_mines_custom_725"
__TS__ClassExtends(techies_land_mines_custom_725, BaseAbility)
function techies_land_mines_custom_725.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_land_mines_custom_725.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function techies_land_mines_custom_725.prototype.CastFilterResultLocation(self, location)
    local caster = self:GetCaster()
    if IsServer() then
        local units = __TS__ArrayFilter(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                location,
                nil,
                self:GetSpecialValueFor("placement_radius"),
                1,
                32,
                0,
                0,
                false
            ),
            function(____, unit) return unit:GetOwner() == caster and unit:GetUnitName() == "npc_dota_techies_725_land_mine_custom" end
        )
        if #units > 0 then
            return UF_FAIL_CUSTOM
        end
    end
    return UF_SUCCESS
end
function techies_land_mines_custom_725.prototype.GetCustomCastErrorLocation(self, location)
    return "#dota_hud_error_cant_place_near_mine"
end
function techies_land_mines_custom_725.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local model = "models/heroes/techies/fx_techiesfx_mine.vmdl"
    if caster:HasArcana("npc_dota_hero_techies") then
        model = "models/items/techies/bigshot/fx_bigshot_mine.vmdl"
    elseif caster:HasWearable("models/items/techies/techies_ti9_immortal_cart/techies_ti9_immortal_cart.vmdl") then
        model = "models/items/techies/techies_ti9_immortal_prox_mine/techies_ti9_immortal_prox_mine.vmdl"
    end
    local mine = CreateUnitByName(
        "npc_dota_techies_725_land_mine_custom",
        point,
        false,
        caster,
        caster,
        caster:GetTeamNumber()
    )
    mine:SetControllableByPlayer(
        caster:GetPlayerOwnerID(),
        true
    )
    mine:SetOwner(caster)
    modifier_techies_land_mines_custom_725:apply(mine, caster, self, {})
    FindClearSpaceForUnit(
        mine,
        mine:GetAbsOrigin(),
        true
    )
    mine:SetOriginalModel(model)
    mine:SetModel(model)
    caster:EmitSound("Hero_Techies.LandMine.Plant")
    if caster:GetUnitName() ~= "npc_dota_hero_techies" then
        return
    end
    local ____array_0 = __TS__SparseArrayNew(
        1,
        2,
        __TS__Spread(range(nil, 4, 12))
    )
    __TS__SparseArrayPush(
        ____array_0,
        13,
        14,
        __TS__Spread(range(nil, 16, 26))
    )
    __TS__SparseArrayPush(
        ____array_0,
        __TS__Spread(range(nil, 28, 30))
    )
    __TS__SparseArrayPush(
        ____array_0,
        __TS__Spread(range(nil, 32, 39))
    )
    __TS__SparseArrayPush(
        ____array_0,
        __TS__Spread(range(nil, 41, 48))
    )
    __TS__SparseArrayPush(
        ____array_0,
        __TS__Spread(range(nil, 50, 52))
    )
    __TS__SparseArrayPush(____array_0, 54)
    local random_list = {__TS__SparseArraySpread(____array_0)}
    local random = RollVoiceLines(
        nil,
        unpack(random_list)
    )
    local cast_responce = "techies_tech_setmine_" .. random
    caster:EmitSoundOnClient(cast_responce)
end
techies_land_mines_custom_725 = __TS__Decorate(
    techies_land_mines_custom_725,
    techies_land_mines_custom_725,
    {registerAbility(nil)},
    {kind = "class", name = "techies_land_mines_custom_725"}
)
____exports.techies_land_mines_custom_725 = techies_land_mines_custom_725
return ____exports
