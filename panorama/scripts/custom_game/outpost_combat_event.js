"use strict";
class OutpostCombatEvent {
    constructor() {
        this.context = $.GetContextPanel();
        GameEvents.Subscribe("outpost_combat_event", event => this.CreateCombatEvent(event));
    }
    CreateCombatEvent(event) {
        const localPlayer = Game.GetLocalPlayerID();
        if (Players.GetTeam(localPlayer) !== event.team && !Players.IsSpectator(localPlayer))
            return;
        const toastManager = FindDotaHudElement("ToastManager");
        if (!toastManager)
            return;
        const team = event.team === DOTATeam_t.DOTA_TEAM_GOODGUYS
            ? "dota_radiant"
            : "dota_dire";
        const row = $.CreatePanel("Panel", this.context, "", {
            class: "ToastPanel AllyEvent",
            hittest: false,
            hittestchildren: false,
        });
        row.SetDialogVariable("outpost_icon", "<panel class='OutpostIcon' />");
        row.SetDialogVariable("team_name", $.Localize(team));
        row.SetDialogVariable("xp", event.xp.toString());
        const slashContainer = $.CreatePanel("Panel", row, "SlashContainer");
        $.CreatePanel("Panel", slashContainer, "TeamColorBar");
        $.CreatePanel("Label", row, "EventLabel", {
            class: "EventListLabel",
            html: true,
            text: "#DOTA_HUD_Custom_OutpostGrantedXP"
        });
        $.CreatePanel("Panel", row, "EventIcon");
        const icon = FindFirstChildWithClass(row, "OutpostIcon");
        if (icon) {
            icon.style.width = "24px";
            icon.style.height = "30px";
            icon.style.backgroundImage = "url(\"s2r://panorama/images/hud/icon_outpost_psd.vtex\")";
            icon.style.backgroundSize = "24px 24px";
            icon.style.backgroundRepeat = "no-repeat";
        }
        row.SetParent(toastManager);
    }
}
const outpost_combat_event = new OutpostCombatEvent();
