"use strict";
// Dota utils
const FindFirstChildWithClass = (panel, className) => panel.FindChildrenWithClassTraverse(className)[0];
const FindDotaHudElement = (id) => dotaHud.FindChildTraverse(id);
const dotaHud = (() => {
    let panel = $.GetContextPanel();
    while (panel) {
        if (panel.id === "DotaHud")
            return panel;
        panel = panel.GetParent();
    }
    return panel;
})();
Entities.IsTowerType = (nEntityIndex) => {
    return Entities.IsTower(nEntityIndex)
        || Entities.IsBuilding(nEntityIndex)
        || Entities.IsFort(nEntityIndex)
        || Entities.IsBarracks(nEntityIndex)
        || Entities.GetClassNameAsCStr(nEntityIndex) === "npc_dota_watch_tower"
        || Entities.GetClassNameAsCStr(nEntityIndex) === "ent_dota_fountain";
};
Entities.IsTempestDouble = (nEntityIndex) => {
    return Entities.HasModifierByName(nEntityIndex, "modifier_arc_warden_tempest_double")
        || Entities.HasModifierByName(nEntityIndex, "modifier_arc_warden_tempest_double_custom_731");
};
Players.GetPlayerColorHex = (iPlayerID) => {
    let color = Players.GetPlayerColor(iPlayerID).toString(16);
    color = color.substring(6, 8) + color.substring(4, 6) + color.substring(2, 4) + color.substring(0, 2);
    return `#${color}`;
};
Players.GetPortraitImage = (iPlayerID, sHeroName) => {
    const unique_portraits = CustomNetTables.GetTableValue("game", "portraits");
    const name = unique_portraits && unique_portraits[iPlayerID] ? unique_portraits[iPlayerID] : sHeroName;
    return `file://{images}/heroes/${name}.png`;
};
Entities.FindModifierByName = (nEntityIndex, sModifierName) => {
    for (let i = 0; i < Entities.GetNumBuffs(nEntityIndex); i++) {
        const buff = Entities.GetBuff(nEntityIndex, i);
        const buff_name = Buffs.GetName(nEntityIndex, buff);
        if (buff_name === sModifierName)
            return buff;
    }
    return null;
};
Entities.HasModifierByName = (nEntityIndex, sModifierName) => {
    for (let i = 0; i < Entities.GetNumBuffs(nEntityIndex); i++) {
        const buffName = Buffs.GetName(nEntityIndex, Entities.GetBuff(nEntityIndex, i));
        if (buffName === sModifierName)
            return true;
    }
    return false;
};
Entities.HasShard = (nEntityIndex) => {
    return Entities.HasModifierByName(nEntityIndex, "modifier_item_aghanims_shard");
};
const _default_context = $.GetContextPanel();
if (!$.LocalizeEngine) {
    $.LocalizeEngine = $.Localize;
    // @ts-ignore
    $.Localize = (text, parent) => {
        const token = text.startsWith("#") ? text : "#" + text;
        const localized = $.LocalizeEngine(token, parent || _default_context);
        return localized === token ? text : localized;
    };
}
// Value utils
const RandomFloat = (min, max) => {
    return Math.round((Math.random() * (max - min) + min) * 10) / 10;
};
const RandomInt = (min, max) => {
    return Math.round(RandomFloat(min, max));
};
const CreateTooltipParameters = (parameters) => {
    const toString = (value) => {
        switch (typeof value) {
            case "string":
            case "boolean":
            case "number": return value.toString();
            case "object":
                if (Array.isArray(value))
                    return value.map(v => toString(v)).join(",");
                else
                    return "object";
            case "undefined":
                return "undefined";
            default:
                throw `Not implemented for '${typeof value}'`;
        }
    };
    return Object.entries(parameters).map(([key, value]) => key + "=" + toString(value)).join("&");
};
String.prototype.replaceAll = function (searchValue, replaceValue) {
    const regexp = searchValue instanceof RegExp
        ? searchValue
        : new RegExp(searchValue.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g');
    return this.replace(regexp, replaceValue);
};
Object.fromEntries = (array) => array.reduce((obj, [key, value]) => {
    obj[key.toString()] = value;
    return obj;
}, {});
Array.prototype.flatMap = function (callback, thisArg) {
    return this.reduce((acc, item, index) => acc.concat(callback.call(thisArg, item, index, this)), []);
};
Array.prototype.removeDuplicates = function () {
    return Array.from(new Set(this));
};
Number.prototype.toRounded = function (fractionDigits = 0) {
    const fraction = 10 ** fractionDigits;
    return Math.round(this.valueOf() * fraction) / fraction;
};
