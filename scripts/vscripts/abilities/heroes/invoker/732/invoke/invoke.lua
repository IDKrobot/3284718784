local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["18"] = 220,["19"] = 1,["20"] = 1,["21"] = 1,["22"] = 4,["23"] = 4,["24"] = 18,["25"] = 19,["26"] = 18,["27"] = 19,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 23,["33"] = 24,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 18,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 40,["51"] = 45,["52"] = 46,["53"] = 45,["54"] = 49,["55"] = 50,["56"] = 49,["57"] = 53,["58"] = 54,["59"] = 53,["60"] = 57,["61"] = 58,["62"] = 57,["63"] = 61,["64"] = 62,["65"] = 63,["67"] = 61,["68"] = 66,["69"] = 67,["70"] = 69,["71"] = 70,["72"] = 71,["74"] = 66,["75"] = 75,["76"] = 76,["77"] = 78,["78"] = 79,["79"] = 80,["80"] = 82,["81"] = 19,["82"] = 75,["83"] = 87,["84"] = 88,["85"] = 90,["86"] = 91,["87"] = 93,["88"] = 99,["89"] = 100,["90"] = 101,["92"] = 104,["93"] = 106,["94"] = 108,["95"] = 87,["96"] = 111,["97"] = 112,["98"] = 113,["99"] = 115,["100"] = 117,["101"] = 118,["103"] = 120,["105"] = 111,["106"] = 123,["107"] = 124,["108"] = 123,["109"] = 127,["110"] = 128,["111"] = 127,["112"] = 131,["113"] = 132,["114"] = 134,["115"] = 135,["116"] = 135,["117"] = 135,["118"] = 136,["119"] = 137,["121"] = 135,["122"] = 135,["123"] = 140,["125"] = 143,["126"] = 144,["128"] = 131,["129"] = 151,["130"] = 152,["133"] = 154,["134"] = 155,["137"] = 157,["138"] = 159,["139"] = 160,["140"] = 161,["143"] = 163,["144"] = 163,["145"] = 163,["146"] = 163,["147"] = 165,["148"] = 179,["150"] = 181,["151"] = 182,["152"] = 183,["153"] = 184,["156"] = 186,["157"] = 186,["158"] = 186,["159"] = 186,["160"] = 187,["161"] = 188,["164"] = 191,["165"] = 192,["168"] = 194,["169"] = 194,["170"] = 194,["171"] = 194,["172"] = 195,["173"] = 196,["174"] = 197,["175"] = 198,["178"] = 200,["179"] = 200,["180"] = 200,["181"] = 200,["182"] = 201,["183"] = 202,["186"] = 206,["187"] = 207,["188"] = 208,["189"] = 208,["190"] = 208,["191"] = 209,["192"] = 208,["193"] = 208,["194"] = 211,["195"] = 212,["196"] = 213,["197"] = 213,["198"] = 213,["199"] = 214,["200"] = 213,["201"] = 213,["203"] = 151,["204"] = 19,["205"] = 19,["206"] = 19,["207"] = 18,["210"] = 19,["211"] = 220,["212"] = 220,["213"] = 247,["214"] = 223,["215"] = 225,["216"] = 226,["217"] = 227,["218"] = 229,["219"] = 234,["220"] = 234,["221"] = 234,["222"] = 234,["223"] = 234,["224"] = 234,["225"] = 234,["226"] = 234,["227"] = 234,["228"] = 234,["229"] = 234,["230"] = 234,["231"] = 248,["232"] = 247,["233"] = 251,["234"] = 252,["235"] = 252,["236"] = 252,["237"] = 252,["238"] = 252,["239"] = 252,["240"] = 252,["241"] = 253,["242"] = 254,["243"] = 252,["244"] = 252,["245"] = 252,["246"] = 251,["247"] = 258,["248"] = 259,["249"] = 260,["252"] = 262,["253"] = 262,["254"] = 262,["255"] = 262,["256"] = 262,["257"] = 262,["259"] = 262,["260"] = 267,["261"] = 268,["262"] = 270,["263"] = 270,["264"] = 271,["265"] = 271,["266"] = 272,["267"] = 274,["268"] = 275,["269"] = 275,["270"] = 276,["271"] = 278,["272"] = 279,["274"] = 258,["275"] = 283,["276"] = 284,["277"] = 284,["278"] = 284,["279"] = 284,["281"] = 284,["283"] = 286,["284"] = 287,["287"] = 289,["288"] = 289,["289"] = 289,["291"] = 289,["292"] = 294,["293"] = 283,["294"] = 297,["295"] = 298,["296"] = 298,["297"] = 298,["298"] = 298,["299"] = 298,["300"] = 298,["301"] = 301,["302"] = 301,["303"] = 301,["304"] = 298,["305"] = 298,["306"] = 298,["307"] = 298,["308"] = 304,["309"] = 297,["310"] = 307,["311"] = 308,["312"] = 308,["313"] = 308,["314"] = 308,["316"] = 308,["317"] = 310,["318"] = 310,["319"] = 310,["320"] = 310,["322"] = 310,["323"] = 316,["324"] = 317,["325"] = 318,["327"] = 321,["328"] = 322,["329"] = 323,["330"] = 328,["331"] = 328,["332"] = 328,["333"] = 328,["334"] = 328,["335"] = 328,["336"] = 328,["337"] = 328,["338"] = 328,["339"] = 329,["340"] = 329,["341"] = 329,["342"] = 329,["343"] = 329,["344"] = 329,["345"] = 329,["346"] = 329,["347"] = 329,["348"] = 331,["349"] = 332,["350"] = 333,["351"] = 334,["352"] = 307,["353"] = 337,["354"] = 346,["355"] = 346,["356"] = 346,["357"] = 346,["358"] = 346,["359"] = 346,["360"] = 346,["361"] = 374,["362"] = 375,["363"] = 376,["364"] = 377,["366"] = 379,["369"] = 382,["370"] = 383,["371"] = 384,["372"] = 385,["375"] = 389,["376"] = 337,["377"] = 393,["378"] = 393,["379"] = 398,["380"] = 398,["381"] = 396,["382"] = 399,["383"] = 398,["384"] = 402,["385"] = 403,["386"] = 403,["387"] = 404,["388"] = 404,["389"] = 402,["390"] = 407,["391"] = 408,["392"] = 408,["394"] = 410,["395"] = 411,["396"] = 411,["398"] = 413,["399"] = 414,["400"] = 415,["402"] = 418,["404"] = 419,["405"] = 419,["406"] = 420,["407"] = 421,["409"] = 419,["412"] = 424,["413"] = 425,["414"] = 426,["415"] = 427,["417"] = 430,["418"] = 431,["419"] = 407,["420"] = 434,["421"] = 435,["422"] = 436,["423"] = 436,["425"] = 437,["426"] = 434,["427"] = 440,["429"] = 441,["430"] = 441,["431"] = 442,["432"] = 442,["433"] = 442,["434"] = 442,["435"] = 442,["436"] = 442,["437"] = 449,["438"] = 449,["439"] = 449,["440"] = 441,["443"] = 440,["444"] = 453,["445"] = 454,["446"] = 455,["447"] = 455,["449"] = 457,["450"] = 457,["451"] = 457,["452"] = 457,["453"] = 457,["454"] = 457,["455"] = 464,["457"] = 467,["458"] = 453});
local ____exports = {}
local OrbManager, AbilityManager
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_invoker_invoke_custom_732 = require("abilities.heroes.invoker.732.invoke.modifier_invoker_invoke_custom_732")
local modifier_invoker_invoke_custom_732 = ____modifier_invoker_invoke_custom_732.modifier_invoker_invoke_custom_732
____exports.invoker_invoke_custom_732 = __TS__Class()
local invoker_invoke_custom_732 = ____exports.invoker_invoke_custom_732
invoker_invoke_custom_732.name = "invoker_invoke_custom_732"
__TS__ClassExtends(invoker_invoke_custom_732, BaseAbility)
function invoker_invoke_custom_732.prototype.____constructor(self, ...)
    BaseAbility.prototype.____constructor(self, ...)
    self.orbManager = __TS__New(OrbManager, self)
    self.abilityManager = __TS__New(AbilityManager, self)
    self.phraseNewCooldown = false
    self.phraseExistCooldown = false
    self.ability_colors = {
        invoker_cold_snap_custom_732 = Vector(0, 0, 255),
        invoker_ghost_walk_custom_732 = Vector(85, 0, 255),
        invoker_tornado_custom_732 = Vector(170, 0, 255),
        invoker_emp_custom_732 = Vector(255, 0, 255),
        invoker_alacrity_custom_732 = Vector(255, 55, 170),
        invoker_chaos_meteor_custom_732 = Vector(255, 110, 85),
        invoker_sun_strike_custom_732 = Vector(255, 165, 0),
        invoker_forge_spirit_custom_732 = Vector(170, 110, 85),
        invoker_ice_wall_custom_732 = Vector(85, 55, 170),
        invoker_deafening_blast_custom_732 = Vector(170, 55, 170)
    }
