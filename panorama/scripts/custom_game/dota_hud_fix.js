"use strict";
class DotaUIFix {
    constructor() {
        this.FixNeutralItems();
        this.FixShopItems();
    }
    FixNeutralItems() {
        const neutralItems = FindDotaHudElement("GridNeutralsCategory");
        if (neutralItems)
            neutralItems.style.overflow = "scroll";
    }
    FixShopItems() {
        const basicItems = FindDotaHudElement("GridBasicItemsCategory");
        if (basicItems)
            basicItems.style.overflow = "scroll";
        const upgradeItems = FindDotaHudElement("GridUpgradesCategory");
        if (upgradeItems)
            upgradeItems.style.overflow = "scroll";
    }
}
const dotaFix = new DotaUIFix();
