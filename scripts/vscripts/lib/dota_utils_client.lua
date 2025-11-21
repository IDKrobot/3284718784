local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 2,["6"] = 1,["7"] = 5,["8"] = 6,["9"] = 5,["10"] = 9,["11"] = 10,["12"] = 9,["13"] = 13,["14"] = 14,["15"] = 15,["16"] = 15,["18"] = 17,["19"] = 13,["20"] = 20,["21"] = 21,["22"] = 20,["23"] = 24,["24"] = 25,["25"] = 24,["26"] = 28,["27"] = 29,["28"] = 28,["29"] = 32,["30"] = 33,["31"] = 32,["32"] = 36,["33"] = 37,["34"] = 36,["35"] = 40,["36"] = 41,["37"] = 40,["38"] = 44,["39"] = 45,["40"] = 44,["41"] = 53,["42"] = 54,["43"] = 53,["44"] = 57,["45"] = 58,["46"] = 59,["47"] = 60,["48"] = 57,["49"] = 63,["50"] = 64,["51"] = 65,["52"] = 63});
C_DOTA_Item.IsBlinkDagger = function(self)
    return false
end
C_DOTA_BaseNPC_Hero.GetAllAttributes = function(self)
    return self:GetAgility() + self:GetStrength() + self:GetIntellect(false)
end
C_DOTA_BaseNPC.HasShard = function(self)
    return self:HasModifier("modifier_item_aghanims_shard")
end
C_DOTA_BaseNPC.HasTalent = function(self, name)
    local ability = self:FindAbilityByName(name)
    if ability then
        return ability:GetLevel() > 0
    end
    return false
end
C_DOTA_BaseNPC.IsOutpost = function(self)
    return self:GetClassname() == "npc_dota_watch_tower"
end
C_DOTA_BaseNPC.IsLotusPool = function(self)
    return self:GetClassname() == "npc_dota_mango_tree"
end
C_DOTA_BaseNPC.IsTwinGate = function(self)
    return self:GetClassname() == "npc_dota_unit_twin_gate"
end
C_DOTA_BaseNPC.IsWatcher = function(self)
    return self:GetClassname() == "npc_dota_lantern"
end
C_DOTA_BaseNPC.IsFountain = function(self)
    return self:GetClassname() == "ent_dota_fountain"
end
C_DOTA_BaseNPC.IsRoshan = function(self)
    return self:GetUnitName() == "npc_dota_roshan"
end
C_DOTA_BaseNPC.IsBuildingType = function(self)
    return self:IsTower() or self:IsBuilding() or self:IsBarracks() or self:IsFort() or self:IsOutpost() or self:IsFountain()
end
CDOTA_Buff.GetAttributeStackingType = function(self)
    return 0
end
CDOTA_Buff.GetCheckStates = function(self)
    local states = {}
    self:CheckStateToTable(states)
    return states
end
CDOTA_Buff.HasState = function(self, state)
    local states = self:GetCheckStates()
    return states[state] == true
end