end
function invoker_invoke_custom_732.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_invoker.vsndevts")
end
function invoker_invoke_custom_732.prototype.GetIntrinsicModifierName(self)
    return modifier_invoker_invoke_custom_732.name
end
function invoker_invoke_custom_732.prototype.ProcsMagicStick(self)
    return false
end
function invoker_invoke_custom_732.prototype.IsStealable(self)
    return false
end
function invoker_invoke_custom_732.prototype.IsHiddenWhenStolen(self)
    return true
end
function invoker_invoke_custom_732.prototype.Spawn(self)
    if IsServer() and self:GetLevel() == 0 then
        self:SetLevel(1)
    end
end
function invoker_invoke_custom_732.prototype.OnUpgrade(self)
    self.abilityManager:PushEmpty()
    if self:GetCaster():GetUnitName() == "npc_dota_hero_morphling" then
        self:SetHidden(true)
        self:DestroyOrbs()
    end
end
function invoker_invoke_custom_732.prototype.GetCooldown(self, level)
    local caster = self:GetCaster()
    local quas = caster:FindAbilityByName("invoker_quas_custom_732")
    local wex = caster:FindAbilityByName("invoker_wex_custom_732")
    local exort = caster:FindAbilityByName("invoker_exort_custom_732")
    local reduction = (quas:GetLevel() + wex:GetLevel() + exort:GetLevel()) * self:GetSpecialValueFor("cooldown_reduction_per_orb")
    return BaseAbility.prototype.GetCooldown(self, level) - reduction
