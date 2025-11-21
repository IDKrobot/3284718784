local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 8,["9"] = 8,["10"] = 8,["11"] = 8,["12"] = 8,["13"] = 8,["14"] = 8,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 8,["22"] = 8,["23"] = 8,["24"] = 8,["25"] = 8,["26"] = 8,["27"] = 8,["28"] = 8,["29"] = 8,["30"] = 8,["31"] = 8,["32"] = 8,["33"] = 8,["34"] = 8,["35"] = 8,["36"] = 8,["37"] = 8,["38"] = 8,["39"] = 8,["40"] = 8,["41"] = 8,["42"] = 8,["43"] = 87,["44"] = 87,["45"] = 87,["47"] = 87,["48"] = 96,["49"] = 97,["50"] = 98,["51"] = 99,["52"] = 101,["53"] = 101,["54"] = 101,["55"] = 102,["56"] = 103,["57"] = 104,["58"] = 106,["59"] = 107,["60"] = 108,["61"] = 109,["63"] = 110,["64"] = 111,["66"] = 113,["67"] = 114,["70"] = 101,["71"] = 101,["72"] = 118,["74"] = 120,["75"] = 120,["76"] = 120,["77"] = 120,["79"] = 96,["81"] = 91,["82"] = 93,["83"] = 87});
local ____exports = {}
local HASH_STYLES = {[1977497166] = 0, [1055040020] = 0, [628863847] = 1, [1347516877] = 2}
local PORTRAITS_FROM_MODEL = {
    ["models/items/windrunner/windrunner_arcana/wr_arcana_base.vmdl"] = {[0] = "npc_dota_hero_windrunner_alt1", [1] = "npc_dota_hero_windrunner_alt2"},
    ["models/items/pudge/arcana/pudge_arcana_base.vmdl"] = {[0] = "npc_dota_hero_pudge_alt1", [1] = "npc_dota_hero_pudge_alt2"},
    ["models/items/earthshaker/earthshaker_arcana/earthshaker_arcana.vmdl"] = {[0] = "npc_dota_hero_earthshaker_alt1", [1] = "npc_dota_hero_earthshaker_alt2"},
    ["models/items/wraith_king/arcana/wraith_king_arcana.vmdl"] = {[0] = "npc_dota_hero_skeleton_king_alt1", [1] = "npc_dota_hero_skeleton_king_alt2"},
    ["models/heroes/juggernaut/juggernaut_arcana.vmdl"] = {[0] = "npc_dota_hero_juggernaut_alt1", [1] = "npc_dota_hero_juggernaut_alt2"},
    ["models/heroes/lina/lina.vmdl"] = {[1] = "npc_dota_hero_lina_alt1"},
    ["models/items/ogre_magi/ogre_arcana/ogre_magi_arcana.vmdl"] = {[0] = "npc_dota_hero_ogre_magi_alt1", [1] = "npc_dota_hero_ogre_magi_alt2"},
    ["models/items/queenofpain/queenofpain_arcana/queenofpain_arcana.vmdl"] = {[0] = "npc_dota_hero_queenofpain_alt1", [1] = "npc_dota_hero_queenofpain_alt2"},
    ["models/heroes/legion_commander/legion_commander.vmdl"] = {[1] = "npc_dota_hero_legion_commander_alt1"},
    ["models/items/spectre/spectre_arcana/spectre_arcana_base.vmdl"] = {[0] = "npc_dota_hero_spectre_alt1", [1] = "npc_dota_hero_spectre_alt2"},
    ["models/items/faceless_void/faceless_void_arcana/faceless_void_arcana_base.vmdl"] = {[0] = "npc_dota_hero_faceless_void_alt1", [1] = "npc_dota_hero_faceless_void_alt2"},
    ["models/items/razor/razor_arcana/razor_arcana_weapon.vmdl"] = {[0] = "npc_dota_hero_razor_alt1", [2] = "npc_dota_hero_razor_alt2"},
    ["models/items/drow/drow_arcana/drow_arcana.vmdl"] = {[0] = "npc_dota_hero_drow_ranger_alt1", [1] = "npc_dota_hero_drow_ranger_alt2"},
    ["models/items/vengefulspirit/vengeful_spirit_arcana/vengeful_spirit_arcana.vmdl"] = {[0] = "npc_dota_hero_vengefulspirit_alt1_png", [1] = "npc_dota_hero_vengefulspirit_alt2_png"},
    ["models/items/skywrath_mage/skywrath_arcana/skywrath_arcana.vmdl"] = {[0] = "npc_dota_hero_skywrath_mage_alt1_png", [1] = "npc_dota_hero_skywrath_mage_alt2_png"},
    ["models/heroes/pudge_cute/pudge_cute.vmdl"] = "npc_dota_hero_pudge_persona1",
    ["models/heroes/antimage_female/antimage_female.vmdl"] = "npc_dota_hero_antimage_persona1",
    ["models/heroes/invoker_kid/invoker_kid.vmdl"] = "npc_dota_hero_invoker_persona1",
    ["models/items/axe/ti9_jungle_axe/axe_bare.vmdl"] = "npc_dota_hero_axe_alt",
    ["models/heroes/phantom_assassin/pa_arcana.vmdl"] = "npc_dota_hero_phantom_assassin_alt1",
    ["models/heroes/shadow_fiend/head_arcana.vmdl"] = "npc_dota_hero_nevermore_alt1",
    ["models/heroes/terrorblade/terrorblade_arcana.vmdl"] = "npc_dota_hero_terrorblade_alt1",
    ["models/heroes/crystal_maiden/crystal_maiden_arcana.vmdl"] = "npc_dota_hero_crystal_maiden_alt1",
    ["models/items/monkey_king/monkey_king_arcana_head/mesh/monkey_king_arcana.vmdl"] = "npc_dota_hero_monkey_king_alt1",
    ["models/items/rubick/rubick_arcana/rubick_arcana_base.vmdl"] = "npc_dota_hero_rubick_alt",
    ["models/items/techies/bigshot/bigshot.vmdl"] = "npc_dota_hero_techies_alt1",
    ["models/heroes/zeus/zeus_arcana.vmdl"] = "npc_dota_hero_zuus_alt1",
    ["models/heroes/dragon_knight_persona/dk_persona_base.vmdl"] = "npc_dota_hero_dragon_knight_persona1",
    ["models/items/io/io_ti7/io_ti7.vmdl"] = "npc_dota_hero_wisp_alt",
    ["models/heroes/phantom_assassin_persona/phantom_assassin_persona.vmdl"] = "npc_dota_hero_phantom_assassin_persona1",
    ["models/heroes/crystal_maiden_persona/crystal_maiden_persona.vmdl"] = "npc_dota_hero_crystal_maiden_persona1",
    ["models/heroes/mirana_persona/mirana_persona_base.vmdl"] = "npc_dota_hero_mirana_persona1",
    ["models/items/vengefulspirit/imperia/imperia.vmdl"] = "npc_dota_hero_vengefulspirit_alt3_png"
}
____exports.UniquePortraits = __TS__Class()
local UniquePortraits = ____exports.UniquePortraits
UniquePortraits.name = "UniquePortraits"
function UniquePortraits.prototype.____constructor(self)
end
function UniquePortraits.UpdatePortraitsDataFromPlayer(self, player_id)
    local hero = PlayerResource:GetSelectedHeroEntity(player_id)
    if hero then
        local models = hero:GetWearables()
        __TS__ArrayForEach(
            models,
            function(____, model)
                local portrait_data = PORTRAITS_FROM_MODEL[model.modelName]
                if portrait_data then
                    local unique_icon
                    if type(portrait_data) == "table" then
                        local style = HASH_STYLES[model.material]
                        if style and portrait_data[style] then
                            unique_icon = portrait_data[style]
                        end
                    elseif type(portrait_data) == "string" then
                        unique_icon = portrait_data
                    end
                    if unique_icon then
                        self.portraits_data[player_id] = unique_icon
                    end
                end
            end
        )
        CustomNetTables:SetTableValue("game", "portraits", self.portraits_data)
    else
        Timers:CreateTimer(
            1,
            function() return self:UpdatePortraitsDataFromPlayer(player_id) end
        )
    end
end;
(function(self)
    self.portraits_data = {}
    CustomNetTables:SetTableValue("game", "portraits", self.portraits_data)
end)(UniquePortraits)
return ____exports
