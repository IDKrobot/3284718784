"use strict";
class MorphlingAttributes {
    constructor() {
        this.context = $.GetContextPanel();
        dotaHud.FindChildrenWithClassTraverse("__Morph_RemoveOnReload")
            .forEach(i => i.DeleteAsync(0));
        this.CreateProgressBar();
        this.CreateNumbers();
        this.Tick();
    }
    CreateProgressBar() {
        const statBranch = FindDotaHudElement("AbilitiesAndStatBranch");
        if (!statBranch)
            return;
        statBranch.FindChildrenWithClassTraverse("__Morph_RemoveOnReload")
            .forEach(i => i.DeleteAsync(0));
        const progressBar = $.CreatePanel("ProgressBar", this.context, "CustomMorphProgress", {
            class: "__Morph_RemoveOnReload"
        });
        this.progressBar = progressBar;
        progressBar.value = 0.5;
        progressBar.FindChildTraverse("CustomMorphProgress_Left").style.backgroundColor = "gradient( linear, 0% 0%, 0% 100%, from( #000000 ), color-stop( .35, #509431 ), color-stop( .65, #509431aa ), to( #000000 ) )";
        progressBar.FindChildTraverse("CustomMorphProgress_Right").style.backgroundColor = "gradient( linear, 0% 0%, 0% 100%, from( #000000 ), color-stop( .35, #880000 ), color-stop( .65, #880000aa ), to( #000000 ) )";
        progressBar.SetParent(statBranch);
    }
    CreateNumbers() {
        const statBranch = FindDotaHudElement("AbilitiesAndStatBranch");
        if (!statBranch)
            return;
        statBranch.FindChildrenWithClassTraverse("CustomHeroStatValue")
            .forEach(i => i.DeleteAsync(0));
        const createNumber = (abilityId, key) => {
            const ability = statBranch.FindChildTraverse(abilityId);
            if (!ability)
                return undefined;
            const buttonSize = ability.FindChildTraverse("ButtonSize");
            if (!buttonSize)
                return undefined;
            const label = buttonSize.FindChildTraverse("StrValue");
            if (!label)
                return undefined;
            const number = $.CreatePanel("Label", this.context, `Custom${key}Value`, {
                class: "CustomHeroStatValue __Morph_RemoveOnReload",
                text: "",
                hittest: false
            });
            number.SetParent(buttonSize);
            buttonSize.MoveChildAfter(number, label);
            return number;
        };
        this.agiValue = createNumber("Ability3", "Agi");
        this.strValue = createNumber("Ability4", "Str");
    }
    RefreshValues() {
        if (!this.progressBar)
            this.CreateProgressBar();
        if (!this.progressBar)
            return;
        if (!this.agiValue || !this.strValue)
            this.CreateNumbers();
        if (!this.agiValue || !this.strValue)
            return;
        const localEntity = Players.GetLocalPlayerPortraitUnit();
        const agilityModifier = Entities.FindModifierByName(localEntity, "modifier_morphling_morph_agi_custom_729");
        const strengthModifier = Entities.FindModifierByName(localEntity, "modifier_morphling_morph_str_custom_729");
        if (!agilityModifier || !strengthModifier)
            return;
        const agility = Buffs.GetStackCount(localEntity, agilityModifier);
        const strength = Buffs.GetStackCount(localEntity, strengthModifier);
        const progress = (agility / (agility + strength)).toRounded(3);
        if (!isNaN(progress))
            this.progressBar.value = progress;
        this.agiValue.text = agility.toString();
        this.strValue.text = strength.toString();
    }
    Tick() {
        this.RefreshValues();
        $.Schedule(0.03, () => this.Tick());
    }
}
const morphling_attributes = new MorphlingAttributes();
