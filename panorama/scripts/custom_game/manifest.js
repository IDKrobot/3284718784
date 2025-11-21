"use strict";
const INVOKER_SPELLS = {
    "7.32": {
        "invoker_cold_snap": "invoker_cold_snap_custom_732",
        "invoker_ghost_walk": "invoker_ghost_walk_custom_732",
        "invoker_ice_wall": "invoker_ice_wall_custom_732",
        "invoker_emp": "invoker_emp_custom_732",
        "invoker_tornado": "invoker_tornado_custom_732",
        "invoker_alacrity": "invoker_alacrity_custom_732",
        "invoker_sun_strike": "invoker_sun_strike_custom_732",
        "invoker_forge_spirit": "invoker_forge_spirit_custom_732",
        "invoker_chaos_meteor": "invoker_chaos_meteor_custom_732",
        "invoker_deafening_blast": "invoker_deafening_blast_custom_732"
    }
};
class Manifest {
    constructor() {
        this.spellCardUpdated = false;
        GameEvents.Subscribe("dota_hud_error_message_player", event => this.SendError(event));
        GameEvents.Subscribe("emit_sound_on_client", event => this.EmitSound(event.soundName));
        this.heroes = CustomNetTables.GetAllTableValues("heroes");
        CustomNetTables.SubscribeNetTableListener("heroes", () => {
            this.heroes = CustomNetTables.GetAllTableValues("heroes");
        });
        /*
        const updater = (): void => {
            $.Schedule(0.03, () => {
                this.HideStats();
                this.SetCustomMorph();
            });
        };

        GameEvents.Subscribe("dota_player_update_selected_unit", updater);
        GameEvents.Subscribe("dota_player_update_query_unit", updater);
        GameEvents.Subscribe("dota_hud_player_learned_ability", updater);
        GameEvents.Subscribe("dota_hud_refresh_unit", updater);
        GameEvents.Subscribe("dota_player_gained_level", (event) => {
            if (event.hero_entindex === Players.GetLocalPlayerPortraitUnit())
                updater();
        });
        */
        this.Tick();
    }
    EmitSound(soundName) {
        Game.EmitSound(soundName);
    }
    SendError(event) {
        GameEvents.SendEventClientSide("dota_hud_error_message", {
            sequenceNumber: event.sequenceNumber,
            reason: event.reason,
            message: event.message
        });
    }
    ChangeInvokerSpellCard(patch) {
        this.spellCardUpdated = true;
        if (!patch)
            return;
        const spellCard = FindDotaHudElement("InvokerSpellCard");
        if (!spellCard)
            return;
        const patch_replacement = INVOKER_SPELLS[patch];
        if (!patch_replacement)
            return;
        const abilities = spellCard.FindChildrenWithClassTraverse("AbilityMaxLevel");
        abilities.forEach(ability => {
            const replacement = patch_replacement[ability.abilityname];
            if (replacement)
                ability.abilityname = replacement;
        });
    }
    ChangeInnatePanel(hide) {
        const statBranch = FindDotaHudElement("AbilitiesAndStatBranch");
        if (statBranch === null)
            return;
        const method = hide ? this.HidePanelElement : this.ShowPanelElement;
        statBranch.FindChildrenWithClassTraverse("RootInnateDisplay")
            .forEach(child => method(child));
    }
    ChangeStatBranchPanel(hasAttributes) {
        const statBranch = FindDotaHudElement("DOTAStatBranch");
        if (statBranch === null)
            return;
        statBranch.style.marginTop = hasAttributes
            ? "15px"
            : "0px";
        statBranch.style.marginRight = hasAttributes
            ? "35px"
            : "0px";
    }
    ChangeInvokerCardButton(isInvoker) {
        const spellCard = this.GetInvokerSpellCardButton();
        if (!spellCard)
            return;
        spellCard.style.visibility = isInvoker
            ? "visible"
            : "collapse";
    }
    ChangeLevelStatsFrame(show) {
        const element = FindDotaHudElement("level_stats_frame");
        if (!element)
            return;
        element.style.visibility = show && element.BHasClass("CanLevelStats")
            ? "visible"
            : "collapse";
    }
    ChangeHudState(heroData) {
        const selectedEntity = Players.GetLocalPlayerPortraitUnit();
        const isInvoker = Entities.GetUnitName(selectedEntity) === "npc_dota_hero_invoker";
        if (Entities.IsHero(selectedEntity)) {
            if (heroData !== undefined && Object.keys(heroData).length > 1) {
                this.ToggleElement("StatBranch", !!heroData.showTalents);
                this.ToggleElement("StatBranchOuter", !!heroData.showTalents);
                this.ToggleElement("AghsStatusContainer", !!heroData.showAghanims);
                this.ChangeLevelStatsFrame(!!heroData.showTalents);
                this.ChangeInnatePanel(!heroData.showFacets);
                this.ChangeStatBranchPanel(!heroData.showAttribute);
                if (isInvoker && !this.spellCardUpdated)
                    this.ChangeInvokerSpellCard("7.32");
            }
            else {
                this.ShowElement("StatBranch");
                this.ShowElement("StatBranchOuter");
                this.ShowElement("AghsStatusContainer");
                this.ChangeLevelStatsFrame(true);
                this.ChangeInnatePanel(false);
                this.ChangeStatBranchPanel(false);
            }
        }
        else {
            this.HideElement("StatBranch");
            this.HideElement("StatBranchOuter");
            this.HideElement("AghsStatusContainer");
            this.ChangeInnatePanel(true);
            this.ChangeLevelStatsFrame(false);
        }
        this.ChangeInvokerCardButton(isInvoker);
    }
    ToggleElement(elementName, show) {
        const element = FindDotaHudElement(elementName);
        if (element)
            element.style.visibility = show ? "visible" : "collapse";
    }
    HideStats() {
        var _a;
        const selectedEntity = Players.GetLocalPlayerPortraitUnit();
        const hero = (_a = this.heroes.find(hero => Entities.GetUnitName(selectedEntity) === hero.key)) === null || _a === void 0 ? void 0 : _a.value;
        this.ChangeHudState(hero);
    }
    HideElement(elementName, opacity = false) {
        const element = FindDotaHudElement(elementName);
        if (element === null)
            return;
        if (opacity)
            element.style.opacity = "0.0";
        else
            element.style.visibility = "collapse";
    }
    HidePanelElement(element, opacity = false) {
        if (element === null)
            return;
        if (opacity)
            element.style.opacity = "0.0";
        else
            element.style.visibility = "collapse";
    }
    ShowElement(elementName, opacity = false) {
        const element = FindDotaHudElement(elementName);
        if (element === null)
            return;
        if (opacity)
            element.style.opacity = "1.0";
        else
            element.style.visibility = "visible";
    }
    ShowPanelElement(element, opacity = false) {
        if (element === null)
            return;
        if (opacity)
            element.style.opacity = "1.0";
        else
            element.style.visibility = "visible";
    }
    GetInvokerSpellCardButton() {
        if (this.invokerSpellCardButton)
            return this.invokerSpellCardButton;
        const centerBlock = FindDotaHudElement("center_block");
        if (centerBlock) {
            const ability5 = centerBlock.FindChildTraverse("Ability5");
            if (ability5) {
                const spellCard = ability5.FindChildTraverse("InvokerSpellCardButton");
                if (spellCard)
                    return this.invokerSpellCardButton = spellCard;
            }
        }
        return undefined;
    }
    SetCustomMorph() {
        const statBranch = FindDotaHudElement("AbilitiesAndStatBranch");
        if (!statBranch)
            return;
        const localEntity = Players.GetLocalPlayerPortraitUnit();
        const ability = Entities.GetAbilityByName(localEntity, "morphling_morph_agi_custom_729");
        const hasAbility = ability !== -1 && !Abilities.IsHidden(ability);
        statBranch.SetHasClass("CustomHasMorph", hasAbility);
        const isMorph = statBranch.BHasClass("HasMorph") || statBranch.BHasClass("CustomHasMorph");
        const setToggleStyles = (panelID) => {
            const abilityPanel = statBranch.FindChildTraverse(panelID);
            if (!abilityPanel)
                return;
            const toggled = isMorph && abilityPanel.BHasClass("toggle_enabled");
            const button = abilityPanel.FindChildTraverse("AbilityButton");
            if (button) {
                button.style.preTransformScale2d = toggled ? "0.9" : "1.0";
                button.style.brightness = toggled ? "1.6" : "1.0";
                button.style.contrast = toggled ? "1.0" : "1.0";
                button.style.saturation = toggled ? "1.2" : "1.0";
            }
            const overlay = abilityPanel.FindChildTraverse("AbilityStatusOverlay");
            if (overlay) {
                overlay.style.border = toggled ? "0px solid transparent" : null;
            }
        };
        setToggleStyles("Ability3");
        setToggleStyles("Ability4");
    }
    Tick(delay = 0.03) {
        this.HideStats();
        this.SetCustomMorph();
        this.tickSchedule = $.Schedule(delay, () => this.Tick(delay));
    }
    StopTick() {
        if (this.tickSchedule)
            $.CancelScheduled(this.tickSchedule);
    }
}
const manifest = new Manifest();
