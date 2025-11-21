local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 11,["26"] = 21,["27"] = 21,["28"] = 21,["29"] = 21,["30"] = 21,["31"] = 21,["32"] = 11,["33"] = 30,["34"] = 30,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 30,["39"] = 11,["40"] = 41,["41"] = 43,["42"] = 44,["43"] = 43,["44"] = 44,["45"] = 45,["46"] = 46,["47"] = 45,["48"] = 49,["49"] = 50,["50"] = 49,["51"] = 53,["52"] = 54,["53"] = 53,["54"] = 57,["55"] = 58,["56"] = 57,["57"] = 61,["58"] = 62,["59"] = 64,["62"] = 67,["65"] = 75,["66"] = 75,["67"] = 75,["68"] = 75,["69"] = 75,["70"] = 75,["71"] = 84,["72"] = 61,["73"] = 87,["74"] = 88,["75"] = 89,["78"] = 91,["79"] = 92,["82"] = 94,["83"] = 96,["84"] = 101,["85"] = 101,["86"] = 101,["87"] = 101,["88"] = 101,["89"] = 102,["90"] = 102,["91"] = 102,["92"] = 102,["93"] = 102,["94"] = 103,["95"] = 105,["96"] = 107,["97"] = 109,["98"] = 111,["99"] = 112,["100"] = 114,["101"] = 115,["102"] = 116,["103"] = 117,["105"] = 120,["106"] = 121,["107"] = 122,["108"] = 124,["109"] = 126,["110"] = 127,["111"] = 129,["112"] = 130,["113"] = 131,["114"] = 131,["115"] = 131,["116"] = 130,["117"] = 130,["118"] = 130,["119"] = 139,["120"] = 140,["121"] = 140,["122"] = 140,["123"] = 140,["125"] = 150,["126"] = 152,["127"] = 152,["128"] = 152,["129"] = 152,["132"] = 163,["133"] = 165,["134"] = 166,["135"] = 167,["136"] = 167,["137"] = 167,["138"] = 166,["139"] = 166,["140"] = 166,["141"] = 175,["142"] = 176,["143"] = 177,["144"] = 177,["145"] = 177,["146"] = 177,["148"] = 187,["149"] = 189,["150"] = 189,["151"] = 194,["152"] = 194,["153"] = 194,["154"] = 189,["155"] = 189,["158"] = 201,["159"] = 203,["160"] = 203,["161"] = 208,["162"] = 208,["163"] = 208,["164"] = 203,["165"] = 203,["168"] = 216,["169"] = 217,["170"] = 217,["171"] = 217,["172"] = 217,["173"] = 217,["174"] = 217,["175"] = 217,["176"] = 217,["177"] = 217,["179"] = 219,["180"] = 219,["181"] = 219,["182"] = 219,["183"] = 219,["184"] = 219,["185"] = 219,["186"] = 219,["189"] = 87,["190"] = 44,["191"] = 44,["192"] = 44,["193"] = 43,["196"] = 44,["197"] = 224,["198"] = 225,["199"] = 224,["200"] = 225,["202"] = 225,["203"] = 226,["204"] = 227,["205"] = 232,["206"] = 224,["207"] = 234,["208"] = 235,["209"] = 234,["210"] = 238,["211"] = 239,["212"] = 238,["213"] = 242,["214"] = 243,["215"] = 242,["216"] = 246,["217"] = 247,["218"] = 248,["219"] = 249,["220"] = 251,["221"] = 252,["223"] = 246,["224"] = 255,["225"] = 256,["228"] = 257,["231"] = 259,["232"] = 259,["233"] = 259,["234"] = 259,["235"] = 259,["236"] = 259,["237"] = 259,["238"] = 259,["239"] = 259,["240"] = 259,["241"] = 259,["242"] = 259,["243"] = 269,["244"] = 270,["245"] = 259,["246"] = 259,["247"] = 273,["248"] = 274,["249"] = 276,["250"] = 277,["251"] = 278,["252"] = 280,["253"] = 282,["254"] = 284,["255"] = 285,["256"] = 287,["257"] = 287,["258"] = 287,["259"] = 287,["260"] = 287,["261"] = 287,["262"] = 287,["263"] = 287,["264"] = 287,["265"] = 296,["266"] = 296,["267"] = 296,["268"] = 287,["269"] = 287,["270"] = 301,["271"] = 303,["272"] = 304,["273"] = 306,["274"] = 306,["275"] = 306,["276"] = 306,["277"] = 306,["278"] = 306,["279"] = 306,["280"] = 306,["281"] = 306,["282"] = 306,["283"] = 317,["284"] = 319,["286"] = 321,["287"] = 323,["288"] = 323,["289"] = 323,["290"] = 323,["291"] = 323,["292"] = 323,["293"] = 323,["294"] = 323,["295"] = 323,["296"] = 323,["297"] = 323,["298"] = 323,["299"] = 332,["301"] = 255,["302"] = 336,["303"] = 337,["304"] = 337,["305"] = 337,["306"] = 337,["307"] = 337,["308"] = 337,["309"] = 337,["310"] = 337,["311"] = 344,["312"] = 344,["313"] = 344,["314"] = 337,["315"] = 337,["316"] = 337,["317"] = 337,["318"] = 347,["319"] = 348,["320"] = 337,["321"] = 337,["322"] = 351,["323"] = 352,["324"] = 354,["325"] = 355,["326"] = 356,["327"] = 357,["328"] = 358,["329"] = 360,["330"] = 362,["331"] = 364,["332"] = 365,["333"] = 367,["334"] = 367,["335"] = 367,["336"] = 367,["337"] = 367,["338"] = 367,["339"] = 367,["340"] = 367,["341"] = 367,["342"] = 376,["343"] = 376,["344"] = 376,["345"] = 367,["346"] = 367,["347"] = 381,["348"] = 383,["349"] = 384,["350"] = 386,["351"] = 386,["352"] = 386,["353"] = 386,["354"] = 386,["355"] = 386,["356"] = 386,["357"] = 386,["358"] = 386,["359"] = 386,["360"] = 397,["361"] = 399,["362"] = 400,["363"] = 401,["365"] = 336,["366"] = 405,["367"] = 406,["368"] = 405,["369"] = 409,["370"] = 410,["371"] = 409,["372"] = 225,["373"] = 225,["374"] = 225,["375"] = 224,["378"] = 225});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____modifier_dummy = require("abilities.generic.modifier_dummy")
local CreateDummy = ____modifier_dummy.CreateDummy
local ____custom_chat = require("lib.custom_chat")
local CustomChat = ____custom_chat.CustomChat
local STYLES = {DEFAULT = {
    cast_sound = "high_five.cast",
    impact_sound = "high_five.impact",
    fail_sound = "high_five.fail",
    impact_particle = "particles/econ/events/plus/high_five/high_five_impact.vpcf",
    travel_particle = "particles/econ/events/plus/high_five/high_five_lvl1_travel.vpcf",
    overhead_particle = "particles/econ/events/plus/high_five/high_five_lvl1_overhead.vpcf"
}, CROWNFALL = {
    cast_sound = "high_five.cast",
    impact_sound = "high_five.impact",
    fail_sound = "high_five.fail",
    impact_particle = "particles/econ/events/crownfall/high_five_crownfall_impact.vpcf",
    travel_particle = "particles/econ/events/crownfall/high_five_crownfall_travel.vpcf",
    overhead_particle = "particles/econ/events/crownfall/high_five_crownfall_overhead.vpcf"
}, FROSTIVUS = {
    cast_sound = "high_five.cast.2023",
    impact_sound = "high_five.impact.2023",
    fail_sound = "high_five.fail",
    impact_particle = "particles/econ/events/frostivus_2023/high_five_mug_impact.vpcf",
    travel_particle = "particles/econ/events/frostivus_2023/high_five_mug_travel.vpcf",
    overhead_particle = "particles/econ/events/frostivus_2023/high_five_mug_overhead.vpcf"
}}
local CURRENT_STYLE = STYLES.DEFAULT
____exports.old_tinker_high_five = __TS__Class()
local old_tinker_high_five = ____exports.old_tinker_high_five
old_tinker_high_five.name = "old_tinker_high_five"
__TS__ClassExtends(old_tinker_high_five, BaseAbility)
function old_tinker_high_five.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds.vsndevts")
end
function old_tinker_high_five.prototype.IsHiddenAbilityCastable(self)
    return true
