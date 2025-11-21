local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 20,["29"] = 22,["30"] = 17,["31"] = 30,["32"] = 31,["33"] = 33,["36"] = 35,["37"] = 41,["38"] = 30,["39"] = 4,["40"] = 4,["41"] = 4,["42"] = 3,["45"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_morphling_replicate_custom_729_manager = __TS__Class()
local modifier_morphling_replicate_custom_729_manager = ____exports.modifier_morphling_replicate_custom_729_manager
modifier_morphling_replicate_custom_729_manager.name = "modifier_morphling_replicate_custom_729_manager"
__TS__ClassExtends(modifier_morphling_replicate_custom_729_manager, BaseModifier)
function modifier_morphling_replicate_custom_729_manager.prototype.IsHidden(self)
    return true
end
function modifier_morphling_replicate_custom_729_manager.prototype.IsPurgable(self)
    return false
end
function modifier_morphling_replicate_custom_729_manager.prototype.IsPurgeException(self)
    return false
end
function modifier_morphling_replicate_custom_729_manager.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:SwapAbilities("morphling_replicate_custom_729", "morphling_morph_replicate_custom_729", false, true)
end
function modifier_morphling_replicate_custom_729_manager.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    parent:SwapAbilities("morphling_morph_replicate_custom_729", "morphling_replicate_custom_729", false, true)
    parent:RemoveModifierByName("modifier_morphling_replicate_custom_729")
end
modifier_morphling_replicate_custom_729_manager = __TS__Decorate(
    modifier_morphling_replicate_custom_729_manager,
    modifier_morphling_replicate_custom_729_manager,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_morphling_replicate_custom_729_manager"}
)
____exports.modifier_morphling_replicate_custom_729_manager = modifier_morphling_replicate_custom_729_manager
return ____exports
