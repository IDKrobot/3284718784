"use strict";
var _a, _b;
var UpgradeType;
(function (UpgradeType) {
    UpgradeType[UpgradeType["ANY"] = 0] = "ANY";
    UpgradeType[UpgradeType["GRANTED_BY_SCEPTER"] = 1] = "GRANTED_BY_SCEPTER";
    UpgradeType[UpgradeType["GRANTED_BY_SHARD"] = 2] = "GRANTED_BY_SHARD";
    UpgradeType["SCEPTER"] = "scepter";
    UpgradeType["SHARD"] = "shard";
})(UpgradeType || (UpgradeType = {}));
const ABILITY_EXCEPTIONS = [
    "generic_hidden",
    "ability_capture",
    "twin_gate_portal_warp",
    "ability_lamp_use",
    "ability_pluck_famango",
    "old_tinker_high_five"
];
const SPECIAL_KEY_COLORS = {
    [DAMAGE_TYPES.DAMAGE_TYPE_NONE]: {
        learned: "#E1E1E1",
        unlearned: "#4E5661"
    },
    [DAMAGE_TYPES.DAMAGE_TYPE_MAGICAL]: {
        learned: "#9AC9FF",
        unlearned: "#5b93d1"
    },
    [DAMAGE_TYPES.DAMAGE_TYPE_PHYSICAL]: {
        learned: "#FF453C",
        unlearned: "#ae2f28"
    },
    [DAMAGE_TYPES.DAMAGE_TYPE_PURE]: {
        learned: "#FFDF9A",
        unlearned: "#d8ae53"
    }
};
const INVOKER_FACETS = {
    "3": "invoker_quas_focus",
    "4": "invoker_wex_focus",
    "5": "invoker_exort_focus"
};
const INVOKER_SPECIAL_VALUES = {
    "3": "special_bonus_facet_invoker_quas_focus",
    "4": "special_bonus_facet_invoker_wex_focus",
    "5": "special_bonus_facet_invoker_exort_focus"
};
const AOE_ICON = "<img class=\"InlineImage InlineIcon\" src=\"s2r://panorama/images/status_icons/ability_aoe_icon_psd.vtex\" />";
const TALENT_ICON = "<img class=\"InlineImage FadedInlineIcon\" src=\"s2r://panorama/images/spellicons/statbranch_psd.vtex\" />";
const UPGRADED_TALENT_ICON = "<img class=\"InlineImage InlineIcon\" src=\"s2r://panorama/images/spellicons/statbranch_psd.vtex\" />";
class AghanimGenerator {
    static Value(upgrade_type, ability_data, special_key, ability_value, settings, is_description) {
        const percent = settings.is_percent ? "%" : "";
        const colorize = (value, index, max_values) => {
            var _c;
            if (!settings.set_color)
                return value;
            const is_learned = (is_description && max_values === 1) || (ability_data.level - 1) === index || (ability_data.level - 1) >= max_values;
            let tooltipColor;
            if (typeof ability_value === "object" && ability_value.DamageTypeTooltip)
                tooltipColor = this.getAbilityColors(ability_value.DamageTypeTooltip);
            const damageType = (special_key.includes("damage") && !is_description) ? ability_data.damage_type : DAMAGE_TYPES.DAMAGE_TYPE_NONE;
            const color = (_c = tooltipColor !== null && tooltipColor !== void 0 ? tooltipColor : SPECIAL_KEY_COLORS[damageType]) !== null && _c !== void 0 ? _c : SPECIAL_KEY_COLORS[DAMAGE_TYPES.DAMAGE_TYPE_NONE];
            return is_learned
                ? `<b><font color='${color.learned}'>${value}</font></b>`
                : `<font color='${color.unlearned}'>${value}</font>`;
        };
        if (typeof ability_value === "number")
            return colorize(this.formatNumber(ability_value) + percent, 0, 1);
        else if (typeof ability_value === "string") {
            const splitted_value = ability_value.split(" ").map(value => this.formatNumber(value) + percent).removeDuplicates();
            return splitted_value
                .map((value, i) => colorize(value, i, splitted_value.length))
                .join(" <font color='#4E5661'>/</font> ");
        }
        const modify = (value, bonus) => {
            const numValue = typeof value === 'number' ? value : modify(0, value);
            if (typeof bonus === "number") {
                return numValue + bonus;
            }
            if (bonus.startsWith("-")) {
                if (bonus.endsWith("%")) {
                    return numValue - numValue * parseFloat(bonus.slice(1, -1)) / 100;
                }
                else {
                    return numValue + parseFloat(bonus);
                }
            }
            else if (bonus.startsWith("+")) {
                if (bonus.endsWith("%")) {
                    return numValue + numValue * parseFloat(bonus.slice(1, -1)) / 100;
                }
                else {
                    return numValue + parseFloat(bonus.slice(1));
                }
            }
            else if (bonus.startsWith("=")) {
                return parseFloat(bonus.slice(1));
            }
            else if (bonus.startsWith("x")) {
                return numValue * parseFloat(bonus.slice(1));
            }
            else {
                return numValue + parseFloat(bonus);
            }
        };
        const facet = ability_data.facet
            ? INVOKER_SPECIAL_VALUES[ability_data.facet]
            : undefined;
        const baseBonus = upgrade_type === UpgradeType.SCEPTER
            ? ability_value.special_bonus_scepter
            : upgrade_type === UpgradeType.SHARD
                ? ability_value.special_bonus_shard
                : undefined;
        const bonuses = [baseBonus];
        if (facet) {
            const bonus = ability_value[facet];
            bonuses.push(bonus);
        }
        const parseValue = (initialValue, bonus) => {
            const format = (v, b) => this.formatNumber(b ? modify(v, b) : v);
            if (typeof initialValue === "number") {
                if (typeof bonus === "number") {
                    return this.formatNumber(initialValue + bonus);
                }
                else if (typeof bonus === "string") {
                    return bonus.split(" ")
                        .map(b => format(initialValue, b))
                        .removeDuplicates()
                        .join(" ");
                }
                else {
                    const b = upgrade_type === UpgradeType.SCEPTER
                        ? bonus.special_bonus_scepter
                        : bonus.special_bonus_shard;
                    const base = modify(initialValue, bonus.value);
                    return format(base, b);
                }
            }
            else {
                const values = initialValue.split(" ");
                if (typeof bonus === "number") {
                    return values
                        .map(v => format(parseFloat(v) + bonus))
                        .removeDuplicates()
                        .join(" ");
                }
                else if (typeof bonus === "string") {
                    return values
                        .map(v => format(v, bonus))
                        .removeDuplicates()
                        .join(" ");
                }
                else {
                    const b = upgrade_type === UpgradeType.SCEPTER
                        ? bonus.special_bonus_scepter
                        : bonus.special_bonus_shard;
                    const base = modify(initialValue, bonus.value);
                    return format(base, b);
                }
            }
        };
        let value = settings.only_special
            ? 0
            : ability_value.value;
        bonuses.forEach(bonus => {
            if (!bonus)
                return;
            value = parseValue(value, bonus);
        });
        const splitted_value = value.toString().split(" ");
        return splitted_value
            .map((v, i) => colorize(v + percent, i, splitted_value.length))
            .join(" <font color='#4E5661'>/</font> ");
    }
    static Description(upgrade_type, ability_data, ability_value) {
        let facet = undefined;
        if (ability_data.facet) {
            const invokerFacet = INVOKER_FACETS[ability_data.facet];
            if ((upgrade_type === UpgradeType.SCEPTER && ability_value.ScepterRequiredFacet === invokerFacet)
                || (upgrade_type === UpgradeType.SHARD && ability_value.ShardRequiredFacet === invokerFacet)) {
                facet = invokerFacet;
            }
        }
        const localize_key = upgrade_type === UpgradeType.GRANTED_BY_SCEPTER || upgrade_type === UpgradeType.GRANTED_BY_SHARD
            ? `DOTA_Tooltip_Ability_${ability_data.name}_Description`
            : facet
                ? `DOTA_Tooltip_Ability_${ability_data.name}_${upgrade_type}_Facet_${facet}`
                : `DOTA_Tooltip_Ability_${ability_data.name}_${upgrade_type}_Description`;
        let text = $.Localize(localize_key);
        if (text === localize_key)
            return undefined;
        Object.entries(ability_value.AbilityValues).forEach(([key, value]) => {
            if (!value)
                return;
            const base_params = {
                set_color: true,
                only_special: true
            };
            const replacement_params = Object.assign(Object.assign({}, base_params), { is_percent: false, only_special: false });
            const bonus_percent_params = Object.assign(Object.assign({}, base_params), { is_percent: true });
            const bonus_percent_value = _a.Value(upgrade_type, ability_data, key, value, bonus_percent_params, true);
            const bonus_value = _a.Value(upgrade_type, ability_data, key, value, Object.assign(Object.assign({}, bonus_percent_params), { is_percent: false }), true);
            const replacement_percent = _a.Value(upgrade_type, ability_data, key, value, Object.assign(Object.assign({}, replacement_params), { is_percent: true }), true);
            const replacement_value = _a.Value(upgrade_type, ability_data, key, value, replacement_params, true);
            const replacements = [
                [`%${key}%%\.`, replacement_percent],
                [`%bonus_${key}%%\.`, bonus_percent_value],
                [`%shard_${key}%%\.`, bonus_percent_value],
                [`%${key}%`, replacement_value],
                [`%bonus_${key}%`, bonus_value],
                [`%shard_${key}%`, bonus_value]
            ];
            replacements.forEach(([regex, replacement]) => {
                text = text.replaceAll(new RegExp(regex, 'g'), replacement);
            });
        });
        return text;
    }
    static SpecialValue(upgrade_type, ability_data, special_key, special_value) {
        const localize_key = `DOTA_tooltip_Ability_${ability_data.name}_${special_key}`;
        const localize = $.Localize(localize_key);
        if (localize_key === localize || localize.trim().length === 0)
            return undefined;
        const is_percent = localize.startsWith("%");
        const base_value = _a.Value(upgrade_type, ability_data, special_key, special_value, {
            set_color: false,
            is_percent: false,
            only_special: false
        }, false);
        if (base_value === "0")
            return undefined;
        const value = _a.Value(upgrade_type, ability_data, special_key, special_value, {
            set_color: true,
            is_percent: is_percent,
            only_special: false
        }, false);
        const localize_special_key = is_percent ? localize.slice(1) : localize;
        return `${localize_special_key} ${value}`;
    }
    static SpecialValues(upgrade_type, ability_data, special_values, is_patch_selection) {
        const values = [];
        const facet = ability_data.facet
            ? INVOKER_SPECIAL_VALUES[ability_data.facet]
            : undefined;
        Object.entries(special_values).forEach(([key, value]) => {
            if (!value)
                return;
            if (upgrade_type === UpgradeType.SCEPTER || upgrade_type === UpgradeType.SHARD) {
                if (typeof value !== "object")
                    return;
                if (upgrade_type === UpgradeType.SCEPTER && !value.RequiresScepter && !value.special_bonus_scepter && !(facet && value[facet]))
                    return;
                else if (upgrade_type === UpgradeType.SHARD && !value.RequiresShard && !value.special_bonus_shard && !(facet && value[facet]))
                    return;
            }
            else if (typeof value === "object") {
                if (upgrade_type === UpgradeType.GRANTED_BY_SHARD && value.RequiresScepter)
                    return;
                else if (upgrade_type === UpgradeType.GRANTED_BY_SCEPTER && value.RequiresShard)
                    return;
            }
            const special_value = _a.SpecialValue(upgrade_type, ability_data, key, value);
            if (special_value === undefined)
                return;
            const aoe_increase_icon = typeof value === "object" && value.affected_by_aoe_increase
                ? AOE_ICON
                : "";
            const talent_icon = typeof value === "object" && Object.keys(value).some(key => key.includes("special_bonus_unique_"))
                ? TALENT_ICON
                : "";
            values.push(special_value + talent_icon + aoe_increase_icon);
        });
        return values.join("<br>");
    }
    static GrantedByAbility(upgrade, upgrade_type, key, ability_data, ability_values) {
        const label = upgrade.FindChildTraverse(key);
        if (!label)
            return;
        const value = ability_values.AbilityValues[key];
        label.SetHasClass("Hidden", value === 0);
        if (value !== 0)
            label.text = _a.Value(upgrade_type, ability_data, key, value, {
                set_color: true,
                is_percent: false,
                only_special: false
            }, false);
    }
}
_a = AghanimGenerator;
AghanimGenerator.getAbilityColors = (damageType) => {
    switch (damageType) {
        case 'DAMAGE_TYPE_PHYSICAL':
            return SPECIAL_KEY_COLORS[DAMAGE_TYPES.DAMAGE_TYPE_PHYSICAL];
        case 'DAMAGE_TYPE_MAGICAL':
            return SPECIAL_KEY_COLORS[DAMAGE_TYPES.DAMAGE_TYPE_MAGICAL];
        case 'DAMAGE_TYPE_PURE':
            return SPECIAL_KEY_COLORS[DAMAGE_TYPES.DAMAGE_TYPE_PURE];
        case 'DAMAGE_TYPE_NONE':
        default:
            return SPECIAL_KEY_COLORS[DAMAGE_TYPES.DAMAGE_TYPE_NONE];
    }
};
AghanimGenerator.formatNumber = (value, abilityValues = false) => {
    const formatted = _a.toFixed(typeof value === "string" ? parseFloat(value) : value);
    return formatted.startsWith("-") && !abilityValues ? formatted.slice(1) : formatted;
};
AghanimGenerator.toFixed = (value) => value.toFixed(4).replace(/\.?0+$/, '');
class AghanimPanelGenerator {
    static DefaultUpgrade(upgrade_type, context, ability_data, ability_name, ability_values, is_patch_selection = false) {
        const description = AghanimGenerator.Description(upgrade_type, ability_data, ability_values);
        if (description === undefined)
            return;
        const upgrade = $.CreatePanel("Panel", context, "");
        upgrade.BLoadLayoutSnippet("AghsScepterSnippet");
        const ability_image = upgrade.FindChildTraverse("ScepterAbilityImage");
        ability_image.abilityname = ability_name;
        upgrade.SetDialogVariable("scepter_granted_ability", $.Localize(`DOTA_Tooltip_Ability_${ability_name}`));
        upgrade.SetDialogVariable("scepter_upgrade_description", description);
        const values_label = upgrade.FindChildTraverse("AbilityValues");
        const values = AghanimGenerator.SpecialValues(upgrade_type, ability_data, ability_values.AbilityValues, is_patch_selection);
        if (values.length === 0)
            values_label.SetHasClass("Hidden", true);
        else
            upgrade.SetDialogVariable("scepter_upgrade_values", values);
        return upgrade;
    }
    static GrantedByAbility(upgrade_type, context, ability_data, ability_name, ability_values, is_patch_selection = false) {
        const type = upgrade_type === UpgradeType.SCEPTER
            ? UpgradeType.GRANTED_BY_SCEPTER
            : UpgradeType.GRANTED_BY_SHARD;
        const description = AghanimGenerator.Description(type, ability_data, ability_values);
        if (description === undefined)
            return undefined;
        const upgrade = $.CreatePanel("Panel", context, "");
        upgrade.BLoadLayoutSnippet("AghsScepterNewAbilitySnippet");
        const ability_image = upgrade.FindChildTraverse("ScepterAbilityImage");
        ability_image.abilityname = ability_name;
        upgrade.SetDialogVariable("scepter_granted_ability", $.Localize(`DOTA_Tooltip_Ability_${ability_name}`));
        upgrade.SetDialogVariable("scepter_upgrade_description", description);
        const values_label = upgrade.FindChildTraverse("AbilityValues");
        const values = AghanimGenerator.SpecialValues(type, ability_data, ability_values.AbilityValues, is_patch_selection);
        if (values.length === 0)
            values_label.SetHasClass("Hidden", true);
        else
            upgrade.SetDialogVariable("scepter_upgrade_values", values);
        AghanimGenerator.GrantedByAbility(upgrade, type, "AbilityCooldown", ability_data, ability_values);
        AghanimGenerator.GrantedByAbility(upgrade, type, "AbilityManaCost", ability_data, ability_values);
        return upgrade;
    }
}
class AghanimValues {
    static GetFacet(unitName) {
        if (!this.facets)
            this.facets = CustomNetTables.GetTableValue("game", "facets");
        if (!this.facets)
            return undefined;
        const facet = this.facets[unitName];
        if (!facet)
            return undefined;
        return facet.toString();
    }
    static GetScepterUpgrades(entity, tooltip = false, unitName) {
        if (!unitName)
            unitName = Entities.GetUnitName(entity);
        if (this.cachedScepterUpdates[unitName])
            return this.cachedScepterUpdates[unitName];
        const upgrades = this.abilities.find(hero => hero.key === unitName);
        if (!upgrades)
            return {};
        let invokerFacet = undefined;
        if (unitName === "npc_dota_hero_invoker" || unitName === "npc_dota_hero_rubick") {
            const facet = this.GetFacet("npc_dota_hero_invoker");
            if (facet) {
                invokerFacet = INVOKER_FACETS[facet];
            }
        }
        const scepter_upgrades = {};
        Object.entries(upgrades.value).forEach(([key, value]) => {
            const hasUpgrade = value.HasScepterUpgrade || value.IsGrantedByScepter;
            if (invokerFacet !== undefined) {
                if ((!value.ScepterRequiredFacet && hasUpgrade) || value.ScepterRequiredFacet === invokerFacet) {
                    scepter_upgrades[key] = value;
                }
            }
            else {
                if (hasUpgrade) {
                    scepter_upgrades[key] = value;
                }
            }
        });
        const sortedUpgrades = this.SortUpgradesByPosition(entity, scepter_upgrades, tooltip);
        this.cachedScepterUpdates[unitName] = sortedUpgrades;
        return sortedUpgrades;
    }
    static GetShardUpgrades(entity, tooltip = false, unitName) {
        if (!unitName)
            unitName = Entities.GetUnitName(entity);
        if (this.cachedShardUpdates[unitName])
            return this.cachedShardUpdates[unitName];
        const upgrades = this.abilities.find(hero => hero.key === unitName);
        if (!upgrades)
            return {};
        let invokerFacet = undefined;
        if (unitName === "npc_dota_hero_invoker" || unitName === "npc_dota_hero_rubick") {
            const facet = this.GetFacet("npc_dota_hero_invoker");
            if (facet) {
                invokerFacet = INVOKER_FACETS[facet];
            }
        }
        const shard_upgrades = {};
        Object.entries(upgrades.value).forEach(([key, value]) => {
            const hasUpgrade = value.HasShardUpgrade || value.IsGrantedByShard;
            if (invokerFacet !== undefined) {
                if ((!value.ShardRequiredFacet && hasUpgrade) || value.ShardRequiredFacet === invokerFacet) {
                    shard_upgrades[key] = value;
                }
            }
            else {
                if (hasUpgrade) {
                    shard_upgrades[key] = value;
                }
            }
        });
        const sortedUpgrades = this.SortUpgradesByPosition(entity, shard_upgrades, tooltip);
        this.cachedShardUpdates[unitName] = sortedUpgrades;
        return sortedUpgrades;
    }
    static SortUpgradesByPosition(entity, upgrades, tooltip = false) {
        const sorted_upgrades = {};
        const indexes = new Map();
        const abilityCount = Entities.GetAbilityCount(entity);
        Object.keys(upgrades).forEach(ability_name => {
            for (let i = 0; i < abilityCount; i++) {
                const ability = Entities.GetAbility(entity, i);
                if (ability === -1)
                    continue;
                if (Abilities.GetAbilityName(ability) === ability_name) {
                    if (tooltip && Abilities.IsStolen(ability))
                        continue;
                    indexes.set(i, ability_name);
                    break;
                }
            }
        });
        Array.from(indexes.entries())
            .sort(([a], [b]) => a - b)
            .forEach(([_, ability_name]) => {
            if (ability_name)
                sorted_upgrades[ability_name] = upgrades[ability_name];
        });
        return sorted_upgrades;
    }
    static GetPatchScepterUpgrades(hero, abilities) {
        const upgrades = this.abilities.find(ability => ability.key === hero).value;
        const scepter_upgrades = {};
        abilities.forEach(ability => {
            const upgrade = upgrades[ability];
            if (!upgrade)
                return;
            if (upgrade.HasScepterUpgrade || upgrade.IsGrantedByScepter)
                scepter_upgrades[ability] = upgrade;
        });
        return scepter_upgrades;
    }
    static GetPatchShardUpgrades(hero, abilities) {
        const upgrades = this.abilities.find(ability => ability.key === hero).value;
        const shard_upgrades = {};
        abilities.forEach(ability => {
            const upgrade = upgrades[ability];
            if (!upgrade)
                return;
            if (upgrade.HasShardUpgrade || upgrade.IsGrantedByShard)
                shard_upgrades[ability] = upgrade;
        });
        return shard_upgrades;
    }
}
_b = AghanimValues;
(() => {
    _b.abilities = CustomNetTables.GetAllTableValues("abilities");
    _b.facets = CustomNetTables.GetTableValue("game", "facets");
    _b.cachedScepterUpdates = {};
    _b.cachedShardUpdates = {};
})();
