"use strict";
class ItemPatchSelection {
    constructor() {
        this.patchButtons = [];
        this.currentSlot = -1;
        this.hurtCooldown = Game.IsInToolsMode() ? 0 : 10;
        this.context = $.GetContextPanel();
        this.bestiary = this.context.FindChildTraverse("ItemBestiary");
        this.backgroundBlur = this.context.FindChildTraverse("BlurBackground");
        this.patchItems = Object.values(CustomNetTables.GetTableValue("item_patches", "items"));
        dotaHud.FindChildrenWithClassTraverse("__ItemPatcher_RemoveOnReload")
            .forEach(i => i.DeleteAsync(0));
        this.button = this.SetupPatcherButton();
        this.patcher = this.SetupPatcher();
        [this.patches, this.patchContainer] = this.SetupPatchContainer();
        this.patchHint = this.SetupPatcherHint();
        this.unitSlots = this.GetUnitSlots();
        this.CreateBestiaryButton();
        this.SetupBestiary();
        GameEvents.Subscribe("dota_inventory_changed", () => {
            if (this.patcher.BHasClass("Visible"))
                this.RefreshItems();
        });
        GameEvents.Subscribe("entity_hurt", (event) => {
            const localEntity = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
            if (event.entindex_killed !== localEntity)
                return;
            if (event.entindex_attacker === localEntity)
                return;
            if (!(Entities.IsHero(event.entindex_attacker) || Entities.GetClassNameAsCStr(event.entindex_attacker) === "ent_dota_fountain"))
                return;
            this.HurtCooldown();
        });
        $.RegisterEventHandler("InputFocusLost", this.bestiary, () => this.CloseBestiary());
        this.button.SetHasClass("Visible", true);
        GameEvents.Subscribe("dota_player_update_selected_unit", () => this.SetButtonVisibility());
        GameEvents.Subscribe("dota_player_update_query_unit", () => this.SetButtonVisibility());
        GameEvents.Subscribe("dota_hud_player_learned_ability", () => this.SetButtonVisibility());
        GameEvents.Subscribe("dota_hud_refresh_unit", () => this.SetButtonVisibility());
        GameEvents.Subscribe("dota_player_gained_level", (event) => {
            if (event.hero_entindex === Players.GetLocalPlayerPortraitUnit())
                this.SetButtonVisibility();
        });
    }
    CreateBestiaryButton() {
        const buttonBar = FindDotaHudElement("ButtonBar");
        if (!buttonBar)
            return;
        const button = $.CreatePanel("Button", this.context, "BestiaryButton", {
            class: "__ItemPatcher_RemoveOnReload"
        });
        button.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowTextTooltip", button, "#Bestiary_Button"));
        button.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideTextTooltip", button));
        button.SetPanelEvent("onactivate", () => this.ToggleBestiary());
        button.SetParent(buttonBar);
    }
    SetupBestiary() {
        const items = this.patchItems.map(item => item.patches.default);
        const container = this.bestiary.FindChildTraverse("ItemBestiaryContainer");
        container.RemoveAndDeleteChildren();
        items.forEach(item => {
            const itemPanel = $.CreatePanel("DOTAItemImage", container, "", {
                class: "BestiaryItem"
            });
            itemPanel.itemname = item;
            itemPanel.SetPanelEvent("onactivate", () => this.ShowBestiaryPatch(item));
        });
        const hint = this.bestiary.FindChildTraverse("BestiaryHint");
        hint.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowTextTooltip", hint, "#Bestiary_Hint"));
        hint.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideTextTooltip", hint));
    }
    ShowBestiaryPatch(item) {
        var _a;
        const patches = (_a = this.patchItems.find(patch => Object.values(patch.items).includes(item))) === null || _a === void 0 ? void 0 : _a.patches;
        if (!patches)
            return;
        if (this.currentBestiaryItem === item)
            return;
        this.currentBestiaryItem = item;
        this.bestiary.SetHasClass("ShowPatches", true);
        Game.EmitSound("ui_generic_button_click");
        const patchContainer = this.bestiary.FindChildTraverse("ItemBestiaryPatchContainer");
        patchContainer.Children().forEach(child => {
            child.RemoveClass("Visible");
            child.DeleteAsync(0.14);
        });
        const delay = patchContainer.GetChildCount() > 0 ? 0.14 : 0;
        $.Schedule(delay, () => {
            Object.entries(patches).sort().forEach(([patch, replacement]) => {
                if (!patch || patch === "default")
                    return;
                const patchPanel = $.CreatePanel("Panel", patchContainer, "");
                patchPanel.BLoadLayoutSnippet("BestiaryPatchSnippet");
                patchPanel.FindChildTraverse("BestiaryPatchLabel").text = patch;
                patchPanel.FindChildTraverse("BestiaryPatchItem").itemname = replacement;
                patchPanel.AddClass("Visible");
            });
        });
    }
    ToggleBestiary() {
        const opened = !this.bestiary.BHasClass("Opened");
        this.context.hittest = opened;
        if (opened) {
            this.bestiary.SetFocus();
            this.bestiary.SetHasClass("ShowPatches", false);
        }
        this.bestiary.SetHasClass("Opened", opened);
        this.backgroundBlur.SetHasClass("Opened", this.bestiary.BHasClass("Opened"));
        const patchContainer = this.bestiary.FindChildTraverse("ItemBestiaryPatchContainer");
        if (!opened)
            patchContainer.Children().forEach(child => child.DeleteAsync(0.21));
        else
            patchContainer.RemoveAndDeleteChildren();
        this.currentBestiaryItem = undefined;
    }
    CloseBestiary() {
        if (!this.bestiary.BHasClass("Opened"))
            return;
        this.ToggleBestiary();
        Game.EmitSound("ui_settings_out_multi");
        $.Schedule(0.1, () => $.DispatchEvent("DropInputFocus"));
    }
    GetUnitSlots() {
        const container = FindDotaHudElement("inventory");
        if (!container)
            return [];
        const unit_slots = [];
        for (let i = 0; i < 6; i++) {
            const slot = container.FindChildTraverse("inventory_slot_" + i);
            if (slot)
                unit_slots.push(slot);
        }
        return unit_slots;
    }
    SetupPatcherButton() {
        const centerBlock = FindDotaHudElement("center_block");
        if (!centerBlock)
            throw `Cannot find center_block in DotaHud`;
        const button = $.CreatePanel("Button", this.context, "PatcherButton", {
            class: "__ItemPatcher_RemoveOnReload"
        });
        $.CreatePanel("Label", button, "", {
            text: "#Item_Patcher_Button",
            hittest: false
        });
        button.SetPanelEvent("onactivate", () => this.TogglePatcher());
        button.SetParent(centerBlock);
        return button;
    }
    SetupPatcher() {
        const centerBlock = FindDotaHudElement("center_block");
        if (!centerBlock)
            throw `Cannot find center_block in DotaHud`;
        const oldPatcher = centerBlock.FindChildrenWithClassTraverse("ItemPatcher");
        if (oldPatcher)
            oldPatcher.forEach(i => i.DeleteAsync(0));
        const patcher = $.CreatePanel("Panel", this.context, "");
        patcher.BLoadLayoutSnippet("PatcherSnippet");
        patcher.SetParent(centerBlock);
        return patcher;
    }
    SetupPatcherHint() {
        const centerBlock = FindDotaHudElement("center_block");
        if (!centerBlock)
            throw `Cannot find center_block in DotaHud`;
        const hint = $.CreatePanel("Panel", this.context, "PatcherHint", {
            class: "__ItemPatcher_RemoveOnReload"
        });
        $.CreatePanel("Label", hint, "", {
            text: "#Item_Patcher_Hint"
        });
        hint.SetParent(centerBlock);
        return hint;
    }
    SetupPatchContainer() {
        const centerBlock = FindDotaHudElement("center_block");
        if (!centerBlock)
            throw `Cannot find center_block in DotaHud`;
        const patches = $.CreatePanel("Panel", this.context, "PatcherPatches", {
            class: "__ItemPatcher_RemoveOnReload"
        });
        const container = $.CreatePanel("Panel", patches, "PatcherPatchContainer");
        patches.SetParent(centerBlock);
        return [patches, container];
    }
    TogglePatcher() {
        if (this.button.BHasClass("HurtCooldown")) {
            GameUI.SendCustomHUDError("#item_patcher_error_hurt_cooldown", "General.CommandRestricted");
            return;
        }
        const visible = this.patcher.BHasClass("Visible");
        this.button.SetHasClass("Selected", !visible);
        this.patcher.SetHasClass("Visible", !visible);
        this.patchHint.SetHasClass("Visible", !visible);
        this.patches.SetHasClass("Visible", false);
        this.RefreshItems();
    }
    RefreshItems() {
        const items = this.patchItems.flatMap(patch => Object.values(patch.items));
        this.unitSlots = this.GetUnitSlots();
        const isVisible = this.patcher.BHasClass("Visible");
        if (!isVisible) {
            for (let i = 0; i < 6; i++) {
                const panel = this.unitSlots[i];
                if (!panel)
                    continue;
                panel.style.saturation = "1";
                panel.style.brightness = "1";
                panel.style.boxShadow = "0px 0px 0px 0px rgba(0, 0, 0, 0)";
            }
            return;
        }
        const entity = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        const modifySlot = (slot, selected = false) => {
            var _a;
            const panel = this.unitSlots[slot];
            if (!panel)
                return;
            const item = Entities.GetItemInSlot(entity, slot);
            if (item === -1)
                selected = false;
            const hasPatch = items.includes(Abilities.GetAbilityName(item));
            (_a = this.patcher.FindChildTraverse("item_" + slot)) === null || _a === void 0 ? void 0 : _a.SetHasClass("HasItem", hasPatch);
            panel.style.saturation = hasPatch ? "1.1" : "0";
            panel.style.brightness = hasPatch ? "1.2" : "0.7";
            panel.style.boxShadow = selected
                ? "0px 0px 2px 0.1px rgba(13, 255, 9, 0.85)"
                : hasPatch
                    ? "0px 0px 2px 0.1px rgba(255, 240, 15, 0.3)"
                    : "0px 0px 0px 0px rgba(0, 0, 0, 0)";
        };
        const hasItem = Entities.GetItemInSlot(entity, this.currentSlot) !== -1;
        if (this.patches.BHasClass("Visible") && hasItem) {
            modifySlot(this.currentSlot, true);
        }
        else {
            for (let i = 0; i < 6; i++)
                modifySlot(i);
        }
    }
    SelectSlot(slot) {
        var _a;
        const entity = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        this.unitSlots = this.GetUnitSlots();
        const item = Entities.GetItemInSlot(entity, slot);
        if (item === -1)
            return;
        const itemName = Abilities.GetAbilityName(item);
        const items = this.patchItems.flatMap(patch => Object.values(patch.items));
        if (!items.includes(itemName))
            return;
        const patches = (_a = this.patchItems.find(patch => Object.values(patch.items).includes(itemName))) === null || _a === void 0 ? void 0 : _a.patches;
        if (!patches)
            return;
        const itemPanel = this.unitSlots[slot];
        if (!itemPanel)
            return;
        for (let i = 0; i < 6; i++) {
            const panel = this.unitSlots[i];
            if (!panel || i === slot)
                continue;
            const item = Entities.GetItemInSlot(entity, i);
            const hasPatch = items.includes(Abilities.GetAbilityName(item));
            panel.style.saturation = hasPatch ? "1.0" : "0";
            panel.style.brightness = hasPatch ? "0.9" : "0.7";
            panel.style.boxShadow = hasPatch
                ? "0px 0px 0px 0px rgba(255, 240, 15, 0.15)"
                : "0px 0px 0px 0px rgb(0, 0, 0, 0)";
        }
        itemPanel.style.saturation = "1.1";
        itemPanel.style.brightness = "1.2";
        itemPanel.style.boxShadow = "0px 0px 2px 0.1px rgba(13, 255, 9, 0.85)";
        this.patchHint.SetHasClass("Visible", false);
        this.patches.SetHasClass("Visible", true);
        this.CreatePatchButton(itemName, patches);
        this.currentSlot = slot;
    }
    CreatePatchButton(itemName, patches) {
        var _a;
        this.patchContainer.RemoveAndDeleteChildren();
        if (!patches) {
            patches = (_a = this.patchItems.find(patch => Object.values(patch.items).includes(itemName))) === null || _a === void 0 ? void 0 : _a.patches;
            if (!patches)
                return [];
        }
        return Object.entries(patches).sort().map(([patch, replacement]) => {
            if (!patch)
                return;
            const patchButton = $.CreatePanel("Panel", this.context, "", {
                class: "ItemPatchButton"
            });
            $.CreatePanel("Label", patchButton, "", {
                text: patch === "default" ? "#DOTA_Current_Patch" : patch
            });
            patchButton.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowAbilityTooltip", patchButton, replacement));
            patchButton.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideAbilityTooltip", patchButton));
            patchButton.SetPanelEvent("onactivate", () => this.SelectItemPatch(itemName, replacement, patch));
            patchButton.SetHasClass("Selected", replacement === itemName);
            patchButton.SetAttributeString("replacement", replacement);
            patchButton.SetAttributeString("patch", patch);
            patchButton.SetParent(this.patchContainer);
            return patchButton;
        }).filter(button => button !== undefined);
    }
    SelectItemPatch(itemName, replacement, patch) {
        if (!itemName || !patch)
            return;
        GameEvents.SendCustomGameEventToServer("select_item_patch", {
            item: itemName,
            patch: patch,
            slot: this.currentSlot
        });
        this.patchButtons.length = 0;
        this.patchButtons = this.CreatePatchButton(replacement);
    }
    SetButtonVisibility() {
        const entity = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        if (entity === Players.GetLocalPlayerPortraitUnit()) {
            if (!this.button.BHasClass("Visible"))
                this.button.SetHasClass("Visible", true);
        }
        else if (this.button.BHasClass("Visible")) {
            this.button.SetHasClass("Visible", false);
            if (this.patcher.BHasClass("Visible"))
                this.TogglePatcher();
        }
    }
    HurtCooldown() {
        if (this.hurtCooldown <= 0)
            return;
        if (this.hurtSchedule)
            $.CancelScheduled(this.hurtSchedule);
        this.button.SetHasClass("Visible", false);
        if (this.patcher.BHasClass("Visible"))
            this.TogglePatcher();
        this.button.SetHasClass("Animation", Math.round(Game.GetDOTATime(false, false) / 60) > 7);
        this.button.SetHasClass("HurtCooldown", true);
        this.hurtSchedule = $.Schedule(this.hurtCooldown, () => this.button.SetHasClass("HurtCooldown", false));
    }
}
const itemPatchSelection = new ItemPatchSelection();
// Exposed functions
const SelectSlot = (slot) => itemPatchSelection.SelectSlot(slot);
const ToggleBestiary = () => itemPatchSelection.ToggleBestiary();
const CloseBestiary = () => itemPatchSelection.CloseBestiary();
