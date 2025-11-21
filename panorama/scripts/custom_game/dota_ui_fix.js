"use strict";
const MINIMAP_HITBOXES = {
    "dota_728": {
        BottomRadiant: {
            x: "29%",
            y: "82%",
            width: "65%",
            height: "16%"
        },
        TopRadiant: {
            x: "3%",
            y: "19%",
            width: "10%",
            height: "47%"
        },
        JungleRadiant: {
            x: "36%",
            y: "70%",
            width: "49%",
            height: "12%"
        },
        MidRadiant: {
            x: "25%",
            y: "52%",
            width: "21%",
            height: "21%"
        },
        BottomDire: {
            x: "85%",
            y: "35%",
            width: "10%",
            height: "47%"
        },
        TopDire: {
            x: "6%",
            y: "0%",
            width: "63%",
            height: "17%"
        },
        JungleDire: {
            x: "16%",
            y: "19%",
            width: "53%",
            height: "13%"
        },
        MidDire: {
            x: "47%",
            y: "31%",
            width: "21%",
            height: "21%"
        }
    }
};
const MINIMAP_GLOW = {
    "BottomRadiantGlow": "botradiant",
    "TopRadiantGlow": "topradiant",
    "JungleRadiantGlow": "jungleradiant",
    "MidRadiantGlow": "midradiant",
    "BottomDireGlow": "botdire",
    "TopDireGlow": "topdire",
    "JungleDireGlow": "jungledire",
    "MidDireGlow": "middire"
};
class DotaUIFix {
    constructor() {
        this.currentMap = Game.GetMapInfo().map_display_name;
        this.FixTalentPips();
        this.RemoveRoshanTimer();
        this.RemovePlusTimers();
        this.FixStrategyMinimap();
        this.FixShopItems();
        this.AdjustCenterBlock();
        // this.FixNeutralItems();
        if (this.currentMap !== "dota") {
            // const refreshSlot = () => $.Schedule(0.1, () => {
            //     this.RefreshNeutralSlot();
            //     // this.RefreshBackpackSlots();
            // });
            // GameEvents.Subscribe("dota_inventory_changed", refreshSlot);
            // GameEvents.Subscribe("dota_player_update_selected_unit", refreshSlot);
            // GameEvents.Subscribe("dota_player_update_query_unit", refreshSlot);
        }
    }
    FixTalentPips() {
        if (this.currentMap === "dota")
            return;
        const pips = FindDotaHudElement("AttributePipsContainer");
        if (pips)
            pips.visible = false;
        const scoreboard = FindDotaHudElement("scoreboard");
        if (scoreboard) {
            const removeContainerPips = (containerID) => {
                const container = scoreboard.FindChildTraverse(containerID);
                if (!container)
                    return;
                container.Children().forEach(child => {
                    const pips = child.FindChildTraverse("AttributePipsContainer");
                    if (pips)
                        pips.visible = false;
                });
            };
            removeContainerPips("RadiantTeamContainer");
            removeContainerPips("DireTeamContainer");
        }
    }
    RemovePlusTimers() {
        if (this.currentMap === "dota")
            return;
        const timers = FindDotaHudElement("TimersContainer");
        if (timers)
            timers.visible = false;
        const timeUntil = FindDotaHudElement("TimeUntil");
        if (timeUntil)
            timeUntil.style.marginTop = "70px";
    }
    RemoveRoshanTimer() {
        const roshanTimer = FindDotaHudElement("RoshanTimer");
        if (roshanTimer)
            roshanTimer.visible = this.currentMap === "dota";
    }
    FixStrategyMinimap() {
        if (this.currentMap === "dota")
            return;
        const modifyMap = (mapId) => {
            const minimap = FindDotaHudElement(mapId);
            if (!minimap)
                return;
            minimap.style.backgroundImage = `url("file://{resources}/images/minimap/${this.currentMap}.png")`;
            const direBuilding = minimap.FindChildTraverse("DireBuildings");
            if (direBuilding)
                direBuilding.style.backgroundImage = `url("file://{resources}/images/minimap/${this.currentMap}_dire_buildings.png")`;
            const radiantBuilding = minimap.FindChildTraverse("RadiantBuildings");
            if (radiantBuilding)
                radiantBuilding.style.backgroundImage = `url("file://{resources}/images/minimap/${this.currentMap}_radiant_buildings.png")`;
            const hitboxes = MINIMAP_HITBOXES[this.currentMap];
            if (hitboxes) {
                Object.entries(hitboxes).forEach(([key, value]) => {
                    if (!value)
                        return;
                    const hitbox = minimap.FindChildTraverse(key);
                    if (!hitbox)
                        return;
                    const { x, y, width, height } = value;
                    hitbox.style.x = x;
                    hitbox.style.y = y;
                    hitbox.style.width = width;
                    hitbox.style.height = height;
                });
            }
            Object.entries(MINIMAP_GLOW).forEach(([key, value]) => {
                if (!value)
                    return;
                const glow = minimap.FindChildTraverse(key);
                if (glow)
                    glow.style.backgroundImage = `url("file://{resources}/images/minimap/${this.currentMap}_glow_${value}.png")`;
            });
        };
        modifyMap("HeroPickMinimap");
        modifyMap("StrategyMinimap");
    }
    FixShopItems() {
        const shop = FindDotaHudElement("shop");
        if (!shop)
            return;
        const basicItems = shop.FindChildTraverse("GridBasicItemsCategory");
        if (basicItems)
            basicItems.style.overflow = "scroll";
        const upgradeItems = shop.FindChildTraverse("GridUpgradesCategory");
        if (upgradeItems)
            upgradeItems.style.overflow = "scroll";
        const neutralItems = shop.FindChildTraverse("GridNeutralsCategory");
        if (neutralItems)
            neutralItems.style.overflow = "scroll";
        const text = FindFirstChildWithClass(shop, "ItemContextMenuInstructionsContainer");
        if (text)
            text.style.visibility = "collapse";
    }
    AdjustCenterBlock() {
        const centerBlock = FindDotaHudElement("center_block");
        if (centerBlock)
            centerBlock.style.height = "536px";
    }
    FixNeutralItems() {
        if (this.currentMap === "dota")
            return;
        const container = FindDotaHudElement("inventory_composition_layer_container");
        if (!container)
            return;
        container.SetHasClass("OldMap", true);
        const tokenChangedFX = FindFirstChildWithClass(container, "NeutralTokenChangedFX");
        if (tokenChangedFX)
            tokenChangedFX.style.visibility = "collapse";
        const neutralSlot = container.FindChildTraverse("inventory_neutral_slot_container");
        if (neutralSlot) {
            neutralSlot.style.animationDuration = "0.0s";
            const buttonSize = neutralSlot.FindChildTraverse("ButtonSize");
            if (buttonSize) {
                buttonSize.style.width = "60px";
                buttonSize.style.height = "45px";
                buttonSize.style.margin = "2px 3px";
            }
            const tokenChangedOverlayFX = FindFirstChildWithClass(neutralSlot, "NeutralTokenChangedOverlayFX");
            if (tokenChangedOverlayFX)
                tokenChangedOverlayFX.style.visibility = "collapse";
        }
        const holder = container.FindChildTraverse("inventory_neutral_craft_holder");
        if (holder)
            holder.style.visibility = "collapse";
    }
    RefreshNeutralSlot() {
        if (this.currentMap === "dota")
            return;
        const localEntity = Players.GetLocalPlayerPortraitUnit();
        const container = FindDotaHudElement("inventory_composition_layer_container");
        if (!container)
            return;
        const neutralSlot = container.FindChildTraverse("inventory_neutral_slot_container");
        if (!neutralSlot)
            return;
        const abilityButton = neutralSlot.FindChildTraverse("AbilityButton");
        if (!abilityButton)
            return;
        const itemImage = abilityButton.FindChildTraverse("ItemImage");
        if (!itemImage)
            return;
        if (itemImage.itemname) {
            abilityButton.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowAbilityTooltipForEntityIndex", abilityButton, itemImage.itemname, localEntity));
            abilityButton.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideAbilityTooltip", abilityButton));
        }
        else {
            abilityButton.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowTitleTextTooltip", abilityButton, "#DOTA_NeutralItemSlot_Title", "#DOTA_NeutralItemSlot_Description"));
            abilityButton.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideTitleTextTooltip", abilityButton));
        }
    }
    RefreshBackpackSlots() {
        if (this.currentMap === "dota")
            return;
        const localEntity = Players.GetLocalPlayerPortraitUnit();
        const container = FindDotaHudElement("inventory_backpack_list");
        if (!container)
            return;
        const modifySlot = (slotId) => {
            const slot = container.FindChildTraverse(slotId);
            if (!slot)
                return;
            const abilityButton = slot.FindChildTraverse("AbilityButton");
            if (!abilityButton)
                return;
            const itemImage = abilityButton.FindChildTraverse("ItemImage");
            if (!itemImage)
                return;
            if (itemImage.itemname) {
                abilityButton.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowAbilityTooltipForEntityIndex", abilityButton, itemImage.itemname, localEntity));
                abilityButton.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideAbilityTooltip", abilityButton));
            }
            else {
                abilityButton.SetPanelEvent("onmouseover", () => $.DispatchEvent("DOTAShowTitleTextTooltip", abilityButton, "#DOTA_HUD_BackpackHintTitle", "#DOTA_HUD_BackpackHint"));
                abilityButton.SetPanelEvent("onmouseout", () => $.DispatchEvent("DOTAHideTitleTextTooltip", abilityButton));
            }
        };
        modifySlot("inventory_slot_6");
        modifySlot("inventory_slot_7");
        modifySlot("inventory_slot_8");
    }
}
const dota_ui_fix = new DotaUIFix();
