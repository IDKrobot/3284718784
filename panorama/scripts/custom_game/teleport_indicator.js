"use strict";
class TeleportIndicator {
    constructor() {
        this.entities = [];
        this.entities = Entities.GetAllEntities();
        GameEvents.Subscribe("npc_spawned", () => this.entities = this.GetAllEntities());
        GameEvents.Subscribe("npc_spawn_finished", () => this.entities = this.GetAllEntities());
        GameEvents.Subscribe("entity_killed", () => this.entities = this.GetAllEntities());
    }
    GetAllEntities() {
        return [
            ...Entities.GetAllHeroEntities(),
            ...Entities.GetAllBuildingEntities(),
            ...Entities.GetAllCreatureEntities(),
            ...Entities.GetAllEntities().filter(entity => Entities.IsCreep(entity) || Entities.IsCreepHero(entity))
        ];
    }
    GetNearestTarget(cursorPosition, ability) {
        const local = Players.GetLocalPlayer();
        const localTeam = Players.GetTeam(local);
        const localEntity = Game.GetLocalPlayerInfo().player_selected_hero_entity_index;
        const targets = this.entities
            .filter(entity => Entities.GetTeamNumber(entity) === localTeam && Entities.IsAlive(entity) && levelFilter(ability, localEntity, entity));
        return targets.sort((a, b) => distance(cursorPosition, a) - distance(cursorPosition, b))[0];
    }
    GetNearestBuilding(cursorPosition) {
        const localTeam = Players.GetTeam(Players.GetLocalPlayer());
        const buildings = Entities.GetAllBuildingEntities()
            .filter(building => Entities.GetTeamNumber(building) === localTeam);
        return buildings.sort((a, b) => distance(cursorPosition, a) - distance(cursorPosition, b))[0];
    }
    /** @deprecated */
    CreateTowerRadius(target) {
        var _a;
        const radius = getRadius(target);
        if (Entities.IsAlive(target) && Entities.IsTowerType(target)) {
            const position = Entities.GetAbsOrigin(target);
            position[2] = 380; // offset
            this.buildingParticle = (_a = this.buildingParticle) !== null && _a !== void 0 ? _a : Particles.CreateParticle("particles/ui_mouseactions/range_finder_tp_dest.vpcf", ParticleAttachment_t.PATTACH_CUSTOMORIGIN, target);
            Particles.SetParticleControl(this.buildingParticle, 2, position);
            Particles.SetParticleControl(this.buildingParticle, 3, [radius, 0, 0]);
            Particles.SetParticleControl(this.buildingParticle, 4, [0, 255, 0]);
        }
        else
            this.RemoveBuildingParticle();
    }
    ShowParticles(ability, mousePosition) {
        var _a;
        const target = this.GetNearestTarget(mousePosition, ability);
        const building = this.GetNearestBuilding(mousePosition);
        const localEntity = Game.GetLocalPlayerInfo().player_selected_hero_entity_index;
        if (target !== this.lastTarget)
            this.HideParticles();
        if (!Entities.IsTowerType(target) && !isInRadius(mousePosition, Entities.GetAbsOrigin(building), 900) && localEntity !== target) {
            this.cursorParticle = (_a = this.cursorParticle) !== null && _a !== void 0 ? _a : Particles.CreateParticle("particles/ui_mouseactions/range_finder_tp_dest.vpcf", ParticleAttachment_t.PATTACH_CUSTOMORIGIN, Players.GetLocalPlayerPortraitUnit());
            Particles.SetParticleControl(this.cursorParticle, 2, [9999, 9999, 9999]);
            Particles.SetParticleControl(this.cursorParticle, 3, [120, 0, 0]);
            Particles.SetParticleControl(this.cursorParticle, 7, Entities.GetAbsOrigin(target));
        }
        else
            this.RemoveCursorParticle();
        this.lastTarget = target;
    }
    HideParticles() {
        this.RemoveCursorParticle();
        this.RemoveBuildingParticle();
    }
    RemoveCursorParticle() {
        if (this.cursorParticle) {
            Particles.DestroyParticleEffect(this.cursorParticle, true);
            Particles.ReleaseParticleIndex(this.cursorParticle);
            this.cursorParticle = undefined;
        }
    }
    RemoveBuildingParticle() {
        if (this.buildingParticle) {
            Particles.DestroyParticleEffect(this.buildingParticle, true);
            Particles.ReleaseParticleIndex(this.buildingParticle);
            this.buildingParticle = undefined;
        }
    }
}
const defaultEntityFilter = (entity) => Entities.IsTowerType(entity) || Entities.IsCreep(entity) || Entities.IsCreepHero(entity);
const heroEntityFilter = (entity) => defaultEntityFilter(entity) || Entities.IsHero(entity);
const levelFilter = (ability, localEntity, entity) => {
    const abilityLevel = Abilities.GetLevel(ability);
    if (localEntity === entity)
        return false;
    switch (abilityLevel) {
        case 2: return defaultEntityFilter(entity);
        case 3: return heroEntityFilter(entity);
        case 1:
        default: return Entities.IsTowerType(entity);
    }
};
const distance = (pos, entity) => pos.__sub(Entities.GetAbsOrigin(entity)).Length2D();
const getRadius = (entity) => !Entities.IsTowerType(entity)
    ? 0
    : Entities.GetClassNameAsCStr(entity) === "npc_dota_watch_tower"
        ? 250
        : 850;
const isInRadius = (a, b, radius) => Vector.toVector(a).__sub(b).Length2D() <= radius;
const teleportIndicator = new TeleportIndicator();
