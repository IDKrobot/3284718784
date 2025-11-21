"use strict";
class OldNeutralItems {
    constructor() {
        this.context = $.GetContextPanel();
        this.neutral_items = CustomNetTables.GetAllTableValues("neutral_items");
        if (Game.GetMapInfo().map_display_name === "dota")
            return;
        this.HideDOTANeutralGrid();
        this.AddCustomGrid();
        CustomNetTables.SubscribeNetTableListener("neutral_items", (_, tier, value) => this.NeutralItemUpdate(tier, value));
    }
    HideDOTANeutralGrid() {
        const grid = FindDotaHudElement("GridNeutralsCategory");
        if (!grid)
            return;
        grid.Children().forEach(child => {
            child.style.visibility = "collapse";
        });
    }
    AddCustomGrid() {
        this.AddCustomTeamNeutrals();
        this.AddCustomAllNeutrals();
    }
    AddCustomAllNeutrals() {
        var _a;
        const grid = FindDotaHudElement("GridNeutralsCategory");
        if (!grid)
            return;
        grid.FindChildrenWithClassTraverse("CustomAllNeutralItems").forEach(i => i.DeleteAsync(0));
        const allNeutrals = $.CreatePanel("Panel", this.context, "");
        allNeutrals.BLoadLayoutSnippet("AllNeutralItemsSnippet");
        this.allNeutral = allNeutrals;
        const list = allNeutrals.FindChildTraverse("CustomGridNeutralItems");
        for (let i = 1; i <= 5; i++) {
            const panel = $.CreatePanel("Panel", list, "");
            panel.BLoadLayoutSnippet("NeutralItemsTierSnippet");
            panel.SetDialogVariableInt("tier_number", i);
            panel.SetDialogVariableInt("tier_max_count", 4);
            panel.SetAttributeInt("tier_number", i);
            panel.AddClass("NeutralTier" + i);
            const panelList = panel.FindChildTraverse("NeutralItemsList");
            const values = (_a = this.neutral_items.find(data => data.key === i.toString())) === null || _a === void 0 ? void 0 : _a.value;
            if (!values)
                continue;
            panel.SetDialogVariable("tier_times", formatDropTime(values.all_items.drop_time) + "+");
            panel.SetDialogVariableInt("tier_found_count", Object.keys(values.dropped).length);
            if (values.available === 1)
                panel.SetHasClass("TierActive", true);
            Object.values(values.all_items.items).forEach(({ itemName }) => {
                const item = $.CreatePanel("DOTAItemImage", this.context, "NeutralShopItem");
                item.AddClass("MainShopItem");
                item.itemname = itemName;
                item.SetPanelEvent("onactivate", () => {
                    if (!GameUI.IsAltDown())
                        return;
                    GameEvents.SendCustomGameEventToServer("debug_give_item", {
                        item: itemName
                    });
                });
                item.SetParent(panelList);
            });
        }
        const button = allNeutrals.FindChildTraverse("NeutralItemsToggleButton");
        button.SetPanelEvent("onactivate", () => $.DispatchEvent("RemoveStyle", grid, "ShowAllNeutralItems"));
        allNeutrals.SetParent(grid);
    }
    AddCustomTeamNeutrals() {
        var _a;
        const grid = FindDotaHudElement("GridNeutralsCategory");
        if (!grid)
            return;
        grid.FindChildrenWithClassTraverse("CustomTeamNeutralItems").forEach(i => i.DeleteAsync(0));
        const teamNeutrals = $.CreatePanel("Panel", this.context, "");
        teamNeutrals.BLoadLayoutSnippet("TeamNeutralItemsSnippet");
        this.teamNeutral = teamNeutrals;
        const button = teamNeutrals.FindChildTraverse("NeutralItemsToggleButton");
        button.SetPanelEvent("onactivate", () => $.DispatchEvent("AddStyle", grid, "ShowAllNeutralItems"));
        const list = teamNeutrals.FindChildTraverse("TeamNeutralItemsTierList");
        for (let i = 1; i <= 5; i++) {
            const panel = $.CreatePanel("Panel", list, "");
            panel.BLoadLayoutSnippet("TeamNeutralItemsTierSnippet");
            panel.SetDialogVariableInt("tier_number", i);
            panel.SetDialogVariableInt("tier_max_count", 4);
            panel.SetAttributeInt("tier_number", i);
            panel.AddClass("NeutralTier" + i);
            const panelList = panel.FindChildTraverse("TierItemsList");
            const values = (_a = this.neutral_items.find(data => data.key === i.toString())) === null || _a === void 0 ? void 0 : _a.value;
            if (!values)
                continue;
            panel.SetDialogVariable("tier_times", formatDropTime(values.all_items.drop_time) + "+");
            panel.SetDialogVariableInt("tier_found_count", Object.keys(values.dropped).length);
            if (values.available === 1)
                panel.SetHasClass("TierActive", true);
            for (let j = 0; j < 4; j++) {
                const item = $.CreatePanel("Panel", panelList, "");
                item.BLoadLayoutSnippet("TeamNeutralItemSnippet");
                item.style.visibility = "visible";
                let status = "DOTA_TeamNeutralItemState_NotYours";
                const drop = values.dropped[j];
                if (drop) {
                    const image = item.FindChildTraverse("ShopItem");
                    image.itemname = drop.itemName;
                    if (drop.owner === undefined) {
                        status = "DOTA_TeamNeutralItemState_Unknown";
                    }
                    else {
                        status = "DOTA_TeamNeutralItemState_Equipped";
                    }
                }
                item.SetDialogVariable("status", $.Localize(status));
            }
        }
        teamNeutrals.SetParent(grid);
    }
    /* Events */
    NeutralItemUpdate(tier, value) {
        if (this.teamNeutral) {
            const panel = this.teamNeutral.FindChildrenWithClassTraverse("TeamNeutralItemsTier").find(itemsTier => {
                const tier_number = itemsTier.GetAttributeInt("tier_number", -1).toString();
                return tier_number === tier;
            });
            if (panel !== undefined) {
                if (value.available === 1)
                    panel.SetHasClass("TierActive", true);
                panel.SetDialogVariableInt("tier_found_count", Object.keys(value.dropped).length);
                const items = panel.FindChildrenWithClassTraverse("CustomTeamNeutralItem");
                items.forEach((item, index) => {
                    const drop = value.dropped[index];
                    if (!drop)
                        return;
                    const image = item.FindChildTraverse("ShopItem");
                    image.itemname = drop.itemName;
                    let status = "DOTA_TeamNeutralItemState_NotYours";
                    if (drop.owner === undefined) {
                        status = "DOTA_TeamNeutralItemState_Unknown";
                    }
                    else {
                        status = "DOTA_TeamNeutralItemState_Equipped";
                    }
                    item.SetDialogVariable("status", $.Localize(status));
                });
            }
        }
        if (this.allNeutral) {
            const panel = this.allNeutral.FindChildrenWithClassTraverse("CustomNeutralItemsTier").find(itemsTier => {
                const tier_number = itemsTier.GetAttributeInt("tier_number", -1).toString();
                return tier_number === tier;
            });
            if (panel !== undefined) {
                if (value.available === 1)
                    panel.SetHasClass("TierActive", true);
                panel.SetDialogVariableInt("tier_found_count", Object.keys(value.dropped).length);
            }
        }
    }
}
const formatDropTime = (time) => {
    const seconds = time % 60;
    const minutes = (time - seconds) / 60;
    return minutes + ":" + seconds.toString().padStart(2, '0');
};
// const oldNeutralItems = new OldNeutralItems();
