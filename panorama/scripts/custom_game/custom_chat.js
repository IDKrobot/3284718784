"use strict";
const NON_BREAKING_SPACE = "\u00A0";
const BASE_MESSAGE_INDENT = "<img src='file://{images}/custom_game/chat_separator.png'/>\u00A0";
var ChatActionsEnum;
(function (ChatActionsEnum) {
    ChatActionsEnum[ChatActionsEnum["PLAYER_NAME"] = 0] = "PLAYER_NAME";
    ChatActionsEnum[ChatActionsEnum["PLAYER_COLOR"] = 1] = "PLAYER_COLOR";
    ChatActionsEnum[ChatActionsEnum["HERO_NAME"] = 2] = "HERO_NAME";
})(ChatActionsEnum || (ChatActionsEnum = {}));
const ChatActions = {
    [ChatActionsEnum.PLAYER_NAME]: (player_id) => {
        return Players.GetPlayerName(player_id);
    },
    [ChatActionsEnum.PLAYER_COLOR]: (player_id) => {
        return Players.GetPlayerColorHex(player_id);
    },
    [ChatActionsEnum.HERO_NAME]: (player_id) => {
        const hero_id = Players.GetPlayerHeroEntityIndex(player_id);
        return $.Localize(Entities.GetUnitName(hero_id));
    }
};
class CustomChat {
    constructor() {
        this.guildTags = {};
        this.ParseGuildTags();
        GameEvents.Subscribe("custom_chat_message", event => this.CreateCustomMessage(event));
    }
    ParseGuildTags() {
        const context = $.GetContextPanel();
        for (const playerID of Game.GetAllPlayerIDs()) {
            const playerInfo = Game.GetPlayerInfo(playerID);
            if (!playerInfo)
                return;
            const temp = $.CreatePanel("DOTAUserName", context, "", {
                steamid: playerInfo.player_steamid,
                style: "visibility: collapse;",
            });
            $.Schedule(2, () => {
                const full_name = temp.GetChild(0).text;
                this.guildTags[playerID] = full_name.replace(playerInfo.player_name, "").trim();
                temp.DeleteAsync(0);
            });
        }
    }
    NewChatEntry() {
        const chatLinesPanel = FindDotaHudElement("ChatLinesPanel");
        const message = $.CreatePanel("Label", chatLinesPanel, "", {
            class: "ChatLine",
            html: "true",
            selectionpos: "auto",
            hittest: "false",
            hittestchildren: "false",
            text: "undefined"
        });
        message.style.flowChildren = "right";
        message.style.color = "#faeac9";
        message.style.opacity = "1";
        $.Schedule(7, () => {
            if (message)
                message.style.opacity = null;
        });
        return message;
    }
    GetPlayerNameWithTag(player_id, add_tag) {
        const playerInfo = Game.GetPlayerInfo(player_id);
        if (!playerInfo)
            return "";
        const color = Players.GetPlayerColorHex(player_id);
        const guild_tag = this.guildTags[player_id];
        let result = `<font color='${color}'>${playerInfo.player_name}</font>`;
        if (guild_tag !== "" && add_tag)
            result += ` <font color='${color}'>${guild_tag}</font>`;
        return result;
    }
    AddHeroInfoToLine(player_id, message, add_tag) {
        const playerInfo = Game.GetPlayerInfo(player_id);
        if (!playerInfo)
            return "";
        $.CreatePanel("Panel", message, "", {
            class: `HeroBadge PlusHeroBadgeIconSmall NoTier`,
            selectionpos: "auto",
        });
        $.CreatePanel("Image", message, "", {
            class: "HeroIcon",
            selectionpos: "auto",
            src: Players.GetPortraitImage(player_id, playerInfo.player_selected_hero)
        });
        return `${this.GetPlayerNameWithTag(player_id, add_tag)} : `;
    }
    SetupNotLocalizedTokens(message, not_localize) {
        if (!not_localize)
            return;
        Object.entries(not_localize).forEach(([key, value]) => {
            message.SetDialogVariable(key, value);
        });
    }
    SetupPlayersInfo(message, players) {
        Object.entries(players).forEach(([id, data]) => {
            const numID = parseInt(id);
            Object.entries(data).forEach(([key, value]) => message.SetDialogVariable(key, ChatActions[value](numID)));
        });
    }
    CreateCustomMessage(data) {
        if (Game.IsPlayerMuted(data.sender_id))
            return;
        const message = this.NewChatEntry();
        if (data.tokens) {
            this.SetupNotLocalizedTokens(message, data.tokens.not_localize);
            this.SetupPlayersInfo(message, data.tokens.players);
            /*
            Object.entries(data.tokens).forEach(([key, value]) => {
                if (key === "not_localize" || key === "hard_replace") return;

                if (key === "players")this.SetupPlayersInfo(message, value);
                else message.SetDialogVariable(key, $.Localize(value as any, message));
            });
             */
        }
        let text = "";
        const allies_tag = $.LocalizeEngine("#DOTA_ChatCommand_GameAllies_Name");
        const all_tag = $.LocalizeEngine("#DOTA_ChatCommand_GameAll_Name");
        if (data.sender_id > -1) {
            text += `${BASE_MESSAGE_INDENT}${!!data.is_team ? `[${allies_tag}] ` : !!data.is_all ? `[${all_tag}]` : NON_BREAKING_SPACE}`;
            text += this.AddHeroInfoToLine(data.sender_id, message, !!data.add_tag);
        }
        else if (!!data.is_team) {
            text += `(${allies_tag}): `;
        }
        else if (!!data.is_all) {
            text += `(${all_tag}): `;
        }
        text += $.Localize(data.main_token, message);
        if (data.tokens && data.tokens.hard_replace) {
            Object.entries(data.tokens.hard_replace).forEach(([key, value]) => {
                text = text.replaceAll(key, $.LocalizeEngine(value, message));
            });
        }
        text = text.replaceAll("%ARROW%", "<img src='s2r://panorama/images/control_icons/chat_wheel_icon_png.vtex' class='ChatWheelIcon' />");
        text = text.replace(/ +(?= )/g, "");
        message.text = text;
    }
}
const custom_chat = new CustomChat();