end
function invoker_invoke_custom_732.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local abilityName = self.orbManager:GetInvokedAbility()
    local responseType = self.abilityManager:Invoke(abilityName)
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_invoke.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    if abilityName then
        local color = self.ability_colors[abilityName]
        ParticleManager:SetParticleControl(particle, 2, color)
    end
    ParticleManager:ReleaseParticleIndex(particle)
    caster:EmitSound("Hero_Invoker.Invoke")
    self:EmitCastResponse(responseType)
end
function invoker_invoke_custom_732.prototype.AddOrb(self, modifier)
    local caster = self:GetCaster()
    local orb_position = RandomInt(1, 2)
    self.orbManager:AddOrb(modifier, orb_position)
    if orb_position == 1 then
        caster:StartGesture(ACT_DOTA_OVERRIDE_ABILITY_1)
    else
        caster:StartGesture(ACT_DOTA_OVERRIDE_ABILITY_2)
    end
end
function invoker_invoke_custom_732.prototype.UpdateOrb(self, modifierName, level)
    self.orbManager:UpdateOrb(modifierName, level)
end
function invoker_invoke_custom_732.prototype.GetOrbs(self)
    return self.orbManager:GetOrbs()
end
function invoker_invoke_custom_732.prototype.DestroyOrbs(self)
    local caster = self:GetCaster()
    if caster.custom_data.invoked_orbs_particle then
        __TS__ArrayForEach(
            caster.custom_data.invoked_orbs_particle,
            function(____, particle)
                if particle ~= nil then
                    ParticleManager:DestroyParticle(particle, false)
                end
            end
        )
        caster.custom_data.invoked_orbs_particle = {}
    end
    if caster.custom_data.invoked_orbs_particle_attach then
        caster.custom_data.invoked_orbs_particle_attach = nil
    end
