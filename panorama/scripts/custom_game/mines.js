"use strict";
const MINES_NAMES = [
    "npc_dota_techies_725_land_mine_custom",
    "npc_dota_techies_725_stasis_trap_custom",
    "npc_dota_techies_725_remote_mine_custom"
];
class Mines {
    constructor() {
        this.localPlayer = Players.GetLocalPlayer();
        this.particles = {};
    }
    IsMine(index) {
        const name = Entities.GetUnitName(index);
        return MINES_NAMES.includes(name);
    }
    GetLandMines() {
        return Entities.GetAllEntities()
            .filter(index => this.IsMine(index)
            && Entities.GetTeamNumber(index) === Players.GetTeam(this.localPlayer)
            && Entities.GetPlayerOwnerID(index) === this.localPlayer);
    }
    ShowParticles() {
        const mines = this.GetLandMines();
        const localEntity = Game.GetLocalPlayerInfo().player_selected_hero_entity_index;
        const ability = Entities.GetAbilityByName(localEntity, "techies_land_mines_custom_725");
        const radius = Abilities.GetSpecialValueFor(ability, "placement_radius");
        mines.forEach(mine => {
            var _a;
            if (Entities.IsAlive(mine)) {
                this.particles[mine] = (_a = this.particles[mine]) !== null && _a !== void 0 ? _a : Particles.CreateParticle("particles/ui_mouseactions/range_finder_tp_dest.vpcf", ParticleAttachment_t.PATTACH_ABSORIGIN_FOLLOW, mine);
                Particles.SetParticleControl(this.particles[mine], 0, Entities.GetAbsOrigin(mine));
                Particles.SetParticleControl(this.particles[mine], 2, Entities.GetAbsOrigin(mine));
                Particles.SetParticleControl(this.particles[mine], 3, [radius, 1, 1]);
                Particles.SetParticleControl(this.particles[mine], 4, [255, 22, 22]);
            }
            else {
                const particle = this.particles[mine];
                if (particle) {
                    Particles.DestroyParticleEffect(particle, true);
                    Particles.ReleaseParticleIndex(particle);
                }
            }
        });
    }
    HideParticles() {
        Object.values(this.particles).forEach(particle => {
            if (particle) {
                Particles.DestroyParticleEffect(particle, true);
                Particles.ReleaseParticleIndex(particle);
            }
        });
        this.particles = {};
    }
}
const mines = new Mines();
