"use strict";
const BIND_ALT_BUTTON = "ALT";
const SECOND_ABILITIES = {
    high_five: {
        id: "HighFiveAbility",
        abilityName: "old_tinker_high_five",
        image: "s2r://panorama/images/spellicons/consumables/plus_high_five_png.vtex",
        bind: "CAPSLOCK"
    }
};
class SecondaryAbilities {
    constructor() {
        dotaHud.FindChildrenWithClassTraverse("SA_RemoveOnReload").forEach(i => i.DeleteAsync(0));
        this.context = $.GetContextPanel();
        this.buffContainer = FindDotaHudElement("BuffContainer");
        this.abilityContainer = this.CreateContainer();
        this.buttons = this.CreateButtons();
        this.SetBuffs();
        this.Tick();
    }
    CreateContainer() {
        const centerBlock = FindDotaHudElement("center_block");
        if (!centerBlock)
            throw 'Cannot find center_block in DotaHud';
        centerBlock.FindChildrenWithClassTraverse("__SecondaryAbilities_RemoveOnReload")
            .forEach(i => i.DeleteAsync(0));
        const panel = $.CreatePanel("Panel", this.context, "SecondAbilitiesContainer", {
            class: "HideSecondAbilities __SecondaryAbilities_RemoveOnReload"
        });
        panel.SetParent(centerBlock);
        return panel;
    }
    CreateButtons() {
        this.abilityContainer.FindChildrenWithClassTraverse("SecondAbilityContainer")
            .forEach(i => i.DeleteAsync(0));
        return Object.entries(SECOND_ABILITIES).reduce((obj, [name, values], i) => {
            if (!values)
                return obj;
            obj[name] = this.CreateButton(values, i);
            return obj;
        }, {});
    }
    CreateButton(values, index) {
        this.CreateCustomBind(index, values);
        const button = $.CreatePanel("Panel", this.context, values.id, {
            class: "SecondAbilityContainer"
        });
        button.BLoadLayoutSnippet("SecondAbilitySnippet");
        button.FindChildTraverse("SecondAbility").style.opacityMask = `url(${values.image})`;
        button.FindChildTraverse("SecondAbilityImage").SetImage(values.image);
        button.FindChildTraverse("KeybindLabel").text = values.bind;
        button.cooldownRoot = button.FindChildTraverse("CooldownContainer");
        button.background = button.FindChildTraverse("CooldownBackground_");
        button.label = button.FindChildTraverse("CooldownLabel");
        button.bindRoot = button.FindChildTraverse("KeybindContainer");
        button.abilityName = values.abilityName;
        button.SetPanelEvent("onactivate", () => this.PressAbility(values.abilityName));
        button.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowAbilityTooltipForEntityIndex", button, values.abilityName, Players.GetLocalPlayerPortraitUnit()));
        button.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideAbilityTooltip", button));
        button.SetParent(this.abilityContainer);
        return button;
    }
    CreateCustomBind(index, values) {
        const GameTime = Game.GetGameTime();
        Game.CreateCustomKeyBind(BIND_ALT_BUTTON + "+" + values.bind, values.id + GameTime);
        Game.AddCommand(values.id + GameTime, () => this.PressAbility(values.abilityName), "", 0);
    }
    SetBuffs() {
        const abilities = FindDotaHudElement("abilities");
        if (!abilities)
            return;
        const can_upgrade = abilities.FindChildrenWithClassTraverse("show_level_up_tab").length > 0;
        this.buffContainer.style.marginBottom = can_upgrade ? "15px" : "46px";
    }
    PressAbility(abilityName) {
        const selectedIndex = Players.GetLocalPlayerPortraitUnit();
        const heroIndex = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        const isLocalHero = heroIndex === selectedIndex || (Entities.IsTempestDouble(selectedIndex) && !Entities.IsEnemy(selectedIndex));
        if (!Game.IsInToolsMode() && !isLocalHero)
            return;
        const ability = Entities.GetAbilityByName(selectedIndex, abilityName);
        if (ability !== -1) {
            if (!Abilities.IsCooldownReady(ability)) {
                GameUI.SendCustomHUDError("#dota_hud_error_ability_in_cooldown", "General.CastFail_AbilityInCooldown");
                return;
            }
            // Abilities.ExecuteAbility(ability, selectedIndex, false);
            GameEvents.SendCustomGameEventToServer("activate_ability", {
                abilityName: abilityName,
                entindex: selectedIndex
            });
        }
    }
    Tick() {
        var _a, _b, _c, _d;
        if (Object.keys(this.buttons).length <= 0)
            return;
        const selectedIndex = Players.GetLocalPlayerPortraitUnit();
        const heroIndex = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        const hasButton = (_b = (_a = FindDotaHudElement("PatcherButton")) === null || _a === void 0 ? void 0 : _a.BHasClass("Visible")) !== null && _b !== void 0 ? _b : false;
        const isPatching = (_d = (_c = FindFirstChildWithClass(dotaHud, "ItemPatcher")) === null || _c === void 0 ? void 0 : _c.BHasClass("Visible")) !== null && _d !== void 0 ? _d : false;
        this.abilityContainer.SetHasClass("HasPatchButton", hasButton);
        this.abilityContainer.SetHasClass("Patching", isPatching);
        this.abilityContainer.SetHasClass("ShowSecondAbilities", Entities.IsHero(selectedIndex));
        Object.values(this.buttons).forEach(button => {
            if (!button)
                return;
            const ability = Entities.GetAbilityByName(selectedIndex, button.abilityName);
            if (ability !== -1 && !Abilities.IsCooldownReady(ability) && !Entities.IsEnemy(selectedIndex)) {
                const cooldown = Abilities.GetCooldownTimeRemaining(ability);
                const cooldown_max = Abilities.GetCooldownLength(ability);
                const progress = (cooldown / cooldown_max) * -360;
                button.cooldownRoot.visible = true;
                button.background.style.clip = `radial(50% 75%, 0deg, ${progress}deg)`;
                button.label.text = Math.ceil(cooldown).toString();
            }
            else
                button.cooldownRoot.visible = false;
            button.bindRoot.visible = selectedIndex === heroIndex
                || (Entities.IsTempestDouble(selectedIndex) && !Entities.IsEnemy(selectedIndex));
        });
        this.SetBuffs();
        $.Schedule(0.03, () => this.Tick());
    }
}
const second_ability = new SecondaryAbilities();
