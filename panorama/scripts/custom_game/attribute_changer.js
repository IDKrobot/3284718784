"use strict";
class AttributeChanger {
    constructor() {
        this.heroes = CustomNetTables.GetAllTableValues("heroes");
        CustomNetTables.SubscribeNetTableListener("heroes", () => {
            this.heroes = CustomNetTables.GetAllTableValues("heroes");
        });
        this.Tick();
    }
    GetAttributeTooltip() {
        if (this.attributePanel)
            return this.attributePanel;
        const tooltips = FindDotaHudElement("Tooltips");
        if (!tooltips)
            return;
        const unitDamageArmor = tooltips.FindChildTraverse("DOTAHUDDamageArmorTooltip");
        if (!unitDamageArmor)
            return;
        const attributes = unitDamageArmor.FindChildTraverse("AttributesContainer");
        return this.attributePanel = attributes;
    }
    GetAttributePanels() {
        if (this.attributePanels && !Object.values(this.attributePanels).some(v => v === null))
            return this.attributePanels;
        const attributes = this.GetAttributeTooltip();
        if (!attributes)
            return undefined;
        const panel = {
            [Attributes.DOTA_ATTRIBUTE_STRENGTH]: attributes.FindChildTraverse("StrengthContainer"),
            [Attributes.DOTA_ATTRIBUTE_AGILITY]: attributes.FindChildTraverse("AgilityContainer"),
            [Attributes.DOTA_ATTRIBUTE_INTELLECT]: attributes.FindChildTraverse("IntelligenceContainer"),
            [Attributes.DOTA_ATTRIBUTE_ALL]: attributes.FindChildTraverse("AllContainer")
        };
        return this.attributePanels = panel;
    }
    ChangeAttributePanel() {
        var _a;
        const selectedEntity = Players.GetLocalPlayerPortraitUnit();
        const values = (_a = this.heroes.find(hero => Entities.GetUnitName(selectedEntity) === hero.key)) === null || _a === void 0 ? void 0 : _a.value;
        if (!values || values.mainAttribute === undefined)
            return;
        const attributeContainers = this.GetAttributePanels();
        if (!attributeContainers)
            return;
        Object.entries(attributeContainers).forEach(([attribute, panel]) => {
            if (!panel)
                return;
            panel.SetHasClass("PrimaryAttribute", Number(attribute) === values.mainAttribute);
        });
    }
    Tick() {
        this.ChangeAttributePanel();
        $.Schedule(0.03, () => this.Tick());
    }
}
const attributeChanger = new AttributeChanger();
