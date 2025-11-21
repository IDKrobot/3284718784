"use strict";
class PatchSelection {
    constructor() {
        var _a, _b;
        this.buttons = [];
        this.context = $.GetContextPanel();
        this.preGame = FindDotaHudElement("PreGame");
        this.strategyScreen = this.preGame.FindChildTraverse("StrategyScreen");
        this.selectedPatch = this.currentPatch = (_b = (_a = CustomNetTables.GetTableValue("game", "current_patch")) === null || _a === void 0 ? void 0 : _a.patch) !== null && _b !== void 0 ? _b : "";
        this.patchAbilities = CustomNetTables.GetAllTableValues("patches");
        this.patches = {};
        this.patchAbilities.forEach(patch => {
            this.patches[patch.key] = Object.keys(patch.value).sort().filter(patch => patch !== "default");
            this.patches[patch.key].push(this.currentPatch);
        });
        GameEvents.Subscribe("game_rules_state_change", () => {
            if (Game.GetState() === DOTA_GameState.DOTA_GAMERULES_STATE_STRATEGY_TIME) {
                this.CreateMainPanel();
                this.CreateTooltipPanel();
                this.HeroSelected();
            }
        });
        GameEvents.Subscribe("dota_hero_swap", event => {
            const localID = Game.GetLocalPlayerID();
            if (event.playerid1 === localID || event.playerid2 === localID) {
                this.HeroSelected();
            }
        });
        // this.CreateTeamPatches();
    }
    CreateMainPanel() {
        this.strategyScreen.Children()
            .filter(child => child.id === "PatchSelection")
            .forEach(child => child.DeleteAsync(0));
        const mainPanel = this.mainPanel = $.CreatePanel("Panel", this.strategyScreen, "PatchSelection", {
            style: "width: 100%; height: 100%;"
        });
        mainPanel.hittest = false;
    }
    /*
    private CreateTeamPatches(): void {
        const header = this.preGame.FindChildTraverse("Header");
        if (!header) return;

        const radiantTeam = header.FindChildTraverse("RadiantTeamPlayers")!;
        const direTeam = header.FindChildTraverse("DireTeamPlayers")!;

        const heroes = Game.GetAllPlayerIDs().reduce((obj, id) => {
            const hero = Game.GetPlayerInfo(id).player_selected_hero;

            obj[hero] = id;
            return obj;
        }, {} as Record<string, PlayerID>);

        radiantTeam.Children().forEach(teamPlayer => {
            const heroImage = teamPlayer.FindChildTraverse<HeroImage>("HeroImage");
            if (!heroImage || !heroImage.heroname) return;

            const heroName = "npc_dota_hero_" + heroImage.heroname;

            const player = heroes[heroName];
            if (player === undefined) return;

            const selectedPatch = CustomNetTables.GetTableValue("selected_patches", heroName)?.value ?? this.currentPatch;
            $.Msg(selectedPatch);
        });
    }
    */
    // Patch Selection
    CreateTooltipPanel() {
        const tooltipPanel = $.CreatePanel("Panel", this.context, "PatchAbilityTooltip");
        tooltipPanel.hittest = false;
        const tooltipContainer = this.abilityContainer = $.CreatePanel("Panel", tooltipPanel, "PatchAbilityTooltipContainer");
        tooltipContainer.hittest = false;
        tooltipPanel.SetParent(this.mainPanel);
    }
    HeroSelected() {
        if (this.mainPanel === null)
            return;
        const selectedHero = Game.GetLocalPlayerInfo().player_selected_hero;
        const hasPatch = Object.keys(this.patches).includes(selectedHero);
        this.mainPanel.visible = hasPatch;
        if (!hasPatch)
            return;
        this.mainPanel.SetHasClass("InvokerAbilities", selectedHero === "npc_dota_hero_invoker");
        this.CreatePatchSelector(selectedHero);
        this.ShowAbilities(selectedHero, this.currentPatch);
    }
    CreatePatchSelector(selectedHero) {
        if (!Object.keys(this.patches).includes(selectedHero))
            return;
        if (this.selectionBox) {
            this.selectionBox.DeleteAsync(0);
        }
        // box
        const selectionBox = $.CreatePanel("Panel", this.context, "PatchSelectionBox");
        this.selectionBox = selectionBox;
        selectionBox.hittest = false;
        // title
        const selectionTitle = $.CreatePanel("Label", selectionBox, "PatchSelectionTitle");
        selectionTitle.hittest = false;
        selectionTitle.text = $.Localize("#Patch_Selector_Choose_Patch");
        // buttons container
        const patchesBox = $.CreatePanel("Panel", selectionBox, "PatchesBox");
        patchesBox.hittest = false;
        const patchesContainer = $.CreatePanel("Panel", patchesBox, "PatchesContainer");
        patchesContainer.hittest = false;
        // buttons
        const patches = this.patches[selectedHero];
        this.buttons = [];
        patches.forEach(patch => {
            const patchButton = $.CreatePanel("Button", patchesContainer, "", {
                class: "PatchButton"
            });
            patchButton.hittest = true;
            patchButton.SetHasClass("CurrentPatch", patch === this.currentPatch);
            patchButton.SetPanelEvent("onactivate", () => this.SelectPatch(patchButton, selectedHero, patch));
            const patchButtonLabel = $.CreatePanel("Label", patchButton, "");
            patchButtonLabel.text = patch === this.currentPatch
                ? $.Localize("#DOTA_Current_Patch")
                : patch;
            this.buttons.push(patchButton);
        });
        this.buttons[this.buttons.length - 1].SetHasClass("Selected", true);
        this.selectedPatch = this.currentPatch;
        this.SendHeroPatch(selectedHero);
        selectionBox.SetParent(this.mainPanel);
    }
    ShowAbilities(hero, patch) {
        var _a, _b;
        this.abilityContainer.SetHasClass("TooltipAnimation", true);
        this.abilityContainer.Children().forEach(child => child.DeleteAsync(0.09));
        const patch_abilities = ((_b = (_a = this.patchAbilities.find(ability => ability.key === hero)) === null || _a === void 0 ? void 0 : _a.value) !== null && _b !== void 0 ? _b : {})[patch];
        if (!patch_abilities)
            return;
        const abilities = [];
        for (let i = 1; i <= 16; i++) {
            const ability_name = patch_abilities["ability" + i];
            if (!ability_name)
                continue;
            if (typeof ability_name === "object") {
                if (ability_name.visible === 1) {
                    abilities.push(ability_name.name);
                }
            }
            else {
                abilities.push(ability_name);
            }
        }
        const scepter_upgrades = AghanimValues.GetPatchScepterUpgrades(hero, abilities);
        const shard_upgrades = AghanimValues.GetPatchShardUpgrades(hero, abilities);
        let hasShardUpgrades = false;
        $.Schedule(0.1, () => {
            abilities.forEach(ability_name => {
                var _a, _b, _c, _d;
                if (!hasShardUpgrades
                    && (!!((_a = shard_upgrades[ability_name]) === null || _a === void 0 ? void 0 : _a.HasShardUpgrade)
                        || !!((_b = shard_upgrades[ability_name]) === null || _b === void 0 ? void 0 : _b.IsGrantedByShard)))
                    hasShardUpgrades = true;
                if (((_c = shard_upgrades[ability_name]) === null || _c === void 0 ? void 0 : _c.IsGrantedByShard)
                    || ((_d = scepter_upgrades[ability_name]) === null || _d === void 0 ? void 0 : _d.IsGrantedByScepter))
                    return;
                const ability = $.CreatePanel("DOTAAbilityImage", this.context, "ability_panel_" + ability_name, {
                    class: "PatchAbility"
                });
                ability.hittest = true;
                ability.abilityname = ability_name;
                ability.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowAbilityTooltip", ability, ability_name));
                ability.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideAbilityTooltip", ability));
                ability.SetParent(this.abilityContainer);
            });
            const scepterContainer = $.CreatePanel("Panel", this.context, "PatchScepterTooltipContainer");
            this.scepterContainer = scepterContainer;
            scepterContainer.hittest = true;
            scepterContainer.SetHasClass("NoShard", !hasShardUpgrades);
            scepterContainer.SetHasClass("NoScepter", Object.keys(scepter_upgrades).length === 0);
            scepterContainer.SetPanelEvent("onmouseover", () => this.ShowTooltip(hasShardUpgrades, hero, abilities));
            scepterContainer.SetPanelEvent("onmouseout", () => this.HideTooltip());
            scepterContainer.SetParent(this.abilityContainer);
            this.abilityContainer.SetHasClass("TooltipAnimation", false);
        });
    }
    SelectPatch(panel, hero, patch) {
        if (this.selectedPatch === patch)
            return;
        this.buttons.forEach(button => {
            if (button) {
                button.SetHasClass("Selected", false);
            }
        });
        panel.SetHasClass("Selected", !panel.BHasClass("Selected"));
        this.selectedPatch = patch;
        this.ShowAbilities(hero, patch);
        this.SendHeroPatch(hero);
    }
    SendHeroPatch(selectedHero) {
        GameEvents.SendCustomGameEventToServer("select_patch", {
            hero: selectedHero,
            patch: this.selectedPatch
        });
    }
    // Aghanim Tooltip
    ShowTooltip(hasShard, hero, abilities) {
        const params = CreateTooltipParameters({
            shard: hasShard,
            hero: hero,
            abilities: abilities
        });
        $.DispatchEvent("UIShowCustomLayoutParametersTooltip", this.scepterContainer, "CustomAghsStatusTooltip", "file://{resources}/layout/custom_game/snippets/custom_aghanim_tooltip.xml", params);
    }
    HideTooltip() {
        $.DispatchEvent("UIHideCustomLayoutTooltip", this.scepterContainer, "CustomAghsStatusTooltip");
    }
}
const patchSelection = new PatchSelection();
