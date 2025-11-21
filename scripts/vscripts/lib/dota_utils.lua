local ____lualib = require("lualib_bundle")
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 2,["11"] = 1,["12"] = 5,["13"] = 6,["14"] = 5,["15"] = 9,["16"] = 10,["17"] = 9,["18"] = 13,["19"] = 14,["20"] = 13,["21"] = 17,["22"] = 18,["23"] = 17,["24"] = 21,["25"] = 22,["27"] = 24,["28"] = 24,["30"] = 25,["31"] = 26,["32"] = 26,["34"] = 28,["37"] = 24,["40"] = 31,["41"] = 21,["42"] = 34,["43"] = 35,["45"] = 37,["46"] = 37,["48"] = 38,["49"] = 39,["50"] = 39,["52"] = 41,["55"] = 37,["58"] = 44,["59"] = 34,["60"] = 47,["61"] = 48,["62"] = 47,["63"] = 51,["64"] = 52,["65"] = 53,["66"] = 53,["68"] = 55,["69"] = 51,["70"] = 58,["71"] = 59,["72"] = 58,["73"] = 62,["74"] = 63,["75"] = 62,["76"] = 66,["77"] = 67,["78"] = 66,["79"] = 70,["80"] = 71,["81"] = 70,["82"] = 74,["83"] = 75,["84"] = 74,["85"] = 78,["86"] = 79,["87"] = 78,["88"] = 82,["89"] = 83,["90"] = 82,["91"] = 91,["92"] = 92,["93"] = 92,["95"] = 93,["96"] = 91,["97"] = 96,["98"] = 98,["99"] = 106,["101"] = 109,["102"] = 96,["103"] = 112,["104"] = 114,["105"] = 117,["107"] = 119,["108"] = 119,["109"] = 119,["110"] = 119,["111"] = 112,["112"] = 125,["113"] = 126,["114"] = 126,["115"] = 126,["116"] = 126,["117"] = 126,["118"] = 125,["119"] = 131,["120"] = 132,["121"] = 132,["122"] = 132,["123"] = 132,["124"] = 132,["125"] = 132,["126"] = 132,["127"] = 140,["128"] = 140,["129"] = 140,["130"] = 140,["131"] = 142,["132"] = 142,["133"] = 142,["134"] = 142,["135"] = 142,["136"] = 142,["137"] = 148,["138"] = 148,["139"] = 148,["140"] = 148,["141"] = 148,["142"] = 148,["143"] = 142,["144"] = 142,["145"] = 153,["146"] = 131,["147"] = 156,["148"] = 157,["149"] = 156,["150"] = 160,["151"] = 161,["152"] = 162,["153"] = 163,["154"] = 160,["155"] = 166,["156"] = 167,["157"] = 168,["158"] = 166,["159"] = 171,["160"] = 172,["161"] = 172,["162"] = 172,["163"] = 172,["164"] = 171,["165"] = 176,["166"] = 177,["167"] = 177,["168"] = 177,["169"] = 177,["170"] = 176,["171"] = 180,["172"] = 181,["173"] = 181,["174"] = 181,["175"] = 182,["176"] = 183,["177"] = 185,["178"] = 181,["179"] = 181,["180"] = 180,["181"] = 192,["182"] = 193,["183"] = 192,["184"] = 196,["185"] = 197,["186"] = 196,["187"] = 207,["188"] = 208,["189"] = 210,["190"] = 211,["191"] = 213,["192"] = 213,["193"] = 213,["194"] = 213,["195"] = 218,["196"] = 219,["197"] = 219,["198"] = 219,["199"] = 219,["200"] = 220,["201"] = 220,["202"] = 220,["203"] = 220,["205"] = 226,["207"] = 229,["208"] = 207,["209"] = 232,["210"] = 233,["211"] = 235,["212"] = 236,["213"] = 243,["214"] = 243,["215"] = 243,["216"] = 243,["218"] = 246,["219"] = 246,["220"] = 246,["221"] = 246,["222"] = 232,["223"] = 249,["224"] = 250,["225"] = 252,["226"] = 252,["227"] = 252,["228"] = 252,["229"] = 252,["230"] = 252,["231"] = 252,["232"] = 252,["233"] = 252,["234"] = 252,["235"] = 252,["236"] = 252,["237"] = 252,["238"] = 252,["239"] = 252,["240"] = 252,["241"] = 252,["242"] = 252,["243"] = 252,["244"] = 252,["245"] = 252,["246"] = 252,["247"] = 252,["248"] = 252,["249"] = 252,["250"] = 252,["251"] = 282,["252"] = 284,["253"] = 284,["254"] = 285,["256"] = 286,["257"] = 286,["258"] = 287,["259"] = 287,["260"] = 287,["261"] = 287,["263"] = 288,["265"] = 286,["267"] = 284,["268"] = 249,["269"] = 291,["270"] = 292,["271"] = 294,["272"] = 294,["273"] = 294,["274"] = 294,["275"] = 294,["276"] = 294,["277"] = 294,["278"] = 294,["279"] = 294,["280"] = 304,["281"] = 305,["282"] = 305,["283"] = 306,["285"] = 307,["287"] = 305,["288"] = 291,["289"] = 310,["290"] = 311,["291"] = 312,["292"] = 313,["293"] = 313,["295"] = 314,["296"] = 315,["297"] = 316,["299"] = 318,["300"] = 319,["301"] = 320,["304"] = 324,["305"] = 310,["309"] = 332,["310"] = 346,["311"] = 347,["312"] = 349,["313"] = 350,["314"] = 352,["315"] = 354,["316"] = 354,["317"] = 354,["318"] = 354,["319"] = 354,["320"] = 354,["321"] = 354,["322"] = 354,["323"] = 354,["324"] = 354,["325"] = 354,["326"] = 354,["327"] = 364,["328"] = 365,["329"] = 366,["330"] = 370,["331"] = 370,["332"] = 370,["333"] = 370,["334"] = 372,["335"] = 373,["336"] = 374,["337"] = 376,["338"] = 354,["339"] = 354,["340"] = 332});
GameRules.GetGameModeType = function(self)
    return Settings:GetQuick("GAME_MODE")