end
function invoker_invoke_custom_732.prototype.EmitCastResponse(self, responseType)
    if responseType == 0 then
        return
    end
    local caster = self:GetCaster()
    if caster:GetUnitName() ~= "npc_dota_hero_invoker" then
        return
    end
    local roll = RollPercentage(75)
    if caster:HasPersona("npc_dota_hero_invoker") then
        if responseType == 2 and roll then
            if self.phraseNewCooldown then
                return
            end
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 18))
            )
            if RollPercentage(50) and (random == "02" or random == "04" or random == "05" or random == "06" or random == "07" or random == "08" or random == "09" or random == "12" or random == "14" or random == "15" or random == "16" or random == "17" or random == "18") then
                random = random .. "_02"
            end
            local response = "invoker_kidvo_la_ability_invoke_" .. random
            caster:EmitSoundOnClient(response)
        elseif responseType == 1 then
            if self.phraseExistCooldown then
                return
            end
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 13))
            )
            local response = "invoker_kidvo_la_failure_" .. random
            caster:EmitSoundOnClient(response)
        end
    else
        if responseType == 2 and roll then
            if self.phraseNewCooldown then
                return
            end
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 17))
            )
            local response = "invoker_invo_ability_invoke_" .. random
            caster:EmitSoundOnClient(response)
        elseif responseType == 1 then
            if self.phraseExistCooldown then
                return
            end
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 13))
            )
            local response = "invoker_invo_failure_" .. random
            caster:EmitSoundOnClient(response)
        end
    end
    if responseType == 2 and roll then
        self.phraseNewCooldown = true
        Timers:CreateTimer(
            60,
            function()
                self.phraseNewCooldown = false
            end
        )
    elseif responseType == 1 then
        self.phraseExistCooldown = true
        Timers:CreateTimer(
            60,
            function()
                self.phraseExistCooldown = false
            end
        )
    end
end
invoker_invoke_custom_732 = __TS__Decorate(
    invoker_invoke_custom_732,
    invoker_invoke_custom_732,
    {registerAbility(nil)},
    {kind = "class", name = "invoker_invoke_custom_732"}
)
____exports.invoker_invoke_custom_732 = invoker_invoke_custom_732
OrbManager = __TS__Class()
OrbManager.name = "OrbManager"
function OrbManager.prototype.____constructor(self, ability)
    self.orbOrder = "qwe"
    self.orb_status = {}
    self.modifiers = {}
    self.names = {}
    self.modifier_list = {modifier_invoker_quas_custom_732_stack = "q", modifier_invoker_wex_custom_732_stack = "w", modifier_invoker_exort_custom_732_stack = "e"}
    self.invoke_list = {
        qqq = "invoker_cold_snap_custom_732",
        qqw = "invoker_ghost_walk_custom_732",
        qww = "invoker_tornado_custom_732",
        www = "invoker_emp_custom_732",
        wwe = "invoker_alacrity_custom_732",
        wee = "invoker_chaos_meteor_custom_732",
        eee = "invoker_sun_strike_custom_732",
        qee = "invoker_forge_spirit_custom_732",
        qqe = "invoker_ice_wall_custom_732",
        qwe = "invoker_deafening_blast_custom_732"
    }
    self.caster = ability:GetCaster()
end
function OrbManager.prototype.GetOrbs(self)
    return __TS__ArrayReduce(
        __TS__ObjectEntries(self.orb_status),
        function(____, orbs, ____bindingPattern0)
            local value
            local key
            key = ____bindingPattern0[1]
            value = ____bindingPattern0[2]
            orbs[key] = value.instances
            return orbs
        end,
        {}
    )
