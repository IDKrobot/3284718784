"use strict";
const INVOKER = {
    "7.32": {
        quas: "invoker_quas_custom_732",
        wex: "invoker_wex_custom_732",
        exort: "invoker_exort_custom_732",
        abilities: [
            "invoker_cold_snap_custom_732",
            "invoker_ghost_walk_custom_732",
            "invoker_ice_wall_custom_732",
            "invoker_emp_custom_732",
            "invoker_tornado_custom_732",
            "invoker_alacrity_custom_732",
            "invoker_sun_strike_custom_732",
            "invoker_forge_spirit_custom_732",
            "invoker_chaos_meteor_custom_732",
            "invoker_deafening_blast_custom_732"
        ]
    }
};
class InvokerAbilities {
    constructor() {
        this.abilities = CustomNetTables.GetAllTableValues("abilities");
        this.CreateAbilityValues();
        if (!$.DbgIsReloadingScript()) {
            $.RegisterEventHandler("DOTAShowAbilityTooltip", dotaHud, (panel, ability_name) => this.AbilityTooltipHandler(panel, ability_name, -1));
            $.RegisterEventHandler("DOTAShowAbilityTooltipForEntityIndex", dotaHud, (panel, ability_name, entity) => this.AbilityTooltipHandler(panel, ability_name, entity));
            $.RegisterEventHandler("DOTAHideAbilityTooltip", dotaHud, (panel, ability_name) => this.AbilityTooltipHandler(panel, ability_name, -1));
        }
        this.Tick();
    }
    CreateAbilityValues(tooltip) {
        let values = FindDotaHudElement("CustomAbilityExtraAttributes");
        if (values)
            return values;
        else if (!values && tooltip) {
            const extra_description = tooltip.FindChildTraverse("AbilityExtraAttributes");
            const core_details = tooltip.FindChildTraverse("AbilityCoreDetails");
            values = $.CreatePanel("Label", core_details, "CustomAbilityExtraAttributes");
            values.BLoadLayout("file://{resources}/layout/custom_game/snippets/invoker_values.xml", false, false);
            core_details.MoveChildAfter(values, extra_description);
        }
        return values;
    }
    AbilityTooltipHandler(panel, ability_name, entity) {
        if (ability_name)
            this.current_ability = ability_name;
        const tooltips = FindDotaHudElement("Tooltips");
        if (!tooltips)
            return;
        const tooltip = tooltips.FindChildTraverse("DOTAAbilityTooltip");
        if (!tooltip)
            return;
        const unit_name = Entities.GetUnitName(entity);
        const invoker = INVOKER["7.32"];
        const level_bonus = unit_name === "npc_dota_hero_invoker" && Entities.HasScepter(entity)
            ? 0
            : -1;
        const ability = Entities.GetAbilityByName(entity, ability_name);
        const quas = Entities.GetAbilityByName(entity, invoker.quas);
        const wex = Entities.GetAbilityByName(entity, invoker.wex);
        const exort = Entities.GetAbilityByName(entity, invoker.exort);
        const ability_data = {
            name: ability_name,
            level: Abilities.GetLevel(ability),
            damage_type: Abilities.GetAbilityDamageType(ability),
            quas: Abilities.GetLevel(quas) + level_bonus,
            wex: Abilities.GetLevel(wex) + level_bonus,
            exort: Abilities.GetLevel(exort) + level_bonus
        };
        const values = this.CreateAbilityValues(tooltip);
        if (!values)
            return;
        if (!ability_name) {
            values.SetHasClass("Hidden", true);
            values.SetHasClass("Visible", false);
            return;
        }
        if (panel.id === "ItemImage")
            return;
        values.SetHasClass("Hidden", true);
        values.SetHasClass("Visible", false);
        values.SetHasClass("DefaultValues", true);
        if (!invoker.abilities.includes(ability_name))
            return;
        const abilityValues = this.abilities.find(hero => hero.key === "npc_dota_hero_invoker").value[ability_name];
        if (!abilityValues)
            return;
        const values_text = this.SpecialValues(entity, ability_data, abilityValues.AbilityValues);
        values.SetHasClass("Hidden", false);
        values.SetHasClass("Visible", true);
        values.SetHasClass("DefaultValues", false);
        values.SetDialogVariable("custom_ability_values", values_text);
    }
    ChangeTooltipVisibility() {
        const tooltips = FindDotaHudElement("Tooltips");
        if (!tooltips)
            return;
        const tooltip = tooltips.FindChildTraverse("DOTAAbilityTooltip");
        if (!tooltip)
            return;
        const extra_description = tooltip.FindChildTraverse("AbilityExtraAttributes");
        if (!extra_description)
            return;
        if (tooltip.BHasClass("IsItem")) {
            extra_description.visible = extra_description.text.trim().length > 0;
            return;
        }
        const isDefaultAbility = !(this.current_ability !== undefined && INVOKER["7.32"].abilities.includes(this.current_ability));
        extra_description.visible = isDefaultAbility && !tooltip.BHasClass("IsItem");
    }
    Tick() {
        this.ChangeTooltipVisibility();
        $.Schedule(0.03, () => this.Tick());
    }
    /* Generator */
    Value(entity, ability_data, special_key, ability_value, is_percent) {
        const percent = is_percent ? "%" : "";
        const colorize = (value, index) => {
            var _a;
            let is_learned = false;
            if (typeof ability_value === "object" && ability_value.levelkey) {
                if (ability_value.levelkey === "quaslevel") {
                    is_learned = ability_data.quas === index;
                }
                else if (ability_value.levelkey === "wexlevel") {
                    is_learned = ability_data.wex === index;
                }
                else if (ability_value.levelkey === "exortlevel") {
                    is_learned = ability_data.exort === index;
                }
            }
            let tooltipColor;
            if (typeof ability_value === "object" && ability_value.DamageTypeTooltip)
                tooltipColor = AghanimGenerator.getAbilityColors(ability_value.DamageTypeTooltip);
            const damageType = (special_key.includes("damage")) ? ability_data.damage_type : DAMAGE_TYPES.DAMAGE_TYPE_NONE;
            const color = (_a = tooltipColor !== null && tooltipColor !== void 0 ? tooltipColor : SPECIAL_KEY_COLORS[damageType]) !== null && _a !== void 0 ? _a : SPECIAL_KEY_COLORS[DAMAGE_TYPES.DAMAGE_TYPE_NONE];
            return is_learned
                ? `<b><font color='${color.learned}'>${value}</font></b>`
                : `<font color='${color.unlearned}'>${value}</font>`;
        };
        if (typeof ability_value !== "object")
            return undefined;
        const modify = (value, bonus) => {
            const numValue = typeof value === 'number' ? value : parseFloat(value.toString());
            if (typeof bonus === "number")
                return numValue + bonus;
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
                $.Msg(`Error: Unknown operator '${bonus[0]}'.\nPlease check the input value for special key: ${special_key}`);
                return numValue + parseFloat(bonus);
            }
        };
        const value = ability_value.value;
        const bonuses = {};
        Object.entries(ability_value).forEach(([key, value]) => {
            if (!value)
                return;
            if (key.startsWith("special_bonus_unique"))
                bonuses[key] = value;
        });
        if (typeof value === "number") {
            let result = value;
            Object.entries(bonuses).forEach(([key, value]) => {
                if (!value)
                    return;
                const special_bonus = Entities.GetAbilityByName(entity, key);
                if (special_bonus === -1 || Abilities.GetLevel(special_bonus) === 0)
                    return;
                result = modify(result, value);
            });
            return colorize(AghanimGenerator.formatNumber(result, true) + percent, 0);
        }
        else {
            const splitted_value = value.split(" ").map(value => {
                let result = value;
                Object.entries(bonuses).forEach(([key, value]) => {
                    if (!value)
                        return;
                    const special_bonus = Entities.GetAbilityByName(entity, key);
                    if (special_bonus === -1 || Abilities.GetLevel(special_bonus) === 0)
                        return;
                    result = modify(result, value);
                });
                return AghanimGenerator.formatNumber(result, true) + percent;
            }).removeDuplicates();
            return splitted_value
                .map((value, i) => colorize(value, i))
                .join(" <font color='#4E5661'>/</font> ");
        }
    }
    SpecialValue(entity, ability_data, special_key, special_value) {
        const localize_key = `DOTA_tooltip_Ability_${ability_data.name}_${special_key}`;
        const localize = $.Localize(localize_key);
        if (localize_key === localize || localize.trim().length === 0)
            return undefined;
        const is_percent = localize.startsWith("%");
        const value = this.Value(entity, ability_data, special_key, special_value, is_percent);
        if (!value)
            return undefined;
        const localize_special_key = is_percent ? localize.slice(1) : localize;
        return `${localize_special_key} ${value}`;
    }
    SpecialValues(entity, ability_data, special_values) {
        const values = [];
        Object.entries(special_values).forEach(([key, value]) => {
            if (!value)
                return;
            const aoe_increase_icon = typeof value === "object" && value.affected_by_aoe_increase
                ? AOE_ICON
                : "";
            const hasSpecialBonusKey = typeof value === "object" && Object.keys(value).some(key => key.includes("special_bonus_unique_"));
            let special_bonus_key = undefined;
            if (hasSpecialBonusKey)
                special_bonus_key = Object.keys(value).find(key => key.startsWith("special_bonus_unique_"));
            let hasSpecialBonus = false;
            if (special_bonus_key) {
                const special_bonus = Entities.GetAbilityByName(entity, special_bonus_key);
                hasSpecialBonus = special_bonus !== -1 && Abilities.GetLevel(special_bonus) > 0;
            }
            const talent_icon = !hasSpecialBonusKey
                ? ""
                : hasSpecialBonus
                    ? UPGRADED_TALENT_ICON
                    : TALENT_ICON;
            const special_value = this.SpecialValue(entity, ability_data, key, value);
            if (typeof value === "number" || (typeof value === "object" && !value.levelkey)) {
                const default_special_value = AghanimGenerator.SpecialValue(UpgradeType.ANY, ability_data, key, value);
                if (default_special_value)
                    values.push(default_special_value + talent_icon + aoe_increase_icon);
            }
            else {
                if (special_value)
                    values.push(special_value + talent_icon + aoe_increase_icon);
            }
        });
        return values.join("<br>");
    }
}
const invokerAbilities = new InvokerAbilities();
