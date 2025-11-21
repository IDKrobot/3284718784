local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 2,["18"] = 2,["19"] = 6,["20"] = 7,["21"] = 6,["22"] = 7,["24"] = 7,["25"] = 8,["26"] = 10,["27"] = 10,["28"] = 10,["29"] = 10,["30"] = 10,["31"] = 10,["32"] = 10,["33"] = 10,["34"] = 10,["35"] = 10,["36"] = 10,["37"] = 10,["38"] = 10,["39"] = 10,["40"] = 10,["41"] = 10,["42"] = 10,["43"] = 10,["44"] = 29,["45"] = 6,["46"] = 31,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 31,["52"] = 35,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 36,["57"] = 35,["58"] = 39,["59"] = 40,["60"] = 41,["61"] = 39,["62"] = 44,["63"] = 45,["64"] = 44,["65"] = 48,["66"] = 49,["67"] = 51,["68"] = 52,["69"] = 54,["70"] = 48,["71"] = 57,["72"] = 58,["73"] = 60,["74"] = 61,["75"] = 57,["76"] = 64,["77"] = 65,["78"] = 64,["79"] = 68,["80"] = 69,["81"] = 71,["82"] = 71,["83"] = 71,["84"] = 71,["85"] = 71,["86"] = 71,["87"] = 80,["88"] = 81,["89"] = 82,["90"] = 82,["91"] = 82,["92"] = 83,["93"] = 83,["94"] = 83,["95"] = 84,["96"] = 85,["97"] = 85,["98"] = 85,["99"] = 85,["100"] = 86,["101"] = 88,["102"] = 90,["103"] = 91,["104"] = 91,["105"] = 91,["106"] = 92,["107"] = 91,["108"] = 91,["111"] = 97,["112"] = 68,["113"] = 100,["114"] = 101,["115"] = 103,["116"] = 105,["117"] = 106,["118"] = 107,["120"] = 109,["123"] = 113,["124"] = 115,["125"] = 115,["126"] = 115,["127"] = 116,["130"] = 117,["133"] = 119,["134"] = 120,["135"] = 121,["136"] = 123,["137"] = 124,["139"] = 126,["141"] = 115,["142"] = 115,["143"] = 130,["144"] = 130,["145"] = 130,["146"] = 131,["149"] = 132,["152"] = 134,["153"] = 135,["155"] = 137,["157"] = 130,["158"] = 130,["159"] = 141,["160"] = 142,["161"] = 142,["163"] = 100,["164"] = 145,["165"] = 146,["166"] = 148,["167"] = 149,["168"] = 154,["169"] = 154,["170"] = 154,["171"] = 154,["172"] = 154,["173"] = 154,["174"] = 154,["175"] = 154,["176"] = 154,["177"] = 155,["178"] = 155,["179"] = 155,["180"] = 155,["181"] = 155,["182"] = 155,["183"] = 155,["184"] = 155,["185"] = 155,["186"] = 156,["187"] = 145,["188"] = 7,["189"] = 7,["190"] = 7,["191"] = 6,["194"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_tinker_rearm_custom_707 = require("abilities.heroes.tinker.707.rearm.modifier_tinker_rearm_custom_707")
local modifier_tinker_rearm_custom_707 = ____modifier_tinker_rearm_custom_707.modifier_tinker_rearm_custom_707
____exports.tinker_rearm_custom_707 = __TS__Class()
local tinker_rearm_custom_707 = ____exports.tinker_rearm_custom_707
tinker_rearm_custom_707.name = "tinker_rearm_custom_707"
__TS__ClassExtends(tinker_rearm_custom_707, BaseAbility)
function tinker_rearm_custom_707.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.phraseCooldown = false
    self.itemExceptions = {
        "item_aeon_disk",
        "item_arcane_boots",
        "item_black_king_bar",
        "item_black_king_bar_custom_728",
        "item_hand_of_midas",
        "item_hand_of_midas_custom_727",
        "item_helm_of_the_dominator",
        "item_meteor_hammer",
        "item_necronomicon",
        "item_necronomicon_2",
        "item_necronomicon_3",
        "item_refresher",
        "item_refresher_custom",
        "item_refresher_shard",
        "item_pipe",
        "item_sphere"
    }
    self.abilityExceptions = {}
end
function tinker_rearm_custom_707.prototype.IsItemException(self, item)
    return __TS__ArrayIncludes(
        self.itemExceptions,
        item:GetName()
    )
end
function tinker_rearm_custom_707.prototype.IsAbilityException(self, ability)
    return __TS__ArrayIncludes(
        self.abilityExceptions,
        ability:GetAbilityName()
    )
end
function tinker_rearm_custom_707.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function tinker_rearm_custom_707.prototype.IsStealable(self)
    return false
end
function tinker_rearm_custom_707.prototype.OnAbilityPhaseStart(self)
    local caster = self:GetCaster()
    caster:StartGesture(self:GetChannelAnimation())
    caster:EmitSound("Hero_Tinker.Rearm")
    return true
end
function tinker_rearm_custom_707.prototype.OnAbilityPhaseInterrupted(self)
    local caster = self:GetCaster()
    caster:RemoveGesture(self:GetChannelAnimation())
    caster:StopSound("Hero_Tinker.Rearm")
end
function tinker_rearm_custom_707.prototype.GetChannelAnimation(self)
    return 1554 + self:GetLevel()
end
function tinker_rearm_custom_707.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    modifier_tinker_rearm_custom_707:apply(
        caster,
        caster,
        self,
        {duration = self:GetChannelTime()}
    )
    if IsServer() then
        if not self.phraseCooldown and caster:GetUnitName() == "npc_dota_hero_tinker" then
            local ____array_0 = __TS__SparseArrayNew(__TS__Spread(range(nil, 1, 5)))
            __TS__SparseArrayPush(____array_0, 7, 8)
            local random_list_all = {__TS__SparseArraySpread(____array_0)}
            local ____array_1 = __TS__SparseArrayNew(unpack(random_list_all))
            __TS__SparseArrayPush(____array_1, 9, 11)
            local random_list_lvl1 = {__TS__SparseArraySpread(____array_1)}
            local list = self:GetLevel() == 1 and random_list_lvl1 or random_list_all
            local random = RollVoiceLines(
                nil,
                unpack(list)
            )
            local cast_response = "tinker_tink_ability_rearm_" .. random
            caster:EmitSoundOnClient(cast_response)
            self.phraseCooldown = true
            Timers:CreateTimer(
                20,
                function()
                    self.phraseCooldown = false
                end
            )
        end
    end
    self:PlayEffects()
end
function tinker_rearm_custom_707.prototype.OnChannelFinish(self, interrupted)
    local caster = self:GetCaster()
    caster:StopSound("Hero_Tinker.Rearm")
    if interrupted then
        if caster:HasModifier(modifier_tinker_rearm_custom_707.name) then
            caster:RemoveModifierByName(modifier_tinker_rearm_custom_707.name)
        end
        caster:RemoveGesture(self:GetChannelAnimation())
        return
    end
    caster:FadeGesture(self:GetChannelAnimation())
    __TS__ArrayForEach(
        caster:GetAbilities(),
        function(____, ability)
            if ability:GetAbilityType() == ABILITY_TYPE_ATTRIBUTES then
                return
            end
            if self:IsAbilityException(ability) then
                return
            end
            local maxCharges = ability:GetMaxAbilityCharges(ability:GetLevel())
            if maxCharges > 0 then
                local currentCharges = ability:GetCurrentAbilityCharges()
                ability:RefreshCharges()
                ability:SetCurrentAbilityCharges(math.min(currentCharges + 1, maxCharges))
            else
                ability:EndCooldown()
            end
        end
    )
    __TS__ArrayForEach(
        caster:GetItems(8),
        function(____, item)
            if self:IsItemException(item) then
                return
            end
            if item:GetPurchaser() ~= caster then
                return
            end
            if item:IsBlinkDagger() then
                item:EndCooldown(true)
            else
                item:EndCooldown()
            end
        end
    )
    local tpScroll = caster:GetItemInSlot(DOTA_ITEM_TP_SCROLL)
    if tpScroll and not self:IsItemException(tpScroll) then
        tpScroll:EndCooldown()
    end
end
function tinker_rearm_custom_707.prototype.PlayEffects(self)
    local caster = self:GetCaster()
    local particleName = ParticleManager:GetParticleReplacement("particles/units/heroes/hero_tinker/tinker_rearm.vpcf", caster)
    local particle = ParticleManager:CreateParticle(particleName, PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        particle,
        0,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack2",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack3",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
end
tinker_rearm_custom_707 = __TS__Decorate(
    tinker_rearm_custom_707,
    tinker_rearm_custom_707,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_rearm_custom_707"}
)
____exports.tinker_rearm_custom_707 = tinker_rearm_custom_707
return ____exports
