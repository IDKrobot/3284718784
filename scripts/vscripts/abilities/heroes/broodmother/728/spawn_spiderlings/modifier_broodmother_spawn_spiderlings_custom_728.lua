local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["20"] = 11,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 19,["25"] = 20,["26"] = 19,["27"] = 25,["28"] = 26,["29"] = 28,["32"] = 30,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 33,["38"] = 38,["39"] = 39,["40"] = 41,["41"] = 43,["43"] = 45,["44"] = 45,["45"] = 46,["46"] = 45,["49"] = 25,["50"] = 49,["51"] = 50,["52"] = 49,["53"] = 53,["54"] = 54,["55"] = 53,["56"] = 6,["57"] = 6,["58"] = 6,["59"] = 5,["62"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_broodmother_spawn_spiderlings_custom_728 = __TS__Class()
local modifier_broodmother_spawn_spiderlings_custom_728 = ____exports.modifier_broodmother_spawn_spiderlings_custom_728
modifier_broodmother_spawn_spiderlings_custom_728.name = "modifier_broodmother_spawn_spiderlings_custom_728"
__TS__ClassExtends(modifier_broodmother_spawn_spiderlings_custom_728, BaseModifier)
function modifier_broodmother_spawn_spiderlings_custom_728.prototype.IsHidden(self)
    return false
end
function modifier_broodmother_spawn_spiderlings_custom_728.prototype.IsPurgable(self)
    return true
end
function modifier_broodmother_spawn_spiderlings_custom_728.prototype.IsDebuff(self)
    return true
end
function modifier_broodmother_spawn_spiderlings_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_DEATH}
end
function modifier_broodmother_spawn_spiderlings_custom_728.prototype.OnDeath(self, event)
    local parent = self:GetParent()
    if event.unit ~= parent then
        return
    end
    local origin = parent:GetAbsOrigin()
    local particle_name = ParticleManager:GetParticleReplacement(
        "particles/units/heroes/hero_broodmother/broodmother_spiderlings_spawn.vpcf",
        self:GetCaster()
    )
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN, parent)
    ParticleManager:SetParticleControl(particle, 0, origin)
    ParticleManager:ReleaseParticleIndex(particle)
    parent:EmitSound("Hero_Broodmother.SpawnSpiderlings")
    local count = self:GetSpecialValueFor("count")
    do
        local i = 0
        while i < count do
            self:GetAbility():SpawnSpiderling(origin)
            i = i + 1
        end
    end
end
function modifier_broodmother_spawn_spiderlings_custom_728.prototype.GetEffectName(self)
    return "particles/units/heroes/hero_broodmother/broodmother_spiderlings_debuff.vpcf"
end
function modifier_broodmother_spawn_spiderlings_custom_728.prototype.GetEffectAttachType(self)
    return PATTACH_ABSORIGIN_FOLLOW
end
modifier_broodmother_spawn_spiderlings_custom_728 = __TS__Decorate(
    modifier_broodmother_spawn_spiderlings_custom_728,
    modifier_broodmother_spawn_spiderlings_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_broodmother_spawn_spiderlings_custom_728"}
)
____exports.modifier_broodmother_spawn_spiderlings_custom_728 = modifier_broodmother_spawn_spiderlings_custom_728
return ____exports