end
GameRules.IsTurboMode = function(self)
    return self:GetGameModeType() == "TM"
end
CDOTA_Item.IsBlinkDagger = function(self)
    return false
end
CDOTA_Item.IsOldNeutralItem = function(self)
    return self:GetSpecialValueFor("IsOldNeutralItem") == 1
end
CDOTA_BaseNPC_Hero.GetAllAttributes = function(self)
    return self:GetAgility() + self:GetStrength() + self:GetIntellect(false)
end
CDOTA_BaseNPC.GetAbilities = function(self)
    local result = {}
    do
        local i = 0
        while i < self:GetAbilityCount() do
            do
                local ability = self:GetAbilityByIndex(i)
                if ability == nil then
                    goto __continue8
                end
                result[#result + 1] = ability
            end
            ::__continue8::
            i = i + 1
        end
    end
    return result
end
CDOTA_BaseNPC.GetItems = function(self, slots)
    local items = {}
    do
        local i = 0
        while i <= slots do
            do
                local item = self:GetItemInSlot(i)
                if item == nil then
                    goto __continue11
                end
                items[#items + 1] = item
            end
            ::__continue11::
            i = i + 1
        end
    end
    return items
end
CDOTA_BaseNPC.HasShard = function(self)
    return self:HasModifier("modifier_item_aghanims_shard")
end
CDOTA_BaseNPC.HasTalent = function(self, name)
    local ability = self:FindAbilityByName(name)
    if ability then
        return ability:GetLevel() > 0
    end
    return false
end
CDOTA_BaseNPC.IsOutpost = function(self)
    return self:GetClassname() == "npc_dota_watch_tower"
end
CDOTA_BaseNPC.IsLotusPool = function(self)
    return self:GetClassname() == "npc_dota_mango_tree"
end
CDOTA_BaseNPC.IsTwinGate = function(self)
    return self:GetClassname() == "npc_dota_unit_twin_gate"
end
CDOTA_BaseNPC.IsWatcher = function(self)
    return self:GetClassname() == "npc_dota_lantern"
end
CDOTA_BaseNPC.IsFountain = function(self)
    return self:GetClassname() == "ent_dota_fountain"
end
CDOTA_BaseNPC.IsRoshan = function(self)
    return self:GetUnitName() == "npc_dota_roshan"
end
CDOTA_BaseNPC.IsBuildingType = function(self)
    return self:IsTower() or self:IsBuilding() or self:IsBarracks() or self:IsFort() or self:IsOutpost() or self:IsFountain()
end
CBaseEntity.IsUnit = function(self)
    if self:IsNull() or not self:IsBaseNPC() then
        return false
    end
    return not self:IsBuildingType() and not self:IsOther()
end
CDOTA_BaseNPC.IsFullyRealHero = function(self)
    if not self:IsBaseNPC() or self:IsTempestDouble() or self:IsCreep() or self:IsCreepHero() or self:IsBuildingType() or self:IsOther() or not self:IsRealHero() and self:IsControllableByAnyPlayer() then
        return false
    end
    return self:IsRealHero()
end
CDOTA_BaseNPC.HealingDisabled = function(self)
    if self:HasModifier("modifier_doom_bringer_doom") or self:HasModifier("modifier_doom_bringer_doom_enemy") or self:HasModifier("modifier_ice_blast") then
        return true
    end
    return __TS__ArraySome(
        self:FindAllModifiers(),
        function(____, modifier) return modifier:HasFunction(MODIFIER_PROPERTY_DISABLE_HEALING) and (modifier.GetDisableHealing ~= nil and modifier:GetDisableHealing() == 1) end
    )
end
CDOTA_BaseNPC.EmitSoundOnClient = function(self, soundName)
    CustomGameEventManager:Send_ServerToPlayer(
        self:GetPlayerOwner(),
        "emit_sound_on_client",
        {soundName = soundName}
    )
end
CDOTA_BaseNPC.KillWithExceptions = function(self, ability, attacker)
    local modifier_exceptions = {
        "modifier_abaddon_borrowed_time",
        "modifier_oracle_false_promise_timer",
        "modifier_troll_warlord_battle_trance",
        "modifier_dazzle_shallow_grave",
        "modifier_dazzle_shallow_grave_custom_734"
    }
    __TS__ArrayForEach(
        modifier_exceptions,
        function(____, modifierName) return self:RemoveModifierByName(modifierName) end
    )
    local damageTable = {
        attacker = attacker or self,
        damage = self:GetHealth(),
        damage_type = DAMAGE_TYPE_PURE,
        victim = self,
        ability = ability,
        damage_flags = bit.bor(
            bit.bor(
                bit.bor(DOTA_DAMAGE_FLAG_BYPASSES_INVULNERABILITY, DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION),
                DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL
            ),
            DOTA_DAMAGE_FLAG_NO_DAMAGE_MULTIPLIERS
        )
    }
    ApplyDamage(damageTable)
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
CDOTA_BaseNPC.HasModifiersState = function(self, state)
    return __TS__ArraySome(
        self:FindAllModifiers(),
        function(____, buff) return buff:HasState(state) end
    )
end
CDOTA_BaseNPC.IsDebuffImmune = function(self)
    return __TS__ArraySome(
        self:FindAllModifiers(),
        function(____, modifier) return modifier:HasState(MODIFIER_STATE_DEBUFF_IMMUNE) end
    )
end
CDOTA_BaseNPC.IsLeashed = function(self)
    return __TS__ArraySome(
        self:FindAllModifiers(),
        function(____, modifier)
            local ability = modifier:GetAbility()
            local behavior = ability and ability:GetAbilityTargetFlags()
            return ability and behavior and bit.band(behavior, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES) == 0 and self:IsAbilityImmune() and modifier:HasState(MODIFIER_STATE_TETHERED)
        end
    )
end
CDOTA_BaseNPC.IsAbilityImmune = function(self)
    return self:IsDebuffImmune() or self:IsMagicImmune()
end
CDOTA_BaseNPC.CanTeleport = function(self)
    return not (self:IsRooted() or self:IsHexed() or self:IsNightmared() or self:IsFeared() or self:IsTaunted() or self:IsLeashed())
end
CDOTA_BaseNPC.GetWearables = function(self)
    local models = {}
    local baseModel = self:GetRootMoveParent()
    local model = self:FirstMoveChild()
    models[#models + 1] = {
        modelName = baseModel:GetModelName(),
        material = baseModel:GetMaterialGroupHash()
    }
    while model ~= nil do
        if __TS__ArrayIncludes(
            {"dota_item_wearable", "prop_dynamic", "additional_wearable"},
            model:GetClassname()
        ) then
            models[#models + 1] = {
                modelName = model:GetModelName(),
                material = model:GetMaterialGroupHash()
            }
        end
        model = model:NextMovePeer()
    end
    return models
end
CDOTA_BaseNPC.HasWearable = function(self, wearableName, style)
    local wearables = self:GetWearables()
    if style ~= nil then
        local HASH_STYLES = {[1977497166] = 0, [1055040020] = 0, [628863847] = 1, [1347516877] = 2}
        return __TS__ArraySome(
            wearables,
            function(____, wearable) return wearable.modelName == wearableName and HASH_STYLES[wearable.material] == style end
        )
    end
    return __TS__ArraySome(
        wearables,
        function(____, wearable) return wearable.modelName == wearableName end
    )
end
CDOTA_BaseNPC.HasArcana = function(self, hero)
    local wearables = self:GetWearables()
    local arcanas = {
        npc_dota_hero_pudge = "models/items/pudge/arcana/pudge_arcana_base.vmdl",
        npc_dota_hero_windrunner = "models/items/windrunner/windrunner_arcana/wr_arcana_base.vmdl",
        npc_dota_hero_earthshaker = "models/items/earthshaker/earthshaker_arcana/earthshaker_arcana.vmdl",
        npc_dota_hero_skeleton_king = "models/items/wraith_king/arcana/wraith_king_arcana.vmdl",
        npc_dota_hero_juggernaut = "models/heroes/juggernaut/juggernaut_arcana.vmdl",
        npc_dota_hero_lina = "models/heroes/lina/lina.vmdl",
        npc_dota_hero_ogre_magi = "models/items/ogre_magi/ogre_arcana/ogre_magi_arcana.vmdl",
        npc_dota_hero_queenofpain = "models/items/queenofpain/queenofpain_arcana/queenofpain_arcana.vmdl",
        npc_dota_hero_legion_commander = "models/heroes/legion_commander/legion_commander.vmdl",
        npc_dota_hero_spectre = "models/items/spectre/spectre_arcana/spectre_arcana_base.vmdl",
        npc_dota_hero_faceless_void = "models/items/faceless_void/faceless_void_arcana/faceless_void_arcana_base.vmdl",
        npc_dota_hero_razor = "models/items/razor/razor_arcana/razor_arcana_weapon.vmdl",
        npc_dota_hero_drow_ranger = "models/items/drow/drow_arcana/drow_arcana.vmdl",
        npc_dota_hero_vengefulspirit = {"models/items/vengefulspirit/vengeful_spirit_arcana/vengeful_spirit_arcana.vmdl", "models/items/vengefulspirit/imperia/imperia.vmdl"},
        npc_dota_hero_skywrath_mage = "models/items/skywrath_mage/skywrath_arcana/skywrath_arcana.vmdl",
        npc_dota_hero_phantom_assassin = "models/heroes/phantom_assassin/pa_arcana.vmdl",
        npc_dota_hero_nevermore = "models/heroes/shadow_fiend/head_arcana.vmdl",
        npc_dota_hero_terrorblade = "models/heroes/terrorblade/terrorblade_arcana.vmdl",
        npc_dota_hero_crystal_maiden = "models/heroes/crystal_maiden/crystal_maiden_arcana.vmdl",
        npc_dota_hero_monkey_king = "models/items/monkey_king/monkey_king_arcana_head/mesh/monkey_king_arcana.vmdl",
        npc_dota_hero_rubick = "models/items/rubick/rubick_arcana/rubick_arcana_base.vmdl",
        npc_dota_hero_techies = "models/items/techies/bigshot/bigshot.vmdl",
        npc_dota_hero_zuus = "models/heroes/zeus/zeus_arcana.vmdl",
        npc_dota_hero_wisp = "models/items/io/io_ti7/io_ti7.vmdl"
    }
    local arcana = arcanas[hero or self:GetUnitName()]
    local ____temp_3
    if arcana == nil then
        ____temp_3 = false
    else
        local ____Array_isArray_result_2
        if __TS__ArrayIsArray(arcana) then
            ____Array_isArray_result_2 = __TS__ArraySome(
                arcana,
                function(____, wearable) return HasWearable(nil, wearables, wearable) end
            )
        else
            ____Array_isArray_result_2 = HasWearable(nil, wearables, arcana)
        end
        ____temp_3 = ____Array_isArray_result_2
    end
    return ____temp_3
end
CDOTA_BaseNPC.HasPersona = function(self, hero)
    local wearables = self:GetWearables()
    local personas = {
        npc_dota_hero_pudge = "models/heroes/pudge_cute/pudge_cute.vmdl",
        npc_dota_hero_antimage = "models/heroes/antimage_female/antimage_female.vmdl",
        npc_dota_hero_invoker = "models/heroes/invoker_kid/invoker_kid.vmdl",
        npc_dota_hero_phantom_assassin = "models/heroes/phantom_assassin_persona/phantom_assassin_persona.vmdl",
        npc_dota_hero_dragon_knight = "models/heroes/dragon_knight_persona/dk_persona_base.vmdl",
        npc_dota_hero_crystal_maiden = "models/heroes/crystal_maiden_persona/crystal_maiden_persona.vmdl",
        npc_dota_hero_mirana = "models/heroes/mirana_persona/mirana_persona_base.vmdl"
    }
    local persona = personas[hero or self:GetUnitName()]
    local ____temp_4
    if persona ~= nil then
        ____temp_4 = HasWearable(nil, wearables, persona)
    else
        ____temp_4 = false
    end
    return ____temp_4
end
CDOTA_BaseNPC.CalculateDuration = function(self, caster, duration)
    local statusResist = self:GetStatusResistance()
    if caster then
        if caster:HasModifier("modifier_item_arcane_blink_custom_731_buff") then
            statusResist = statusResist - 0.2
        end
        if caster:HasAbility("rubick_spell_steal") then
            local spell_steal = caster:FindAbilityByName("rubick_spell_steal")
            statusResist = statusResist - spell_steal:GetSpecialValueFor("stolen_debuff_amp") / 100
        end
        if caster:HasAbility("lion_to_hell_and_back") then
            local hell_and_back = caster:FindAbilityByName("lion_to_hell_and_back")
            statusResist = statusResist - hell_and_back:GetSpecialValueFor("debuff_amp") / 100
        end
    end
    return duration * (1 - statusResist)
end
--- Finds the units in a given cone with the given flags.
-- 
-- @server
function FindUnitsInCone(self, team, location, startLocation, endLocation, cacheUnit, startRadius, endRadius, teamFilter, typeFilter, flagFilter, order, canGrowCache)
    local direction = endLocation:__sub(startLocation)
    direction.z = 0
    local distance = direction:Length2D()
    direction = direction:Normalized()
    local radius = distance + math.max(startRadius, endRadius)
    return __TS__ArrayFilter(
        FindUnitsInRadius(
            team,
            location,
            cacheUnit,
            radius,
            teamFilter,
            typeFilter,
            flagFilter,
            order,
            canGrowCache
        ),
        function(____, unit)
            local unitLocation = unit:GetAbsOrigin():__sub(startLocation)
            local projection = unitLocation.x * direction.x + unitLocation.y * direction.y + unitLocation.z * direction.z
            projection = math.max(
                math.min(projection, distance),
                0
            )
            local vectorProjection = direction:__mul(projection)
            local unitRadius = unitLocation:__sub(vectorProjection):Length2D()
            local interpretRadius = projection / distance * (endRadius - startRadius) + startRadius
            return unitRadius <= interpretRadius
        end
    )
end
