local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 5,["21"] = 6,["22"] = 5,["23"] = 6,["25"] = 6,["26"] = 7,["27"] = 5,["28"] = 9,["29"] = 10,["30"] = 11,["31"] = 12,["32"] = 9,["33"] = 15,["34"] = 16,["35"] = 15,["36"] = 19,["37"] = 20,["38"] = 19,["39"] = 23,["40"] = 24,["41"] = 25,["42"] = 27,["43"] = 29,["44"] = 30,["45"] = 31,["46"] = 32,["47"] = 33,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 36,["57"] = 37,["58"] = 37,["59"] = 37,["60"] = 37,["61"] = 38,["62"] = 39,["63"] = 46,["64"] = 46,["65"] = 46,["66"] = 46,["67"] = 46,["68"] = 48,["69"] = 49,["70"] = 51,["71"] = 52,["72"] = 52,["73"] = 54,["74"] = 55,["75"] = 56,["76"] = 58,["78"] = 61,["79"] = 63,["83"] = 68,["84"] = 68,["85"] = 68,["89"] = 68,["90"] = 68,["91"] = 68,["95"] = 68,["99"] = 68,["103"] = 68,["107"] = 68,["109"] = 68,["110"] = 68,["111"] = 69,["112"] = 69,["113"] = 69,["114"] = 69,["115"] = 70,["116"] = 72,["117"] = 23,["118"] = 75,["119"] = 76,["120"] = 77,["121"] = 75,["122"] = 80,["123"] = 81,["124"] = 82,["125"] = 84,["126"] = 80,["127"] = 6,["128"] = 6,["129"] = 6,["130"] = 5,["133"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_techies_land_mines_custom_684 = require("abilities.heroes.techies.684.land_mines.modifier_techies_land_mines_custom_684")
local modifier_techies_land_mines_custom_684 = ____modifier_techies_land_mines_custom_684.modifier_techies_land_mines_custom_684
local ____modifier_techies_land_mines_custom_684_mine = require("abilities.heroes.techies.684.land_mines.modifier_techies_land_mines_custom_684_mine")
local modifier_techies_land_mines_custom_684_mine = ____modifier_techies_land_mines_custom_684_mine.modifier_techies_land_mines_custom_684_mine
____exports.techies_land_mines_custom_684 = __TS__Class()
local techies_land_mines_custom_684 = ____exports.techies_land_mines_custom_684
techies_land_mines_custom_684.name = "techies_land_mines_custom_684"
__TS__ClassExtends(techies_land_mines_custom_684, BaseAbility)
function techies_land_mines_custom_684.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.mines = {}
end
function techies_land_mines_custom_684.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies.vsndevts")
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_land_mines_custom_684.prototype.GetIntrinsicModifierName(self)
    return modifier_techies_land_mines_custom_684.name
end
function techies_land_mines_custom_684.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("small_radius")
end
function techies_land_mines_custom_684.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local max_mines = self:GetSpecialValueFor("max_mines")
    local model = "models/heroes/techies/fx_techiesfx_mine.vmdl"
    if caster:HasArcana("npc_dota_hero_techies") then
        model = "models/items/techies/bigshot/fx_bigshot_mine.vmdl"
    elseif caster:HasWearable("models/items/techies/techies_ti9_immortal_cart/techies_ti9_immortal_cart.vmdl") then
        model = "models/items/techies/techies_ti9_immortal_prox_mine/techies_ti9_immortal_prox_mine.vmdl"
    end
    local mine = CreateUnitByName(
        "npc_dota_techies_684_land_mine_custom",
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
    modifier_techies_land_mines_custom_684_mine:apply(mine, caster, self, {})
    FindClearSpaceForUnit(
        mine,
        mine:GetAbsOrigin(),
        true
    )
    mine:SetOriginalModel(model)
    mine:SetModel(model)
    self:AddStack()
    local ____self_mines_0 = self.mines
    ____self_mines_0[#____self_mines_0 + 1] = mine
    if #self.mines > max_mines then
        local old_mine = self.mines[1]
        local modifier = old_mine:FindModifierByName(modifier_techies_land_mines_custom_684_mine.name)
        modifier:Explode()
    end
    caster:EmitSound("Hero_Techies.LandMine.Plant")
    if caster:GetUnitName() ~= "npc_dota_hero_techies" then
        return
    end
    local ____array_1 = __TS__SparseArrayNew(
        1,
        2,
        __TS__Spread(range(nil, 4, 12))
    )
    __TS__SparseArrayPush(
        ____array_1,
        13,
        14,
        __TS__Spread(range(nil, 16, 26))
    )
    __TS__SparseArrayPush(
        ____array_1,
        __TS__Spread(range(nil, 28, 30))
    )
    __TS__SparseArrayPush(
        ____array_1,
        __TS__Spread(range(nil, 32, 39))
    )
    __TS__SparseArrayPush(
        ____array_1,
        __TS__Spread(range(nil, 41, 48))
    )
    __TS__SparseArrayPush(
        ____array_1,
        __TS__Spread(range(nil, 50, 52))
    )
    __TS__SparseArrayPush(____array_1, 54)
    local random_list = {__TS__SparseArraySpread(____array_1)}
    local random = RollVoiceLines(
        nil,
        unpack(random_list)
    )
    local cast_response = "techies_tech_setmine_" .. random
    caster:EmitSoundOnClient(cast_response)
end
function techies_land_mines_custom_684.prototype.AddStack(self)
    local count_modifier = self:GetCaster():FindModifierByName(modifier_techies_land_mines_custom_684.name)
    count_modifier:IncrementStackCount()
end
function techies_land_mines_custom_684.prototype.RemoveStack(self)
    local count_modifier = self:GetCaster():FindModifierByName(modifier_techies_land_mines_custom_684.name)
    count_modifier:DecrementStackCount()
    self.mines = __TS__ArraySlice(self.mines, 1)
end
techies_land_mines_custom_684 = __TS__Decorate(
    techies_land_mines_custom_684,
    techies_land_mines_custom_684,
    {registerAbility(nil)},
    {kind = "class", name = "techies_land_mines_custom_684"}
)
____exports.techies_land_mines_custom_684 = techies_land_mines_custom_684
return ____exports
