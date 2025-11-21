local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 6,["14"] = 7,["15"] = 6,["16"] = 7,["18"] = 7,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 21,["27"] = 6,["28"] = 25,["29"] = 26,["30"] = 25,["31"] = 29,["32"] = 30,["33"] = 29,["34"] = 33,["35"] = 34,["36"] = 33,["37"] = 37,["38"] = 38,["39"] = 40,["42"] = 42,["43"] = 43,["44"] = 45,["45"] = 47,["46"] = 48,["47"] = 49,["48"] = 50,["49"] = 51,["50"] = 52,["51"] = 53,["52"] = 55,["53"] = 57,["54"] = 58,["55"] = 59,["56"] = 61,["57"] = 61,["58"] = 61,["59"] = 62,["60"] = 64,["61"] = 64,["62"] = 64,["63"] = 64,["64"] = 61,["65"] = 61,["67"] = 68,["68"] = 68,["69"] = 68,["70"] = 69,["71"] = 70,["72"] = 71,["73"] = 72,["75"] = 75,["76"] = 77,["78"] = 68,["79"] = 68,["80"] = 81,["81"] = 83,["82"] = 84,["83"] = 84,["85"] = 85,["86"] = 87,["87"] = 87,["88"] = 87,["89"] = 87,["90"] = 87,["91"] = 89,["92"] = 93,["93"] = 94,["94"] = 95,["95"] = 95,["96"] = 95,["97"] = 96,["98"] = 97,["99"] = 98,["100"] = 100,["101"] = 101,["102"] = 101,["103"] = 101,["104"] = 101,["105"] = 103,["106"] = 103,["107"] = 103,["108"] = 104,["109"] = 105,["110"] = 106,["112"] = 103,["113"] = 103,["114"] = 95,["115"] = 95,["118"] = 37,["119"] = 114,["120"] = 115,["121"] = 117,["124"] = 119,["125"] = 121,["126"] = 122,["127"] = 123,["128"] = 124,["129"] = 126,["130"] = 126,["131"] = 126,["132"] = 127,["133"] = 129,["134"] = 130,["135"] = 131,["137"] = 126,["138"] = 126,["139"] = 134,["140"] = 135,["141"] = 136,["142"] = 136,["145"] = 139,["146"] = 141,["147"] = 141,["148"] = 141,["149"] = 141,["150"] = 141,["151"] = 143,["152"] = 114,["153"] = 7,["154"] = 7,["155"] = 7,["156"] = 6,["159"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_morphling_replicate_custom_729 = __TS__Class()
local modifier_morphling_replicate_custom_729 = ____exports.modifier_morphling_replicate_custom_729
modifier_morphling_replicate_custom_729.name = "modifier_morphling_replicate_custom_729"
__TS__ClassExtends(modifier_morphling_replicate_custom_729, BaseModifier)
function modifier_morphling_replicate_custom_729.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.abilities = {
        "morphling_waveform_custom_729",
        "morphling_adaptive_strike_agi_custom_729",
        "morphling_adaptive_strike_str_custom_729",
        "morphling_morph_agi_custom_729",
        "morphling_morph_str_custom_729"
    }
    self.abilityLevels = {}
end
function modifier_morphling_replicate_custom_729.prototype.IsHidden(self)
    return true
end
function modifier_morphling_replicate_custom_729.prototype.IsPurgable(self)
    return false
end
function modifier_morphling_replicate_custom_729.prototype.IsPurgeException(self)
    return false
end
function modifier_morphling_replicate_custom_729.prototype.OnCreated(self, params)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    local target = EntIndexToHScript(params.target)
    local targetName = target:GetUnitName()
    local playerId = tostring(parent:GetPlayerID())
    local ability = self:GetAbility()
    local attribute = nil
    if ability and ability.target and not ability.target:IsNull() then
        self.agility = parent:GetBaseAgility()
        self.strength = parent:GetBaseStrength()
        self.intellect = parent:GetBaseIntellect()
        self.attribute = parent:GetPrimaryAttribute()
        attribute = ability.target:GetPrimaryAttribute()
        parent:SetBaseAgility(ability.target:GetBaseAgility())
        parent:SetBaseStrength(ability.target:GetBaseStrength())
        parent:SetBaseIntellect(ability.target:GetBaseIntellect())
        Timers:CreateTimer(
            FrameTime(),
            function()
                parent:SetPrimaryAttribute(attribute)
                Timers:CreateTimer(
                    FrameTime(),
                    function() return parent:CalculateStatBonus(true) end
                )
            end
        )
    end
    __TS__ArrayForEach(
        self.abilities,
        function(____, abilityName)
            local ability = parent:FindAbilityByName(abilityName)
            if ability then
                if ability:IsToggle() and ability:GetToggleState() then
                    ability:ToggleAbility()
                end
                self.abilityLevels[abilityName] = ability:GetLevel()
                parent:RemoveAbilityByHandle(ability)
            end
        end
    )
    self.morphlingData = CustomNetTables:GetTableValue("heroes", "npc_dota_hero_morphling")
    local targetData = CustomNetTables:GetTableValue("heroes", targetName) or ({})
    if attribute then
        targetData.mainAttribute = attribute
    end
    CustomNetTables:SetTableValue("heroes", "npc_dota_hero_morphling", targetData)
    CustomGameEventManager:Send_ServerToPlayer(
        parent:GetPlayerOwner(),
        "dota_hud_refresh_unit",
        {}
    )
    CustomNetTables:SetTableValue("morphed_hero", playerId, {hero = targetName})
    if targetName == "npc_dota_hero_invoker" then
        if targetData.selectedPatch == "7.32" then
            Timers:CreateTimer(
                FrameTime(),
                function()
                    local invoke = parent:AddAbility("invoker_invoke_custom_732")
                    invoke:SetHidden(true)
                    invoke:SetStolen(true)
                    local targetInvoke = target:FindAbilityByName("invoker_invoke_custom_732")
                    local invokedAbilities = __TS__ArrayMap(
                        targetInvoke.abilityManager.ability_slot,
                        function(____, ability) return ability:GetAbilityName() end
                    )
                    __TS__ArrayForEach(
                        invokedAbilities,
                        function(____, abilityName)
                            local ability = parent:FindAbilityByName(abilityName)
                            if ability then
                                ability:SetHidden(false)
                            end
                        end
                    )
                end
            )
        end
    end
end
function modifier_morphling_replicate_custom_729.prototype.OnDestroy(self)
    local parent = self:GetParent()
    if not IsServer() then
        return
    end
    local playerId = tostring(parent:GetPlayerID())
    parent:SetBaseAgility(self.agility)
    parent:SetBaseStrength(self.strength)
    parent:SetBaseIntellect(self.intellect)
    parent:SetPrimaryAttribute(self.attribute)
    __TS__ArrayForEach(
        self.abilities,
        function(____, abilityName)
            local ability = parent:AddAbility(abilityName)
            local level = self.abilityLevels[abilityName]
            if level ~= nil then
                ability:SetLevel(level)
            end
        end
    )
    if parent:HasAbility("invoker_invoke_custom_732") then
        local invoke = parent:FindAbilityByName("invoker_invoke_custom_732")
        if invoke then
            invoke:Destroy()
        end
    end
    CustomNetTables:SetTableValue("heroes", "npc_dota_hero_morphling", self.morphlingData)
    CustomGameEventManager:Send_ServerToPlayer(
        parent:GetPlayerOwner(),
        "dota_hud_refresh_unit",
        {}
    )
    CustomNetTables:SetTableValue("morphed_hero", playerId, {hero = ""})
end
modifier_morphling_replicate_custom_729 = __TS__Decorate(
    modifier_morphling_replicate_custom_729,
    modifier_morphling_replicate_custom_729,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_morphling_replicate_custom_729"}
)
____exports.modifier_morphling_replicate_custom_729 = modifier_morphling_replicate_custom_729
return ____exports
