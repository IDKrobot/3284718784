local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 12,["14"] = 16,["15"] = 16,["16"] = 16,["17"] = 16,["18"] = 16,["19"] = 16,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 16,["25"] = 16,["26"] = 16,["27"] = 16,["28"] = 16,["29"] = 16,["30"] = 16,["31"] = 16,["32"] = 16,["33"] = 16,["34"] = 16,["35"] = 16,["36"] = 57,["37"] = 58,["38"] = 58,["39"] = 58,["40"] = 58,["41"] = 59,["42"] = 59,["43"] = 59,["44"] = 59,["45"] = 60,["46"] = 60,["47"] = 60,["48"] = 60,["49"] = 57});
local ____exports = {}
local particles = {
    "particles/ui_mouseactions/range_finder_cone.vpcf",
    "particles/items_fx/misery_projectile.vpcf",
    "particles/econ/events/plus/high_five/high_five_impact.vpcf",
    "particles/econ/events/plus/high_five/high_five_lvl1_travel.vpcf",
    "particles/econ/events/plus/high_five/high_five_lvl1_overhead.vpcf"
}
local sounds = {"soundevents/game_sounds_heroes/game_sounds_techies_pre731.vsndevts"}
local models = {
    "models/heroes/techies/fx_techiesfx_mine.vmdl",
    "models/items/techies/bigshot/fx_bigshot_mine.vmdl",
    "models/items/techies/techies_ti9_immortal_prox_mine/techies_ti9_immortal_prox_mine.vmdl",
    "models/heroes/techies/fx_techiesfx_stasis.vmdl",
    "models/items/techies/bigshot/fx_bigshot_stasis.vmdl",
    "models/heroes/techies/techies_sign.vmdl",
    "models/items/techies/bigshot/fx_bigshot_sign.vmdl",
    "models/items/techies/techies_ti9_immortal_sign/techies_ti9_immortal_sign.vmdl",
    "models/heroes/techies/fx_techies_remotebomb.vmdl",
    "models/heroes/techies/fx_techies_remotebomb_rubick.vmdl",
    "models/items/techies/bigshot/bigshot_remotebomb.vmdl",
    "models/items/techies/techies_ti9_immortal_remote_mine/techies_ti9_immortal_remote_mine.vmdl",
    "models/heroes/clinkz/clinkz_archer.vmdl",
    "models/items/clinkz/clinkz_ti9_immortal_weapon/clinkz_ti9_immortal_army.vmdl",
    "models/heroes/invoker/forge_spirit.vmdl",
    "models/heroes/invoker_kid/invoker_kid_trainer_dragon.vmdl",
    "models/items/invoker_kid/continuum_echoes_forge_spirit/continuum_echoes_forge_spirit.vmdl",
    "models/heroes/broodmother/spiderling.vmdl",
    "models/items/broodmother/spiderling/lycosidae_spiderling/lycosidae_spiderling.vmdl",
    "models/props_gameplay/wraith_pact.vmdl"
}
____exports.PrecacheResources = function(____, context)
    __TS__ArrayForEach(
        particles,
        function(____, particle) return context:AddResource(particle) end
    )
    __TS__ArrayForEach(
        sounds,
        function(____, sound) return context:AddResource(sound) end
    )
    __TS__ArrayForEach(
        models,
        function(____, model) return context:AddResource(model) end
    )
end
return ____exports
