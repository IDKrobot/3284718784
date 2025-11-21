local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 5,["14"] = 6,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 8,["19"] = 9,["20"] = 7,["21"] = 12,["22"] = 13,["23"] = 12,["24"] = 16,["25"] = 17,["26"] = 16,["27"] = 20,["28"] = 21,["29"] = 20,["30"] = 24,["31"] = 25,["32"] = 24,["33"] = 28,["34"] = 29,["35"] = 28,["36"] = 32,["37"] = 33,["38"] = 34,["39"] = 36,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 46,["52"] = 47,["53"] = 36,["54"] = 36,["55"] = 50,["56"] = 50,["57"] = 50,["58"] = 51,["59"] = 50,["60"] = 50,["61"] = 32,["62"] = 6,["63"] = 6,["64"] = 6,["65"] = 5,["68"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.techies_focused_detonate_custom_684 = __TS__Class()
local techies_focused_detonate_custom_684 = ____exports.techies_focused_detonate_custom_684
techies_focused_detonate_custom_684.name = "techies_focused_detonate_custom_684"
__TS__ClassExtends(techies_focused_detonate_custom_684, BaseAbility)
function techies_focused_detonate_custom_684.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_techies.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_techies.vsndevts")
end
function techies_focused_detonate_custom_684.prototype.GetAOERadius(self)
    return self:GetSpecialValueFor("radius")
end
function techies_focused_detonate_custom_684.prototype.RequiresFacing(self)
    return false
end
function techies_focused_detonate_custom_684.prototype.IsStealable(self)
    return false
end
function techies_focused_detonate_custom_684.prototype.ProcsMagicStick(self)
    return false
end
function techies_focused_detonate_custom_684.prototype.GetAssociatedPrimaryAbilities(self)
    return "techies_remote_mines_custom_684"
end
function techies_focused_detonate_custom_684.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local mines = __TS__ArrayFilter(
        FindUnitsInRadius(
            caster:GetTeamNumber(),
            point,
            nil,
            self:GetSpecialValueFor("radius"),
            1,
            32,
            0,
            0,
            false
        ),
        function(____, unit)
            return unit:GetUnitName() == "npc_dota_techies_684_remote_mine_custom" and unit:GetOwner():GetPlayerOwnerID() == caster:GetPlayerOwnerID() and not unit:HasModifier("modifier_dummy")
        end
    )
    __TS__ArrayForEach(
        mines,
        function(____, mine)
            mine:FindAbilityByName("techies_remote_mines_self_detonate_custom_684"):Explode()
        end
    )
end
techies_focused_detonate_custom_684 = __TS__Decorate(
    techies_focused_detonate_custom_684,
    techies_focused_detonate_custom_684,
    {registerAbility(nil)},
    {kind = "class", name = "techies_focused_detonate_custom_684"}
)
____exports.techies_focused_detonate_custom_684 = techies_focused_detonate_custom_684
return ____exports