end
function old_tinker_high_five.prototype.ProcsMagicStick(self)
    return false
end
function old_tinker_high_five.prototype.IsStealable(self)
    return false
end
function old_tinker_high_five.prototype.OnActivate(self)
    local caster = self:GetCaster()
    if caster:HasModifier(____exports.modifier_old_tinker_high_five_search.name) then
        return
    end
    if caster:IsSilenced() or caster:IsStunned() or caster:IsNightmared() or caster:IsCommandRestricted() or caster:IsFeared() or caster:IsOutOfGame() then
        return
    end
    ____exports.modifier_old_tinker_high_five_search:apply(
        caster,
        caster,
        self,
        {duration = self:GetSpecialValueFor("request_duration")}
    )
    caster:EmitSound(CURRENT_STYLE.cast_sound)
end
function old_tinker_high_five.prototype.OnProjectileHit_ExtraData(self, _, location, extraData)
    local caster = self:GetCaster()
    if extraData.target == nil or extraData.dummy == nil then
        return
    end
    local dummy = EntIndexToHScript(extraData.dummy)
    if not dummy or dummy:IsNull() or not IsValidEntity(dummy) then
        return
    end
    local target = EntIndexToHScript(extraData.target)
    local particle = ParticleManager:CreateParticle(CURRENT_STYLE.impact_particle, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(
        particle,
        0,
        dummy:GetAbsOrigin()
    )
    ParticleManager:SetParticleControl(
        particle,
        3,
        dummy:GetAbsOrigin()
    )
    ParticleManager:ReleaseParticleIndex(particle)
    dummy:EmitSound(CURRENT_STYLE.impact_sound)
    UTIL_Remove(dummy)
    local cooldown = self:GetSpecialValueFor("acknowledged_cooldown")
    self:EndCooldown()
    self:StartCooldown(cooldown)
    local targetAbility = target:FindAbilityByName("old_tinker_high_five")
    if targetAbility then
        targetAbility:EndCooldown()
        targetAbility:StartCooldown(cooldown)
    end
    if target ~= nil then
        local target_team = target:GetTeamNumber()
        local caster_team = caster:GetTeamNumber()
        local token
        if not caster:IsFullyRealHero() then
            local owner_id = caster:GetPlayerOwnerID()
            if target:IsBuildingType() then
                token = {
                    hard_replace = {
                        ["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>",
                        ["%s2"] = "#" .. target:GetUnitName()
                    },
                    players = {[owner_id] = CustomChat:Player(1)}
                }
            elseif not target:IsFullyRealHero() then
                token = {
                    hard_replace = {["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>", ["%s2"] = "#npc_dota_tower"},
                    players = {[owner_id] = CustomChat:Player(1)}
                }
            else
                local target_id = target:GetPlayerID()
                token = {
                    hard_replace = {["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>", ["%s2"] = "#npc_dota_tower"},
                    players = {[target_id] = CustomChat:Player(1)}
                }
            end
        else
            local caster_id = caster:GetPlayerID()
            if target:IsBuildingType() then
                token = {
                    hard_replace = {
                        ["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>",
                        ["%s2"] = "#" .. target:GetUnitName()
                    },
                    players = {[caster_id] = CustomChat:Player(1)}
                }
            elseif not target:IsFullyRealHero() then
                if caster:GetUnitName() == target:GetUnitName() then
                    token = {
                        hard_replace = {["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>", ["%s2"] = "#npc_dota_tower"},
                        players = {[caster_id] = CustomChat:Player(1)}
                    }
                else
                    local owner_id = target:GetPlayerOwnerID()
                    token = {
                        hard_replace = {["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>", ["%s2"] = "<font color='{s:player_color_2}'>{s:player_name_2}</font>"},
                        players = {
                            [caster_id] = CustomChat:Player(1),
                            [owner_id] = CustomChat:Player(2)
                        }
                    }
                end
            else
                local target_id = target:GetPlayerID()
                token = {
                    hard_replace = {["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>", ["%s2"] = "<font color='{s:player_color_2}'>{s:player_name_2}</font>"},
                    players = {
                        [caster_id] = CustomChat:Player(1),
                        [target_id] = CustomChat:Player(2)
                    }
                }
            end
        end
        if target_team == caster_team then
            CustomChat:MessageToTeam(
                -1,
                false,
                caster_team,
                "DOTA_HighFive_Completed",
                token,
                true,
                false
            )
        else
            CustomChat:MessageToAll(
                -1,
                false,
                "DOTA_HighFive_Completed",
                token,
                false,
                true
            )
        end
    end
end
old_tinker_high_five = __TS__Decorate(
    old_tinker_high_five,
    old_tinker_high_five,
    {registerAbility(nil)},
    {kind = "class", name = "old_tinker_high_five"}
)
____exports.old_tinker_high_five = old_tinker_high_five
____exports.modifier_old_tinker_high_five_search = __TS__Class()
local modifier_old_tinker_high_five_search = ____exports.modifier_old_tinker_high_five_search
modifier_old_tinker_high_five_search.name = "modifier_old_tinker_high_five_search"
__TS__ClassExtends(modifier_old_tinker_high_five_search, BaseModifier)
function modifier_old_tinker_high_five_search.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.parent = self:GetParent()
    self.ability = self:GetAbility()
    self.finded = false
end
function modifier_old_tinker_high_five_search.prototype.IsHidden(self)
    return true
end
function modifier_old_tinker_high_five_search.prototype.IsPurgable(self)
    return false
end
function modifier_old_tinker_high_five_search.prototype.IsPurgeException(self)
    return false
end
function modifier_old_tinker_high_five_search.prototype.OnCreated(self, params)
    self.find_radius = self:GetSpecialValueFor("acknowledge_range")
    self.speed = self:GetSpecialValueFor("high_five_speed")
    self.think_interval = self:GetSpecialValueFor("think_interval")
    if IsServer() then
        self:StartIntervalThink(self.think_interval)
    end
end
function modifier_old_tinker_high_five_search.prototype.OnDestroy(self)
    if not IsServer() then
        return
    end
    if self.finded then
        return
    end
    local towers = __TS__ArrayFilter(
        FindUnitsInRadius(
            self.parent:GetTeamNumber(),
            self.parent:GetAbsOrigin(),
            nil,
            self.find_radius,
            3,
            4,
            64,
            1,
            false
        ),
        function(____, tower)
            return tower:HasAttackCapability() and tower:GetAttackCapability() == DOTA_UNIT_CAP_RANGED_ATTACK and not tower:IsFountain() or tower:IsFort()
        end
    )
    if #towers > 0 then
        self.finded = true
        local finded_tower = towers[1]
        local finded_tower_origin = finded_tower:GetAbsOrigin()
        local parent_origin = self.parent:GetAbsOrigin()
        local center = finded_tower_origin:__add(parent_origin):__mul(0.5)
        local dummy = CreateDummy(nil, center)
        local velocity = center:__sub(parent_origin):Normalized():__mul(self.speed)
        velocity.z = 0
        local info = {
            Source = self.parent,
            Ability = self.ability,
            vSpawnOrigin = parent_origin,
            EffectName = CURRENT_STYLE.travel_particle,
            fDistance = center:__sub(parent_origin):Length(),
            fStartRadius = 10,
            fEndRadius = 10,
            vVelocity = velocity,
            ExtraData = {
                dummy = dummy:entindex(),
                target = finded_tower:entindex()
            }
        }
        ProjectileManager:CreateLinearProjectile(info)
        velocity = center:__sub(finded_tower_origin):Normalized():__mul(self.speed)
        velocity.z = 0
        info = {
            Source = finded_tower,
            Ability = self.ability,
            vSpawnOrigin = finded_tower_origin,
            EffectName = CURRENT_STYLE.travel_particle,
            fDistance = center:__sub(finded_tower_origin):Length(),
            fStartRadius = 10,
            fEndRadius = 10,
            vVelocity = velocity
        }
        ProjectileManager:CreateLinearProjectile(info)
        self:Destroy()
    else
        local caster_id = self.parent:GetPlayerID()
        CustomChat:MessageToTeam(
            -1,
            false,
            self.parent:GetTeamNumber(),
            "DOTA_HighFive_LeftHanging",
            {
                hard_replace = {["%s1"] = "<font color='{s:player_color_1}'>{s:player_name_1}</font>"},
                players = {[caster_id] = CustomChat:Player(1)}
            },
            true,
            false
        )
        self.parent:EmitSound(CURRENT_STYLE.fail_sound)
    end
end
function modifier_old_tinker_high_five_search.prototype.OnIntervalThink(self)
    local units = __TS__ArrayFilter(
        FindUnitsInRadius(
            self.parent:GetTeamNumber(),
            self.parent:GetAbsOrigin(),
            nil,
            self.find_radius,
            3,
            1,
            bit.bor(
                bit.bor(64, 262144),
                16
            ),
            1,
            false
        ),
        function(____, unit)
            return unit:HasModifier(____exports.modifier_old_tinker_high_five_search.name) and unit ~= self.parent
        end
    )
    if #units > 0 then
        self.finded = true
        local finded_unit = units[1]
        local finded_unit_ability = finded_unit:FindAbilityByName(____exports.old_tinker_high_five.name)
        local finded_unit_origin = finded_unit:GetAbsOrigin()
        local finded_unit_modifier = finded_unit:FindModifierByName(____exports.modifier_old_tinker_high_five_search.name)
        local parent_origin = self.parent:GetAbsOrigin()
        local center = finded_unit_origin:__add(parent_origin):__mul(0.5)
        local dummy = CreateDummy(nil, center)
        local velocity = center:__sub(parent_origin):Normalized():__mul(self.speed)
        velocity.z = 0
        local info = {
            Source = self.parent,
            Ability = self.ability,
            vSpawnOrigin = parent_origin,
            EffectName = CURRENT_STYLE.travel_particle,
            fDistance = center:__sub(parent_origin):Length(),
            fStartRadius = 10,
            fEndRadius = 10,
            vVelocity = velocity,
            ExtraData = {
                dummy = dummy:entindex(),
                target = finded_unit:entindex()
            }
        }
        ProjectileManager:CreateLinearProjectile(info)
        velocity = center:__sub(finded_unit_origin):Normalized():__mul(self.speed)
        velocity.z = 0
        info = {
            Source = finded_unit,
            Ability = finded_unit_ability,
            vSpawnOrigin = finded_unit_origin,
            EffectName = CURRENT_STYLE.travel_particle,
            fDistance = center:__sub(finded_unit_origin):Length(),
            fStartRadius = 10,
            fEndRadius = 10,
            vVelocity = velocity
        }
        ProjectileManager:CreateLinearProjectile(info)
        self:Destroy()
        finded_unit_modifier.finded = true
        finded_unit_modifier:Destroy()
    end
end
function modifier_old_tinker_high_five_search.prototype.GetEffectName(self)
    return CURRENT_STYLE.overhead_particle
end
function modifier_old_tinker_high_five_search.prototype.GetEffectAttachType(self)
    return PATTACH_OVERHEAD_FOLLOW
end
modifier_old_tinker_high_five_search = __TS__Decorate(
    modifier_old_tinker_high_five_search,
    modifier_old_tinker_high_five_search,
    {registerModifier(nil)},
    {kind = "class", name = "modifier_old_tinker_high_five_search"}
)
____exports.modifier_old_tinker_high_five_search = modifier_old_tinker_high_five_search
return ____exports
