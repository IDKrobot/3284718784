"use strict";
class AghanimTooltip {
    constructor() {
        this.ping_cooldown = {
            count: 0,
            last_ping: 0,
            in_cooldown: false
        };
        this.context = $.GetContextPanel();
        this.SetupStatusDisplay();
        this.CreateScepterDescription();
        this.CreateShardDescription();
        if (!$.DbgIsReloadingScript()) {
            $.RegisterEventHandler("DOTAShowAbilityTooltip", dotaHud, (panel, ability_name) => this.AbilityTooltipHandler(panel, ability_name, -1));
            $.RegisterEventHandler("DOTAShowAbilityTooltipForEntityIndex", dotaHud, (panel, ability_name, entity) => this.AbilityTooltipHandler(panel, ability_name, entity));
            $.RegisterEventHandler("DOTAHideAbilityTooltip", dotaHud, (panel, ability_name) => this.AbilityTooltipHandler(panel, ability_name, -1));
        }
        // Precache
        $.Schedule(0.03, () => {
            const unit = Players.GetLocalPlayerPortraitUnit();
            AghanimValues.GetScepterUpgrades(unit);
            AghanimValues.GetShardUpgrades(unit);
        });
        this.Tick();
    }
    /* Tooltip Logic */
    SetupStatusDisplay() {
        const abilityPanel = FindDotaHudElement("AbilitiesAndStatBranch");
        if (!abilityPanel)
            return;
        const container = abilityPanel.FindChildTraverse("AghsStatusContainer");
        this.container = container;
        container.ClearPanelEvent("onmouseover");
        container.ClearPanelEvent("onmouseout");
        container.SetPanelEvent("onmouseover", () => $.DispatchEvent("UIShowCustomLayoutParametersTooltip", this.container, "CustomAghsStatusTooltip", "file://{resources}/layout/custom_game/snippets/custom_aghanim_tooltip.xml", ""));
        container.SetPanelEvent("onmouseout", () => $.DispatchEvent("UIHideCustomLayoutTooltip", this.container, "CustomAghsStatusTooltip"));
        const scepterContainer = container.FindChildTraverse("AghsStatusScepterContainer");
        scepterContainer.ClearPanelEvent("onactivate");
        scepterContainer.SetPanelEvent("onactivate", () => this.ClickedAghsStatusDisplay(UpgradeType.SCEPTER));
        const shardContainer = container.FindChildTraverse("AghsStatusShard");
        shardContainer.ClearPanelEvent("onactivate");
        shardContainer.SetPanelEvent("onactivate", () => this.ClickedAghsStatusDisplay(UpgradeType.SHARD));
    }
    /* Overwrite Ability Description */
    CreateScepterDescription(tooltip) {
        if (this.custom_scepter_description)
            return this.custom_scepter_description;
        let description = FindDotaHudElement("CustomAghsScepterDescription");
        if (!description && tooltip) {
            const extra_description = tooltip.FindChildTraverse("AbilityExtraDescription");
            const core_details = tooltip.FindChildTraverse("AbilityCoreDetails");
            if (!extra_description || !core_details)
                return null;
            description = $.CreatePanel("Panel", core_details, "CustomAghsScepterDescription");
            description.BLoadLayout("file://{resources}/layout/custom_game/snippets/custom_scepter_description.xml", false, false);
            core_details.MoveChildAfter(description, extra_description);
        }
        this.custom_scepter_description = description;
        return description;
    }
    CreateShardDescription(tooltip) {
        if (this.custom_shard_description)
            return this.custom_shard_description;
        let description = FindDotaHudElement("CustomAghsShardDescription");
        if (!description && tooltip) {
            const scepter_description = tooltip.FindChildTraverse("CustomAghsScepterDescription");
            const core_details = tooltip.FindChildTraverse("AbilityCoreDetails");
            if (!scepter_description || !core_details)
                return null;
            description = $.CreatePanel("Panel", core_details, "CustomAghsShardDescription");
            description.BLoadLayout("file://{resources}/layout/custom_game/snippets/custom_shard_description.xml", false, false);
            core_details.MoveChildAfter(description, scepter_description);
        }
        this.custom_shard_description = description;
        return description;
    }
    ShowAbilityUpgradeDescription(upgrade_type, description, entity, ability_name, ability_data) {
        var _a;
        description.SetHasClass("Hidden", true);
        description.SetHasClass("Visible", false);
        let unitName = undefined;
        if (Entities.GetUnitName(entity) === "npc_dota_hero_morphling") {
            unitName = (_a = CustomNetTables.GetTableValue("morphed_hero", Entities.GetPlayerOwnerID(entity))) === null || _a === void 0 ? void 0 : _a.hero;
        }
        const upgrade = (upgrade_type === UpgradeType.SCEPTER
            ? AghanimValues.GetScepterUpgrades(entity, false, unitName)
            : AghanimValues.GetShardUpgrades(entity, false, unitName))[ability_name];
        const noUpgrade = upgrade === undefined
            || upgrade.IsGrantedByShard === 1
            || upgrade.IsGrantedByScepter === 1;
        description.SetHasClass("NoUpgrade", noUpgrade);
        if (noUpgrade)
            return;
        const description_text = AghanimGenerator.Description(upgrade_type, ability_data, upgrade);
        if (description_text === undefined)
            return;
        description.SetHasClass("Hidden", false);
        description.SetHasClass("Visible", true);
        const dialogKey = upgrade_type === UpgradeType.SCEPTER
            ? "scepter_upgrade_description"
            : "shard_upgrade_description";
        description.SetDialogVariable(dialogKey, description_text);
    }
    AbilityTooltipHandler(panel, ability_name, entity) {
        const tooltips = FindDotaHudElement("Tooltips");
        if (!tooltips)
            return;
        const tooltip = tooltips.FindChildTraverse("DOTAAbilityTooltip");
        if (!tooltip)
            return;
        const scepter_description = this.CreateScepterDescription(tooltip);
        const shard_description = this.CreateShardDescription(tooltip);
        if (!scepter_description || !shard_description)
            return;
        if (!ability_name) {
            scepter_description.SetHasClass("Hidden", true);
            shard_description.SetHasClass("Hidden", true);
            scepter_description.SetHasClass("Visible", false);
            shard_description.SetHasClass("Visible", false);
            return;
        }
        if (panel.id === "ItemImage") {
            // this.ItemTooltipHandler(panel as ItemImage, entity);
            return;
        }
        const unitName = Entities.GetUnitName(entity);
        const facet = unitName === "npc_dota_hero_invoker" || unitName === "npc_dota_hero_rubick"
            ? AghanimValues.GetFacet("npc_dota_hero_invoker")
            : undefined;
        const ability = Entities.GetAbilityByName(entity, ability_name);
        const ability_data = {
            name: ability_name,
            level: Abilities.GetLevel(ability),
            damage_type: Abilities.GetAbilityDamageType(ability),
            facet
        };
        if (Entities.HasScepter(entity)) {
            this.ShowAbilityUpgradeDescription(UpgradeType.SCEPTER, scepter_description, entity, ability_name, ability_data);
        }
        else {
            scepter_description.SetHasClass("Hidden", true);
            scepter_description.SetHasClass("Visible", false);
            scepter_description.SetHasClass("NoUpgrade", true);
        }
        if (Entities.HasShard(entity)) {
            this.ShowAbilityUpgradeDescription(UpgradeType.SHARD, shard_description, entity, ability_name, ability_data);
        }
        else {
            shard_description.SetHasClass("Hidden", true);
            shard_description.SetHasClass("Visible", false);
            shard_description.SetHasClass("NoUpgrade", true);
        }
    }
    ItemTooltipHandler(panel, entity) {
        const itemName = panel.itemname;
        let upgrade_type;
        if (itemName === "item_ultimate_scepter"
            || itemName === "item_ultimate_scepter_2"
            || itemName === "item_ultimate_scepter_roshan") {
            upgrade_type = UpgradeType.SCEPTER;
        }
        else if (itemName === "item_aghanims_shard"
            || itemName === "item_aghanims_shard_roshan") {
            upgrade_type = UpgradeType.SHARD;
        }
        else
            return;
        const upgrades = upgrade_type === UpgradeType.SCEPTER
            ? AghanimValues.GetScepterUpgrades(entity)
            : AghanimValues.GetShardUpgrades(entity);
        // maybe later...
    }
    /* Other */
    ClickedAghsStatusDisplay(type) {
        var _a;
        if (!GameUI.IsAltDown())
            return;
        if (this.ping_cooldown.in_cooldown) {
            const cooldown = Game.GetGameTime() - this.ping_cooldown.last_ping;
            if (cooldown > 2.0) {
                this.ping_cooldown.in_cooldown = false;
                this.ping_cooldown.count = 0;
            }
            else
                return;
        }
        const localPlayer = Game.GetLocalPlayerID();
        const selectedIndex = Players.GetLocalPlayerPortraitUnit();
        let unitName = undefined;
        if (Entities.GetUnitName(selectedIndex) === "npc_dota_hero_morphling") {
            unitName = (_a = CustomNetTables.GetTableValue("morphed_hero", Entities.GetPlayerOwnerID(selectedIndex))) === null || _a === void 0 ? void 0 : _a.hero;
        }
        const heroIndex = Game.GetPlayerInfo(localPlayer).player_selected_hero_entity_index;
        const upgraded_abilities = type === UpgradeType.SCEPTER
            ? AghanimValues.GetScepterUpgrades(selectedIndex, false, unitName)
            : AghanimValues.GetShardUpgrades(selectedIndex, false, unitName);
        const getKey = (initialType, targetType, finalType) => targetType.length > 0
            ? `DOTA_${initialType}_Ping_${targetType}_${finalType}`
            : `DOTA_${initialType}_Ping_${finalType}`;
        const hasUpgrade = (unit) => type === UpgradeType.SCEPTER
            ? Entities.HasScepter(unit)
            : Entities.HasShard(unit);
        const main_token = getKey(type === UpgradeType.SCEPTER
            ? "AghsScepter"
            : "AghsShard", heroIndex === selectedIndex
            ? ""
            : Entities.GetTeamNumber(heroIndex) === Entities.GetTeamNumber(selectedIndex)
                ? "Ally"
                : "Enemy", hasUpgrade(selectedIndex)
            ? "Ready"
            : "Unlearned");
        const target = heroIndex === selectedIndex ? heroIndex : selectedIndex;
        const targetId = Entities.GetPlayerOwnerID(target);
        // Not the best idea to send full values to server
        // But idk how to make it work on every client properly
        //
        // And I don't wanna touch this shit >:(
        GameEvents.SendCustomGameEventToServer("scepter_ping", {
            token: main_token,
            color: Players.GetPlayerColorHex(targetId),
            unit_name: Entities.GetUnitName(target),
            abilities: Object.keys(upgraded_abilities)
                .map(ability => $.Localize("DOTA_Tooltip_Ability_" + ability))
                .join(", ")
        });
        /* ping cooldown controls */
        if (Game.GetGameTime() - this.ping_cooldown.last_ping > 4.0)
            this.ping_cooldown.count = 0;
        this.ping_cooldown.count++;
        this.ping_cooldown.last_ping = Game.GetGameTime();
        if (this.ping_cooldown.count > 1)
            this.ping_cooldown.in_cooldown = true;
    }
    GetDotaAbilityTooltip() {
        if (this.ability_tooltip)
            return this.ability_tooltip;
        const tooltips = FindDotaHudElement("Tooltips");
        if (!tooltips)
            return null;
        return this.ability_tooltip = tooltips.FindChildTraverse("DOTAAbilityTooltip");
    }
    GetDotaScepterDescription() {
        if (this.scepter_description)
            return this.scepter_description;
        const tooltips = this.GetDotaAbilityTooltip();
        if (!tooltips)
            return null;
        return this.scepter_description = tooltips.FindChildTraverse("ScepterUpgradeDescription");
    }
    GetDotaShardDescription() {
        if (this.shard_description)
            return this.shard_description;
        const tooltips = this.GetDotaAbilityTooltip();
        if (!tooltips)
            return null;
        return this.shard_description = tooltips.FindChildTraverse("ShardUpgradeDescription");
    }
    Tick() {
        const scepter = this.GetDotaScepterDescription();
        if (scepter)
            scepter.visible = false;
        const shard = this.GetDotaShardDescription();
        if (shard)
            shard.visible = false;
        $.Schedule(0.03, () => this.Tick());
    }
}
const aghanimTooltip = new AghanimTooltip();
