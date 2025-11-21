"use strict";
class PlayerTips {
    constructor() {
        this.scoreboardButtons = [];
        this.tipCooldown = [];
        this.clientCooldown = false;
        dotaHud.FindChildrenWithClassTraverse("TIPS_RemoveOnReload").forEach(i => i.DeleteAsync(0));
        this.cards = dotaHud.FindChildrenWithClassTraverse("TopBarPlayerSlot");
        this.toastManager = FindDotaHudElement("SpectatorToastManager");
        this.context = $.GetContextPanel();
        this.buttons = this.CreateButtons();
        this.CreateScoreboardColumns();
        GameEvents.Subscribe("player_tipped", (event) => this.OnPlayerTipped(event));
        this.Tick();
    }
    CreateButtons() {
        if (Game.GetAllPlayerIDs().length === 1)
            return [];
        const localPlayer = Game.GetLocalPlayerID();
        const buttons = new Array();
        this.cards.forEach(element => {
            const player_id = Number(element.id.match(/-?\d+(\.\d+)?/g)[0]);
            if (player_id === -1 || player_id === localPlayer)
                return;
            const button = $.CreatePanel("Button", this.context, "CustomTipButton", {
                class: "TIPS_RemoveOnReload"
            });
            button.BLoadLayoutSnippet("TipButtonSnippet");
            button.SetPanelEvent("onactivate", () => this.TipPlayer(player_id));
            button.SetParent(element);
            buttons.push(button);
        });
        return buttons;
    }
    CreateScoreboardColumns() {
        const scoreboard = FindDotaHudElement("scoreboard");
        if (!scoreboard)
            return;
        const radiant_header = scoreboard.FindChildTraverse("RadiantHeader");
        const dire_header = scoreboard.FindChildTraverse("DireHeader");
        const createHeader = (header) => {
            const tipping_column = FindFirstChildWithClass(header, "TippingColumn");
            let custom_tipping_column = FindFirstChildWithClass(header, "CustomTippingColumn");
            if (custom_tipping_column)
                custom_tipping_column.DeleteAsync(0);
            custom_tipping_column = $.CreatePanel("Label", header, "", {
                class: "CustomTippingColumn SubheaderDesc",
                style: "width: 100px;" + (header.id === "DireHeader" ? "opacity: 0.0;" : ""),
                text: "#DOTA_Scoreboard_Tipping"
            });
            header.MoveChildBefore(custom_tipping_column, tipping_column);
        };
        createHeader(radiant_header);
        createHeader(dire_header);
    }
    CreateScoreboardControl(container) {
        const buttons = new Array();
        for (let i = 0; i < container.GetChildCount(); i++) {
            const panel = container.GetChild(i);
            if (!panel)
                continue;
            // Only way to get dialog variable XD
            const hack = $.CreatePanel("Label", panel, "", {
                style: "visibility: collapse;",
                text: "{d:player_id}"
            });
            const player_id = Number(hack.text);
            hack.DeleteAsync(0);
            const tip_controls = panel.FindChildTraverse("TipControls");
            let custom_tip_controls = panel.FindChildTraverse("CustomTipControls");
            if (custom_tip_controls)
                custom_tip_controls.DeleteAsync(0);
            custom_tip_controls = $.CreatePanel("Panel", panel, "CustomTipControls");
            custom_tip_controls.BLoadLayout("file://{resources}/layout/custom_game/snippets/tip_controls.xml", false, false);
            const tip_cooldown = custom_tip_controls.FindChildTraverse("CustomTipsCooldown");
            this.tipCooldown.push(tip_cooldown);
            const button = custom_tip_controls.FindChildTraverse("CustomTipButton");
            button.SetPanelEvent("onactivate", () => this.TipPlayer(player_id));
            buttons.push(button);
            panel.MoveChildBefore(custom_tip_controls, tip_controls);
        }
        return buttons;
    }
    CreateScoreboardButtons() {
        const scoreboard = FindDotaHudElement("scoreboard");
        if (!scoreboard)
            return [];
        const buttons = new Array();
        const radiant_container = scoreboard.FindChildTraverse("RadiantTeamContainer");
        const dire_container = scoreboard.FindChildTraverse("DireTeamContainer");
        buttons.push(...this.CreateScoreboardControl(radiant_container));
        buttons.push(...this.CreateScoreboardControl(dire_container));
        return buttons;
    }
    TipPlayer(playerID) {
        var _a, _b;
        const localPlayer = Game.GetLocalPlayerID();
        if (playerID === -1)
            return;
        if (playerID === localPlayer)
            return;
        if (this.clientCooldown)
            return;
        const cooldown = (_b = (_a = CustomNetTables.GetTableValue("units", localPlayer.toString())) === null || _a === void 0 ? void 0 : _a.tip_cooldown) !== null && _b !== void 0 ? _b : 0;
        if (cooldown === 0) {
            GameEvents.SendCustomGameEventToServer("player_tip", { target: playerID });
            this.clientCooldown = true;
            $.Schedule(0.1, () => {
                this.clientCooldown = false;
            });
        }
    }
    SetToastData(toast, playerID, labelId, imageId) {
        const info = Game.GetPlayerInfo(playerID);
        if (!info)
            return;
        const label = toast.FindChildTraverse(labelId);
        const image = toast.FindChildTraverse(imageId);
        label.text = info.player_name;
        label.style.color = Players.GetPlayerColorHex(playerID);
        image.heroname = info.player_selected_hero;
    }
    OnPlayerTipped(event) {
        Game.EmitSound("General.Coins");
        const toast = $.CreatePanel("Panel", this.context, "CustomTipToast", {
            class: "ToastPanel TIPS_RemoveOnReload TipToast"
        });
        toast.BLoadLayoutSnippet("PlayerTipToast");
        this.SetToastData(toast, event.player, "SourceHeroLabel", "SourceHeroImage");
        this.SetToastData(toast, event.target, "TargetHeroLabel", "TargetHeroImage");
        const amount = toast.FindChildTraverse("TipValue");
        amount.text = event.amount.toString();
        toast.SetParent(this.toastManager);
        toast.AddClass("ToastVisible");
        $.Schedule(4.5, () => {
            try {
                toast.RemoveClass("ToastVisible");
                toast.DeleteAsync(0.31);
            }
            catch (_a) { }
        });
    }
    Tick() {
        var _a, _b;
        if (this.scoreboardButtons.length === 0)
            this.scoreboardButtons = this.CreateScoreboardButtons();
        const cooldown = (_b = (_a = CustomNetTables.GetTableValue("units", Game.GetLocalPlayerID().toString())) === null || _a === void 0 ? void 0 : _a.tip_cooldown) !== null && _b !== void 0 ? _b : 0;
        const isVisible = cooldown > 0 && Game.GetState() !== DOTA_GameState.DOTA_GAMERULES_STATE_POST_GAME;
        this.buttons.forEach(button => {
            button.SetHasClass("InCooldown", isVisible);
            button.SetHasClass("AltPressed", GameUI.IsAltDown());
        });
        this.scoreboardButtons.forEach(button => button.SetHasClass("IsCooldown", isVisible));
        this.tipCooldown.forEach(panel => {
            panel.SetHasClass("InCooldown", isVisible);
            panel.text = $.Localize("#DOTA_Scoreboard_Custom_TipCooldown").replace("%s1", formatTime(cooldown));
        });
        this.cards.forEach(element => {
            let tpSlot = element.FindChildTraverse("TPIndicator");
            if (tpSlot)
                tpSlot.style.marginBottom = cooldown === 0 ? "20px" : "40px";
        });
        $.Schedule(0.03, () => this.Tick());
    }
}
const formatTime = (time) => {
    const minutes = Math.floor(time / 60);
    const seconds = time % 60;
    return `${minutes.toString().padStart(1, '0')}:${seconds.toString().padStart(2, '0')}`;
};
const player_tips = new PlayerTips();
