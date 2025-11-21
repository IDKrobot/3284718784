"use strict";
var BehaviorEvent;
(function (BehaviorEvent) {
    BehaviorEvent[BehaviorEvent["START"] = 0] = "START";
    BehaviorEvent[BehaviorEvent["UPDATE"] = 1] = "UPDATE";
    BehaviorEvent[BehaviorEvent["END"] = 2] = "END";
})(BehaviorEvent || (BehaviorEvent = {}));
function FireBehaviorEvent(event, state) {
    var _a;
    const mousePos = GameUI.GetScreenWorldPosition(GameUI.GetCursorPosition());
    const entities = GameUI.FindScreenEntities(GameUI.GetCursorPosition());
    const entity = (_a = entities[0]) === null || _a === void 0 ? void 0 : _a.entityIndex;
    const abilityName = Abilities.GetAbilityName(state.ability);
    if (mousePos === null)
        return;
    /*
    GameEvents.SendEventClientSide("custom_indicator", {
        ability: state.ability,
        behavior: state.behavior,
        event: event,
        unit: entity,
        worldX: mousePos[0],
        worldY: mousePos[1],
        worldZ: mousePos[2]
    });
    */
    if (abilityName === "techies_land_mines_custom_725") {
        if (event === BehaviorEvent.UPDATE) {
            mines.ShowParticles();
        }
        else if (event === BehaviorEvent.END) {
            mines.HideParticles();
        }
    }
    if (abilityName === "tinker_keen_teleport_custom_730") {
        if (event === BehaviorEvent.UPDATE) {
            teleportIndicator.ShowParticles(state.ability, Vector.toVector(mousePos));
        }
        else if (event === BehaviorEvent.END) {
            teleportIndicator.HideParticles();
        }
    }
}
function ConsiderBehavior(target_behavior, last_state, current_state) {
    if (current_state.behavior === target_behavior) {
        if (last_state.behavior !== target_behavior) {
            FireBehaviorEvent(BehaviorEvent.START, current_state);
        }
        else if (last_state.ability !== current_state.ability) {
            FireBehaviorEvent(BehaviorEvent.START, current_state);
            FireBehaviorEvent(BehaviorEvent.END, last_state);
        }
        else {
            FireBehaviorEvent(BehaviorEvent.UPDATE, current_state);
        }
    }
    else if (last_state.behavior === target_behavior) {
        FireBehaviorEvent(BehaviorEvent.END, last_state);
    }
}
let last_state = {
    ability: -1,
    behavior: CLICK_BEHAVIORS.DOTA_CLICK_BEHAVIOR_NONE
};
function UpdateMousePosition() {
    const current_state = {
        ability: Abilities.GetLocalPlayerActiveAbility(),
        behavior: GameUI.GetClickBehaviors()
    };
    ConsiderBehavior(CLICK_BEHAVIORS.DOTA_CLICK_BEHAVIOR_CAST, last_state, current_state);
    ConsiderBehavior(CLICK_BEHAVIORS.DOTA_CLICK_BEHAVIOR_VECTOR_CAST, last_state, current_state);
    last_state = current_state;
    $.Schedule(0.03, () => UpdateMousePosition());
}
(function () {
    $.Msg("Hello from custom_indicator.ts, World!");
    UpdateMousePosition();
})();
