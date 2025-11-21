local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 13,["22"] = 14,["25"] = 16,["26"] = 17,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 19,["34"] = 20,["37"] = 22,["38"] = 23,["39"] = 9,["40"] = 26,["41"] = 27,["42"] = 27,["44"] = 29,["45"] = 30,["46"] = 32,["47"] = 36,["48"] = 36,["49"] = 26,["50"] = 6,["51"] = 6,["52"] = 6,["53"] = 5,["56"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.broodmother_spin_web_destroy_custom_728 = __TS__Class()
local broodmother_spin_web_destroy_custom_728 = ____exports.broodmother_spin_web_destroy_custom_728
broodmother_spin_web_destroy_custom_728.name = "broodmother_spin_web_destroy_custom_728"
__TS__ClassExtends(broodmother_spin_web_destroy_custom_728, BaseAbility)
function broodmother_spin_web_destroy_custom_728.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local owner = caster:GetOwner()
    local handler = owner:FindAbilityByName("broodmother_spin_web_custom_728")
    if not handler then
        return
    end
    local webs = handler.webs
    if not __TS__ArrayIncludes(webs, caster) then
        return
    end
    local removed_web = __TS__ArraySplice(
        webs,
        __TS__ArrayIndexOf(webs, caster),
        1
    )[1]
    if not removed_web then
        return
    end
    removed_web:ForceKill(false)
    removed_web:RemoveModifierByName("modifier_broodmother_spin_web_custom_728_aura")
end
function broodmother_spin_web_destroy_custom_728.prototype.GetAbilityTextureName(self)
    if self.abilityTexture then
        return self.abilityTexture
    end
    local caster = self:GetCaster()
    local owner = caster.owner
    local texture = caster:GetModifierStackCount("modifier_broodmother_spin_web_custom_728_aura", owner) == 1 and "broodmother_spin_web_destroy_immortal" or "broodmother_spin_web_destroy"
    self.abilityTexture = texture
    return texture
end
broodmother_spin_web_destroy_custom_728 = __TS__Decorate(
    broodmother_spin_web_destroy_custom_728,
    broodmother_spin_web_destroy_custom_728,
    {registerAbility(nil)},
    {kind = "class", name = "broodmother_spin_web_destroy_custom_728"}
)
____exports.broodmother_spin_web_destroy_custom_728 = broodmother_spin_web_destroy_custom_728
return ____exports
