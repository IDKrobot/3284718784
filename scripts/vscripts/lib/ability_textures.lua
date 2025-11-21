local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 8,["10"] = 8,["11"] = 8,["12"] = 30,["13"] = 30,["14"] = 30,["15"] = 30,["16"] = 30,["17"] = 30,["18"] = 30,["19"] = 30,["20"] = 30,["21"] = 30,["22"] = 30,["23"] = 30,["24"] = 30,["25"] = 30,["26"] = 30,["27"] = 30,["28"] = 30,["29"] = 30,["30"] = 30,["31"] = 30,["32"] = 8,["33"] = 145,["34"] = 145,["35"] = 145,["36"] = 145,["37"] = 145,["38"] = 145,["39"] = 145,["40"] = 8,["41"] = 8,["42"] = 8,["43"] = 8,["44"] = 8,["45"] = 235,["46"] = 235,["47"] = 235,["48"] = 235,["49"] = 235,["50"] = 235,["51"] = 235,["52"] = 8,["53"] = 8,["54"] = 283,["55"] = 283,["56"] = 283,["57"] = 283,["58"] = 283,["59"] = 283,["60"] = 283,["61"] = 283,["62"] = 283,["63"] = 283,["64"] = 283,["65"] = 283,["66"] = 283,["67"] = 283,["68"] = 283,["69"] = 283,["70"] = 8,["71"] = 8,["72"] = 382,["73"] = 382,["74"] = 382,["75"] = 382,["76"] = 382,["77"] = 382,["78"] = 382,["79"] = 8,["80"] = 8,["81"] = 8,["82"] = 430,["83"] = 430,["84"] = 430,["86"] = 430,["87"] = 431,["88"] = 432,["91"] = 434,["92"] = 435,["93"] = 437,["94"] = 437,["95"] = 437,["96"] = 437,["99"] = 439,["100"] = 440,["103"] = 442,["104"] = 443,["105"] = 443,["106"] = 444,["107"] = 445,["108"] = 446,["110"] = 448,["111"] = 443,["112"] = 443,["113"] = 443,["114"] = 451,["115"] = 451,["116"] = 451,["117"] = 451,["118"] = 451,["119"] = 431,["120"] = 456,["121"] = 457,["122"] = 457,["124"] = 459,["125"] = 460,["126"] = 460,["128"] = 462,["129"] = 456,["130"] = 465,["131"] = 466,["132"] = 466,["134"] = 468,["135"] = 469,["136"] = 471,["137"] = 471,["138"] = 471,["139"] = 471,["140"] = 471,["142"] = 473,["143"] = 473,["144"] = 473,["145"] = 473,["146"] = 474,["147"] = 474,["149"] = 476,["150"] = 477,["151"] = 477,["153"] = 479,["154"] = 465});
local ____exports = {}
local HEROES_ABILITY_TEXTURES = {
    npc_dota_hero_ogre_magi = {{model = "models/items/ogre_magi/ogre_arcana/ogre_magi_arcana.vmdl", ability = "hand_of_midas_727", texture = "hand_of_midas_ogre_arcana_727"}},
    npc_dota_hero_tinker = {{model = "models/items/tinker/tinker_ti10_immortal_laser/tinker_ti10_immortal_laser.vmdl", ability = "tinker_laser", texture = "tinker/tinker_ti10_immortal_ability_icons/tinker_laser_ti10"}, {model = "models/items/tinker/roller_mawster/roller_mawster.vmdl", ability = "tinker_march_of_the_machines", texture = "tinker/rollermawster/tinker_march_of_the_machines_1"}},
    npc_dota_hero_pudge = {
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_meat_hook", texture = "pudge/arcana/pudge_meat_hook_arcana", style = 0},
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_rot", texture = "pudge/arcana/pudge_rot_arcana", style = 0},
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_flesh_heap", texture = "pudge/arcana/pudge_flesh_heap_arcana", style = 0},
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_dismember", texture = "pudge/arcana/pudge_dismember_arcana", style = 0},
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_meat_hook", texture = "pudge/arcana/pudge_meat_hook_arcana_style1", style = 1},
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_rot", texture = "pudge/arcana/pudge_rot_arcana_style1", style = 1},
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_flesh_heap", texture = "pudge/arcana/pudge_flesh_heap_arcana_style1", style = 1},
        {model = "models/items/pudge/arcana/pudge_arcana_base.vmdl", ability = "pudge_dismember", texture = "pudge/arcana/pudge_dismember_arcana_style1", style = 1},
        {model = "models/heroes/pudge_cute/pudge_cute.vmdl", ability = "pudge_meat_hook", texture = "pudge/persona_toy_butcher/pudge_meat_hook_persona1"},
        {model = "models/heroes/pudge_cute/pudge_cute.vmdl", ability = "pudge_rot", texture = "pudge/persona_toy_butcher/pudge_rot_persona1"},
        {model = "models/heroes/pudge_cute/pudge_cute.vmdl", ability = "pudge_flesh_heap", texture = "pudge/persona_toy_butcher/pudge_flesh_heap_persona1"},
        {model = "models/heroes/pudge_cute/pudge_cute.vmdl", ability = "pudge_dismember", texture = "pudge/persona_toy_butcher/pudge_dismember_persona1"},
        {model = "models/items/pudge/ti10_immortal_armhook/pudge_ti10_immortal_arm_hook.vmdl", ability = "pudge_meat_hook", texture = "pudge/ti_10_pudge_immortal_hook/pudge_meat_hook_immortal", style = 0},
        {model = "models/items/pudge/ti10_immortal_armhook/pudge_ti10_immortal_arm_hook.vmdl", ability = "pudge_meat_hook", texture = "pudge/ti_10_pudge_immortal_hook/pudge_meat_hook_immortal_alt", style = 1},
        {model = "models/items/pudge/immortal_arm/immortal_arm.vmdl", ability = "pudge_rot", texture = "pudge/ti7_pudge_immortal/pudge_rot_alt", style = 0},
        {model = "models/items/pudge/immortal_arm/immortal_arm.vmdl", ability = "pudge_rot", texture = "pudge/ti7_pudge_immortal/pudge_rot_alt2", style = 1},
        {model = "models/items/pudge_cute/pudge_cute_frostivus/pudge_cute_frostivus_hook.vmdl", ability = "pudge_meat_hook", texture = "pudge/persona_frostivus/pudge_meat_hook_persona_frostivus1"},
        {model = "models/items/pudge_cute/pudge_cute_frostivus/pudge_cute_frostivus_hook.vmdl", ability = "pudge_meat_hook", texture = "pudge/persona_frostivus/pudge_meat_hook_persona_frostivus2", style = 1},
        {model = "models/items/pudge_cute/pudge_cute_calavera/pudge_cute_calavera_weapon.vmdl", ability = "pudge_meat_hook", texture = "pudge/persona_toy_butcher_calavera/pudge_meat_hook_persona_calavera1"}
    },
    npc_dota_hero_nevermore = {
        {model = "models/heroes/shadow_fiend/head_arcana.vmdl", ability = "nevermore_shadowraze1", texture = "nevermore_shadowraze1_demon"},
        {model = "models/heroes/shadow_fiend/head_arcana.vmdl", ability = "nevermore_shadowraze2", texture = "nevermore_shadowraze2_demon"},
        {model = "models/heroes/shadow_fiend/head_arcana.vmdl", ability = "nevermore_shadowraze3", texture = "nevermore_shadowraze3_demon"},
        {model = "models/heroes/shadow_fiend/head_arcana.vmdl", ability = "nevermore_necromastery", texture = "nevermore_necromastery_demon"},
        {model = "models/heroes/shadow_fiend/head_arcana.vmdl", ability = "nevermore_dark_lord", texture = "nevermore_dark_lord_demon"},
        {model = "models/heroes/shadow_fiend/head_arcana.vmdl", ability = "nevermore_requiem", texture = "nevermore_requiem_demon"}
    },
    npc_dota_hero_techies = {{model = "models/items/techies/techies_ti9_immortal_cart/techies_ti9_immortal_cart.vmdl", ability = "techies_land_mines", texture = "techies/techies_land_mines_immortal"}, {model = "models/items/techies/bigshot/bigshot.vmdl", ability = "techies_minefield_sign", texture = "techies_minefield_sign_swine"}, {model = "models/items/techies/bigshot/bigshot.vmdl", ability = "techies_remote_mines", texture = "techies_remote_swines"}},
    npc_dota_hero_clinkz = {{model = "models/items/clinkz/clinkz_ti9_immortal_weapon/clinkz_ti9_immortal_weapon.vmdl", ability = "clinkz_searing_arrows", texture = "clinkz_searing_arrows_immortal"}, {model = "models/items/clinkz/ti7_clinkz_immortal/ti7_clinkz_immortal.vmdl", ability = "clinkz_burning_army", texture = "clinkz/ti9_immortal_bow/clinkz_burning_army_immortal"}},
    npc_dota_hero_arc_warden = {{model = "models/items/arc_warden/aw_ti9_immortal_shoulders/aw_ti9_immortal_shoulders.vmdl", ability = "arc_warden_spark_wraith", texture = "arc_warden/ti9_immortal_shoulders/arc_warden_spark_wraith_immortal"}, {model = "models/items/arc_warden/arc_warden_frostivus/arc_warden_frostivus_head.vmdl", ability = "arc_warden_magnetic_field", texture = "arc_warden_magnetic_field_frostivus"}},
    npc_dota_hero_dazzle = {{model = "models/items/dazzle/darkclaw_acolyte_weapon/darkclaw_acolyte_weapon.vmdl", ability = "dazzle_poison_touch", texture = "dazzle/darkclaw_acolyte_weapon/darkclaw_acolyte_poison_touch"}, {model = "models/items/dazzle/dazzle_ti6_immortal/mesh/dazzle_ti6_immortal.vmdl", ability = "dazzle_shallow_grave", texture = "dazzle/immortal/dazzle_shallow_grave"}, {model = "models/items/dazzle/dazzle_ti9_immortal_back/dazzle_ti9_immortal_back.vmdl", ability = "dazzle_shadow_wave", texture = "dazzle/ti9_immortal_head/dazzle_shadow_wave_immortal"}},
    npc_dota_hero_huskar = {
        {model = "models/items/huskar/huskar_ti8_immortal_shoulders/huskar_ti8_immortal_shoulders.vmdl", ability = "huskar_inner_vitality", texture = "huskar/ti8_immortal_shoulder/huskar_inner_vitality_immortal"},
        {model = "models/items/huskar/husk_2021_immortal/husk_2021_immortal_arm_model.vmdl", ability = "huskar_burning_spear", texture = "huskar/husk_2021_immortal_weapon_ability_icon/husk_2021_immortal_burning_spear", style = 0},
        {model = "models/items/huskar/husk_2021_immortal/husk_2021_immortal_arm_model.vmdl", ability = "huskar_burning_spear", texture = "huskar/husk_2021_immortal_weapon_ability_icon/husk_2021_immortal_burning_spear_gold", style = 1},
        {model = "models/items/huskar/husk_2022_immortal/husk_2022_immortal.vmdl", ability = "huskar_life_break", texture = "huskar/husk_2022_immortal/husk_2022_immortal_life_break", style = 0},
        {model = "models/items/huskar/husk_2022_immortal/husk_2022_immortal.vmdl", ability = "huskar_life_break", texture = "huskar/husk_2022_immortal/husk_2022_immortal_life_break_gold", style = 1},
        {model = "models/items/huskar/searing_dominator/searing_dominator.vmdl", ability = "huskar_life_break", texture = "huskar_life_break_alt"}
    },
    npc_dota_hero_pangolier = {{model = "models/items/pangolier/pangolier_immortal_musket/pangolier_immortal_musket.vmdl", ability = "pangolier_swashbuckle", texture = "armadillo/immortal/armadillo_swashbuckle"}, {model = "models/items/pangolier/pangolier_ti8_immortal_head/pangolier_ti8_immortal_head.vmdl", ability = "pangolier_shield_crash", texture = "armadillo/ti8_immortal_head/pangolier_shield_crash_immortal"}},
    npc_dota_hero_invoker = {
        {model = "models/items/invoker/magus_apex/magus_apex.vmdl", ability = "invoker_quas", texture = "invoker/magus_apex/invoker_quas"},
        {model = "models/items/invoker/magus_apex/magus_apex.vmdl", ability = "invoker_wex", texture = "invoker/magus_apex/invoker_wex"},
        {model = "models/items/invoker/magus_apex/magus_apex.vmdl", ability = "invoker_exort", texture = "invoker/magus_apex/invoker_exort"},
        {model = "models/heroes/invoker_kid/invoker_kid.vmdl", ability = "invoker_quas", texture = "invoker_quas_persona1"},
        {model = "models/heroes/invoker_kid/invoker_kid.vmdl", ability = "invoker_wex", texture = "invoker_wex_persona1"},
        {model = "models/heroes/invoker_kid/invoker_kid.vmdl", ability = "invoker_exort", texture = "invoker_exort_persona1"},
        {model = "models/heroes/invoker_kid/invoker_kid.vmdl", ability = "invoker_ghost_walk", texture = "invoker_ghost_walk_persona1"},
        {model = "models/items/invoker/dark_artistry/dark_artistry_cape_model.vmdl", ability = "invoker_tornado", texture = "invoker/dark_artistry/invoker_tornado"},
        {model = "models/items/invoker_kid/dark_artistry_kid/invoker_kid_dark_artistry_back.vmdl", ability = "invoker_tornado", texture = "invoker/dark_artistry/invoker_tornado"},
        {model = "models/items/invoker/immortal_arms_ti7/immortal_arms_ti7.vmdl", ability = "invoker_alacrity", texture = "invoker/immortal/invoker_alacrity"},
        {model = "models/items/invoker/magus_apex/magus_apex.vmdl", ability = "invoker_sun_strike", texture = "invoker/magus_apex/invoker_sun_strike"},
        {model = "models/items/invoker_kid/dark_artistry_kid/magus_apex_kid.vmdl", ability = "invoker_sun_strike", texture = "invoker/magus_apex/invoker_sun_strike"},
        {model = "models/heroes/invoker_kid/invoker_kid.vmdl", ability = "invoker_forge_spirit", texture = "invoker_forge_spirit_persona1"},
        {model = "models/items/invoker/dark_artistry/dark_artistry_cape_model.vmdl", ability = "invoker_deafening_blast", texture = "invoker/dark_artistry/invoker_deafening_blast"},
        {model = "models/items/invoker_kid/dark_artistry_kid/invoker_kid_dark_artistry_back.vmdl", ability = "invoker_deafening_blast", texture = "invoker/dark_artistry/invoker_deafening_blast"}
    },
    npc_dota_hero_broodmother = {{model = "models/items/broodmother/lycosidae_back/lycosidae_back.vmdl", ability = "broodmother_spawn_spiderlings", texture = "broodmother_spawn_spiderlings_immortal"}, {model = "models/items/broodmother/bm_2022_immortal_legs/bm_2022_immortal_legs.vmdl", ability = "broodmother_spin_web", texture = "broodmother_spin_web_immortal"}, {model = "models/items/broodmother/bm_2022_immortal_legs/bm_2022_immortal_legs.vmdl", ability = "broodmother_spin_web_destroy", texture = "broodmother_spin_web_destroy_immortal"}},
    npc_dota_hero_sniper = {
        {model = "models/items/sniper/machine_gun_charlie/machine_gun_charlie.vmdl", ability = "sniper_shrapnel", texture = "sniper_shrapnel_muh_keen_gun"},
        {model = "models/items/sniper/scifi_sniper_test_gun/scifi_sniper_test_gun.vmdl", ability = "sniper_shrapnel", texture = "sniper_fall20_shrapnel"},
        {model = "models/items/sniper/sniper_cape_immortal/sniper_cape_immortal.vmdl", ability = "sniper_headshot", texture = "sniper_headshot_immortal", style = 0},
        {model = "models/items/sniper/sniper_cape_immortal/sniper_cape_immortal.vmdl", ability = "sniper_headshot", texture = "sniper_headshot_immortal_gold", style = 1},
        {model = "models/items/sniper/machine_gun_charlie/machine_gun_charlie.vmdl", ability = "sniper_assassinate", texture = "sniper_assassinate_muh_keen_gun"},
        {model = "models/items/sniper/scifi_sniper_test_gun/scifi_sniper_test_gun.vmdl", ability = "sniper_assassinate", texture = "sniper_fall20_assassinate"}
    },
    npc_dota_hero_morphling = {{model = "models/items/morphling/crown_of_tears/mesh/crown_of_tears_model.vmdl", ability = "morphling_waveform", texture = "morphling/crown_of_tears/morphling_waveform"}, {model = "models/items/morphling/ethereal_blade/ethereal_blade.vmdl", ability = "morphling_adaptive_strike_agi", texture = "morphling_adaptive_strike_agi_ethereal_blade"}}
}
____exports.AbilityTextureManager = __TS__Class()
local AbilityTextureManager = ____exports.AbilityTextureManager
AbilityTextureManager.name = "AbilityTextureManager"
function AbilityTextureManager.prototype.____constructor(self)
end
function AbilityTextureManager.InitHero(self, unit)
    if unit == nil then
        return
    end
    local unitName = unit:GetUnitName()
    local playerId = unit:GetPlayerOwnerID()
    if not __TS__ArrayIncludes(
        __TS__ObjectKeys(HEROES_ABILITY_TEXTURES),
        unitName
    ) then
        return
    end
    local heroTextures = HEROES_ABILITY_TEXTURES[unitName]
    if heroTextures == nil or #heroTextures == 0 then
        return
    end
    local wearables = unit:GetWearables()
    local textures = __TS__ArrayReduce(
        heroTextures,
        function(____, textures, data)
            if HasWearable(nil, wearables, data.model, data.style) then
                textures[data.ability] = data.texture
            end
            return textures
        end,
        {}
    )
    CustomNetTables:SetTableValue(
        "textures",
        tostring(playerId),
        {textures = textures}
    )
end
function AbilityTextureManager.GetAbilityTexture(self, unit, abilityName)
    if IsServer() or unit == nil or unit:IsNull() then
        return abilityName
    end
    local texture = self:GetTexture(unit, abilityName)
    if not texture then
        return abilityName
    end
    return texture
end
function AbilityTextureManager.GetTexture(self, unit, abilityName)
    if IsServer() or unit == nil or unit:IsNull() then
        return nil
    end
    local unitName = unit:GetUnitName()
    local playerId = unit:GetPlayerOwnerID()
    if not __TS__ArrayIncludes(
        __TS__ObjectKeys(HEROES_ABILITY_TEXTURES),
        unitName
    ) then
        return nil
    end
    local textures = CustomNetTables:GetTableValue(
        "textures",
        tostring(playerId)
    )
    if not textures then
        return nil
    end
    local texture = textures.textures[abilityName]
    if not texture then
        return nil
    end
    return texture
end
return ____exports
