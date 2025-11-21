local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 7,["16"] = 8,["17"] = 7,["18"] = 11,["19"] = 12,["20"] = 11,["21"] = 15,["22"] = 16,["23"] = 15,["24"] = 19,["25"] = 20,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 26,["32"] = 27,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 33,["40"] = 36,["41"] = 37,["42"] = 38,["44"] = 41,["45"] = 46,["46"] = 46,["47"] = 46,["48"] = 46,["49"] = 46,["50"] = 47,["51"] = 49,["54"] = 19,["55"] = 4,["56"] = 4,["57"] = 4,["58"] = 3,["61"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_nevermore_shadowraze_custom_728_counter = __TS__Class()
local modifier_nevermore_shadowraze_custom_728_counter = ____exports.modifier_nevermore_shadowraze_custom_728_counter
modifier_nevermore_shadowraze_custom_728_counter.name = "modifier_nevermore_shadowraze_custom_728_counter"
__TS__ClassExtends(modifier_nevermore_shadowraze_custom_728_counter, BaseModifier)
function modifier_nevermore_shadowraze_custom_728_counter.prototype.IsHidden(self)
    return true
end
function modifier_nevermore_shadowraze_custom_728_counter.prototype.IsPurgable(self)
    return false
end
function modifier_nevermore_shadowraze_custom_728_counter.prototype.OnCreated(self, params)
    self:SetStackCount(1)
end
function modifier_nevermore_shadowraze_custom_728_counter.prototype.OnRefresh(self, params)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if self:GetStackCount() < 3 then
        self:IncrementStackCount()
        if self:GetStackCount() == 2 then
            self.particle = ParticleManager:CreateParticle("particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_shadowraze_double.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
            ParticleManager:SetParticleControl(
                self.particle,
                0,
                parent:GetOrigin()
            )
            ParticleManager:ReleaseParticleIndex(self.particle)
        end
        if self:GetStackCount() >= 3 then
            if self.particle then
                ParticleManager:DestroyParticle(self.particle, true)
            end
            self.particle = ParticleManager:CreateParticle("particles/econ/items/shadow_fiend/sf_fire_arcana/sf_fire_arcana_shadowraze_triple.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
            ParticleManager:SetParticleControl(
                self.particle,
                0,
                parent:GetOrigin()
            )
            ParticleManager:ReleaseParticleIndex(self.particle)
            self:Destroy()
        end
    end
end
modifier_nevermore_shadowraze_custom_728_counter = __TS__Decorate(
    modifier_nevermore_shadowraze_custom_728_counter,
    modifier_nevermore_shadowraze_custom_728_counter,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_nevermore_shadowraze_custom_728_counter"}
)
____exports.modifier_nevermore_shadowraze_custom_728_counter = modifier_nevermore_shadowraze_custom_728_counter
return ____exports
