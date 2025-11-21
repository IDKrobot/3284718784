local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 4,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 5,["19"] = 9,["20"] = 10,["21"] = 9,["22"] = 13,["23"] = 14,["24"] = 13,["25"] = 17,["26"] = 18,["27"] = 17,["28"] = 21,["29"] = 22,["30"] = 21,["31"] = 25,["32"] = 26,["33"] = 25,["34"] = 29,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 30,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 29,["46"] = 37,["47"] = 38,["48"] = 37,["49"] = 4,["50"] = 4,["51"] = 4,["52"] = 3,["55"] = 4,["56"] = 42,["57"] = 43,["58"] = 42,["59"] = 43,["61"] = 43,["62"] = 81,["63"] = 82,["64"] = 42,["65"] = 44,["66"] = 45,["67"] = 44,["68"] = 48,["69"] = 49,["70"] = 48,["71"] = 52,["72"] = 53,["73"] = 52,["74"] = 56,["75"] = 57,["78"] = 59,["79"] = 60,["80"] = 56,["81"] = 63,["82"] = 64,["83"] = 66,["84"] = 66,["85"] = 66,["86"] = 67,["89"] = 69,["90"] = 70,["92"] = 66,["93"] = 66,["94"] = 63,["95"] = 74,["96"] = 75,["97"] = 74,["98"] = 84,["99"] = 85,["100"] = 84,["101"] = 43,["102"] = 43,["103"] = 43,["104"] = 42,["107"] = 43});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_fountain_aura_custom = __TS__Class()
local modifier_fountain_aura_custom = ____exports.modifier_fountain_aura_custom
modifier_fountain_aura_custom.name = "modifier_fountain_aura_custom"
__TS__ClassExtends(modifier_fountain_aura_custom, BaseModifier)
function modifier_fountain_aura_custom.prototype.IsHidden(self)
    return true
end
function modifier_fountain_aura_custom.prototype.IsAura(self)
    return true
end
function modifier_fountain_aura_custom.prototype.GetAuraRadius(self)
    return 1200
end
function modifier_fountain_aura_custom.prototype.GetAuraDuration(self)
    return 3
end
function modifier_fountain_aura_custom.prototype.GetModifierAura(self)
    return ____exports.modifier_fountain_aura_custom_buff.name
end
function modifier_fountain_aura_custom.prototype.GetAuraSearchTeam(self)
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end
function modifier_fountain_aura_custom.prototype.GetAuraSearchType(self)
    return bit.bor(
        bit.bor(
            bit.bor(
                bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_CREEP),
                DOTA_UNIT_TARGET_COURIER
            ),
            DOTA_UNIT_TARGET_BASIC
        ),
        DOTA_UNIT_TARGET_OTHER
    )
end
function modifier_fountain_aura_custom.prototype.GetAuraSearchFlags(self)
    return bit.bor(DOTA_UNIT_TARGET_FLAG_INVULNERABLE, DOTA_UNIT_TARGET_FLAG_OUT_OF_WORLD)
end
modifier_fountain_aura_custom = __TS__Decorate(
    modifier_fountain_aura_custom,
    modifier_fountain_aura_custom,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_fountain_aura_custom"}
)
____exports.modifier_fountain_aura_custom = modifier_fountain_aura_custom
____exports.modifier_fountain_aura_custom_buff = __TS__Class()
local modifier_fountain_aura_custom_buff = ____exports.modifier_fountain_aura_custom_buff
modifier_fountain_aura_custom_buff.name = "modifier_fountain_aura_custom_buff"
__TS__ClassExtends(modifier_fountain_aura_custom_buff, BaseModifier)
function modifier_fountain_aura_custom_buff.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.GetModifierHealthRegenPercentage = function() return 5 end
    self.GetModifierTotalPercentageManaRegen = function() return 6 end
end
function modifier_fountain_aura_custom_buff.prototype.IsHidden(self)
    return false
end
function modifier_fountain_aura_custom_buff.prototype.IsPurgable(self)
    return false
end
function modifier_fountain_aura_custom_buff.prototype.IsPurgeException(self)
    return false
end
function modifier_fountain_aura_custom_buff.prototype.OnCreated(self, params)
    if not IsServer() then
        return
    end
    self:OnIntervalThink()
    self:StartIntervalThink(0.2)
end
function modifier_fountain_aura_custom_buff.prototype.OnIntervalThink(self)
    local parent = self:GetParent()
    __TS__ArrayForEach(
        parent:GetItems(5),
        function(____, item)
            if item:GetName() ~= "item_bottle" then
                return
            end
            if item:GetCurrentCharges() < 3 then
                item:SetCurrentCharges(3)
            end
        end
    )
end
function modifier_fountain_aura_custom_buff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE, MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE}
end
function modifier_fountain_aura_custom_buff.prototype.GetTexture(self)
    return "fountain_heal"
end
modifier_fountain_aura_custom_buff = __TS__Decorate(
    modifier_fountain_aura_custom_buff,
    modifier_fountain_aura_custom_buff,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_fountain_aura_custom_buff"}
)
____exports.modifier_fountain_aura_custom_buff = modifier_fountain_aura_custom_buff
return ____exports
