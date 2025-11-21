"use strict";
class ChangedHeroVisualizer {
    constructor() {
        this.heroes = CustomNetTables.GetAllTableValues("patches").map(heroes => heroes.key);
        this.Tick();
    }
    GetHeroesPanels() {
        const table_panels = new Array();
        const gridCategories = FindDotaHudElement("GridCategories");
        if (gridCategories === null)
            return table_panels;
        gridCategories.Children().forEach(grid => {
            const heroList = grid.FindChildTraverse("HeroList");
            if (heroList === null)
                return;
            heroList.Children().forEach(hero => {
                const imagePanel = hero.FindChildTraverse("HeroImage");
                if (!imagePanel)
                    return;
                if (this.heroes.includes("npc_dota_hero_" + imagePanel.heroname)) {
                    table_panels.push(hero);
                }
            });
        });
        return table_panels;
    }
    UpdatePanel(panel) {
        if (!panel)
            return;
        const image = panel.FindChildTraverse("HeroImage");
        if (image) {
            image.style.border = "1px solid #98FB98";
            image.style.boxShadow = "0px 0px 5px #32CD32";
        }
    }
    Tick() {
        if (this.heroes.length === 0)
            return;
        const panels = this.GetHeroesPanels();
        panels.forEach(panel => this.UpdatePanel(panel));
        $.Schedule(0.03, () => this.Tick());
    }
}
const changedHeroVisualizer = new ChangedHeroVisualizer();
