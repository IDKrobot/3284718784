"use strict";
class HeroBans {
    constructor() {
        this.heroes = CustomNetTables.GetAllTableValues("patches").map(heroes => heroes.key);
        this.pickScreen = FindDotaHudElement("PreGame");
        this.Tick();
    }
    Tick() {
        if (!this.pickScreen || Game.GameStateIsAfter(DOTA_GameState.DOTA_GAMERULES_STATE_HERO_SELECTION))
            return;
        const heroNamePanel = this.pickScreen.FindChildTraverse("HeroInspectHeroName");
        const banButton = this.pickScreen.FindChildTraverse("BanButton");
        const heroName = heroNamePanel ? heroNamePanel.text : "";
        const hasPatch = !this.heroes.some(hero => this.hasPatch(heroName, hero));
        if (banButton) {
            banButton.style.brightness = hasPatch ? null : "0.75";
            banButton.style.saturation = hasPatch ? null : "1.5";
            banButton.style.opacity = hasPatch ? null : "0.0";
            banButton.enabled = hasPatch;
            banButton.hittest = hasPatch;
            banButton.hittestchildren = hasPatch;
            banButton.SetAcceptsFocus(hasPatch);
        }
        $.Schedule(0.03, () => this.Tick());
    }
    hasPatch(selected_hero, hero) {
        if (!hero)
            return false;
        return $.Localize(hero).toLowerCase() === selected_hero.toLowerCase();
    }
}
const heroBans = new HeroBans();
