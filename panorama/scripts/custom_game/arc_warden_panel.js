"use strict";
class ArcWardenPanel {
    constructor() {
        const context = $.GetContextPanel();
        this.unitsPanel = context.FindChildTraverse("UnitsDisplay");
        this.originalPanel = this.unitsPanel.FindChildTraverse("UnitRow0");
        this.tempestPanel = this.unitsPanel.FindChildTraverse("UnitRow1");
        GameEvents.Subscribe("update_tempest_double", (event) => this.UpdateTempestDouble(event.entindex));
        GameEvents.Subscribe("entity_hurt", (event) => this.EntityHurt(event));
        this.SetParent();
        this.Tick();
    }
    SetParent() {
        const heroDisplay = FindDotaHudElement("HeroDisplay");
        if (!heroDisplay)
            return;
        heroDisplay.SetHasClass("Hidden", false);
        this.unitsPanel.SetParent(heroDisplay);
    }
    UpdateTempestDouble(entindex) {
        this.tempest_id = entindex;
        this.unitsPanel.SetHasClass("Visible", entindex !== undefined);
        if (entindex === undefined)
            return;
        const unitName = Entities.GetUnitName(entindex);
        this.unitsPanel.FindChildrenWithClassTraverse("UnitImage").forEach(image => {
            image.heroname = unitName;
        });
    }
    EntityHurt(event) {
        if (this.tempest_id === undefined)
            return;
        if (event.damage <= 0)
            return;
        const entindex = event.entindex_killed;
        const localEntity = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        const isAlive = Entities.IsAlive(entindex);
        if (localEntity === entindex) {
            if (this.originalAttacked)
                $.CancelScheduled(this.originalAttacked);
            this.originalPanel.SetHasClass("RecentlyAttacked", isAlive);
            if (isAlive)
                this.originalAttacked = $.Schedule(1.6, () => this.originalPanel.SetHasClass("RecentlyAttacked", false));
        }
        else if (this.tempest_id === entindex) {
            if (this.tempestAttacked)
                $.CancelScheduled(this.tempestAttacked);
            this.tempestPanel.SetHasClass("RecentlyAttacked", isAlive);
            if (isAlive)
                this.tempestAttacked = $.Schedule(1.6, () => this.tempestPanel.SetHasClass("RecentlyAttacked", false));
        }
    }
    SelectWarden(type) {
        const localEntity = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        if (type === "original") {
            GameUI.SelectUnit(localEntity, false);
        }
        else if (type === "tempest") {
            if (this.tempest_id)
                GameUI.SelectUnit(this.tempest_id, false);
        }
        else {
            throw "WTF";
        }
    }
    UpdateProgressBar(entindex) {
        const localEntity = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        const panel = this.tempest_id === entindex
            ? this.tempestPanel
            : entindex === localEntity
                ? this.originalPanel
                : undefined;
        if (!panel)
            return;
        const healthBar = panel.FindChildTraverse("HealthProgress");
        const manaBar = panel.FindChildTraverse("ManaProgress");
        const health_pct = Entities.GetHealthPercent(entindex) / 100;
        const mana_pct = Entities.GetMana(entindex) / Entities.GetMaxMana(entindex);
        healthBar.value = health_pct;
        manaBar.value = mana_pct;
    }
    Tick() {
        const localId = Players.GetLocalPlayer();
        const localEntity = Players.GetPlayerHeroEntityIndex(localId);
        const selectedEntities = Players.GetSelectedEntities(localId);
        const isOriginalSelected = selectedEntities.includes(localEntity);
        const isTempestSelected = this.tempest_id !== undefined && selectedEntities.includes(this.tempest_id);
        this.originalPanel.SetHasClass("MainSelected", isOriginalSelected);
        this.tempestPanel.SetHasClass("MainSelected", isTempestSelected);
        this.UpdateProgressBar(localEntity);
        if (this.tempest_id !== undefined)
            this.UpdateProgressBar(this.tempest_id);
        $.Schedule(0.1, () => this.Tick());
    }
}
const arcWardenPanel = new ArcWardenPanel();
const SelectWarden = (type) => arcWardenPanel.SelectWarden(type);
