local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 39,["20"] = 40,["21"] = 41,["22"] = 4,["23"] = 6,["24"] = 7,["25"] = 6,["26"] = 10,["27"] = 11,["28"] = 10,["29"] = 14,["30"] = 15,["31"] = 17,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 18,["39"] = 14,["40"] = 26,["41"] = 27,["42"] = 28,["44"] = 28,["47"] = 26,["48"] = 31,["49"] = 32,["50"] = 31,["51"] = 5,["52"] = 5,["53"] = 5,["54"] = 4,["57"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_item_octarine_core_custom_728_cooldown = require("abilities.items.octarine_core.728.modifier_item_octarine_core_custom_728_cooldown")
local modifier_item_octarine_core_custom_728_cooldown = ____modifier_item_octarine_core_custom_728_cooldown.modifier_item_octarine_core_custom_728_cooldown
____exports.modifier_item_octarine_core_custom_728 = __TS__Class()
local modifier_item_octarine_core_custom_728 = ____exports.modifier_item_octarine_core_custom_728
modifier_item_octarine_core_custom_728.name = "modifier_item_octarine_core_custom_728"
__TS__ClassExtends(modifier_item_octarine_core_custom_728, BaseModifier)
function modifier_item_octarine_core_custom_728.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierManaBonus = function() return self:GetSpecialValueFor("bonus_mana") end
    self.GetModifierHealthBonus = function() return self:GetSpecialValueFor("bonus_health") end
    self.GetModifierConstantManaRegen = function() return self:GetSpecialValueFor("bonus_mana_regen") end
end
function modifier_item_octarine_core_custom_728.prototype.IsHidden(self)
    return true
end
function modifier_item_octarine_core_custom_728.prototype.IsPurgable(self)
    return false
end
function modifier_item_octarine_core_custom_728.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if IsServer() then
        modifier_item_octarine_core_custom_728_cooldown:apply(
            parent,
            parent,
            self:GetAbility(),
            {}
        )
    end
end
function modifier_item_octarine_core_custom_728.prototype.OnDestroy(self)
    if IsServer() then
        local ____opt_0 = self:GetParent():FindModifierByName(modifier_item_octarine_core_custom_728_cooldown.name)
        if ____opt_0 ~= nil then
            ____opt_0:Destroy()
        end
    end
end
function modifier_item_octarine_core_custom_728.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MANA_BONUS, MODIFIER_PROPERTY_HEALTH_BONUS, MODIFIER_PROPERTY_MANA_REGEN_CONSTANT}
end
modifier_item_octarine_core_custom_728 = __TS__Decorate(
    modifier_item_octarine_core_custom_728,
    modifier_item_octarine_core_custom_728,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_item_octarine_core_custom_728"}
)
____exports.modifier_item_octarine_core_custom_728 = modifier_item_octarine_core_custom_728
return ____exports
