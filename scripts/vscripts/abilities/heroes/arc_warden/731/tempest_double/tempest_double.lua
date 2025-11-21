local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 2,["16"] = 2,["17"] = 3,["18"] = 3,["19"] = 5,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 5,["24"] = 5,["25"] = 5,["26"] = 13,["27"] = 19,["28"] = 20,["29"] = 19,["30"] = 20,["32"] = 20,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 23,["43"] = 23,["44"] = 23,["45"] = 23,["46"] = 23,["47"] = 23,["48"] = 23,["49"] = 23,["50"] = 23,["51"] = 23,["52"] = 23,["53"] = 23,["54"] = 23,["55"] = 23,["56"] = 23,["57"] = 23,["58"] = 23,["59"] = 23,["60"] = 23,["61"] = 23,["62"] = 23,["63"] = 19,["64"] = 54,["65"] = 55,["66"] = 56,["67"] = 54,["68"] = 59,["69"] = 60,["70"] = 59,["71"] = 63,["72"] = 64,["73"] = 66,["76"] = 68,["77"] = 69,["80"] = 71,["81"] = 73,["82"] = 74,["83"] = 75,["84"] = 76,["85"] = 77,["86"] = 83,["87"] = 85,["88"] = 85,["89"] = 85,["90"] = 85,["91"] = 85,["92"] = 85,["93"] = 85,["94"] = 87,["95"] = 89,["96"] = 90,["97"] = 92,["98"] = 94,["99"] = 96,["100"] = 97,["101"] = 97,["102"] = 97,["103"] = 97,["104"] = 99,["105"] = 101,["106"] = 103,["107"] = 103,["108"] = 103,["109"] = 103,["110"] = 103,["111"] = 105,["112"] = 107,["113"] = 115,["114"] = 124,["115"] = 129,["116"] = 129,["117"] = 129,["118"] = 129,["119"] = 129,["120"] = 129,["121"] = 129,["122"] = 129,["123"] = 129,["124"] = 130,["125"] = 132,["126"] = 137,["127"] = 137,["128"] = 137,["129"] = 137,["130"] = 137,["131"] = 137,["132"] = 137,["133"] = 137,["134"] = 137,["135"] = 138,["136"] = 140,["137"] = 142,["138"] = 142,["139"] = 142,["140"] = 143,["141"] = 144,["142"] = 142,["143"] = 142,["144"] = 147,["145"] = 148,["146"] = 148,["147"] = 148,["148"] = 148,["149"] = 149,["150"] = 151,["152"] = 63,["153"] = 155,["154"] = 156,["155"] = 158,["156"] = 159,["157"] = 160,["159"] = 162,["160"] = 162,["161"] = 162,["162"] = 162,["163"] = 162,["164"] = 162,["165"] = 162,["166"] = 162,["167"] = 163,["168"] = 170,["169"] = 172,["170"] = 177,["171"] = 177,["172"] = 177,["173"] = 177,["174"] = 177,["175"] = 177,["176"] = 177,["177"] = 177,["178"] = 177,["179"] = 179,["180"] = 180,["181"] = 181,["182"] = 183,["183"] = 183,["184"] = 183,["185"] = 184,["186"] = 184,["187"] = 184,["188"] = 185,["189"] = 185,["190"] = 185,["191"] = 187,["192"] = 187,["193"] = 187,["194"] = 187,["195"] = 189,["196"] = 191,["197"] = 193,["200"] = 197,["201"] = 155,["202"] = 200,["203"] = 201,["204"] = 203,["205"] = 204,["206"] = 205,["207"] = 205,["209"] = 207,["210"] = 209,["211"] = 210,["212"] = 210,["213"] = 210,["214"] = 210,["216"] = 212,["217"] = 213,["218"] = 214,["219"] = 215,["220"] = 216,["221"] = 217,["222"] = 217,["223"] = 217,["224"] = 217,["226"] = 217,["228"] = 219,["229"] = 203,["230"] = 222,["232"] = 224,["233"] = 224,["235"] = 225,["236"] = 226,["237"] = 228,["238"] = 229,["239"] = 230,["240"] = 230,["242"] = 232,["243"] = 233,["244"] = 234,["245"] = 235,["246"] = 236,["247"] = 237,["248"] = 239,["249"] = 240,["251"] = 243,["252"] = 245,["253"] = 245,["255"] = 247,["256"] = 248,["257"] = 249,["258"] = 250,["264"] = 224,["267"] = 256,["268"] = 257,["269"] = 258,["270"] = 259,["271"] = 260,["272"] = 261,["275"] = 200,["276"] = 265,["277"] = 266,["278"] = 268,["279"] = 270,["280"] = 271,["282"] = 273,["283"] = 275,["284"] = 275,["285"] = 275,["286"] = 276,["287"] = 278,["288"] = 283,["289"] = 284,["290"] = 285,["291"] = 285,["292"] = 286,["294"] = 287,["296"] = 285,["297"] = 289,["298"] = 290,["299"] = 290,["300"] = 290,["301"] = 290,["302"] = 290,["303"] = 290,["305"] = 297,["306"] = 298,["309"] = 275,["310"] = 275,["311"] = 302,["312"] = 302,["313"] = 302,["314"] = 303,["315"] = 303,["316"] = 303,["317"] = 302,["318"] = 302,["319"] = 302,["320"] = 302,["321"] = 306,["322"] = 306,["323"] = 306,["324"] = 307,["325"] = 307,["326"] = 307,["327"] = 306,["328"] = 306,["329"] = 308,["330"] = 309,["331"] = 310,["332"] = 312,["333"] = 313,["334"] = 314,["337"] = 318,["338"] = 319,["339"] = 306,["340"] = 306,["341"] = 322,["342"] = 265,["343"] = 20,["344"] = 20,["345"] = 20,["346"] = 19,["349"] = 20});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_arc_warden_tempest_double_custom_731 = require("abilities.heroes.arc_warden.731.tempest_double.modifier_arc_warden_tempest_double_custom_731")
local modifier_arc_warden_tempest_double_custom_731 = ____modifier_arc_warden_tempest_double_custom_731.modifier_arc_warden_tempest_double_custom_731
local ____modifier_arc_warden_tempest_double_custom_731_tracker = require("abilities.heroes.arc_warden.731.tempest_double.modifier_arc_warden_tempest_double_custom_731_tracker")
local modifier_arc_warden_tempest_double_custom_731_tracker = ____modifier_arc_warden_tempest_double_custom_731_tracker.modifier_arc_warden_tempest_double_custom_731_tracker
local ABILITY_EXCEPTIONS = {
    "ability_capture",
    "ability_lamp_use",
    "ability_pluck_famango",
    "twin_gate_portal_warp",
    "old_tinker_high_five"
}
local DISABLED_ABILITIES = {"arc_warden_tempest_double", "arc_warden_tempest_double_custom_731", "rubick_spell_steal"}
____exports.arc_warden_tempest_double_custom_731 = __TS__Class()
local arc_warden_tempest_double_custom_731 = ____exports.arc_warden_tempest_double_custom_731
arc_warden_tempest_double_custom_731.name = "arc_warden_tempest_double_custom_731"
__TS__ClassExtends(arc_warden_tempest_double_custom_731, BaseAbility)
function arc_warden_tempest_double_custom_731.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.itemExceptions = {
        "item_rapier",
        "item_gem",
        "item_aegis",
        "item_clarity",
        "item_faerie_fire",
        "item_smoke_of_deceit",
        "item_ward_observer",
        "item_ward_sentry",
        "item_ward_dispenser",
        "item_enchanted_mango",
        "item_flask",
        "item_tango",
        "item_tango_single",
        "item_tome_of_knowledge",
        "item_blood_grenade",
        "item_dust",
        "item_bottle",
        "item_aghanims_shard",
        "item_ultimate_scepter_roshan",
        "item_aghanims_shard_roshan",
        "item_roshans_banner",
        "item_cheese",
        "item_famango",
        "item_great_famango",
        "item_greater_famango",
        "item_royale_with_cheese",
        "item_refresher",
        "item_refresher_shard"
    }