end
function OrbManager.prototype.AddOrb(self, modifier, orb_position)
    local orb_name = self.modifier_list[modifier:GetName()]
    if not orb_name then
        return
    end
    local ____self_orb_status_0, ____orb_name_1 = self.orb_status, orb_name
    if ____self_orb_status_0[____orb_name_1] == nil then
        ____self_orb_status_0[____orb_name_1] = {
            instances = 0,
            level = modifier:GetAbilityLevel()
        }
    end
    local status = self.orb_status[orb_name]
    local particle = self:GetOrbParticle(orb_name)
    self:AddOrbParticle(particle, orb_position)
    local ____self_modifiers_3 = self.modifiers
    ____self_modifiers_3[#____self_modifiers_3 + 1] = modifier
    local ____self_names_4 = self.names
    ____self_names_4[#____self_names_4 + 1] = orb_name
    status.instances = status.instances + 1
    if #self.modifiers > 3 then
        local ____self_orb_status_self_names__1_5, ____instances_6 = self.orb_status[self.names[1]], "instances"
        ____self_orb_status_self_names__1_5[____instances_6] = ____self_orb_status_self_names__1_5[____instances_6] - 1
        self.modifiers[1]:Destroy()
        table.remove(self.modifiers, 1)
        table.remove(self.names, 1)
    end
end
function OrbManager.prototype.UpdateOrb(self, modifierName, level)
    local ____opt_7 = __TS__ArrayFind(
        self.modifiers,
        function(____, modifier) return modifier:GetName() == modifierName end
    )
    if ____opt_7 ~= nil then
        ____opt_7:ForceRefresh()
    end
    local orb_name = self.modifier_list[modifierName]
    if not orb_name then
        return
    end
    local ____self_orb_status_9, ____orb_name_10 = self.orb_status, orb_name
    if ____self_orb_status_9[____orb_name_10] == nil then
        ____self_orb_status_9[____orb_name_10] = {instances = 0, level = level}
    end
    local status = self.orb_status[orb_name]
    status.level = level
end
function OrbManager.prototype.GetInvokedAbility(self)
    local key = table.concat(
        __TS__ArrayMap(
            __TS__ArrayFilter(
                __TS__StringSplit(self.orbOrder, ""),
                function(____, orb) return self.orb_status[orb] end
            ),
            function(____, orb) return string.rep(
                orb,
                math.floor(self.orb_status[orb].instances)
            ) end
        ),
        ""
    )
    return self.invoke_list[key]
end
function OrbManager.prototype.AddOrbParticle(self, particle, orb_position)
    local ____self_caster_custom_data_15 = self.caster.custom_data
    local ____self_caster_custom_data_12, ____invoked_orbs_particle_13 = self.caster.custom_data, "invoked_orbs_particle"
    if ____self_caster_custom_data_12[____invoked_orbs_particle_13] == nil then
        ____self_caster_custom_data_12[____invoked_orbs_particle_13] = {}
    end
    ____self_caster_custom_data_15.invoked_orbs_particle = self.caster.custom_data.invoked_orbs_particle
    local ____self_caster_custom_data_19 = self.caster.custom_data
    local ____self_caster_custom_data_16, ____invoked_orbs_particle_attach_17 = self.caster.custom_data, "invoked_orbs_particle_attach"
    if ____self_caster_custom_data_16[____invoked_orbs_particle_attach_17] == nil then
        ____self_caster_custom_data_16[____invoked_orbs_particle_attach_17] = {"attach_orb1", "attach_orb2", "attach_orb3"}
    end
    ____self_caster_custom_data_19.invoked_orbs_particle_attach = self.caster.custom_data.invoked_orbs_particle_attach
    if self.caster.custom_data.invoked_orbs_particle[1] ~= nil then
        ParticleManager:DestroyParticle(self.caster.custom_data.invoked_orbs_particle[1], false)
        __TS__Delete(self.caster.custom_data.invoked_orbs_particle, 1)
    end
    self.caster.custom_data.invoked_orbs_particle[1] = self.caster.custom_data.invoked_orbs_particle[2]
    self.caster.custom_data.invoked_orbs_particle[2] = self.caster.custom_data.invoked_orbs_particle[3]
    self.caster.custom_data.invoked_orbs_particle[3] = ParticleManager:CreateParticle(particle, PATTACH_CUSTOMORIGIN, self.caster)
    ParticleManager:SetParticleControlEnt(
        self.caster.custom_data.invoked_orbs_particle[3],
        0,
        self.caster,
        PATTACH_POINT_FOLLOW,
        "attach_attack" .. tostring(orb_position),
        self.caster:GetAbsOrigin(),
        false
    )
    ParticleManager:SetParticleControlEnt(
        self.caster.custom_data.invoked_orbs_particle[3],
        1,
        self.caster,
        PATTACH_POINT_FOLLOW,
        self.caster.custom_data.invoked_orbs_particle_attach[1],
        self.caster:GetAbsOrigin(),
        false
    )
    local temp_point = self.caster.custom_data.invoked_orbs_particle_attach[1]
    self.caster.custom_data.invoked_orbs_particle_attach[1] = self.caster.custom_data.invoked_orbs_particle_attach[2]
    self.caster.custom_data.invoked_orbs_particle_attach[2] = self.caster.custom_data.invoked_orbs_particle_attach[3]
    self.caster.custom_data.invoked_orbs_particle_attach[3] = temp_point
end
function OrbManager.prototype.GetOrbParticle(self, orbName)
    local orbParticles = {
        [0] = {q = "particles/units/heroes/hero_invoker/invoker_quas_orb.vpcf", w = "particles/units/heroes/hero_invoker/invoker_wex_orb.vpcf", e = "particles/units/heroes/hero_invoker/invoker_exort_orb.vpcf"},
        [1] = {q = "particles/econ/items/invoker/invoker_ti6/invoker_ti6_quas_orb.vpcf", w = "particles/econ/items/invoker/invoker_ti6/invoker_ti6_wex_orb.vpcf", e = "particles/econ/items/invoker/invoker_ti6/invoker_ti6_exort_orb.vpcf"},
        [2] = {q = "particles/econ/items/invoker/invoker_apex/invoker_apex_quas_orb.vpcf", w = "particles/econ/items/invoker/invoker_apex/invoker_apex_wex_orb.vpcf", e = "particles/econ/items/invoker/invoker_apex/invoker_apex_exort_orb.vpcf"},
        [3] = {q = "particles/units/heroes/hero_invoker_kid/invoker_kid_quas_orb.vpcf", w = "particles/units/heroes/hero_invoker_kid/invoker_kid_wex_orb.vpcf", e = "particles/units/heroes/hero_invoker_kid/invoker_kid_exort_orb.vpcf"},
        [4] = {q = "particles/econ/items/invoker_kid/invoker_dark_artistry/invoker_kid_dark_artistry_quas_orb.vpcf", w = "particles/econ/items/invoker_kid/invoker_dark_artistry/invoker_kid_dark_artistry_wex_orb.vpcf", e = "particles/econ/items/invoker_kid/invoker_dark_artistry/invoker_kid_dark_artistry_exort_orb.vpcf"}
    }
    local particles = orbParticles[0]
    if self.caster:HasPersona("npc_dota_hero_invoker") then
        if self.caster:HasWearable("models/items/invoker_kid/dark_artistry_kid/invoker_kid_dark_artistry_back.vmdl") then
            particles = orbParticles[4]
        else
            particles = orbParticles[3]
        end
    else
        if self.caster:HasWearable("models/items/invoker/dark_artistry/dark_artistry_cape_model.vmdl") then
            particles = orbParticles[1]
        elseif self.caster:HasWearable("models/items/invoker/magus_apex/magus_apex.vmdl") then
            particles = orbParticles[2]
        end
    end
    return particles[orbName]
end
AbilityManager = __TS__Class()
AbilityManager.name = "AbilityManager"
function AbilityManager.prototype.____constructor(self, ability)
    self.ability = ability
    self.ability_slot = {}
    self.caster = ability:GetCaster()
end
function AbilityManager.prototype.PushEmpty(self)
    local ____self_ability_slot_20 = self.ability_slot
    ____self_ability_slot_20[#____self_ability_slot_20 + 1] = self.caster:FindAbilityByName("invoker_empty1")
    local ____self_ability_slot_21 = self.ability_slot
    ____self_ability_slot_21[#____self_ability_slot_21 + 1] = self.caster:FindAbilityByName("invoker_empty2")
end
function AbilityManager.prototype.Invoke(self, abilityName)
    if not abilityName then
        return 0
    end
    local ability = self:GetAbility(abilityName)
    if not ability then
        return 0
    end
    if self.ability_slot[1] and self.ability_slot[1] == ability then
        self.ability:EndCooldown()
        return 1
    end
    local exist = 0
    do
        local i = 1
        while i < #self.ability_slot do
            if self.ability_slot[i] == ability then
                exist = i
            end
            i = i + 1
        end
    end
    if exist > 0 then
        self:InvokeExist(exist)
        self.ability:EndCooldown()
        return 0
    end
    self:InvokeNew(ability)
    return 2
end
function AbilityManager.prototype.GetAbility(self, abilityName)
    local ability = self.caster:FindAbilityByName(abilityName)
    if ability ~= nil then
        ability:SetLevel(1)
    end
    return ability
end
function AbilityManager.prototype.InvokeExist(self, slot)
    do
        local i = slot
        while i >= 2 do
            self.caster:SwapAbilities(
                self.ability_slot[slot - 2 + 1]:GetAbilityName(),
                self.ability_slot[slot]:GetAbilityName(),
                true,
                true
            )
            local ____temp_24 = {self.ability_slot[slot - 2 + 1], self.ability_slot[slot]}
            self.ability_slot[slot] = ____temp_24[1]
            self.ability_slot[slot - 2 + 1] = ____temp_24[2]
            i = i - 1
        end
    end
end
function AbilityManager.prototype.InvokeNew(self, ability)
    if #self.ability_slot < 2 then
        local ____self_ability_slot_25 = self.ability_slot
        ____self_ability_slot_25[#____self_ability_slot_25 + 1] = ability
    else
        self.caster:SwapAbilities(
            ability:GetAbilityName(),
            self.ability_slot[#self.ability_slot]:GetAbilityName(),
            true,
            false
        )
        self.ability_slot[#self.ability_slot] = ability
    end
    self:InvokeExist(#self.ability_slot)
end
return ____exports
