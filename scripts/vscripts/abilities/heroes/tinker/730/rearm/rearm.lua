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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 2,["18"] = 2,["19"] = 6,["20"] = 7,["21"] = 6,["22"] = 7,["24"] = 7,["25"] = 8,["26"] = 10,["27"] = 10,["28"] = 10,["29"] = 10,["30"] = 10,["31"] = 10,["32"] = 10,["33"] = 10,["34"] = 10,["35"] = 10,["36"] = 10,["37"] = 10,["38"] = 10,["39"] = 10,["40"] = 10,["41"] = 10,["42"] = 10,["43"] = 10,["44"] = 29,["45"] = 6,["46"] = 31,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 31,["52"] = 35,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 36,["57"] = 35,["58"] = 39,["59"] = 40,["60"] = 41,["61"] = 39,["62"] = 44,["63"] = 45,["64"] = 44,["65"] = 48,["66"] = 49,["67"] = 48,["68"] = 52,["69"] = 53,["70"] = 55,["71"] = 57,["72"] = 57,["73"] = 57,["74"] = 57,["75"] = 57,["76"] = 57,["77"] = 66,["78"] = 67,["79"] = 67,["80"] = 67,["81"] = 68,["82"] = 68,["83"] = 68,["84"] = 69,["85"] = 70,["86"] = 70,["87"] = 70,["88"] = 70,["89"] = 71,["90"] = 73,["91"] = 75,["92"] = 76,["93"] = 76,["94"] = 76,["95"] = 77,["96"] = 76,["97"] = 76,["99"] = 81,["100"] = 52,["101"] = 84,["102"] = 85,["103"] = 87,["104"] = 89,["105"] = 90,["106"] = 91,["110"] = 96,["111"] = 96,["112"] = 96,["113"] = 97,["116"] = 98,["119"] = 100,["120"] = 101,["121"] = 102,["122"] = 104,["123"] = 105,["125"] = 107,["127"] = 96,["128"] = 96,["129"] = 111,["130"] = 111,["131"] = 111,["132"] = 112,["135"] = 113,["138"] = 115,["139"] = 116,["141"] = 118,["143"] = 111,["144"] = 111,["145"] = 122,["146"] = 123,["147"] = 123,["149"] = 84,["150"] = 126,["151"] = 127,["152"] = 129,["153"] = 130,["154"] = 135,["155"] = 135,["156"] = 135,["157"] = 135,["158"] = 135,["159"] = 135,["160"] = 135,["161"] = 135,["162"] = 135,["163"] = 136,["164"] = 136,["165"] = 136,["166"] = 136,["167"] = 136,["168"] = 136,["169"] = 136,["170"] = 136,["171"] = 136,["172"] = 137,["173"] = 126,["174"] = 7,["175"] = 7,["176"] = 7,["177"] = 6,["180"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_tinker_rearm_custom_730 = require("abilities.heroes.tinker.730.rearm.modifier_tinker_rearm_custom_730")
local modifier_tinker_rearm_custom_730 = ____modifier_tinker_rearm_custom_730.modifier_tinker_rearm_custom_730
____exports.tinker_rearm_custom_730 = __TS__Class()
local tinker_rearm_custom_730 = ____exports.tinker_rearm_custom_730
tinker_rearm_custom_730.name = "tinker_rearm_custom_730"
__TS__ClassExtends(tinker_rearm_custom_730, BaseAbility)
function tinker_rearm_custom_730.prototype.____constructor(self, ...)
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
function tinker_rearm_custom_730.prototype.IsItemException(self, item)
    return __TS__ArrayIncludes(
        self.itemExceptions,
        item:GetName()
    )
end
function tinker_rearm_custom_730.prototype.IsAbilityException(self, ability)
    return __TS__ArrayIncludes(
        self.abilityExceptions,
        ability:GetAbilityName()
    )
end
function tinker_rearm_custom_730.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_tinker.vsndevts")
end
function tinker_rearm_custom_730.prototype.IsStealable(self)
    return false
end
function tinker_rearm_custom_730.prototype.GetChannelAnimation(self)
    return 1554 + self:GetLevel()
end
function tinker_rearm_custom_730.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:EmitSound("Hero_Tinker.Rearm")
    modifier_tinker_rearm_custom_730:apply(
        caster,
        caster,
        self,
        {duration = self:GetChannelTime()}
    )
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
    self:PlayEffects()
end
function tinker_rearm_custom_730.prototype.OnChannelFinish(self, interrupted)
    local caster = self:GetCaster()
    caster:StopSound("Hero_Tinker.Rearm")
    if interrupted then
        if caster:HasModifier(modifier_tinker_rearm_custom_730.name) then
            caster:RemoveModifierByName(modifier_tinker_rearm_custom_730.name)
        end
        return
    end
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
            if item:GetPurchaser() ~= caster then
                return
            end
            if self:IsItemException(item) then
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
function tinker_rearm_custom_730.prototype.PlayEffects(self)
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
tinker_rearm_custom_730 = __TS__Decorate(
    tinker_rearm_custom_730,
    tinker_rearm_custom_730,
    {registerAbility(nil)},
    {kind = "class", name = "tinker_rearm_custom_730"}
)
____exports.tinker_rearm_custom_730 = tinker_rearm_custom_730
return ____exports
