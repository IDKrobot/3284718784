"use strict";
const context = $.GetContextPanel();
function SetupPatchTooltip() {
    const hasShard = context.GetAttributeString("shard", "false") === "true";
    const hero = context.GetAttributeString("hero", "undefined");
    const contextAbilities = context.GetAttributeString("abilities", "undefined");
    if (hero === "undefined" || contextAbilities === "undefined")
        return;
    context.SetHasClass("NoShard", !hasShard);
    const abilities = contextAbilities.split(",");
    const scepter_upgrades = AghanimValues.GetPatchScepterUpgrades(hero, abilities);
    const shard_upgrades = hasShard
        ? AghanimValues.GetPatchShardUpgrades(hero, abilities)
        : undefined;
    SetupUpgrades(undefined, -1, scepter_upgrades, shard_upgrades);
}
function SetupTooltip() {
    const selectedIndex = Players.GetLocalPlayerPortraitUnit();
    if (selectedIndex === -1) {
        SetupPatchTooltip();
        return;
    }
    context.SetHasClass("NoShard", false);
    let scepter_upgrades;
    let shard_upgrades;
    if (Entities.GetUnitName(selectedIndex) === "npc_dota_hero_morphling") {
        const customMorph = Entities.GetAbilityByName(selectedIndex, "morphling_replicate_custom_729") !== -1;
        const scepter_abilities = customMorph
            ? ["morphling_replicate_custom_729"]
            : ["morphling_replicate"];
        const shard_abilities = customMorph
            ? ["morphling_adaptive_strike_agi_custom_729", "morphling_adaptive_strike_str_custom_729"]
            : ["morphling_morph_agi", "morphling_morph_str"];
        scepter_upgrades = AghanimValues.GetPatchScepterUpgrades("npc_dota_hero_morphling", scepter_abilities);
        shard_upgrades = AghanimValues.GetPatchShardUpgrades("npc_dota_hero_morphling", shard_abilities);
    }
    else {
        scepter_upgrades = AghanimValues.GetScepterUpgrades(selectedIndex, true);
        shard_upgrades = AghanimValues.GetShardUpgrades(selectedIndex, true);
    }
    const unitName = Entities.GetUnitName(selectedIndex);
    const facet = unitName === "npc_dota_hero_invoker" || unitName === "npc_dota_hero_rubick"
        ? AghanimValues.GetFacet("npc_dota_hero_invoker")
        : undefined;
    context.SetHasClass("HasScepter", Entities.HasScepter(selectedIndex));
    context.SetHasClass("HasShard", Entities.HasShard(selectedIndex));
    SetupUpgrades(facet, selectedIndex, scepter_upgrades, shard_upgrades);
}
function SetupUpgrades(facet, selectedIndex, scepterUpgrades, shardUpgrades) {
    const scepter_section = context.FindChildTraverse("AghsScepterContainer");
    const shard_section = context.FindChildTraverse("AghsShardContainer");
    scepter_section.RemoveAndDeleteChildren();
    shard_section.RemoveAndDeleteChildren();
    Object.entries(scepterUpgrades).forEach(([ability_name, ability_values]) => {
        if (!ability_values)
            return;
        const ability = Entities.GetAbilityByName(selectedIndex, ability_name);
        const ability_data = {
            name: ability_name,
            level: Abilities.GetLevel(ability),
            damage_type: Abilities.GetAbilityDamageType(ability),
            facet
        };
        if (ability_values.IsGrantedByScepter)
            AghanimPanelGenerator.GrantedByAbility(UpgradeType.SCEPTER, scepter_section, ability_data, ability_name, ability_values);
        else if (ability_values.HasScepterUpgrade)
            AghanimPanelGenerator.DefaultUpgrade(UpgradeType.SCEPTER, scepter_section, ability_data, ability_name, ability_values);
    });
    if (scepter_section.Children().length === 0) {
        const upgrade = $.CreatePanel("Panel", scepter_section, "");
        upgrade.BLoadLayoutSnippet("NoUpgradeSnippet");
    }
    // Shard
    if (shardUpgrades !== undefined) {
        Object.entries(shardUpgrades).forEach(([ability_name, ability_values]) => {
            if (!ability_values)
                return;
            const ability = Entities.GetAbilityByName(selectedIndex, ability_name);
            const ability_data = {
                name: ability_name,
                level: Abilities.GetLevel(ability),
                damage_type: Abilities.GetAbilityDamageType(ability),
                facet
            };
            if (ability_values.IsGrantedByShard)
                AghanimPanelGenerator.GrantedByAbility(UpgradeType.SHARD, shard_section, ability_data, ability_name, ability_values);
            else if (ability_values.HasShardUpgrade)
                AghanimPanelGenerator.DefaultUpgrade(UpgradeType.SHARD, shard_section, ability_data, ability_name, ability_values);
        });
    }
    if (shard_section.Children().length === 0) {
        const upgrade = $.CreatePanel("Panel", shard_section, "");
        upgrade.BLoadLayoutSnippet("NoUpgradeSnippet");
    }
}