end
function arc_warden_tempest_double_custom_731.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_arc_warden.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_arc_warden.vsndevts")
end
function arc_warden_tempest_double_custom_731.prototype.GetIntrinsicModifierName(self)
    return modifier_arc_warden_tempest_double_custom_731_tracker.name
end
function arc_warden_tempest_double_custom_731.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    if caster:IsTempestDouble() then
        return
    end
    local tempest = self:GetTempest()
    if not tempest or tempest:IsNull() then
        return
    end
    tempest:RespawnHero(false, false)
    tempest:SetBaseDamageMin(27)
    tempest:SetBaseDamageMax(37)
    tempest:SetHealth(caster:GetHealth())
    tempest:SetMana(caster:GetMana())
    tempest:SetPrimaryAttribute(DOTA_ATTRIBUTE_AGILITY)
    tempest:CalculateStatBonus(true)
    tempest:Purge(
        true,
        true,
        false,
        true,
        true
    )
    tempest:SetAbilityPoints(0)
    tempest:SetHasInventory(false)
    tempest:SetCanSellItems(false)
    tempest:SetForwardVector(caster:GetForwardVector())
    tempest.owner = caster
    tempest:RemoveModifierByName("modifier_fountain_invulnerability")
    Timers:CreateTimer(
        FrameTime(),
        function() return tempest:RemoveModifierByName("modifier_fountain_invulnerability") end
    )
    caster.custom_data.tempest_double = tempest
    tempest:RemoveGesture(ACT_DOTA_DIE)
    FindClearSpaceForUnit(
        tempest,
        caster:GetAbsOrigin(),
        true
    )
    local duration = self:GetSpecialValueFor("duration")
    tempest:AddNewModifier(caster, self, "modifier_kill", {duration = duration})
    modifier_arc_warden_tempest_double_custom_731:apply(tempest, caster, self, {duration = duration})
    local caster_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_arc_warden/arc_warden_tempest_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    ParticleManager:SetParticleControlEnt(
        caster_particle,
        0,
        caster,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        caster:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(caster_particle)
    local tempest_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_arc_warden/arc_warden_tempest_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, tempest)
    ParticleManager:SetParticleControlEnt(
        tempest_particle,
        0,
        tempest,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        tempest:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(tempest_particle)
    caster:EmitSound("Hero_ArcWarden.TempestDouble")
    Timers:CreateTimer(
        0.03,
        function()
            self:ManageItems(tempest)
            self:ManageBuffs(tempest)
        end
    )
    if RollPercentage(75) and caster:GetUnitName() == "npc_dota_hero_arc_warden" then
        local random = RollVoiceLines(
            nil,
            __TS__Spread(range(nil, 1, 6))
        )
        local response = "arc_warden_arcwar_tempest_double_" .. random
        caster:EmitSoundOnClient(response)
    end
end
function arc_warden_tempest_double_custom_731.prototype.GetTempest(self, origin)
    local caster = self:GetCaster()
    if not self.tempest then
        if caster.custom_data.tempest_double then
            self.tempest = caster.custom_data.tempest_double
        else
            local tempest = CreateUnitByName(
                caster:GetUnitName(),
                origin or caster:GetAbsOrigin(),
                true,
                caster,
                caster,
                caster:GetTeamNumber()
            )
            tempest:AddNewModifier(caster, self, "modifier_arc_warden_tempest_double", {})
            tempest:RemoveModifierByName("modifier_fountain_invulnerability")
            local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_arc_warden/arc_warden_tempest_eyes.vpcf", PATTACH_ABSORIGIN, tempest)
            ParticleManager:SetParticleControlEnt(
                particle,
                0,
                tempest,
                PATTACH_POINT_FOLLOW,
                "attach_head",
                tempest:GetAbsOrigin(),
                true
            )
            tempest.owner = caster
            tempest:SetUnitCanRespawn(true)
            tempest:SetRespawnsDisabled(true)
            tempest.IsRealHero = function(self)
                return true
            end
            tempest.IsMainHero = function(self)
                return false
            end
            tempest.IsTempestDouble = function(self)
                return true
            end
            tempest:SetControllableByPlayer(
                caster:GetPlayerOwnerID(),
                true
            )
            tempest:SetRenderColor(0, 0, 190)
            tempest:CalculateStatBonus(true)
            self.tempest = tempest
        end
    end
    return self.tempest
end
function arc_warden_tempest_double_custom_731.prototype.ManageItems(self, tempest)
    local caster = self:GetCaster()
    local function addItem(____, itemName, index)
        local newItem = CreateItem(itemName, nil, nil)
        if newItem == nil then
            return nil
        end
        tempest:AddItem(newItem)
        if index ~= nil then
            tempest:SwapItems(
                newItem:GetItemSlot(),
                index
            )
        end
        newItem:SetSellable(false)
        newItem:SetDroppable(false)
        newItem:SetShareability(ITEM_FULLY_SHAREABLE)
        newItem:SetPurchaser(nil)
        if newItem:GetName() == "item_black_king_bar_custom_728" then
            local ____newItem_SetLevel_1 = newItem.SetLevel
            local ____tempest_custom_data_bkb_level_0 = tempest.custom_data.bkb_level
            if ____tempest_custom_data_bkb_level_0 == nil then
                ____tempest_custom_data_bkb_level_0 = 1
            end
            ____newItem_SetLevel_1(newItem, ____tempest_custom_data_bkb_level_0)
        end
        return newItem
    end
    local cooldownMidas = false
    do
        local i = 0
        while i <= DOTA_ITEM_SLOT_9 do
            do
                local caster_item = caster:GetItemInSlot(i)
                local tempest_item = tempest:GetItemInSlot(i)
                if caster_item ~= nil and tempest_item == nil then
                    local itemName = caster_item:GetName()
                    if not caster_item:IsPermanent() or __TS__ArrayIncludes(self.itemExceptions, itemName) then
                        goto __continue22
                    end
                    addItem(nil, itemName, i)
                elseif caster_item == nil and tempest_item ~= nil then
                    UTIL_Remove(tempest_item)
                elseif caster_item ~= nil and tempest_item ~= nil then
                    if caster_item:GetName() ~= tempest_item:GetName() then
                        local itemName = caster_item:GetName()
                        if tempest_item:GetName() == "item_hand_of_midas" and not tempest_item:IsFullyCastable() then
                            cooldownMidas = true
                        end
                        UTIL_Remove(tempest_item)
                        if not caster_item:IsPermanent() or __TS__ArrayIncludes(self.itemExceptions, itemName) then
                            goto __continue22
                        end
                        local newItem = addItem(nil, itemName, i)
                        if newItem and newItem:GetName() == "item_hand_of_midas" and cooldownMidas then
                            newItem:RefreshCharges()
                            newItem:SetCurrentCharges(0)
                        end
                    end
                end
            end
            ::__continue22::
            i = i + 1
        end
    end
    UTIL_Remove(tempest:FindItemInInventory("item_tpscroll"))
    local tpScroll = caster:FindItemInInventory("item_tpscroll")
    if tpScroll then
        local newItem = addItem(nil, "item_tpscroll")
        if newItem and tpScroll:GetCurrentCharges() > 0 then
            newItem:SetCurrentCharges(tpScroll:GetCurrentCharges())
        end
    end
end
function arc_warden_tempest_double_custom_731.prototype.ManageBuffs(self, tempest)
    local caster = self:GetCaster()
    local level = caster:GetLevel()
    while tempest:GetLevel() < level do
        tempest:HeroLevelUp(false)
    end
    tempest:SetAbilityPoints(0)
    __TS__ArrayForEach(
        caster:FindAllModifiers(),
        function(____, modifier)
            local modifierName = modifier:GetName()
            if modifier.StackOnIllusion ~= nil and modifier:StackOnIllusion() or modifierName == "modifier_item_ultimate_scepter_consumed" or modifierName == "modifier_item_aghanims_shard" or modifierName == "modifier_item_moon_shard_consumed" then
                local tempest_modifier = tempest:FindModifierByName(modifierName)
                local ability = modifier:GetAbility()
                local ____temp_2
                if ability ~= nil and tempest:HasAbility(ability:GetName()) then
                    ____temp_2 = tempest:FindAbilityByName(ability:GetName())
                else
                    ____temp_2 = nil
                end
                local cast_ability = ____temp_2
                if not tempest_modifier then
                    tempest_modifier = tempest:AddNewModifier(
                        tempest,
                        cast_ability,
                        modifier:GetName(),
                        {}
                    )
                end
                if tempest_modifier ~= nil then
                    tempest_modifier:SetStackCount(modifier:GetStackCount())
                end
            end
        end
    )
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            tempest:GetAbilities(),
            function(____, ability) return not __TS__ArrayIncludes(
                ABILITY_EXCEPTIONS,
                ability:GetAbilityName()
            ) end
        ),
        function(____, ability) return tempest:RemoveAbilityByHandle(ability) end
    )
    __TS__ArrayForEach(
        __TS__ArrayFilter(
            caster:GetAbilities(),
            function(____, ability) return not __TS__ArrayIncludes(
                ABILITY_EXCEPTIONS,
                ability:GetAbilityName()
            ) end
        ),
        function(____, ability)
            local abilityName = ability:GetAbilityName()
            local tempest_ability = tempest:AddAbility(abilityName)
            if __TS__ArrayIncludes(DISABLED_ABILITIES, abilityName) then
                tempest_ability:SetLevel(0)
                tempest_ability:SetActivated(false)
                return
            end
            tempest_ability:SetHidden(ability:IsHidden())
            tempest_ability:SetLevel(ability:GetLevel())
        end
    )
    tempest:CalculateStatBonus(true)
end
arc_warden_tempest_double_custom_731 = __TS__Decorate(
    arc_warden_tempest_double_custom_731,
    arc_warden_tempest_double_custom_731,
    {registerAbility(nil)},
    {kind = "class", name = "arc_warden_tempest_double_custom_731"}
)
____exports.arc_warden_tempest_double_custom_731 = arc_warden_tempest_double_custom_731
return ____exports
